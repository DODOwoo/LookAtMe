#coding=utf-8
from bottle import request, Bottle, abort
import twilioService
import mongoservice
import json
from datetime import datetime


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
                try:
                    w.send(message)
                except WebSocketError:
                    conns.remove(w)
                    continue
            data = json.loads(message)
            # print(data)
            deal_with_moodchange(data)
        except WebSocketError as e:
            print(e)
            break

def deal_with_moodchange(data):
    mood = dict(name = data["myid"],score=data["mood"])
    mongoservice.update_score(mood)
    mongoservice.insert_log(dict(adddate=datetime.now(),mood=data["mood"],user=data["myid"]))
    yourid = data["yourid"]
    myid = data["myid"]
    mongoservice.update_score(dict(name=myid,score=data["mood"]))
    user = mongoservice.find_someone(yourid)

    if user:
        phone = user["phone"]
        mood = data["mood"]
        if mood < minimal_score:
            pair = mongoservice.find_pair(data["myid"])
            if pair:
                mongoservice.modify_crazy(dict(name=data["myid"],pairname=pair["name"],pairmail=pair["gtalk"],mood=data["mood"]))
            sms_minimal(mood,phone) 


def sms_minimal(msg,phone):
    twilioService.sendSMSMsg("中文短信测试!!!! TA现在的心情指数是"+str(msg),phone)        


from gevent.pywsgi import WSGIServer
from geventwebsocket import WebSocketHandler, WebSocketError
server = WSGIServer(("0.0.0.0", 8081), app,
                    handler_class=WebSocketHandler)
server.serve_forever()
