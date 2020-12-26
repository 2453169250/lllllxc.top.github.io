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
MM_authFailedURL="gjht1.html"
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
		<title>阿联酋发力太空探索 “拉希德”2024年登月</title>
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
				<h1>阿联酋发力太空探索 “拉希德”2024年登月</h1>
				<center style="margin-top: -50px;">发布日期：2020年11月12日</center>
				<p>今年7月20日，阿联酋火星探测器“希望号”成功发射，打响了其“探火”第一枪。如今，阿联酋又将目光投向了月球。</p>
				<p>据《自然》杂志11月5日最新消息，阿拉伯联合酋长国宣布，计划发射一辆名为“拉希德”的小型月球车以研究月球。消息中称，这体现了阿拉伯世界国家在航天方面的勃勃野心。</p>
				<p>如果计划成功，阿联酋航天局将成为阿拉伯世界第一个、全球第五个成功将飞船送上月球表面的国家。</p>
				<p>位于迪拜的穆罕默德·本·拉希德航天中心(MBRSC)表示，其内部团队将开发、建造和运行这辆重约10公斤的月球车——“拉希德”。</p>
				<p>该团队将雇佣一个太空机构或商业伙伴来执行探月任务中最危险的部分：发射和着陆。“拉希德”预计2024年登上月球，如果成功，它将成为由私人公司和太空机构制造的月球漫游车之一。</p>
				<p>建造“拉希德” 面临多重挑战</p>
				<p>对于一个在太空探索领域只有14年经验的国家，建造月球车对阿联酋提出了许多新的挑战。</p>
				<p>相对简单的月球车包含6台科学仪器、4台相机。英国米尔顿凯恩斯开放大学行星科学家汉娜·萨金特说：“在这个阶段，阿联酋并没有自不量力。我认为他们实际上在这方面(探月)相当聪明。”</p>
				<p>“拉希德”的重量只有中国嫦娥四号探测器重量的十分之一。它将进行的任务包括一项研究月球表面热特性的实验，以进一步了解月球景观的构成。MBRSC探月任务项目经理哈马德·阿尔·马祖齐说，另一项实验将研究月球尘埃的构成和颗粒大小。</p>
				<p>萨金特说，“拉希德”最令人兴奋的地方在于，这将是首次在月球上使用朗缪尔探测器。它将研究由流动的太阳风引起的在月球表面盘旋的带电粒子等离子体，这种环境会让月尘带电，而人们对此知之甚少。</p>
				<p>她补充说，基于月表的实验对于了解带电环境是必不可少的，因为这种条件会使月球尘埃粘在表面，可能会对未来的载人飞船任务造成危险。“月尘真的非常细小，无处不在，到处都粘在一起，如果宇航员大量吸入，会危害身体。”</p>
				<p>“拉希德”将在月球近侧赤道北纬或南纬45度之间的一个未经探索的位置着陆。这使其与地球的通信比远侧探测器更容易，也意味着着陆时碰到的岩石比在月球极地区域要少一些。然而，确切的地点还有待从5个候选名单中选出。</p>
				<p>这项任务计划至少持续一个月球日——大约相当于地球上的14天。“拉希德”的飞行距离可以从几百米到几千米不等。该团队希望这辆漫游车也能在月球上度过同样漫长的夜晚，届时气温将降至-173℃左右。以前的月球车通常携带一个热源，但阿联酋长期计划的项目经理阿德南·阿尔·赖斯表示，过夜生存将意味着为小型月球车开发新技术。</p>
				<p>据介绍，“拉希德”重量轻，可以搭乘商用着陆器飞行，这可降低任务的总成本。阿尔·马祖齐说，体积小、重量轻意味着月球车的开发速度会更快，并且更容易登上月球。</p>
				<p>虽计划独立完成 但仍需国际合作</p>
				<p>2017年，阿联酋曾宣布一项名为“火星2117”的计划，打算在2117年之前，在火星上建造第一个人类可居住的社区。当然，该计划也包括探月。</p>
				<p>阿联酋的航天工业起步较晚。阿联酋航天局只有6年历史，其卫星项目也只有14年历史，该国在所有领域授予第一个博士学位也只有10年的历史。短短十几年，通过雇佣国际学术和工业合作伙伴帮助建立和设计任务，同时培养本土工程师的政策，阿联酋迅速成长为一个航天业大发展的国家。</p>
				<p>尽管阿联酋目前在卫星、轨道器和遥感仪器方面有专长，但机器人任务需要新的技术——建造月球车的机械结构及其供暖和通信系统。团队项目人员之一迈埃尼说，用一个轻型月球车有限的功率和天线长度，在距离地球384000公里之外向地球发送信号，尤其具有挑战性。</p>
				<p>MBRSC的漫游车团队已经为这个项目工作了大约两年，他们正在之前成功的探测器的基础上设计“拉希德”月球车，还计划建造一系列月球车模型。阿尔·马祖齐说，与此前阿联酋的“希望号”火星探测器(主要由美国和阿联酋工程师共同在美国完成建造)不同的是，整个月球车将在阿联酋开发。不过他也表示，“拉希德”的建造仍将涉及国际伙伴间的合作。</p>
				<p>“拉希德”能否登上月球还未可知。到目前为止，只有欧洲、中国、俄罗斯和美国的国家航天局成功将探测器安全降落在月球，而且还没有一家私营公司取得成功。已有20多个着陆器坠毁，最近一次的“探月”失败案例是2019年，印度的“月船2号”着陆器在月球坠毁。</p>
				<p>阿尔·赖斯补充说：“尽管阿联酋2024年‘探月’的任务日期与美国2024年‘阿尔忒弥斯’登月计划时间一致，但即使‘阿尔忒弥斯’计划停止，阿联酋的月球任务也将继续进行。我们的计划是完全独立的。”</p>
				<p>NASA计划从2021年开始对在月球上进行科技实验的公司支付费用，而在接下来的几年里，将会有一系列月球车和着陆器出现，作为执行美国“阿尔忒弥斯”登月计划的先驱。欧洲航天局、中国、印度、以色列、日本和俄罗斯等国家也计划在未来5年内发射着陆器或月球车。</p>
				<p>“每个人都急于登上月球，而我们希望成为这些国际努力的关键贡献者。”阿尔·马祖齐说。</p>
			</section>
		<div class="backtotop"></div>
	</body>
</html>
