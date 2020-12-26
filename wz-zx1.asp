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
MM_authFailedURL="wz-zx1.html"
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
		<title>土星与木星的大近合</title>
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
			<header>
				<div class="top">
					<a href="index.asp"><img src="img/logoko0.png"></a>
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
			</header>
			<section class="wz-section">
				<h1>土星与木星的大近合</h1>
				<img src="img/6/1/1/1.jpg" /><center><i>2020年12月13日星期日，在弗吉尼亚州卢雷，雪兰多国家公园日落后拍摄的土星(上方)和木星(下方)。两颗行星在12月21日朝着大近合前进时，彼此之间的距离越来越近，这两个巨行星之间的距离将相差十分之一度。<br/>
来源：NASA / Bill Ingalls</i></center>
				<p>天文爱好者迎来了年终盛宴。俗称“圣诞节之星”的是一颗特别活跃的行星结，在接下来的两周里，当明亮的木星和土星近合在12月21日晚上达到顶峰时，很容易在傍晚的天空中看到它们。</p>
				<p>1610年，意大利天文学家伽利略·伽利莱（Galileo Galilei）将望远镜对准夜空，发现了木星的四个卫星——木卫一、木卫二、木卫三和木卫四。同一年，伽利略还在土星周围发现了一个奇怪的椭圆形，后来的观测确定这就是土星环。这些发现改变了人们对太阳系的认识。</p>
				<p>13年后的1623年，太阳系的两颗大行星——木星和土星一起划过天空。在一次被称为大近合的天文事件中，木星赶上并超过了土星。</p>
				<p>“你可以把太阳系想象成一个跑道，每个行星都在自己的跑道上奔跑，而地球则朝着体育场的中心奔跑，”NASA华盛顿总部行星科学部的天文学家亨利·特鲁普(Henry Throop)说。“从有利的角度来看，我们将能够看到木星在内部跑道上，整整一个月都接近土星，最后在12月21日超越木星。”</p>
				<p>这两颗行星在太阳系中有规律地掠过，木星和土星的位置大约每20年在天空中排成一条直线。</p>
				<p>那么，是什么让今年的奇观如此罕见呢？两颗行星在天空中如此接近地掠过已经过去了近400年，而土星和木星在夜间连成一线也已经过去了近800年，就像2020年一样，这让全世界几乎所有人都见证了这一大近合。</p>
				<p>最近的近合将出现在十分之一度的距离，并持续几天。在21号，它们会显得如此接近，以至于与小臂保持一定距离的手指很容易遮盖天空中的两个行星。日落之后，朝西南方向看，将很容易用肉眼看到这些行星。</p>
				<p>从我们在地球上的有利位置看，这两颗巨大的气体巨星看上去非常近，但它们在太空中的距离将保持数亿英里。而且，虽然在冬至的同一天发生了近合，但基于行星的轨道和地球的倾斜，时间只是巧合。</p>
				<p>“这样的结合可能在一年中的任何一天发生，这取决于行星在它们轨道上的位置。”思鲁普（Throop）说，“近合的日期是由木星、土星和地球在它们绕太阳运行轨道上的位置决定，而至日的日期是由地球轴线的倾斜决定。冬至是一年中最长的夜晚，所以这个罕见的巧合将给人们一个绝佳的机会去外面看看太阳系。”</p>
				<p>不知道什么时候该抬头看，在什么地方该抬头看？12月17日星期四，加入思鲁普在#NASAScience Live上谈论大近合的节目。通过使用#askNASA提交你的问题。NASA科学直播将于美国东部时间周四下午3点在NASA电视台和NASA网站上直播，还在NASA的Facebook、YouTube和Periscope频道上同步转播。</p>
				<p>对于那些想亲眼目睹这一现象的人来说，可以这样做:</p>
				<p>寻找一个没有遮挡天空的地点，例如田野或公园。木星和土星明亮，因此即使在大多数城市也能看到它们。</p>
				<p>日落一小时后，望向西南的天空。木星将看起来像一颗明亮的恒星，很容易被看到。土星会稍微暗淡一些，并会出现在木星的上方和左侧，直到12月21日，当木星将超过它，它们将在天空中改变位置。</p>
				<p>这些行星可以用肉眼看到，但如果你有双筒望远镜或小型望远镜，你也许能看到木星的四颗大卫星围绕着这颗巨大的行星运行。</p>
				<p>每到夜晚，这两颗行星将会在日落后的一个小时内出现在较低的西南方向，如下图所示:</p>
				<img src="img/6/1/1/2.jpg" /><center><i>来源：NASA/JPL-Caltech</i></center>
				<p>学习以下如何拍摄行星的技巧和技巧:</p>
				<p><a href="https://solarsystem.nasa.gov/news/1615/how-to-photograph-the-conjunction-of-saturn-and-jupiter/" target="_blank">https://solarsystem.nasa.gov/news/1615/how-to-photograph-the-conjunction-of-saturn-and-jupiter/</a></p>
				<p>夜空网络:</p>
				<p><a href="https://nightsky.jpl.nasa.gov/" target="_blank">https://nightsky.jpl.nasa.gov/</a></p>
				<p>木星和土星的访客：</p>
				<p><a href="https://nightsky.jpl.nasa.gov/news-display.cfm?News_ID=931" target="_blank">https://nightsky.jpl.nasa.gov/news-display.cfm?News_ID=931</a></p>
				<p>想了解更多关于行星近合的知识吗？看看这些资源:</p>
				<p><a href="https://blogs.nasa.gov/Watch_the_Skies/2015/06/30/jupiter-and-venus-conjunction/" target="_blank">https://blogs.nasa.gov/Watch_the_Skies/2015/06/30/jupiter-and-venus-conjunction/</a></p>
				<p><a href="https://youtu.be/sofRYcfaqy0" target="_blank">https://youtu.be/sofRYcfaqy0</a></p>
				<p>阅读NASA的这些观察天空的小贴士:</p>
				<p><a href="https://solarsystem.nasa.gov/whats-up-skywatching-tips-from-nasa/" target="_blank">https://solarsystem.nasa.gov/whats-up-skywatching-tips-from-nasa/</a></p>
				<p><strong>参考来源：</strong></p>
				<p><a href="https://www.nasa.gov/feature/the-great-conjunction-of-jupiter-and-saturn" target="_blank">https://www.nasa.gov/feature/the-great-conjunction-of-jupiter-and-saturn</a></p>
			</section>
		<div class="backtotop"></div>
	</body>
</html>
