define(function(require,exports,module){
	function WSocket(url){
		this.ws = new WebSocket(url);
	}

	WSocket.prototype = {
		constructor: WSocket,
		
		init: function(moodbar){
			var moodbar = moodbar;
			var ws = this.ws;
			ws.onmessage = function (evt) {
        		var data = evt.data;
        		console.log(data)
        		moodbar.changeMood(data);
    		};
		}
		
	}

	module.exports = WSocket;
})