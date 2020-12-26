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
MM_authFailedURL="gjht4.html"
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
		<title>美国宇航局计划在小行星表面采集岩石样本</title>
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
			</header>
			<section class="wz-section">
				<h1>美国宇航局计划在小行星表面采集岩石样本</h1>
				<center style="margin-top: -50px;">发布日期：2020年10月20日</center>
				<p>美国国家航空航天局(NASA)10月19日宣布，“奥西里斯-雷克斯”探测器将于本月20日在小行星“本努”(Bennu)表面收集太空岩石样本。</p>
				<img src="img/7/07.png" ><center><i>资料图：由水和沉积物形成的杰泽罗陨石坑。</i></center>
				<p>NASA称，这颗被命名为“本努”的小行星，其表面有许多砾石堆积。NASA的探测器“奥西里斯-雷克斯”绕着它运转了近两年。目前，它们距离地球约2.07亿英里。NASA计划在“本努”的一个陨石坑内采集至少2盎司岩石样本。</p>
				<p>NASA表示，美国宇航局采集过一些太空岩石样本，如月亮砾石、彗星尘埃和太阳风粒子。如果本次任务成功，将成为NASA采集的最大太空岩石样本。</p>
				<p>据《今日美国》报道，该任务首席科学家但丁·洛雷塔本月19日表示，小行星“本努”在45亿年前太阳系形成的时候就已经存在了，其表面拥有大量含碳材料，对这颗小行星的样本进行研究有助于人类了解地球的起源。</p>
				<img src="img/7/08.png"><center><i>资料图：火星一岩石被NASA命名“滚石”，约高尔夫球大小。</i></center>
				<p>NASA介绍称，整个任务将耗时4.5小时。科研人员预先编写了操作程序，因此本次任务是由探测器自动完成。</p>
				<p>探测器将先通过一条狭长的空间到达“本努”北半球的一个陨石坑上方。这个被命名为“南丁格尔”的陨石坑直径为52英尺，约为一个网球场的大小。</p>
				<p>之后，探测器将执行着陆和采样任务：探测器将“伸出”11英尺长的机械手臂，与小行星表面接触。探测器还将喷出加压氮气并吸走其表面的泥土和砾石。采样时长在5到10秒。</p>
				<p>最后，探测器将点燃助推器离开小行星表面。</p>
				<p>探测器将向地球发回数据，帮助科研人员判断任务是否成功执行。如果一切顺利，预计探测器在2023年能将样本送返地球。</p>
				<p>据美联社报道，绕太阳运行的“本努”，每六年会绕地球一圈。美国宇航局认为，它在下个世纪末撞击地球的几率是1/2700。科学家们称，对这种小行星了解得越多，地球就会越安全。</p>
			</section>
		<div class="backtotop"></div>
	</body>
</html>
