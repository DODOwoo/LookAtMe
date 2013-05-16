from bottle import route,run,response,template,error,request,redirect,static_file,default_app
from json import dumps
import mongoservice

@route('/show/<id>')
def show_heart(id):
	return template('template/main.tpl')

@route('/nologin')
def nologin():
	return template('template/show.tpl')



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


@route('/s/css/<fname>')
def s(fname):
	return static_file(fname,'./s/css')

@route('/s/<filepath:path>')
def js(filepath):
	return static_file(filepath,'./s/')


run(host='localhost', port=8080, debug=True)
