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
MM_authFailedURL="kjkx5.html"
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
		<title>“太极一号”：我国空间引力波探测迈出第一步</title>
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
				<h1>“太极一号”：我国空间引力波探测迈出第一步</h1>
				<center style="margin-top: -50px;">发布日期：2019年09月24日</center>
				<p>8月31日，中国科学院空间科学(二期)战略性先导科技专项首发星——微重力技术实验卫星在酒泉卫星发射中心成功发射。卫星在轨测试正在按计划有序开展，截至目前，卫星状态正常，各项测试结果正常，第一阶段在轨测试任务顺利完成。</p>
				<p>作为我国首颗空间引力波探测技术实验卫星，该卫星被正式命名为“太极一号”。“太极一号”的成功发射和第一阶段在轨测试任务的顺利完成，迈出了我国空间引力波探测的第一步，为我国在空间引力波探测领域率先取得突破奠定了基础。</p>
				<p>引力波是物质和能量的剧烈运动和变化所产生的一种物质波。爱因斯坦一个世纪前基于广义相对论预言了引力波的存在。双黑洞并合产生的引力波已在2015年首次在地面被直接观测到。引力波提供了有别于电磁波的一个全新的观测宇宙的重要窗口，成为人类探索和认识宇宙的新的途径和手段。</p>
				<p>不同频率引力波反映了宇宙的不同时期和不同的天体物理过程。有别于地基探测，在空间能够探测到中低频段的引力波信号，能够发现天体质量更大、距离更遥远的引力波波源，揭示更为丰富的天体物理过程。由于引力波信号极其微弱，实施空间引力波探测挑战巨大，需要突破目前人类精密测量和控制技术的极限。所涉及的核心技术包括高精度超稳激光干涉仪、引力参考传感器、超高精度无拖曳控制、微牛级推进器、超稳超静卫星平台等。“太极一号”正是瞄准这一重大科技前沿，对这些核心技术的可行性和实现途径进行在轨验证。</p>
				<p>“太极一号”第一阶段在轨测试和数据分析结果表明，激光干涉仪位移测量精度达到百皮米量级(约为一个原子直径)，引力参考传感器测量精度达到地球重力加速度的百亿分之一量级，微推进器推力分辨率达到亚微牛量级。“太极一号”实现了我国迄今为止最高精度的空间激光干涉测量，成功进行了我国首次在轨无拖曳控制技术试验，并在国际上首次实现了微牛级射频离子和双模霍尔电推进技术的在轨验证。</p>
				<p>中科院从2008年开始前瞻论证我国空间引力波探测的可行性，经过多年科学前沿研究，提出了我国空间引力波探测“太极计划”，确定了“单星、双星、三星”“三步走”的发展战略和路线图，并于2018年8月在空间科学(二期)战略性先导科技专项中立项实施 “太极计划”单星工程任务，启动了三步走中的第一步。“太极一号”科研团队以实现零到一的突破为己任，全力以赴、攻坚克难、勇于突破、协同创新，在不到一年的时间里完成了卫星的研制任务。</p>
			</section>
		<div class="backtotop"></div>
	</body>
</html>
