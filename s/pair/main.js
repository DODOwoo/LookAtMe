define(function(require) {

  var Navbar = require('./nav');
  var Tabs = require('./tab');
  var Moodbar = require('./moodbar');
  var WSocket = require('./websocket');
  var y = yourmood;
  var s = new Navbar('.menu-bar');
  s.init();
  var t = new Tabs('.mainbar');
  t.init();
  var y_m = new Moodbar('#yourtab .moodbar-con',yourmood,{});
  y_m.init(yourid,myid);

  var websocket = new WSocket("ws://localhost:8081/changemood",y_m,myid);
  websocket.init();
  var m_m = new Moodbar('#mytab .moodbar-con',mymood,{"writable":true,"ws":websocket});
  m_m.init(myid,yourid);
});