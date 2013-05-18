define(function(require) {
  var $ = require("jquery");
  var Navbar = require('./nav');
  var Tabs = require('./tab');

  var s = new Navbar('.menu-bar');
  s.init();
  var t = new Tabs('.mainbar');
  t.init();
  t.cback();
});