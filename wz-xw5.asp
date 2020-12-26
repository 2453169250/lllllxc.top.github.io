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
MM_authFailedURL="wz-xw5.html"
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
		<title>OSIRIS-REx小行星采集样品任务开始倒计时</title>
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
				<h1>OSIRIS-REx小行星采集样品任务开始倒计时</h1>
				<img src="img/6/2/5/1.png">
				<center><i>来源：NASA</i></center>
				<p>NASA的源光谱释义资源安全风化层辨认探测器（Origins Spectral Interpretation Resource Identification Security Regolith Explorer，OSIRIS-REx）任务即将到来的历史性时刻。短短几周内，机器人OSIRIS-REx航天器将下降到小行星贝努的巨石表面，着陆几秒钟，并收集小行星的岩石和尘土样本——这标志着首次采集小行星样本，这些样本将被送回地球进行研究。</p>
				<p>10月20日，任务团将首次尝试“即触即走”（Touch-And-Go，TAG）样品采集任务。</p>
				<p>这一系列的操作将使飞船降落到夜莺地点，该地位于贝努北半球直径52英尺（16 m）的岩石区域，飞船的机械取样臂将尝试在那里收集样本。夜莺地点之所以被选为这次任务的主要样本地点，是因为它拥有最多的不受阻碍的细粒物料，但该地区周围是大块的巨石。在采样过程中，这艘大型货车大小的航天器将尝试在一个只有几个停车位大小的区域着陆，而且距离这些巨石只有几步之遥。</p>
				<video src="img/6/2/5/2.mp4" controls="controls" width="100%" height="100%"></video>
				<center><i>10月20日，OSIRIS-REx飞船将进行第一次“即触即走”(TAG)样本采集任务。该航天器不仅将使用创新的导航技术导航到火星表面，而且还将收集自阿波罗任务以来最大的样本。<br/>
来源：NASA’s Goddard Space Flight Center</i></center>
				<p>在为期4.5小时的样本采集过程中，飞船将进行三次不同的操作，以到达小行星表面。下降过程从OSIRIS-REx点燃推进器进行脱离轨道操作开始，执行轨道偏离操作，离开它的安全轨道，距离本努地表约2500英尺(770米)。在这个下行轨道上飞行了4个小时后，飞船在大约410英尺(125米)的高度执行“检查点”操作，推进器燃烧调整OSIRIS-REx的位置和速度，使其急剧下降到小行星表面。大约11分钟后，飞船在大约177英尺(54米)的高度进行了“匹配点”燃烧，减缓了下降速度，并瞄准了与小行星接触时的旋转相匹配的路径。然后飞船下降到小行星表面，在不到16秒的时间内着陆并发射了三个加压氮气瓶中的一个。气体搅动并提升了贝努表面的物质，这些物质随后被吸附在飞船的收集器头上。在这次短暂的接触之后，OSIRIS-REx发射推进器，使其远离贝努的表面，并导航到距离小行星安全距离的地方。</p>
				<p>离开轨道后，航天器将进行一系列重新配置以准备采样。首先，OSIRIS-REx将其自动采样臂（即取即走样品采集机构（TAGSAM））从折叠位置延伸到样品采集位置。然后，飞船的两个太阳能电池板在飞船的身体上方移动成“ Y型”构型，从而在降落过程中将它们安全地定位在远离小行星表面的位置。这种配置还将航天器的重心直接放在TAGSAM收集器头上，这是航天器中唯一在样本收集过程中会接触贝努表面的部分。</p>
				<p>由于TAG期间航天器和贝努距离地球大约2.07亿英里（3.34亿公里），因此信号在它们之间传播大约需要18.5分钟。这种时滞会阻止TAG事件期间从地面实时指挥飞行活动，因此该航天器被设计为自动执行整个样本采集序列。在活动开始之前，OSIRIS-REx团队将把所有命令上行到航天器，然后发送“ GO”命令开始。</p>
				<p>由于飞船和和贝努在TAG期间距离地球约2.07亿英里(3.34亿公里)，信号在它们之间传播大约需要18.5分钟。这个时间延迟阻止了在标签事件期间从地面对飞行活动的实时指挥，所以航天器被设计为自主地执行整个样本采集序列。在活动开始之前，欧西里斯-雷克斯团队将把所有的指令发送到飞船上，然后发送“出发”命令开始。</p>
				<p>为了自主导航到夜莺地点，OSIRIS-REx使用了自然特征跟踪（NFT）导航系统。航天器在脱离轨道大约90分钟后开始收集导航图像。然后，使用已识别的表面特征，将这些实时图像与机载图像目录进行比较，以确保其朝着正确的方向行驶。当航天器接近地面时，OSIRIS-REx根据NFT对航天器位置和速度的估计来更新检查点和匹配点的操作。OSIRIS-REx在进行匹配点操作后降落到地面时，继续使用NFT估算来监测其位置和下降速度。如果航天器的轨迹变化超出预定范围，它将自动自主中止。</p>
				<p>为了确保航天器降落在一个安全区域，避免该区域的许多岩石，导航系统配备了一个夜莺危险地图，它描绘了样本区域内可能对航天器造成潜在伤害的区域。如果航天器的NFT系统检测到它正在接近这些危险区域之一，航天器将在到达16英尺(5米)的高度时自动离开接近区域，这保证了航天器的安全，并允许在未来的日期进行后续的样本收集尝试。</p>
				<p>当飞船执行采样序列中的每一个事件时，它将以非常缓慢的数据传输速度将遥测更新发送回OSIRIS-REx团队。该团队将在飞行过程中监测遥测技术，并能够确认TAG发生后不久，飞船已成功降落到本努的表面。在这次活动中收集到的图像和其他科学数据将在航天器远离小行星后向下传输，并将其较大的天线指向地球，以更高的通信速率进行传输。</p>
				<p>OSIRIS-REx计划收集至少2盎司(60克)的贝努岩石材料，并将其带回地球——这是自阿波罗计划以来从太空返回的最大样本——该任务开发了两种方法来验证这些样本的收集。10月22日，OSIRIS-REx的SamCam相机将捕捉到TAGSAM头部的图像，以确定它是否含有贝努的表面物质。10月24日，该航天器还将进行旋转操作，以确定收集到的物质的质量。如果这些措施显示采集成功，将决定将样本放入样本返回舱(SRC)返回地球。如果没有从夜莺中收集到足够的样本，飞船上还会装载氮气进行另外两次尝试。在鱼鹰后备地点的TAG尝试将不早于2021年1月进行。</p>
				<p>任务团队在过去的几个月中一直为样品采集活动做准备，同时将远程工作最大化作为其应对COVID-19的一部分。在TAG当天，有限的小组成员将采取适当的安全预防措施，从洛克希德·马丁航天公司的任务支持区监视航天器。团队的其他成员也将在现场的其他地点进行报道，同时遵守安全规程。</p>
				<p>该航天器计划于2021年离开本努，并将于2023年9月24日将收集到的样本送到地球。</p>
				<p>NASA位于马里兰州格林贝尔特的戈达德太空飞行中心为OSIRIS-REx提供总体任务管理、系统工程以及安全和任务保证。图森市亚利桑那大学的但丁·劳雷塔（Dante Lauretta）是首席研究员，亚利桑那大学还领导科学团队以及该团队的科学观测计划和数据处理。丹佛的洛克希德·马丁航天公司制造了该航天器并提供飞行操作。Goddard和KinetX Aerospace负责OSIRIS-REx航天器的导航。OSIRIS-REx是NASA新边界计划的第三项任务，该计划由位于阿拉巴马州亨茨维尔的NASA马歇尔航天飞行中心管理，隶属于该机构在华盛顿的科学任务理事会。</p>
				
				<p><strong>参见：</strong></p>
				<p><a href="https://www.nasa.gov/feature/goddard/2020/osiris-rex-begins-its-countdown-to-tag

" target="_blank">https://www.nasa.gov/feature/goddard/2020/osiris-rex-begins-its-countdown-to-tag

</a></p>
			</section>
		<div class="backtotop"></div>
	</body>
</html>
