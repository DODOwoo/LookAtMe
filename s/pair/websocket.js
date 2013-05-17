define(function(require,exports,module){
	function WSocket(url,moodbar,myid){
		this.ws = new WebSocket(url);
		this.moodbar = moodbar;
		this.myid = myid;
	}

	WSocket.prototype = {
		constructor: WSocket,
		
		init: function(){
			var moodbar = this.moodbar,
				ws = this.ws,
				myid = this.myid;
			ws.onmessage = function (evt) {
        		var data = JSON.parse(evt.data);
        		if(data["yourid"] == myid){
        			moodbar.changeMood(data["mood"]);
        		}
    		};
		},
		sendMsg: function(data){
			var ws = this.ws;
			ws.send(data);
		}


		
	}

	module.exports = WSocket;
})