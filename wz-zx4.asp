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
MM_authFailedURL="wz-zx4.html"
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
		<title>来自哈勃的新数据，解释了消失的暗物质</title>
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
				<h1>来自哈勃的新数据，解释了消失的暗物质</h1>
				<p>2018年，一个国际研究团队使用美国航空航天局（NASA）/欧洲空间局（ESA）的哈勃空间望远镜（Hubble Space Telescope）和其他几个天文台的数据，首次发现了一个缺失大部分暗物质的星系。这个星系位于银河系的邻居鲸鱼座（Cetus）之中，名为NGC1052-DF2，距离我们4500万光年。</p>
				<p>NGC 1052-DF2星系的这一奇怪发现，令天文学家倍感意外，因为依据现有的理解，暗物质是当前星系形成和演化模型中的关键组成部分。实际上，如果没有暗物质的存在，原初气团将缺乏足够的引力来开始它的塌陷过程，也就无法并形成新的星系。</p>
				<p>在此一年之后，研究人员又发现了另一个缺失暗物质的星系，NGC 1052-DF4星系，这进一步引发了天文学家关于这些天体性质的激烈争论。</p>
				<img src="img/6/1/4/1.jpg"/><center><i>来自NASA / ESA哈勃空间望远镜的新数据，为NGC 1052-DF4星系的潮汐破坏提供了进一步的证据，这一结论解释了此前的奇怪发现，即该星系缺失了它的大部分暗物质。通过研究星系发出的光和球状星团的分布，天文学家得出结论：来自邻近星系NGC 1035的引力将NGC 1052-DF4的暗物质剥离了出去，而这一强大的引力作用现在正在逐渐拆解NGC 1052-DF4星系。上面的图像是根据构成数字巡天第二阶段（Digitized Sky Survey 2）的图像创建的，显示了NGC 1052-DF4周围的天空。<br/>
图片来源：ESA /哈勃、NASA、数字巡天第二阶段<br/>
致谢：戴维德·马丁（Davide de Martin）</i></center>
				<p>现在，研究人员用哈勃的新数据来解释为什么NGC 1052-DF4中会缺失大部分暗物质。澳大利亚新南威尔士大学（University of New South Wales）的米雷亚·蒙特斯（Mireia Montes）带领的一个国际天文学家团队，使用深光学成像技术研究了这个星系，他们发现，潮汐破坏（tidal disruption）的影响可以解释缺失的暗物质。邻近的大型星系NGC 1035的引力正在将NGC 1052-DF4裂解开来，在此过程中，暗物质被去除了，而恒星在随后的阶段中感受到的则是与另一个星系相互作用的影响。</p>
				<p>直到现在，天文学家也很难发现暗物质以这种方式被去除掉，因为只有使用能够揭示极微弱特征的极深图像，才能观察到这种情况。“我们以两种方式使用到了哈勃望远镜，发现NGC 1052-DF4正在发生某种相互作用，”蒙特斯解释说，“这两种方式分别是研究星系的光和球状星团的分布。”</p>
				<img src="img/6/1/4/2.jpg"/><center><i>上面的图像展示了NGC 1052-DF4星系周围的区域，由西班牙特内里费岛泰德天文台（Teide Observatory）的IAC80望远镜所拍摄，图像突出显示了视野中的主要星系，包括NGC 1052-DF4（位于图像的中心）及其相邻的NGC 1035（位于图像左侧中部）。<br />
图片来源：米雷亚·蒙特斯等人</i></center>
				<p>由于哈勃望远镜具有很高的分辨率，天文学家可以从所得数据中识别出星系的球状星团。通过进一步研究西班牙加那利群岛上口径长达10.4米的加那利大型望远镜（Gran Telescopio Canarias，GTC）和IAC80望远镜的数据，研究人员对哈勃的观测结果做出了相应的补充。</p>
				<p>“仅仅花费大量的时间在数据观察上是远远不够的，仔细地处理数据才是至关重要的，”西班牙加那利天体物理研究所（Instituto de Astrofísica de Canarias）的团队成员劳尔·因凡特-塞恩斯（Raúl Infante-Sainz）解释说，“因此重要的是，我们要使用的不只是一台望远镜或仪器，而是多个地基和太空中的观测仪器来进行这项研究。利用哈勃望远镜的高分辨率，我们可以识别出球状星团，然后利用加那利大型望远镜的光度测量，我们可以得到星系的物理特性。”</p>
				<p>科学家认为，球状星团是在剧烈的恒星形成过程中形成的，多个恒星的形成则进一步塑造了星系。这些星团因恒星紧密地聚集在一起而产生了易于观察的边界和光度，因此可以很好地说明它们所在星系的性质。通过研究和表征NGC 1052-DF4星系中星团的空间分布，天文学家可以深入地了解星系本身的当前状态，而这些星团的直线形排列表明，它们正在从宿主星系中被“剥离”，这支持了潮汐破坏事件正在发生的结论。</p>
				<p>通过研究星系的光，天文学家也捕捉到了潮汐尾（tidal tails）的证据，它们是由远离NGC 1052-DF4的物质形成的，这进一步支持了以下结论：这是一个潮汐破坏事件。进一步的分析得出的结论是，星系的中心部分未受影响，星系中仅有7%的恒星质量处于潮汐尾中。这意味着一开始的时候，暗物质被优先从星系中剥离出来，因为暗物质的密度比恒星低，而现在，星系外围的行星部分也开始被逐渐剥离。</p>
				<p>“这为我们提供了一个很好的指示：虽说星系中的暗物质已经从系统中蒸发掉了，但恒星才刚刚开始受到潮汐破坏的影响，”西班牙西班牙加那利天体物理研究所的成员伊格纳西奥·特鲁希略（Ignacio Trujillo）解释说，“随着时间的推移，NGC 102-DF4将被围绕NGC 1035的大型系统拆解吞噬，至少会有其中的一些恒星在深空中自由地漂荡。</p>
				<p>作为对于星系缺失暗物质的原因解释，支持潮汐破坏机制的证据发现不仅解决了一项天文学难题，也让天文学家们松了一口气，因为如果没有它，科学家或许就不得不修订我们对引力定律的理解。</p>
				<p>蒙特斯补充说：“这项发现，让有关星系如何形成和演化的现有知识，与最有利的宇宙学模型达成了一致。”</p>
				<p><strong>参考来源：</strong></p>
				<p><a href="https://www.nasa.gov/feature/goddard/2020/new-hubble-data-explains-missing-dark-matter" target="_blank">https://www.nasa.gov/feature/goddard/2020/new-hubble-data-explains-missing-dark-matter</a></p>
			</section>
		<div class="backtotop"></div>
	</body>
</html>
