from bottle import route,run,response,template,error,request,redirect,static_file,default_app
from json import dumps
import mongoservice

@route('/show/<id>')
def show_heart(id):
	return 'hello my heart'+id

run(host='localhost', port=8080, debug=True)