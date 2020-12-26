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
MM_authFailedURL="gjht2.html"
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
		<title>NASA持续推进太空“引爆点”技术</title>
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
				<h1>NASA持续推进太空“引爆点”技术</h1>
				<center style="margin-top: -50px;">发布日期：2020年11月06日</center>
				<p>美国国家航空航天局(NASA)早已与多家美国太空公司建立起公私合作伙伴关系，开发“引爆点”(Tipping Point)技术，即潜在的革命性太空技术。</p>
				<p>而据NASA官网近日消息称，NASA持续和工业界合作，协同开发一系列技术——包括与14家公司签下了价值数亿美元的“引爆点”技术合同，以争取在10年后，实现在月球的持续生存，并为载人火星任务铺平道路。</p>
				<p>据项目描述，如果在演示中，一项技术可以通过投资显著地促使该技术成熟，增加商业空间应用的可能性，并可由政府和商业应用将该技术推向市场，则该技术被视为处于“引爆点”。</p>
				<p>目光投向“阿尔忒弥斯”计划之后</p>
				<p>今年10月初，NASA正式发布了其“阿尔忒弥斯”月球探索计划的规划报告。</p>
				<p>2017年12月，美国总统特朗普签署政策令并呼吁：NASA与商业和国际合作伙伴应一道领导人类探索月球和更深远目标的事业。</p>
				<p>自那时以来，NASA一直在微调该报告。</p>
				<p>在本次报告中，NASA描述了其探索途径和迄今为止该计划所取得的进展，回答了3个问题：如何实现可持续月球探索?美国重返月球的基础能力是否已足够?月球任务如何为未来火星探索做铺垫?</p>
				<p>此外，本次报告还论述了“阿尔忒弥斯”计划的科学策略和月面技术，包括任务核心部件的建设情况、飞行准备程度及资金要求。</p>
				<p>可以看出，NASA正力求尽快开辟出一条在月球上实现可持续发展的“阿尔忒弥斯之路”。</p>
				<p>实际上，NASA和合作伙伴已经开发和测试了许多技术，这些对于实现在月球持续生存和载人火星任务至关重要。</p>
				<p>就在日前，美国工业界已向NASA的第五次“引爆点”竞标提交了建议书，预期总金额超过3.7亿美元。NASA的空间技术任务理事会将与这些公司协商，签署里程碑式的公司固定价格合同，合同期限长达5年。</p>
				<p>鼓励企业主导技术创新</p>
				<p>此次的合作，集中在低温流体管理、月球表面创新计划技术示范、闭环下降和着陆能力演示这3个领域。其中金额比较巨大的几家公司包括：</p>
				<p>梅里特岛Eta空间公司，2700万美元，其研发的系统将成为火箭实验室光子卫星上的主要有效载荷，并在轨道上收集关键的低温流体管理数据，为期9个月;</p>
				<p>洛克希德·马丁公司，8970万美元，将使用液氢(在低温推进剂中最具挑战性)进行太空演示任务，测试十多种低温流体管理技术，并让其可加入未来的太空系统;</p>
				<p>美国太空探索技术公司(SpaceX)，5320万美元，进行大规模飞行演示，并在星际飞船的储罐之间转移10公吨低温推进剂;</p>
				<p>联合发射联盟(ULA)，8620万美元，将使用液氧和氢气演示智能低温推进系统，该系统将测试精确的储罐压力控制、传输以及推进剂存储;</p>
				<p>休斯敦太空测试与研究联盟，2210万美元，其太空科学与技术评估设施将为小型实验提供进入月球环境的通道，收集数据并测试紫外线和带电粒子辐射的暴露强度;</p>
				<p>休斯顿直觉机器公司，4160万美元，将开发一个小型、可展开的着陆器，该着陆器能够提供2.2磅有效载荷，可进入月球陨石坑并对月球表面进行高分辨率测量;</p>
				<p>诺基亚公司，1410万美元，其受地面技术的启发，会在太空中部署首个LTE/4G通信系统，该系统可支持更远距离的月面通信，大大提高速度，可靠性也更高。</p>
				<p>这些只是14家公司的其中一部分。</p>
				<p>NASA局长吉姆·布里登斯廷表示，NASA在创新技术演示上的重大投资，共由来自美国9个州的大小企业主导，这一举措将为太空和月球表面探索提供更多可能。</p>
				<p>既完成战略任务，也确保商业获益</p>
				<p>“这些是NASA目前选出的最佳‘引爆点’提案，也是迄今为止数额最大的项目。”NASA航天技术副局长吉姆·罗伊特表示，他很高兴NASA的投资以及与合作伙伴的共同努力能为人类探月和他领域带去最新的技术，并且没有忽视商业部门的利益。</p>
				<p>这里的每家公司，都要根据自身规模承担项目总开销的最低百分比，以此将NASA的资源与工业界的投资结合——既能保障关键空间技术的发展，又能节省NASA和美国纳税人的钱。</p>
				<p>毫无疑问，美国当前的目标就是尽早登陆月球，接着才能着手下一个巨大飞跃——载人登陆火星任务。而NASA的登月也必须为一种新型可持续的“月球经济体制”铺平道路，与此同时，还要让美国商业合作伙伴和国际合作伙伴都能从中受益。</p>
			</section>
		<div class="backtotop"></div>
	</body>
</html>
