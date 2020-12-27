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
MM_authFailedURL="wz-zx3.html"
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
		<title>NASA为首次载人登月的阿尔忒弥斯任务制定了科学优先事项</title>
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
				<h1>NASA为首次载人登月的阿尔忒弥斯任务制定了科学优先事项</h1>
				<img src="img/6/1/3/1.jpg">
				<p>美国国家航空航天局(NASA)已经确定了该机构在阿尔忒弥斯3号(Artemis III)任务中的科学优先事项，该任务将在2024年将首位女性和下一位男性送上月球。新报告中包括这些优先事项和一系列候选活动。</p>
				<p>阿尔忒弥斯3号任务科学定义小组由联邦雇员和具有月球科学专业知识的顾问组成，于9月开始开会，为阿尔忒弥斯3号任务的各个方面各个方面（包括抽样策略，现场调查和可部署的实验）定义令人信服且可实现的科学目标。</p>
				<p>月球通常被称为太阳系的基石，这些高度优先的研究将帮助科学家更好地了解运行在整个太阳系和更广阔的行星的基本过程。此外，研究小组对调查进行了优先排序，以帮助NASA了解月球南极的风险和潜在资源，该机构希望在该年末确立其阿尔忒弥斯基地的概念。</p>
				<p>“月球具有巨大的科学潜力，宇航员将帮助我们实现这一科学。”NASA科学任务部副局长托马斯·祖布琛（Thomas Zurbuchen）说，“即使在阿尔忒弥斯3号任务登陆之前，我们机构的科学和人类探索团队也从未像现在这样共同努力，以确保我们能够利用彼此的优势。这份报告帮助我们勾勒出一条通向引人注目的科学的道路，我们现在可以考虑与人类探险者一起在月球表面进行研究。”</p>
				<p>小组探讨的问题包括如何进行月球表面的调查和关键科学活动，以及如何将科学纳入到载人登月任务的行动概念中。该小组还从月球科学界中征集论文，并从许多现有报告中提炼出来，这些报告概述了月球科学界的最高科学重点，数十年来一直在为人类返回月球表面做准备。</p>
				<p>“科学将成为阿尔忒弥斯任务不可或缺的一部分，我们期待着利用团队的周密工作来规划人类和科学发现任务，” NASA人类探索和操作任务理事会副局长凯西·鲁德斯(Kathy Lueders)说，“NASA已经在科学领域所做的工作将有助于为2024年阿尔忒弥斯3号任务登陆做准备，并使自1972年以来人类首次登上月球表面的科学价值最大化。”</p>
				<p>正如阿波罗时代人类探索的经验一样，宇航员在月球表面的每一秒都将被精心规划，该报告将为开发宇航员表面活动的任务规划者提供资源。</p>
				<p>与实地地质、样本采集和回收以及实验部署相关的活动，都是推进月球科学计划所必需的综合工作的一部分。总的来说，这一系列候选活动将解决在月球南极可以实现的最高科学优先事项。</p>
				<p>该团队还通过评估在阿尔忒弥斯3号地面任务期间可以实际执行的科学目标提供了总体背景。当人类着陆系统的功能、着陆点和其他建筑细节变得更加清晰时，NASA将制定一份详细的任务操作计划。为阿尔忒弥斯3号任务开发的程序和操作技术也将为阿尔忒弥斯的未来任务提供信息。</p>
				<p>“我们希望将对月球科学界最有吸引力的东西与宇航员在月球表面所能做的事以及两者如何相互增强相结合,“NASA马歇尔首席科学家雷尼·韦伯（Renee Weber）说，“团队的辛勤工作将确保我们能够利用阿尔忒弥斯3号任务的潜力来帮助我们从月球学习，作为通往太阳系其他部分的门户。”</p>
				<p>随着计划在2024年启动阿尔忒弥斯3号载人航天任务，NASA的科学与人类探索和运营任务主管们将共同努力，将各项建议纳入该机构的阿尔忒弥斯计划的科学策略中。</p>
				<p>阿尔忒弥斯3号任务有潜力使科学界在许多已确定的优先科学目标上取得重大进展，包括加深我们对月球的形成和演化，月球与太阳的相互作用以及水和其他资源如何到达月球、如何运输和目前如何保存。</p>
				<p>要阅读完整的报告，请访问：</p>
				<p><center><a href="https://www.nasa.gov/reports" style="font-size: 20px;" target="_blank">https://www.nasa.gov/reports</a></center></p>
				<p>有关NASA的阿尔忒弥斯计划的更多信息，请访问：</p>
				<p><center><a href="https://www.nasa.gov/artemis" style="font-size: 20px;" target="_blank">https://www.nasa.gov/artemis</a></center></p>
				<p><strong>参考来源：</strong></p>
				<p><a href="https://www.nasa.gov/press-release/nasa-defines-science-priorities-for-first-crewed-artemis-landing-on-moon" target="_blank">https://www.nasa.gov/press-release/nasa-defines-science-priorities-for-first-crewed-artemis-landing-on-moon</a></p>
			</section>
		<div class="backtotop"></div>
	</body>
</html>
