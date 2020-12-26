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
MM_authFailedURL="wz-xw2.html"
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
		<title>NASA的OSIRIS-REx航天器收集了大量的小行星样本</title>
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
				<h1>NASA的OSIRIS-REx航天器收集了大量的小行星样本</h1>
				<img src="img/6/2/2/1.gif"><center><i>这组三张照片是由飞船的SamCam相机于2020年10月22日拍摄的，显示了NASA的OSIRIS-REx的采样器头部充满了从小行星贝努表面收集的岩石和尘埃。他们还显示，这些颗粒中的一些正在慢慢地从采样器头部逃逸。OSIRIS-REx团队的分析表明，一些物质穿过了头部的薄膜瓣略微楔形打开的小缝隙。聚拉膜瓣(环内左侧黑色凸起处)的设计目的是将收集的物质锁在里面，这些未封闭的区域似乎是由于较大的岩石没有完全穿过聚拉膜瓣造成的。根据现有的图像，研究小组怀疑在头部中有大量的样本，并且正在尽快将样本储存起来。<br/>
影像来源:美国国家航空航天局</i></center>
				<p>10月22日，星期四，NASA的OSIRIS-REx任务团队在碰触贝努小行星后两天收到的图像证实，这些图片证实飞船已经收集了足够多的样本，以满足其主要任务的要求——获取至少2盎司(60克)小行星表面的样本。</p>
				<p>航天器捕捉到样本收集器头部在不同位置移动时的图像。在回顾这些图像时，OSIRIS-REx团队注意到，头部似乎充满了小行星粒子，而其中一些粒子似乎正在从样本收集器中缓慢逃逸，该采样头被称为稍触即离样本采集机制(TAGSAM)。他们怀疑碎片正穿过一个小缝隙，那里有一个聚脂薄膜盖，即收集器的盖子，被较大的岩石稍微楔开。</p>
				<p>“贝努继续用伟大的科学成果给我们带来惊喜，也给我们带来了一些难题，”美国宇航局在华盛顿总部负责科学的副局长托马斯·祖布臣(Thomas Zurbuchen)说。“尽管我们可能需要更快地行动来存放样品，但拥有它并不是一个坏问题。我们很高兴看到似乎是一个丰富的样本，它将在这个历史性时刻之后的数十年中激发科学灵感。”</p>
				<p>该团队认为它已经收集了足够的样本，并且正在尽快收集样本。他们比较了样本收集事件后空收集器头的图像和10月22日TAGSAM头的图像，得出了这一结论。</p>
				<p>图像还显示，航天器和TAGSAM仪器的任何移动都可能导致进一步的样本损失。为了保留剩余样本，任务团队决定放弃原定于10月24日星期六举行的“样品质量测量”活动，并取消了原定于星期五进行的制动燃烧，以最大程度地降低航天器的加速度。</p>
				<p>从这里开始，OSIRIS-Rex团队将专注于将样品存放在样品返回舱（SRC）中，在飞船返回地球的过程中，任何松散的物质都将被安全保护。</p>
				<p>“我们正在努力保持自己在这里的成功，我的工作是安全返回尽可能大的贝努样本，”但丁·劳雷塔（Dante Lauretta）说，他是亚利桑那大学OSIRIS-REx的首席研究员，他领导着科学小组和科学观测计划和数据处理。“质量的损失是我所关心的，因此我强烈建议团队尽快收集这一宝贵的样品。”</p>
				<p>TAGSAM头在最优条件下执行采样事件。最新的分析表明，当收集器头部与贝努的表面接触时，以及当氮气瓶被点燃以搅动表面材料时，收集器头部与贝努的表面是齐平的。它还穿透了小行星表面几厘米的物质。到目前为止，所有的数据都表明，收集器的头部保存着超过2盎司的风化层样本。</p>
				<p>OSIRIS-Rex目前健康状况良好，任务小组正在确定样本储存的时间表。一旦对样品的存储时间和程序做出决定，将提供更新。</p>
				<p>NASA位于马里兰州格林贝尔特的戈达德太空飞行中心为OSIRIS-REx提供总体任务管理，系统工程以及安全和任务保证。丹佛的洛克希德·马丁航天公司制造了该航天器，并正在提供飞行操作。亚利桑那坦佩市的Goddard和KinetX Aerospace负责OSIRIS-REx航天器的导航。OSIRIS-REx是NASA新边界计划的第三项任务，该计划由位于阿拉巴马州阿拉巴马州亨茨维尔的NASA马歇尔太空飞行中心管理，由该机构的华盛顿科学任务局负责。</p>
				<p><strong>参考来源：</strong></p>
				<p><a href="https://www.nasa.gov/press-release/nasa-s-osiris-rex-spacecraft-collects-significant-amount-of-asteroid" target="_blank">https://www.nasa.gov/press-release/nasa-s-osiris-rex-spacecraft-collects-significant-amount-of-asteroid</a></p>
			</section>
		<div class="backtotop"></div>
	</body>
</html>
