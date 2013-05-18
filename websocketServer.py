#coding=utf-8
from bottle import request, Bottle, abort
import json
import time 
import twilioService
import mongoservice
app = Bottle()
app.debug = True

conns = []
minimal_score = 15
max_score = 100

@app.route('/changemood')
def handle_websocket():
    wsock = request.environ.get('wsgi.websocket')
    if not wsock:
        abort(400, 'Expected WebSocket request.')
    else:
        conns.append(wsock)

    while True:
        try:
            message = wsock.receive()
            for w in conns:
                w.send(message)
            data = json.loads(message)
            print(data)
            deal_with_moodchange(data)
        except WebSocketError:
            break

def deal_with_moodchange(data):
    yourid = data["yourid"]
    user = mongoservice.find_someone(yourid)
    if user.count() > 0:
        user = user[0]
        phone = user["phone"]
        mood = data["mood"]
        if mood < minimal_score:
            sms_minimal(mood,phone) 


def sms_minimal(msg,phone):
    twilioService.sendSMSMsg("中文短信测试!!!! TA现在的心情指数是"+str(msg),phone)        


from gevent.pywsgi import WSGIServer
from geventwebsocket import WebSocketHandler, WebSocketError
server = WSGIServer(("0.0.0.0", 8081), app,
                    handler_class=WebSocketHandler)
server.serve_forever()