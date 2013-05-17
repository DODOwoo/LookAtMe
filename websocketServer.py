from bottle import request, Bottle, abort
from json import dump
import time 
app = Bottle()

conns = []

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
        except WebSocketError:
            break
    

from gevent.pywsgi import WSGIServer
from geventwebsocket import WebSocketHandler, WebSocketError
server = WSGIServer(("0.0.0.0", 8081), app,
                    handler_class=WebSocketHandler)
server.serve_forever()