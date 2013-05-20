<html>
<head>
	<title>LookAtMe</title>
	<link rel="stylesheet" href="/s/css/foundation.css">
	<link rel="stylesheet" href="/s/css/normalize.css">
	<link rel="stylesheet" href="/s/css/look.css" media="screen">
	<link rel="stylesheet" href="/s/css/common.css">
	<meta charset="utf-8">
</head>
<body>
	<div class="page">
		<div class="top">
				<div class="words">
					「你能听到我的心在砰砰跳，<br>
						你却假装什么都不知道。」
				</div>
				<div class="login-fm">
					<div class="logo">
						<img src="http://placehold.it/300x150&text=300x150LOGO">
					</div>
					<div class="l">
						
						<div class="btns tabs ">
							<ul>
								<li class="left" data-target="login">
									<a href="javascript:;">login</a>
								</li>
								<li class="left" data-target="signup">
									<a href="javascript:;">signup</a>
								</li>
							</ul>
						</div>
						<div class="clearfix"></div>
						<form action="/login" class="fm tab-item active" id="login" method="POST">
							<ul>
								<li>
									<div class="fit">Name：</div><input type="text" name="name" class="ipt">
								</li>
								<li>
									<div class="fit">Password:</div><input type="password" name="password" class="ipt">
								</li>
								<li>
									<button class="enter">enter</button>
								</li>
							</ul>
							
						</form>

						<form action="/adduser" class="fm tab-item" id="signup" method="POST">
							<ul>
								<li>
									<div class="fit">Name：</div><input type="text" name="name" class="ipt">
								</li>
								<li>
									<div class="fit">Password:</div><input type="password" name="password" class="ipt">
								</li>
								<li>
									<button class="enter">signup</button>
								</li>
							</ul>
						</form>
					</div>
				</div>
		</div>
		<div class="bottom">
			DODOWOO & FULUCHII
		</div>
	</div>

	<script src="s/seajs/sea.js"
        data-config="pair/config.js"
        data-main="pair/nologin.js"></script>

</body>
</body>
</html>