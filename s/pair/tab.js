/* -------------------------------
 * author: fuluchii
 * for LookAtMe
 *------------------------------*/
define(function(require,exports,moduel){
	var $ = require("jquery");

	function Tabs(tabcontainer){
		this.tabs = $(tabcontainer).find('.tabs li');
		this.items = $(tabcontainer).find('.tab-item');
		this.itemdic = [];
	}

	Tabs.prototype.init = function(){
		var tabs = this.tabs;
		var items = this.items;
		var itemdic = this.itemdic;
		var active = active;
		items.each(function(n){
			var item = $(this);
			itemdic[item.attr('id')] = item;
		})

		tabs.each(function(n){
			var tab = $(this);
			tab.on('click',function(){
				var itemname = tab.attr('data-target');
				var active = items.filter('.active');
				active.removeClass('active');
				itemdic[itemname].addClass('active');
			})
		})
	}
	
	Tabs.prototype.cback = function(){
		var tabs = this.tabs;
		var items = this.items;
		var itemdic = this.itemdic;
		var active = active;
		items.each(function(n){
			var item = $(this);
			itemdic[item.attr('id')] = item;
		})

		tabs.each(function(n){
			var tab = $(this);
			tab.on('click',function(){
				var itemname = tab.attr('data-target');
				//console.log(itemdic[itemname].find('.gchart'));
				itemdic[itemname].find('.gchart').click();
			})
		})
	}
	moduel.exports = Tabs;
})