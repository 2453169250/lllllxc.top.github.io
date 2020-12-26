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
MM_authFailedURL="xwfb4.html"
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
		<title>嫦娥五号探测器圆满完成我国首次地外天体采样返回任务</title>
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
				<h1>嫦娥五号探测器圆满完成我国首次地外天体采样返回任务</h1>
				<img src="img/7/05.jpg" >
				<p>北京时间12月17日1时59分，探月工程嫦娥五号返回器在内蒙古四子王旗预定区域成功着陆，标志着我国首次地外天体采样返回任务圆满完成。</p>
				<p>凌晨1时许，北京航天飞行控制中心通过地面测控站向嫦娥五号轨道器和返回器组合体注入高精度导航参数。此后，轨道器与返回器在距南大西洋海平面高约5000公里处正常解锁分离，轨道器按计划完成规避机动。</p>
				<p>按计划，回收后的嫦娥五号返回器在完成必要的地面处理工作后，将空运至北京开舱，取出样品容器及搭载物。国家航天局将择机举行交接仪式，正式向地面应用系统移交月球样品，我国首次地外天体样品储存、分析和研究相关工作也将随之启动。</p>
				<p>嫦娥五号探测器于11月24日在中国文昌航天发射场发射升空并进入地月转移轨道。探测器实施2次轨道修正、2次近月制动，顺利进入环月圆轨道。此后，探测器经历组合体分离、环月降轨及动力下降，着陆器和上升器组合体于12月1日在月球正面预选区域着陆并开展采样工作。12月3日，上升器点火起飞、精准入轨，于6日完成与轨道器和返回器组合体之间的交会对接及样品转移，此后按计划分离并受控落月。12月12日至16日，轨道器和返回器组合体在完成2次月地转移入射、2次轨道修正后，返回器于12月17日与轨道器分离并重返地球。</p>
				<p>国家航天局专家表示，嫦娥五号探测器在一次任务中，连续实现我国航天史上首次月面采样、月面起飞、月球轨道交会对接、带样返回等多个重大突破，为我国探月工程“绕、落、回”三步走发展规划画上了圆满句号。同时，嫦娥五号任务作为我国复杂度最高、技术跨度最大的航天系统工程，成功实现了多方面技术创新、突破了一系列关键技术，对于我国提升航天技术水平、完善探月工程体系、开展月球科学研究、组织后续月球及星际探测任务，具有承前启后、里程碑式的重要意义。</p>
			</section>
		<div class="backtotop"></div>
	</body>
</html>
