/* -------------------------------
 * author: fuluchii
 * for LookAtMe
 *------------------------------*/
 define(function(require,exports,module){
 	var $ = require('jquery');
 	function Moodbar(bar,mood,opts){
 		this.bar = $(bar).find('em');
 		this.mood = mood;
 		this.tex = $(bar).find('.mood-txt');
 		this.opts = opts;
 		if(opts["writable"]){
 			this.addbtn = $(bar).find(".addbtn");
 			this.minusebtn = $(bar).find(".minusebtn");
 			this.submit = $(bar).find(".submit");
 		}
 		if(opts["ws"]){
 			this.ws = opts["ws"];
 		}
 	}

 	module.exports = Moodbar;

 	Moodbar.prototype.init = function(myid,yourid){
 		var mood = this.mood
 			,bar = this.bar
 			,mood = this.mood
 			,tex = this.tex,
 			ws = this.ws;
 		
 		function refresh(){
 			bar.css('width',mood+'%');
 			tex.text(mood+"%");
 		}
 		if(this.opts["writable"]){
 			var addbtn = this.addbtn,
 				minusebtn = this.minusebtn,
 				submitbtn = this.submit
 			addbtn.on("click",function(){
 				mood = mood +5;
 				refresh();
 			});
 			minusebtn.on("click",function(){
 				mood = mood -5;
 				refresh();
 			});
 			submitbtn.on("click",function(){
 				var data = {
 					"myid":myid,
 					"mood":mood,
 					"yourid":yourid
 				}
 				ws.sendMsg(JSON.stringify(data));
 			})

 		}
 		refresh();
 	}

 	Moodbar.prototype.render = function(){
 		var bar = this.bar
 			,mood = this.mood
 			,tex = this.tex;
 		bar.css('width',mood+'%');
 		tex.text(mood+"%");
 	}

 	Moodbar.prototype.changeMood = function(newmood){
 		this.mood = newmood;
 		this.render();
 	}




 })