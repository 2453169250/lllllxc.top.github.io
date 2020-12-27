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
MM_authFailedURL="wz-ls2.html"
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
		<title>历史上的今天 惠更斯发现了灭霸的故乡</title>
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
						<li><a href="zght.html" class="nav-0-a">中国航天</a></li>
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
			<h1>历史上的今天 惠更斯发现了灭霸的故乡</h1>
			<img src="img/6/4/2/1.jpg" ><center><i>克里斯蒂安·惠更斯（Christiaan Huygens ）<br/>
Credit：NASA</i></center>
			<p>1655年3月25日，荷兰数学家和天文学家克里斯蒂安·惠更斯发现了灭霸的故乡（虚构），土卫六泰坦。</p>
			<p>当年惠更斯在观察土星环时，注意到附近有一个明亮的小点，随后经过几天的确认，证实这个小点在环绕土星运行，确认新发现了一个土星的卫星。土卫六是土星最大的卫星，也是土星截止目前82颗卫星中最先发现的。</p>
			<img src="img/6/4/2/2.jpg" ><center><i>杰拉德·柯伊伯（Gerard Kuiper），1960年，柯伊伯在亚利桑那州创建了月球与行星实验室。<br/>
Credit:NASA</i></center>
			<p>近300年后，1944年，荷兰美籍天文学家杰拉德·柯伊伯发现土卫六具有与众不同的特征之一，这颗遥远的土星卫星拥有大气层。</p>
			<p>土卫六上反射的太阳光通过光谱仪后，柯伊伯从中检测到了甲烷的存在，地基望远镜的进一步观测，证实了这一发现，土卫六拥有浓密且朦胧的大气层。</p>
			<img src="img/6/4/2/3.jpg" ><center><i>先驱者11号拍摄到的土星和土卫六，当时距离土星284.6万公里。<br/>
Credit: NASA Ames</i></center>
			<p>1979年9月1日，先驱者11号飞越了土星系统，成为首个探索土卫六的航天器。天文学们之前研究过土卫六的温度，并估算出它的质量，这些特征都得到了先驱者11号的证实。</p>
			<p>由于土卫六的大气层不透明，当年科学家们错误地认为土卫六可能是太阳系中最大的卫星。先驱者11号在土卫六的高层大气中看到了淡蓝色的烟雾，后来旅行者一号又观测到了这一现象。</p>
			<img src="img/6/4/2/4.jpg" ><center><i>1980年10月18日，旅行者一号近距离拍摄到的土星彩色增强照。<br/>
Credits: NASA/JPL-Caltech</i></center>
<img src="img/6/4/2/5.jpg" ><center><i>1980年11月12日，旅行者1号拍摄到的土卫六，涵盖范围约2.2万公里，从中我们能看到土卫六大气层的细节。<br/>
Credits: NASA/JPL-Caltech</i></center>
			<p>上面这张照片中，我们能看到橙色和蓝色的高层大气。在旅行者1号抵达土星系统前，一些科学家估计，由于土卫六的温度很低，可能在其表面存在着液态的甲烷海洋，但由于旅行者1号和旅行者2号携带的相机无法穿透土卫六浓密的大气层，无法看清土卫六的表面，所以这一猜想无法得到证实。</p>
			<img src="img/6/4/2/6.jpg" ><center><i>1981年8月4日，旅行者2号拍摄到的土星系统，当时相距大约2100万公里。<br/>
Credit：NASA</i></center>
			<p>旅行者号探测器证实了土卫六大气层中有乙炔、乙烷、丙烷和其他有机分子，且大气的主要成分是氮气。</p>
			<img src="img/6/4/2/7.jpg" ><center><i>红外光下的土卫六表面<br/>
Credit: UA Lunar and Planetary Laboratory</i></center>
			<p>1994年，哈勃太空望远镜在红外光波段拍摄了土卫六，照片显示有较大的明暗区域，但这并不能证实土卫六表面存在着液态海洋。</p>
			<img src="img/6/4/2/8.jpg" ><center><i>可见光和红外光波段下，土卫六的变化，分别由卡西尼号拍摄于2005年10月28日（左），2005年12月26日（中），2006年1月15日（右）。<br/>
Credit：NASA/JPL/University of Arizona</i></center>
<img src="img/6/4/2/9.jpg"><center><i>红外光下，迄今最清晰的土卫六全球影像，由卡西尼号拍摄。<br/>
Crdit：NASA/JPL-Caltech/Stéphane Le Mouélic, University of Nantes, Virginia Pasek, University of Arizona</i></center>
			<p>2004年，卡西尼-惠更斯号成为首个进入土星轨道的探测器，并开始多次观察土卫六。</p>
			<img src="img/6/4/2/10.png" ><center><i>2005年1月14日，惠更斯探测器成功着陆土卫六，传回的首张土卫六表面影像。<br/>
Credit：NASA/JPL/ESA/University of Arizona</i></center>
			<p>在惠更斯发现土卫六的300多年后，2005年1月14日，以惠更斯名字命名的探测器着陆土卫六，这是人类探测器首次在外太阳系着陆。</p>
			<p><strong>参考：</strong></p>
			<p><a href="https://solarsystem.nasa.gov/moons/saturn-moons/titan" target="_blank">https://solarsystem.nasa.gov/moons/saturn-moons/titan</a></p>
			</section>
		<div class="backtotop"></div>
	</body>
</html>
