/* -------------------------------
 * author: fuluchii
 * for LookAtMe
 *------------------------------*/
 define(function(require,exports,module){
 	var $ = require('jquery');
 	function Moodbar(bar,mood){
 		this.bar = $(bar).find('em');
 		this.mood = mood;
 		this.tex = $(bar).find('div');
 	}

 	module.exports = Moodbar;

 	Moodbar.prototype.init = function(){
 		this.render();
 	}

 	Moodbar.prototype.render = function(){
 		var bar = this.bar;
 		var mood = this.mood;
 		var tex = this.tex;
 		bar.css('width',mood+'%');
 		tex.text(mood+"%");
 	}

 	Moodbar.prototype.changeMood = function(newmood){
 		this.mood = newmood;
 		this.render();
 	}
 })