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
 			if(mood < 15){
 				bar.css('background-color','rgba(200,40,40,1)');
 			}else if(mood>70){
 				bar.css('background-color','rgba(70,150,70,1)');
 			}else{
 				bar.css('background-color','rgba(190,190,30,1)');
 			}
 			bar.css('width',mood+'%');
 			tex.text(mood+"%");
 		}
 		if(this.opts["writable"]){
 			var addbtn = this.addbtn,
 				minusebtn = this.minusebtn,
 				submitbtn = this.submit
 			addbtn.on("click",function(){
 				if(mood <=95){
	 				mood = mood +5;
	 				refresh();
	 			}
 			});
 			minusebtn.on("click",function(){
 				if(mood >=5){
 					mood = mood -5;
 					refresh();
 				}
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
 		this.render();
 	}

 	Moodbar.prototype.render = function(){
 		var bar = this.bar
 			,mood = this.mood
 			,tex = this.tex;
 		if(mood < 15){
 				bar.css('background-color','rgba(200,40,40,1)');
 			}else if(mood>70){
 				bar.css('background-color','rgba(70,150,70,1)');
 			}else{
 				bar.css('background-color','rgba(190,190,30,1)');
 			}
 		bar.css('width',mood+'%');
 		tex.text(mood+"%");
 	}

 	Moodbar.prototype.changeMood = function(newmood){
 		this.mood = newmood;
 		this.render();
 	}




 })