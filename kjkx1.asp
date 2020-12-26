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
MM_authFailedURL="kjkx1.html"
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
		<title>国际最小高能绿色推力器在轨验证成功</title>
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
				<h1>国际最小高能绿色推力器在轨验证成功</h1>
				<center style="margin-top: -50px;">发布日期：2020年03月25日</center>
				<p>近日，由中国航天科技集团有限公司五院502所研制的ADN(二硝酰胺铵)基0.2N推力器组件顺利完成在轨性能验证。数据表明，产品推力及比冲性能均满足任务指标要求，达到国际先进水平，搭载试验取得圆满成功。</p>
				<p>此次ADN基0.2N推力器组件在轨验证试验的圆满成功，进一步拓展了ADN绿色无毒推进技术在微推进领域的应用，是我国在空间推进领域技术创新的一次新突破。目前，ADN基0.2N推力器组件为国际上已在轨飞行验证的最小推力的高能绿色推力器。</p>
				<p>ADN基推进技术是目前国际上研究较为热门的无毒推进技术，是未来发展的大趋势，具有无毒、高密度、低冰点、低挥发性、稳定性高等特点，可实现空间动力系统的预包装，缩短卫星发射前的准备时间，提高快速响应能力。</p>
				<p>在微推进领域，该技术具有高性能、无毒、可预包装特性，能广泛应用于微纳卫星的轨道快速机动、编队飞行和组网任务，具有良好的应用前景。</p>
				<p>据了解，为适应我国航天器无毒化需求，研制团队从2009年起开展了基于ADN 基推进剂的无毒推进系统研究。2016年，ADN无毒推进系统在轨试验圆满完成，我国成为世界上第二个成功在轨应用无毒推进剂的国家。</p>
				<p>此次，502所瞄准未来卫星推进领域发展方向，将高性能绿色无毒ADN推进技术应用于微推进领域，实现了ADN基推力器微型化、微流量下稳定工作等关键技术的突破。研制过程中，研制人员在搭载进度紧张的情况下，快速进行产品研制迭代，不断完善产品设计，最终按时保质完成研制任务。</p>
				<p>目前，该所已开展基于ADN基推进技术的微推进模块产品研制，完成了原理样机技术验证，于2020年交付用户。</p>
			</section>
		<div class="backtotop"></div>
	</body>
</html>
