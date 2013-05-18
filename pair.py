#coding=utf-8
from bottle import route,run,response,template,error,request,redirect,static_file,default_app,view
import json
import mongoservice

@route('/show/<id>')
@view('template/main.tpl')
def show_heart(id):
	yourid = 1-int(id)
	return dict(mymood=40,yourmood=50,myid=int(id),yourid=yourid)

@route('/nologin')
def nologin():
	return template('template/show.tpl')

@route('/log/<id>')
def show_log(id):
    ourmoods = {};
    mymoods = mongoservice.find_someone_log(id)
    print(mymoods)
    ourmoods['my'] = mymoods
    #get pair's id
    urmoods = mongoservice.find_someone_log('fuluchii')
    ourmoods['your'] = urmoods
    return template('template/log.tpl',moods=ourmoods)


@route('/adduser',method='POST')
def adduser():
	data = {}
	data["name"] = request.POST.get("name")
	data["pair"] = 0
	data["score"] = 0
	mongoservice.insert_user(data)

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





##########################
#静态资源
##########################

@route('/s/css/<fname>')
def s(fname):
	return static_file(fname,'./s/css')

@route('/s/<filepath:path>')
def js(filepath):
	return static_file(filepath,'./s/')


run(host='localhost', port=8080, debug=True)
