/* -------------------------------
 * author: fuluchii
 * for LookAtMe
 *------------------------------*/

define(function(require, exports, module) {
	var $ = require('jquery');
	function Navbar(container){
		this.container = $(container);
		this.button = this.container.find(".nav-btn");
		this.items = this.container.find(".nav-items");
		this.istoggle = true;
	}

	Navbar.prototype={
		constractor:Navbar,
		init: function(){
			var button = this.button;
			var items  = this.items;
			var istoggle  = this.istoggle;
			button.css('-webkit-transition','all .3s linear');
			button.on('click',function(){
				if(istoggle){
					$(this).css('transform','rotate(45deg)');
					items.fadeIn(300);
					istoggle = !istoggle;
				}else{
					$(this).css('transform','rotate(0deg)');
					items.fadeOut(300);
					istoggle = !istoggle;
				}
			})
		}
}



	module.exports = Navbar;
});