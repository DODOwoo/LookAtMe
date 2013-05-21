<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>mood log</title>
	<link rel="stylesheet" href="/s/css/main.css" />
	<link rel="stylesheet" href="/s/css/common.css" />
	<style type="text/css">
		.log{
			height: 350px;
			background-color: rgb(240,240,240);
		}
	</style>
	<script type="text/javascript" src="https://www.google.com/jsapi"></script>
	<script type="text/javascript">
      google.load("visualization", "1", {packages:["corechart"]});
      google.setOnLoadCallback(drawChart);
      function drawChart() {
      	$('div.tab-item.active').find('.gchart').click();
      }
      
      
    var formatDate = function(d){
    	var date = new Date(d);
    	var hour = date.getHours();
    	return Math.floor(hour/3) * 3;
    }
    </script>
    <script>
    var dict = {};    
    var arr_my = [];
    arr_my.push(['Day','我的心情']);    
    var arr_ur=[];
    arr_ur.push(['Day','TA的心情']);
    var arr=[];
    arr.push(['Day','TA的心情','我的心情']);
    
    %for m in moods['my']:
    	arr_my.push([formatDate('{{m["adddate"]}}'),{{m["score"]}}]);
    %end    
    dict['my'] = arr_my.sort(function(a,b){return a[0]-b[0]});
    
    %for m in moods['your']:
       	arr_ur.push([formatDate('{{m['adddate']}}'),{{m['score']}}]);
    %end
    dict['your'] = arr_ur.sort(function(a,b){return a[0]-b[0]});
 
    arr.sort(function(a,b){return b[0]-a[0]})
    dict['our'] = arr;
    
    </script>
</head>
<body>
	<div class="container">	
		<div class="menu-bar">
			<div class="menu-btn left nav-btn"></div>
			<div class="menu nav-items hide" >
				<ul>
					<li>
						<a href="/show/{{name}}">
							<img src="/s/img/icon1.png" alt="" />
							<span>主页</span>
						</a>
					</li>
					<li>
						<a href="/log/{{name}}">
							 <img src="/s/img/icon2.png" alt="" />
							<span>历史</span>
						</a>
					</li>
					<li>
						<a href="/setting/{{name}}">
							<img src="/s/img/icon3.png" alt="" />
							<span>设置</span>
						</a>
					</li>
					<li>
						<a href="/logout">
							<img src="/s/img/icon4.png" alt="" />
							<span>登出</span>
						</a>
					</li>
					<li><a href="https://github.com/DODOwoo/LookAtMe" ref=><img src="/s/img/pusheencat.png" alt="" /><span>fork me</span></a></li>
				</ul>
			</div>
		</div>
	<div class="row mainbar">
		<div class="left switch tabs">
			<ul>
				<li data-target="yourtab">
					<a href="javascript:;"><div class="tabtag">you</div></a>
				</li>
				<li data-target="mytab">
					<a href="javascript:;"><div class="tabtag">me</div></a>
				</li>
				<li data-target="ourtab" class="active">
					<a href="javascript:;"><div class="tabtag">our</div></a>
				</li>
			</ul>
		</div>
		<div class="tab-con diary">
			<div class="me tab-item " id="mytab">	
				<div class="row">
					<div id="m_chart_div" class="gchart" onclick="drawme(this)" style="width: 900px; height: 500px;"></div>
				</div>
			</div>
			<div class="you tab-item" id="yourtab">
				<div class="row">			
					<div id="u_chart_div" class="gchart" onclick="drawme(this)" style="width: 900px; height: 500px;"></div>
				</div>
			</div>
			<div class="our tab-item active" id="ourtab">	
				<div class="row">
					<div id="chart_div" class="gchart" onclick="drawme(this)" style="width: 900px; height: 500px;"></div>
				</div>
			</div>
		</div>
	</div>
</div>
<script src="/s/seajs/sea.js"
        data-config="pair/config.js"
        data-main="pair/log.js"></script>
        <script type="text/javascript">
        	   
    var j = 0;
    arr_my.forEach(function(a,b){
		console.log(arr_my[b][0]);
		if(arr_my[b][0]<arr_ur[j][0]){}
    });
		</script>
        <script type="text/javascript">
        function drawme(ct){
        	var chartdata = google.visualization.arrayToDataTable(
        	dict['your']
        	/*[
          ['Day', 'TA的心情'],
          ['5.15',  80],
          ['5.16',  50],
          ['5.17',  90],
          ['5.18',  70]
        ]*/);
        	if(ct.id=='m_chart_div'){
        		chartdata = google.visualization.arrayToDataTable(
        		dict['my']
        		/*[
          ['Day', '我的心情'],
          ['5.15',  70],
          ['5.16',  80],
          ['5.17',  50],
          ['5.18',  80]
        ]*/);
        	}
        	else if(ct.id == 'chart_div'){
        	chartdata = google.visualization.arrayToDataTable([
		  ['Day', 'TA的心情','我的心情'],
          [3,  80,	70],
          [6,  , 80],
          [9,  90, 50],
          [12,  70, 80]
        ])
        	}
        	var urchart = $.merge({
         'data' : chartdata,

         'options' : {
          title: 'Mood Chart',
          hAxis: {title: 'Age', minValue: 0, maxValue: 12},
          vAxis: {title: 'Weight', minValue: 0, maxValue: 100},
          legend: 'none'
        }
        },{});
        
        var chart = new google.visualization.ScatterChart(document.getElementById(ct.id));
        chart.draw(urchart['data'], urchart['options']);
       	}
        </script>
</body>
</html>