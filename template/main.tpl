<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en">
<head>
	<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
	<title>demo</title>
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
						<a href="/show/{{me['name']}}">
							<img src="/s/img/icon1.png" alt="" />
							<span>主页</span>
						</a>
					</li>
					<li>
						<a href="/log/{{me['name']}}">
							 <img src="/s/img/icon2.png" alt="" />
							<span>历史</span>
						</a>
					</li>
					<li>
						<a href="/setting/{{me['name']}}">
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
				<li data-target="yourtab" class="active">
					<a href="javascript:;">
						<div class="tabtag">{{you["name"]}}</div>
					</a>
				</li>
				<li data-target="mytab">
					<a href="javascript:;"><div class="tabtag">{{me["name"]}}</div></a>
				</li>
			</ul>
		</div>
		<div class="tab-con diary">
			<div class="me tab-item" id="mytab">
				<div class="row title">
					我目前的心情值：
				</div>		
				<div class="row yourheart">
					<div class="moodbar-con">
						<span class="moodbar">
							<em></em>
						</span>
						<div class="mood-txt"></div>
						<div class="modifyMood">
							<div class="addbtn left btn">
								<a href="javascript:;"><img src="http://placehold.it/150x50&text=add5"/></a>
							</div>
							<div class="submit left btn">
								<a  href="javascript:;"><img src="http://placehold.it/150x50&text=go"/></a>
							</div>
							<div class="minusebtn left btn">
								<a  href="javascript:;"><img src="http://placehold.it/150x50&text=minus5"/></a>
							</div>							
						</div>
					</div>	
				</div>
				<div class="clearfix"></div>
			</div>
			<div class="you tab-item active" id="yourtab">
				<div class="row title">
					{{you["name"]}}目前的心情值：
				</div>		
				<div class="row yourheart">
					<div class="moodbar-con">
						<span class="moodbar">
							<em></em>
						</span>
						<div class="mood-txt"></div>
					</div>	
					
				</div>
				<div class="clearfix"></div>

			</div>
		</div>
	</div>
</div>
<script>
	var mymood = {{me["score"]}};
	var yourmood = {{you["score"]}};
	var myid = '{{me["name"]}}';
	var yourid = '{{you["name"]}}';
</script>
<script src="/s/seajs/sea.js"
        data-config="pair/config.js"
        data-main="pair/main.js"></script>
</body>
</html>