<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>demo</title>
	<link rel="stylesheet" href="/s/css/main.css" />
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
			</ul>
		</div>
		<div class="tab-con diary">
			<div class="me tab-item" id="mytab">
				<div class="row title">
					我的心情：可以在这里随机显示点什么
				</div>		
				<div class="row yourheart">
					<div class="moodbar-con">
						<span class="moodbar">
							<em></em>
						</span>
						<div></div>
					</div>	
				</div>
			</div>
			<div class="you tab-item active" id="yourtab">
				<div class="row title">
					TA的心情：可以在这里随机显示点什么
				</div>		
				<div class="row yourheart">
					<div class="moodbar-con">
						<span class="moodbar">
							<em></em>
						</span>
						<div></div>
					</div>	
					<div class="writeup row">
						不知道放点什么，也许是提示语，也许是TA说的话。也许有个输入框，反正写功能的控件都先不做。
					</div>
				</div>


			</div>
		</div>
	</div>
</div>
<script src="/s/seajs/sea.js"
        data-config="pair/config.js"
        data-main="pair/main.js"></script>
</body>
</html>