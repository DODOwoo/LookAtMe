<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>mood log</title>
	<link rel="stylesheet" href="/s/css/main.css" />
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
    </script>
</head>
<body>
	<div class="container">	
		<div class="menu-bar">
			<div class="menu-btn left nav-btn"></div>
			<div class="menu nav-items hide" >
				<ul>
					<li>
						<a href="#">
							<img src="http://placehold.it/50x50" alt="" />
							<span>MENU-ITEM</span>
						</a>
					</li>
					<li>
						<a href="#">
							<img src="http://placehold.it/50x50" alt="" />
							<span>MENU-ITEM</span>
						</a>
					</li>
					<li>
						<a href="#">
							<img src="http://placehold.it/50x50" alt="" />
							<span>MENU-ITEM</span>
						</a>
					</li>
					<li>
						<a href="#">
							<img src="http://placehold.it/50x50" alt="" />
							<span>MENU-ITEM</span>
						</a>
					</li>
				</ul>
			</div>
		</div>
	<div class="row mainbar">
		<div class="left switch tabs">
			<ul>
				<li data-target="yourtab">
					<a href="javascript:;"><img src="http://placehold.it/60x60&text=YOUR"></a>
				</li>
				<li data-target="mytab">
					<a href="javascript:;"><img src="http://placehold.it/60x60&text=MY"></a>
				</li>
				<li data-target="ourtab">
					<a href="javascript:;"><img src="http://placehold.it/60x60&text=OUR"></a>
				</li>
			</ul>
		</div>
		<div class="tab-con diary">
			<div class="me tab-item active" id="mytab">	
				<div class="row">
					<div id="m_chart_div" class="gchart" onclick="drawme(this)" style="width: 900px; height: 500px;"></div>
				</div>
			</div>
			<div class="you tab-item" id="yourtab">
				<div class="row">			
					<div id="u_chart_div" class="gchart" onclick="drawme(this)" style="width: 900px; height: 500px;"></div>
				</div>
			</div>
			<div class="our tab-item" id="ourtab">	
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
        function drawme(ct){
        	var chartdata = google.visualization.arrayToDataTable([
          ['Day', 'TA的心情'],
          ['5.15',  80],
          ['5.16',  50],
          ['5.17',  90],
          ['5.18',  70]
        ]);
        	if(ct.id=='m_chart_div'){
        		chartdata = google.visualization.arrayToDataTable([
          ['Day', '我的心情'],
          ['5.15',  70],
          ['5.16',  80],
          ['5.17',  50],
          ['5.18',  80]
        ]);
        	}
        	else if(ct.id == 'chart_div'){
        	chartdata = google.visualization.arrayToDataTable([
		  ['Day', 'TA的心情','我的心情'],
          ['5.15',  80,	70],
          ['5.16',  50, 80],
          ['5.17',  90, 50],
          ['5.18',  70, 80]
        ])
        	}
        	var urchart = $.merge({
         'data' : chartdata,

         'options' : {
          title: 'Mood Chart'
        }
        },{});
        
        var chart = new google.visualization.LineChart(document.getElementById(ct.id));
        chart.draw(urchart['data'], urchart['options']);
       	}
        </script>
</body>
</html>