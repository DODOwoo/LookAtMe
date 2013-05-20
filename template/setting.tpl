<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>mood log</title>
	<link rel="stylesheet" href="/s/css/main.css" />
	<link rel="stylesheet" href="/s/css/common.css" />
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
				<li data-target="mytab">
					<a href="javascript:;"><img src="http://placehold.it/60x60&text=MY"></a>
				</li>
			</ul>
		</div>
		<div class="tab-con diary">
			<div class="me tab-item active" id="mytab">	
				<form action="/set" method="post">
					<div class="row">
						Pair:<input type="text" name="pair" value="{{pair}}" />
					</div>
					<div class="row">
						Password:<input type="password" name="password" value="{{password}}" />
					</div>
					<div class="row">
						Phone:<input type="text" name="phone" value="{{phone}}" />
					</div>
					<input type="hidden" name="name" value="{{myid}}"/>
					<div class="row">
						<button>Update</button>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>
<!--<script src="/s/seajs/sea.js"
        data-config="pair/config.js"
        data-main="pair/log.js"></script>-->
</body>
</html>