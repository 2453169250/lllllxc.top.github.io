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
MM_authFailedURL="wz-kp6.html"
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
		<title>火星的基本事实</title>
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
				<h1>火星的基本事实</h1>
			<img src="img/6/3/6/1.jpg" >
			<center><i>红色火星<br/>Credit：NASA</i></center>
			<img src="img/6/3/6/2.jpg" >
			<center><i>火星是太阳系内，距离太阳从近到远的第四颗行星。<br/>Credit：NASA</i></center>
			<img src="img/6/3/6/3.jpg" >
			<center><i>火星有两颗卫星，分别是火卫一和火卫二，一个22.2公里，一个12.6公里。<br/>Credit：NASA</i></center>
			<img src="img/6/3/6/4.gif" >
			<center><i>地球的直径12742公里（7926英里），火星的直径6779公里（4220英里），月球的直径3474.2公里（2159英里）。<br/>Credit：NASA</i></center>
			<img src="img/6/3/6/5.gif" >
			<center><i>如果你在地球上称重100磅，那么你在火星上的重量只有38磅，想要减肥吗？去火星吧！<br/>
Credit：NASA</i></center>
			<img src="img/6/3/6/6.gif" >
			<center><i>地球平均距离太阳的1.5亿公里（1AU），火星平均距离太阳2.29亿公里（1.5AU）。<br/>
			Credit：NASA</i></center>
			<img src="img/6/3/6/7.gif" >
			<center><i>地球环绕太阳一周365天，火星环绕太阳一周687天，一个火星年的长度约是一个地球年的两倍。<br/>
			Credit：NASA</i></center>
			<img src="img/6/3/6/8.gif" >
			<center><i>地球的体积是火星体积的6倍多。<br/>
			Credit：NASA</i></center>
			<img src="img/6/3/6/9.jpg" >
			<center><i>火星的平均温度为零下63摄氏度，地球平均温度为14摄氏度。<br/>
火星最高温度为30摄氏度，地球最高温度为58摄氏度。<br/>
火星最低温度为零下140摄氏度，地球最低温度为零下88摄氏度。<br/>
			Credit：NASA</i></center>
			<img src="img/6/3/6/10.gif" >
			<center><i>火星的核心和地球类似，但火星的确切结构尚不清楚。<br/>
			Credit：NASA</i></center>
			<img src="img/6/3/6/11.gif" >
			<center><i>火星的重量大约是地球的十分之一。<br/>
			Credit：NASA</i></center>
			<img src="img/6/3/6/12.gif" >
			<center><i>在火星上，你的重力比地球上小62.5%，所以你会跳的更远。<br/>
			Credit：NASA</i></center>
			<img src="img/6/3/6/13.gif" >
			<center><i>火星的大气层非常稀薄，96%是二氧化碳，氮气小于2%，氩气小于2%，其他成分小于1%。地球的大气成分78%是氮气，21%是氧气，其他成分占1%。<br/>
			Credit：NASA</i></center>
			<div class='video_wrapper'>
			<iframe id="MarsModel" src='https://mars.nasa.gov/layout/embed/model/?s=1&#038;rotate=true' width='100%' height='720' scrolling='no' frameborder='0' allowfullscreen></iframe></span></p>
			<style>.video_wrapper {height:720px !important;width:90%;margin: 0 auto;}</style>
			<p><span>
			</div>
			<p style="text-align: center;"><em><strong>行星火星：单击（或触摸）并拖动以与该行星火星3D模型进行交互。</strong></em></p>
			
			<p><strong>参考：</strong></p>
			<p><a href="https://mars.nasa.gov/all-about-mars/facts/" target="_blank">https://mars.nasa.gov/all-about-mars/facts/</a></p>
			</section>
		<div class="backtotop"></div>
	</body>
</html>
