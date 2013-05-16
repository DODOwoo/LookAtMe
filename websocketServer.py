from bottle import request, Bottle, abort
from json import dump
import time 
app = Bottle()

@app.route('/changemood')
def handle_websocket():
    wsock = request.environ.get('wsgi.websocket')
    if not wsock:
        abort(400, 'Expected WebSocket request.')
    time.sleep(5);
    wsock.send("40")
    

from gevent.pywsgi import WSGIServer
from geventwebsocket import WebSocketHandler, WebSocketError
server = WSGIServer(("0.0.0.0", 8081), app,
                    handler_class=WebSocketHandler)
server.serve_forever()