#coding=utf-8
from bottle import route,run,response,template,error,request,redirect,static_file,default_app,view,redirect
import json
import mongoservice
import bson
import sha, time
from datetime import timedelta


@route('/nologin')
def nologin():
	return template('template/show.tpl')

@route('/show/<id>')
@view('template/main.tpl')
def show_heart(id):
    #yourid = 1-int(id)
    if not request.get_cookie('pairsid',secret='secretkey'):
        redirect('/nologin')

    user = mongoservice.find_someone(id)
    pair = mongoservice.find_pair(id)
    return dict(me=user,you=pair)

@route('/setting/<id>')
@view('template/setting.tpl')
def setting(id):
    user = mongoservice.find_someone(id)
    return dict(myid=id,password=user["password"],phone=user["phone"],pairname=user["pairname"],gtalk=user["gtalk"])

@route('/set', method='POST')
def updateSetting():
    name = request.POST.get('name')
    if not request.get_cookie('pairsid',secret='secretkey'):
        redirect('/nologin')
    pairname = request.POST.get('pairname')
    if not mongoservice.find_someone(pairname):
        pairname=''
    mongoservice.update_user(dict(name=name,pairname=pairname,phone=request.POST.get('phone'),password=request.POST.get('password'),gtalk=request.POST.get('gtalk')))
    redirect('/show/%s' % name)

@route('/log/<id>')
def show_log(id):
    if not request.get_cookie('pairsid',secret='secretkey'):
	    redirect('/nologin')
    ourmoods = {};
    mymoods = mongoservice.find_someone_log(id)
    ourmoods['my'] = mymoods[:]
    #get pair's id
    pair = mongoservice.find_pair(id);
    urmoods = mongoservice.find_someone_log(pair["name"])
    ourmoods['your'] = urmoods[:]
    print(ourmoods)
    return template('template/log.tpl',moods=ourmoods)


@route('/adduser',method='POST')
def adduser():
    data = {}
    data["name"] = request.POST.get("name")
    if not mongoservice.find_someone(data["name"]):
        data["password"] = request.POST.get("password")
        data["pairname"] = ''
        data["phone"] = ''
        data["gtalk"] = ''
        data["score"] = 0
        mongoservice.insert_user(data)
    redirect('/show/%s' % data["name"])
	
@route('/login', method='POST')
def login():
    #return request.POST.get('name')
    name = request.POST.get('name')
    if not request.get_cookie('pairsid',secret='secretkey'):
        password = request.POST.get('password')
        if(mongoservice.check_user_credentials(name,password)):
            response.set_cookie('pairsid',name,secret='secretkey')
            redirect('/show/%s' % name)
        else:
            return 'no user';
    else:
        redirect('/show/%s' % name)

@route('/logout')
def logout():
    if not request.get_cookie('pairsid',secret='secretkey'):
        request.set_cookie('pairsid',secret='secretkey',expires=timedelta.min)
    redirect('/nologin')

@route('/mood/add')
def add_mood():
        #insert mood{ score, memo}
        return 'done'

@route('/pair/')
def connect(secret):
        return 'id'

############################################################################
# 以下为rest接口，为hubot及第三方服务.全部以.json结尾
############################################################################

# 获取某个用户的目前mood
@route('/getmood.json',method='GET')
def getmood():
	username = request.GET.get("username")
	user = mongoservice.find_someone(username)
	if user.count() >0:
		user = user[0]
		mood = dict(username=username,mood=user["score"])
		return json.dumps(mood)


@route('/getcrazy.json',method='GET')
def getcrazy():
    return mongoservice.find_and_remove_crazy()
    


##########################
#静态资源
##########################

@route('/s/css/<fname>')
def s(fname):
	return static_file(fname,'./s/css')

@route('/s/<filepath:path>')
def js(filepath):
	return static_file(filepath,'./s/')


run(host='localhost', port=8083, debug=True)
