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
MM_authFailedURL="wz-kp2.html"
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
		<title>行星上的季节变化</title>
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
				<h1>行星上的季节变化</h1>
				<img src="img/6/3/2/1.jpg" ><center><i>Credit：NASA</i></center>
				<p>9月22日是北半球的秋分，同时也是南半球的春分，也就是说昨天是北半球入秋第一天，南半球入春第一天。</p>
				<p>地球上有着明显的春夏秋冬，四季分明，但不是太阳系中每颗行星都有明显的四季变化。</p>
				<img src="img/6/3/2/2.jpg"><center><i>Credit：NASA</i></center>
				<p>行星上的季节变化由两个因素引起，轴倾角（axial tilt）和轨道偏心率（orbital eccentricity）。轴倾角指的是行星的自转轴相对于轨道面的倾斜程度。水星，金星和木星的轴倾角很小，地球，火星，土星，海王星的轴倾角都是二十多度，而天王星最夸张，轴倾角82度，和其他行星兄弟相比，几乎是躺着。</p>
				<p>轨道偏心率简单说指的是远日点和近日点的变化比，太阳系所有的行星的轨道都是椭圆，轨道偏心率决定了椭圆轨道的扁平程度。</p>
				<p>拿我们地球来说，轨道偏心率为0.02，环绕太阳的轨道几乎是圆形，所以这点对地球上的气候影响很小。地球的轴倾角为23.5°，我们星球上的季节变化主要由它决定，当北极偏向太阳时，北半球迎来了夏天，当北极偏离太阳时，北半球迎来了冬天。</p>
				<p>水星，金星和木星上的轴倾角很小，这三颗行星上的季节变化很小。</p>
				<p>水星，几乎没有季节变化。水星上的一天（一昼夜）相当于177个地球日，一年相当于88个地球日。另外由于没有大气层保护，水星昼夜温差极大，面向太阳的一面，白天温度可答430摄氏度，背向太阳的一面，夜晚的温度低至零下180摄氏度。</p>
				<p>金星有着浓厚的大气层，导致其表面温度高达470摄氏度。多提一句，大气层中的温度随着距离地面的高度而不同，在其距离地面约30英里的大气层中，温度和地球相当。</p>
				<p>火星的轴倾角是 24°，略高于地球，但火星轨道偏心率是0.09，是地球的四倍多，火星环绕太阳的轨道在1.64 AU和1.36 AU之间，这两种情况的加持下，导致火星上的季节变化比我们地球大很多。</p>
				<p>我们都知道，火星上的大气很稀薄，约为地球的1%。另外引起我们注意的是，火星上的大气压力随着季节发生变化，火星上冬季的全球大气压力比夏季低25%，之所以有这种情况发生，是因为火星的轨道偏心率，以及火星两极干冰冰冠和二氧化碳的交换。火星北半球在冬至比在夏至，距离太阳近约10%，火星北半球冬至时，北极冰冠吸收的二氧化碳，比南极在同期吸收的多。</p>
				<p>天王星上一年相当于84个地球年，轨道偏心率为0.06，它环绕太阳的轨道几乎也是圆形，但天王星的轴倾角为82度，这就导致天王星上长达四分之一的时间里有着极端的季节变化，当太阳光直射天王星极区时，其他地区就陷入了漫长、黑暗、寒冷的冬天。</p>
			<p><strong>参考：</strong></p>
			<p><a href="https://science.nasa.gov/science-news/science-at-nasa/2000/interplanetaryseasons" target="_blank">https://science.nasa.gov/science-news/science-at-nasa/2000/interplanetaryseasons</a></p>
			</section>
		<div class="backtotop"></div>
	</body>
</html>
