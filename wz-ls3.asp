<%@LANGUAGE="VBSCRIPT"%>
<%
' *** Logout the current user.
MM_Logout = CStr(Request.ServerVariables("URL")) & "?MM_Logoutnow=1"
If (CStr(Request("MM_Logoutnow")) = "1") Then
  Session.Contents.Remove("MM_Username")
  Session.Contents.Remove("MM_UserAuthorization")
  MM_logoutRedirectPage = "index.html"
  ' redirect with URL parameters (remove the "MM_Logoutnow" query param).
  if (MM_logoutRedirectPage = "") Then MM_logoutRedirectPage = CStr(Request.ServerVariables("URL"))
  If (InStr(1, UC_redirectPage, "?", vbTextCompare) = 0 And Request.QueryString <> "") Then
    MM_newQS = "?"
    For Each Item In Request.QueryString
      If (Item <> "MM_Logoutnow") Then
        If (Len(MM_newQS) > 1) Then MM_newQS = MM_newQS & "&"
        MM_newQS = MM_newQS & Item & "=" & Server.URLencode(Request.QueryString(Item))
      End If
    Next
    if (Len(MM_newQS) > 1) Then MM_logoutRedirectPage = MM_logoutRedirectPage & MM_newQS
  End If
  Response.Redirect(MM_logoutRedirectPage)
End If
%>
<%
' *** Restrict Access To Page: Grant or deny access to this page
MM_authorizedUsers=""
MM_authFailedURL="wz-ls3.html"
MM_grantAccess=false
If Session("MM_Username") <> "" Then
  If (true Or CStr(Session("MM_UserAuthorization"))="") Or _
         (InStr(1,MM_authorizedUsers,Session("MM_UserAuthorization"))>=1) Then
    MM_grantAccess = true
  End If
End If
If Not MM_grantAccess Then
  MM_qsChar = "?"
  If (InStr(1,MM_authFailedURL,"?") >= 1) Then MM_qsChar = "&"
  MM_referrer = Request.ServerVariables("URL")
  if (Len(Request.QueryString()) > 0) Then MM_referrer = MM_referrer & "?" & Request.QueryString()
  MM_authFailedURL = MM_authFailedURL & MM_qsChar & "accessdenied=" & Server.URLEncode(MM_referrer)
  Response.Redirect(MM_authFailedURL)
End If
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<meta name="apple-mobile-web-app-title" content="太空旅客"/>
		<title>50年前人类迈出了划时代的一大步</title>
		<link rel="stylesheet" href="css/index.css"/>
		<!-- <base target="_blank"/> -->
		<script src="js/jquery.min.js"></script>
		<script src="js/index.js"></script>
		<link rel="icon" href="img/favicon.png" type="image/x-icon">
		<link rel="stylesheet" href="font/iconfont.css">
		<link rel="stylesheet" href="css/wz.css"/>
	</head>
	<body>
		<div class="beijing1"></div>
		<div class="zhezhao"></div>
			<header>
				<div class="top">
					<a href="javascript:;" class="header-menu"></a>
					<a href="index.asp" class="logo"><img src="img/logoko0.png"></a>
				</div>
				<nav>
					<ul class="nav-0">
						<li><a href="index.asp" class="nav-0-a">首页</a></li>
						<li class="a1"><a class="nav-0-a">每日一图<span class="bottom"></span></a>
							<ul class="nav-1">
								<li><a href="mryt-nasa.asp" class="nav-1-a">NASA·每日一图</a></li>
								<li><a href="mryt-tw.asp" class="nav-1-a">天文·每日一图</a></li>
							</ul>
						</li>
						<li  class="a2"><a class="nav-0-a">文章分类<span class="bottom"></span></a>
							<ul class="nav-1">
								<li><a href="wz.asp?type=1" class="nav-1-a">咨讯</a></li>
								<li><a href="wz.asp?type=2" class="nav-1-a">新闻</a></li>
								<li><a href="wz.asp?type=3" class="nav-1-a">科普</a></li>
								<li><a href="wz.asp?type=4" class="nav-1-a">历史</a></li>
							</ul>
						</li>
						<li><a href="zght.html" class="nav-0-a">中国航天</a></li>
						<li><a href="liuyan.asp" class="nav-0-a">留言板</a></li>
						<span style="color:#fff;line-height:35px; margin-left:20px;font-size:14px;">欢迎用户 <%=Session("MM_Username") %> <a href="<%= MM_Logout %>" style="color:#FC9;text-decoration:none;font-size:13px;margin-left:20px;">注销</a></span>
						<li>
							<div class="box">
								<form action="https://www.baidu.com/s" target="_blank">
									<input type="search" name="wd" class="search_text" placeholder="探索"/> <button class="search icon-search"></button>
									 
								</form>
								 
							</div>
						</li>
					</ul>
				</nav>
			<div class="nav-2">
						<ul class="nav-2-ul">
							<li class="nav-2-li n1"><a href="index.html" class="nav-2-a" style="color: #bfbfbf;">首页</a></li>
							<li class="nav-2-li n1"><a class="nav-2-a nav-click">每日一图<span class="bottom2"></span></a>
								<ul class="nav-3">
									<li><a href="mryt-nasa.html" class="nav-3-a">NASA·每日一图</a></li>
									<li><a href="mryt-tw.html" class="nav-3-a">天文·每日一图</a></li>
								</ul>
							</li>
							<li class="nav-2-li n2"><a class="nav-2-a nav-click">文章分类<span class="bottom2"></span></a>
								<ul class="nav-3">
									<li><a href="wz.html?type=1" class="nav-3-a">咨讯</a></li>
									<li><a href="wz.html?type=2" class="nav-3-a">新闻</a></li>
									<li><a href="wz.html?type=3" class="nav-3-a">科普</a></li>
									<li><a href="wz.html?type=4" class="nav-3-a">历史</a></li>
								</ul>
							</li>
							<li class="nav-2-li"><a href="zght.html" class="nav-2-a" style="color: #bfbfbf;">中国航天</a></li>
						</ul>
					</div>
				</nav>
			</header>
			<section class="wz-section">
			<h1>50年前人类迈出了划时代的一大步</h1>
			<video src="img/6/4/3/1.mp4" controls="controls" width="100%" height="100%"></video>
			<center><i>阿波罗11号月球行走时留下的脚印（其中有部分为2009年修复重制）<br />
视频来源：NASA</i></center>
			<p>1961年，尤里•阿列克谢耶维奇•加加林（Yuri Alekseyevich Gagarin）乘坐东方1号宇宙飞船（Vostok 1），成为了第一名进入太空的人类宇航员；艾伦•谢泼德（Alan Shepard）紧随他的脚步，在一个月后也成功遨游了宇宙，成为了第一位进入太空的美国宇航员。</p>
			<p>时隔8年之后的1969年7月，肯尼迪总统提出了新的挑战：在人类进入太空的头十年结束之前，送宇航员登上月球！</p>
			<img src="img/6/4/3/2.jpg" ><center><i>阿波罗11号的指令长尼尔•阿姆斯特朗在登月舱的设备存储区工作。这是在月球行走中展示阿姆斯特朗的为数不多的照片之一。<br/>图片来源：NASA</i></center>
			<img src="img/6/4/3/3.jpg"/><center><i>火光与烟雾之中，土星5号运载火箭离开了发射台，开启了一个划时代的太空旅程。<br/>
图片来源：NASA</i></center>
			<img src="img/6/4/3/4.jpg" /><center><i>巴兹•奥尔德林从“鹰”号登月舱的爬梯上下来，登陆到月球表面。<br/>
图片来源：NASA</i></center>
			<img src="img/6/4/3/5.jpg"/><center><i>从月球轨道拍摄的这张照片中，陨石坑308格外突出。<br/>
图片来源：NASA</i></center>
			<p>对于美国航空航天局（NASA）来说，1968年12月，用土星5号（Saturn V）超重型运载火箭将阿波罗8号（Apollo 8）一路送上月球就已经是一个大胆的决定了，毕竟阿波罗8号是地球之外的人类第一次太空飞行。</p>
			<p>就在仅仅七个月后，1969年7月16日的早晨，在肯尼迪航天中心（Kennedy Space Center）的39A发射台（Launch Complex 39A）上，阿波罗11号（Apollo 11）的三名宇航员尼尔•阿姆斯特朗（Neil Armstrong）、巴兹•奥尔德林（Buzz Aldrin）和迈克尔•柯林斯（Michael Collins）又登上了土星5号火箭。这架高达363英尺（110.6米）的三级火箭，将利用它750万磅（约34兆牛顿）的推力，将三名宇航员载上月球，载入历史。</p>
			<img src="img/6/4/3/6.jpg"><center><i>阿波罗11号的三名宇航员。<br/>
图片来源：NASA</i></center>
			<p>美国东部时间上午9:32（北京时间晚上9:32），发动机启动，阿波罗11号离开了发射台。大约12分钟之后，三位宇航员进入了地球轨道。</p>
			<p>绕轨运行一圈半之后，阿波罗11号收到了一项重要指令，被任务指挥官称为“月球转移轨道射入”（Translunar Injection，TLI），也就是到了前往月球的时间点了。三天后，三名宇航员成功进入月球轨道；又过了一天之后，阿姆斯特朗和奥尔德林爬入了“鹰”号登月舱（lunar module Eagle），并开始向月球表面着陆，与此同时，柯林斯则待在哥伦比亚号指令舱（command module Columbia）中继续绕轨飞行。</p>
			<p>柯林斯在后来的回忆录中写道：“‘鹰’号登月舱是我在天空中看过的样子最复杂怪异的装置了。”但在那一历史性的时刻里，这个奇怪的东西证明了自己存在的价值。</p>
			<p>当他们需要将“鹰”号登月舱降落到月球表面的陨石坑宁静海（Sea of Tranquility）时，阿姆斯特朗进行了一段“即兴表演”，手动驾驶登月舱飞跃过一片满是巨大石块的区域，在着陆前的最后几秒时间里，“鹰”号的计算机响起了警报。</p>
			<p>结果证明，这只是当计算机同时运行的程序过多时普遍出现的问题，不过后来奥尔德林指出“非常不幸的是，就在我们不想处理这些问题的时候，警报响了。”</p>
			<p>美国东部时间下午4:18（北京时间第二天凌晨4:18），登月舱降落在月球表面，那时剩下的燃料只能支持30秒的飞行时间了。阿姆斯特朗向地球传回了无线电通讯：“休斯顿中心，我们已到达宁静海，‘鹰’号登月舱已成功登陆月球。”休息顿指挥中心的紧张局势瞬间瓦解，所有人都沉浸在兴奋激动的欢呼之中，其中一名指挥官告诉阿姆斯特朗说：“你刚刚让我们这一大帮人都脸色铁青，现在终于可以正常呼吸了。”</p>
			<p>阿姆斯特朗在后来承认道，登月舱着陆月球是他在这次登月任务中最大的担忧，还表明“未知数非常之多，”并且“整个过程中大概有一千件事情需要揪着心。”</p>
			<p>美国东部时间晚上10:56（北京时间第二天上午10:56）的时候，阿姆斯特朗做好了充足的准备，将要在月球上留下第一个人类脚印。当时，通过电视直播见证这历史性一刻的观众数量达到了5亿，在所有人焦灼的注视之下，阿姆斯特朗顺着爬梯踏上了月球的表面，宣布道：“这是我个人的一小步，却是全人类的一大步。”（”That’s one small step for a man, one giant leap for mankind. “）</p>
			<center><audio style="text-align: center;outline: none;" src="img/6/4/3/6.mp3" controls="controls"></audio></center>
			<center><i>“这是我个人的一小步，却是全人类的一大步。”<br/>
音频来源：NASA</i></center>
			<p>奥尔德林在不久之后也踏足了月球表面，并用简短有力的描述表达了月球的景象：“壮丽的荒凉。”（”magnificent desolation.”）他们两人在月球表面进行了2个半小时的探索，收集月球样本并拍摄月表照片。</p>
			<p>除了从月球拿走一些东西，他们还在上面留下了一些东西：一面美国国旗、纪念阿波罗1号失事宇航员的一小块飞船碎片，以及一个“鹰”号登月舱支撑腿上的铭牌，上面写着：“在这里，来自行星地球的人类第一次踏足月球。公元1969年7月。我们为全人类的和平而来。”（”Here men from the planet Earth first set foot upon the moon. July 1969 A.D. We came in peace for all mankind.”）</p>
			<img src="img/6/4/3/8.jpg"><center><i>“鹰”号登月舱支撑腿上的铭牌<br/>
图片来源：NASA</i></center>
			<p>结束月球表面的初访和赠礼后，阿姆斯特朗和奥尔德林再次点火升空，与柯林斯驾驶的哥伦比亚号指挥舱对接。柯林斯后来表示：“直到那时，我才第一次觉得我们就要将这些月亮上的东西带走了。”</p>
			<p>7月24日，阿波罗11号的全体宇航员溅落在夏威夷附近的海域，肯尼迪总统提出的挑战取得了圆满的成功：来自地球的人类完成了月球行走，并安全回家。</p>
			<p>在几年之后的一次采访中，阿姆斯特朗不忘赞扬这场胜利之后的“数十万名”功臣：“每个进行测试的人，或拧着扳手或调着扭矩，无论男女他们都在说：‘如果哪里出了问题，绝对不会是我的错。’”</p>
			<p>在登月结束后的一次新闻发布会上，阿姆斯特朗将这次的载人飞行称为“一个新时代的起点”，柯林斯则展望了未来登陆火星的人类之旅。</p>
			<p>在此后三年半的时间里，10名宇航员延续了他们的丰功伟绩，吉恩•塞尔南（Gene Cernan）是最后一项阿波罗任务（阿波罗17号）的指令长，也是目前为止最后一个登上月球的宇航员，他在月球表面留下了这样一句话：“轻轻的我们走了，正如我们轻轻的来，如若神祉应允，我们还会回来，带着全人类的和平与希望。”（”We leave as we came and, God willing, as we shall return, with peace, and hope for all mankind.”）</p>
			<p><strong>参考来源：</strong></p>
			<p>[1]<a href="https://www.nasa.gov/mission_pages/apollo/apollo11.html" target="_blank">https://www.nasa.gov/mission_pages/apollo/apollo11.html</a></p>
			</section>
		<div class="backtotop"></div>
	</body>
</html>
