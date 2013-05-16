define(function(require) {

  var Navbar = require('./nav');
  var Tabs = require('./tab');
  var Moodbar = require('./moodbar')

  var s = new Navbar('.menu-bar');
  s.init();
  var t = new Tabs('.mainbar');
  t.init();
  var y_m = new Moodbar('#yourtab .moodbar-con',30);
  var m_m = new Moodbar('#mytab .moodbar-con',44);
  y_m.init();
  m_m.init();

  setTimeout(function() {
  	y_m.changeMood(80);
  }, 1000);
  setTimeout(function() {
  	y_m.changeMood(50);
  }, 2000);

});