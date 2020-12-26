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
MM_authFailedURL="gjht5.html"
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
		<title>2024年将宇航员送上月球 分三步走</title>
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
				<h1>2024年将宇航员送上月球 分三步走</h1>
				<center style="margin-top: -50px;">发布日期：2020年10月16日</center>
				<p>据物理学家组织网近日报道，美国国家航空航天局(NASA)最近公布了其“阿尔忒弥斯”(Artemis)登月计划的最新安排：2024年将宇航员送上月球，分三步走，整个任务将耗资280亿美元，其中160亿美元用于研制登月舱。美国总统特朗普已将这一登月计划列为优先发展事项。</p>
				<p>NASA局长吉姆·布里登斯廷在记者会上表示，“政治风险”通常是NASA探测计划面临的最大威胁。比如奥巴马总统上台后就取消了载人火星探测计划——尽管前任总统在该项目上已经花费了数十亿美元。</p>
				<p>布里登斯廷表示：“如果国会在圣诞节前批准第一笔32亿美元的拨款，我们仍有望在2024年实现登月。确切地说，我们的目标是月球南极，而在1969年至1972年之间开展的阿波罗计划中，着陆器降落于月球的赤道。”</p>
				<p>今年4月份，NASA宣布已经与“蓝色起源”公司、Dynetics公司和太空探索技术公司(SpaceX)这3家太空公司签订了价值9.67亿美元的合同，设计载人着陆系统，“其中一家公司研制出的着陆系统会在2024年将第一位女性和一位男性宇航员送到月球表面。”</p>
				<p>第一次飞行——“阿尔忒弥斯1”任务将于2021年11月开展，这是一次无人飞行，目前正处于测试阶段的新型巨型火箭太空发射系统(SLS)将首次同“猎户座”飞船一起升空。随后，2023年，“阿尔忒弥斯2”将携带宇航员绕月飞行，但不会在月球上着陆。最终，2024年，“阿尔忒弥斯3”将与1969年升空的阿波罗11号一样，在月球上着陆，只不过其停留时间更长——一周，而且还将进行2—5次“舱外活动”。</p>
				<p>布里登斯廷说：“我们这次要开展的科学探索活动与阿波罗时代大相径庭。在阿波罗时代，我们以为月亮很干燥，但现在我们知道，月球上有很多水冰，而且我们也知道，这些水冰位于月球南极。”</p>
			</section>
		<div class="backtotop"></div>
	</body>
</html>
