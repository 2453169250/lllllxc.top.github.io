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
MM_authFailedURL="wz-zx5.html"
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
		<title>12月的天象</title>
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
						<li><a href="zght.asp" class="nav-0-a">中国航天</a></li>
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
							<li class="nav-2-li"><a href="index.html" class="nav-2-a" style="color: #bfbfbf;">首页</a></li>
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
				<h1>12月的天象</h1>
				<video src="img/6/1/5/1.mp4" controls="controls" width="80%" height="100%"></video><center><i>Credit: NASA/JPL-Caltech</i></center>
				<p>十二月的天空会发生什么？一场流星雨，一场木星和土星之间的罕见的近距离接触，还有冬至。</p>
				<img src="img/6/1/5/2.jpg"/><center><i>Credit: NASA/JPL-Caltech</i></center>
				<p>12月带来了每年最可靠的流星雨之一，也是2020年最好的流星雨之一——双子座流星雨。这场流星雨从12月4日到17日非常活跃，因为地球在小行星法厄同3200轨道上留下的尘埃碎片的痕迹中穿行。这可能是一颗被烧毁的彗星。</p>
				<p>双子座流星雨大多数年份都能产生大量的流星，但今年的流星雨更甚。因为流星雨的高峰期正好赶上新月的到来，因此天空变得更暗，没有月光来干扰较暗的流星，双子座流星雨在12月13日夜间至14日早晨达到高峰，前后几天都能看到一些流星活动。北半球整夜都可以观看，当地时间凌晨2点左右最活跃，而对于南半球的观众来说则是在午夜之后观看。</p>
				<p>为了获得最佳的观赏效果，找一个远离城市灯光的安全地点，平躺在地上，双脚指向南方，双脚朝南，然后抬头往天空上看。流星可以出现在天空的任何地方，不过，它们看起来像是从双子座附近放射出来。所以，在这里愿你的天空晴朗，看到流星。</p>
				<img src="img/6/1/5/3.jpg"/><center><i>Credit: NASA/JPL-Caltech</i></center>
				<p>木星和土星一整年都在一起穿越天空，但这个月，准备好让它们真正上演一出好戏吧。在12月的前三周，每天晚上观看这两颗行星在天空中的距离比它们20年来的距离都要近。在日落后的一小时内，在西南部寻找它们，而在12月21日，两颗巨大的行星将相距仅十分之一度，这大约是一枚一角硬币的厚度。这意味着这两颗行星和它们的卫星，可以通过双筒望远镜或小型望远镜在同一视野中看到。实际上，土星看起来会像木星的卫星一样靠近木星。
</p>
				<img src="img/6/1/5/4.jpg" /><center><i>Credit: NASA/JPL-Caltech</i></center>
				<p>这一事件被称为“伟大的合相”。这种现象在本世纪每20年发生一次，因为地球、木星和土星的轨道周期性地排成一条直线，使得这两颗外行星在我们的夜空中显得很近。即便如此，这也是木星和土星在接下来的60年里最伟大的合相，这两颗行星直到2080年才在天空中如此近距离出现。</p>
				<p>21日也是冬至点，北半球是冬至，南半球是夏至。在冬至点这一天，无论你身在地球的哪个角落，太阳都会到达它在天空中最南端的位置。</p>
				<p>在北半球，太阳在这一天以最低、最短的路径穿过天空。因此，在北方，冬至带来了一年中日照时间最短的一天。现在，太阳在天空中一年四季的高度变化是由地球围绕我们的恒星公转时的倾斜引起的。这种倾斜使得每个半球接收到的太阳光在每年的季节周期中上下波动。</p>
				<p>这是十二月的月相。</p>
				<img src="img/6/1/5/5.jpg"/><center><i>Credit: NASA/JPL-Caltech</i></center>
				<p>你可以在NASA.gov网站上了解所有NASA探索太阳系和太阳系以外的任务。我是来自美国宇航局喷气推进实验室的普雷斯顿·戴奇斯，这就是这个月的天象。</p>
				<p><strong>参考来源：</strong></p>
				<p><a href="https://solarsystem.nasa.gov/whats-up-skywatching-tips-from-nasa/" target="_blank">https://solarsystem.nasa.gov/whats-up-skywatching-tips-from-nasa/</a></p>
			</section>
		<div class="backtotop"></div>
	</body>
</html>
