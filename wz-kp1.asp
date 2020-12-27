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
MM_authFailedURL="wz-kp1.html"
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
		<title>地球和月球曾经共享一个磁场屏障，保护它们的大气层</title>
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
				<h1>地球和月球曾经共享一个磁场屏障，保护它们的大气层</h1>
			<p>45亿年前，地球表面是一个危险而炎热的世界。此外，在我们还只是一个蹒跚学步的孩子时，太阳以猛烈的辐射爆发轰击我们的星球，称之为耀斑和日冕物质抛射。被称为太阳风的带电粒子流威胁着我们的大气层。简而言之，我们的星球是不适合居住的。</p>
			<img src="img/6/3/1/1.jpg"/><center><i>地球和月球，这是20世纪90年代伽利略号任务拍摄的两张照片的合成图，有着悠久的共同历史。数十亿年前，它们的磁场相互连接。<br/>影像来源：美国国家航空航天局/喷气推进实验室/美国地质调查局</i></center>
			<p>但是一个邻近的地盾可能帮助我们的星球保持它的大气层，并最终发展生命和适宜居住的条件。美国国家航空航天局（NASA）在《科学进展》杂志上发表的一项研究称，这个保护层就是月球。</p>
			<p>“月球似乎为地球提供了一个抵御太阳风的实质性屏障，这对地球在此期间维持大气层的能力至关重要。”NASA首席科学家、这项新研究的主要作者吉姆·格林(Jim Green)说，“我们期待着在NASA通过阿耳忒弥斯项目将宇航员送往月球时，对这些发现进行后续研究。阿耳忒弥斯项目将带回月球南极的关键样本。”</p>
			<h2>月球简史</h2>
			<p>根据主流理论，月球形成于45亿年前，当时我们的地球还不到1亿年之久，一个名为忒亚(Theia)的火星大小的物体撞击到原始地球上。碰撞产生的碎片聚集成月球，而其他残余物重新融入了地球。由于重力，月亮的存在稳定了地球的自转轴。那时，我们的地球自转得更快，一天只有5个小时。</p>
			<p>在早期，月球离我们也很近。由于月球的引力作用在海洋上，水会被略微加热，能量就会被消耗掉。这就导致月球以每年1.5英寸的速度远离地球，或者说大约是两个两个10美分硬币的宽度。随着时间的推移，这就足够了。到40亿年前，月球离地球的距离是现在的三分之一——大约8万英里，而现在的距离是23万8千英里。在某个时刻，月球也变得“潮汐锁定”，这意味着地球只能看到月球的一面。</p>
			<p>物理学家曾经认为，月球从未有过一个持久的全球磁场，因为它的核心很小。磁场使电荷沿着看不见的线移动，这些线在两极向月球弯曲。科学家们很早就知道地球的磁场，这种磁场在北极和南极地区形成了色彩艳丽的极光。</p>
			<p>磁场起着屏蔽作用，使电荷沿着它看不见的线移动。科学家们很早就知道地球的磁场，这种磁场在北极和南极地区形成了色彩艳丽的极光。在地球深处，液态铁和液态镍的运动仍然在流动，这是因为地球形成过程中留下的热量。这些运动产生的磁场构成了围绕地球磁层的保护性气泡。</p>
			<p>通过对阿波罗任务中月球表面样本的研究，科学家们发现月球曾经也有一个磁层。这些封存了几十年的样本，最近用现代技术进行了分析，证据不断增加。</p>
			<p>像地球一样，月球形成时产生的热量会使铁保持在月球内部深处流动，但由于月球的大小，铁的流动时间不会那么长。</p>
			<p>“这就像烤蛋糕：你把它从烤箱里拿出来，它还在冷却，”格林说。“质量越大，冷却所需的时间就越长。”</p>
			<h2>磁屏蔽</h2>
			<p>这项新的研究模拟了大约40亿年前地球和月球磁场的变化。物理学家们建立了一个计算机模型来观察磁场在各自轨道的两个位置的行为。</p>
			<p>科学家们写道，在某些时候，月球的磁层可能会成为地月系统遭受强烈太阳辐射的屏障。这是因为，根据这个模型，月球和地球的磁球在每个天体的两极区域都有磁性连接。对于地球的演化很重要的一点是，高能的太阳风粒子不能完全穿透耦合磁场并剥离大气层。</p>
			<img src="img/6/3/1/2.jpg" /><center><i>当月球有磁场时，地球就会被屏蔽，不受太阳风的影响，如图所示。<br/>
影像来源：美国国家航空航天局</i></center>
			<p>但地球和月球也有一些大气交换。来自太阳的极端紫外线会将地球最高层大气中的中性粒子中的电子剥离，使这些粒子带电，并使它们能够沿着月球磁场线前往月球。这可能也是当时月球保持稀薄大气的原因之一。月球岩石样本中氮的发现支持了这样一种观点，即以氮为主的地球大气层促成了月球的古代大气及其地壳。</p>
			<p>科学家们计算出，地球和月球的磁球结合在一起的磁场共享情况可能在41亿到35亿年前一直存在。</p>
			<img src="img/6/3/1/3.jpg"/><center><i>根据一项新的研究，这幅图显示了地球和月球在数十亿年前都有连接在一起的磁场，这有助于保护它们的大气层免受太阳粒子流的破坏。<br />
影像来源：美国国家航空航天局</i></center>
<p>“了解月球磁场的历史不仅有助于我们了解早期大气，还有助于我们了解月球内部是如何演变的，”美国宇航局副首席科学家和研究合著者大卫·德雷珀(David Draper)说。“它告诉我们月球的核心可能是什么样子的——可能是在其历史的某个时刻液态和固态金属的结合——这是月球内部如何工作的一个非常重要的谜团。”</p>
<p>随着时间的推移，随着月球内部的冷却，我们最近的邻居失去了磁层，最终失去了大气层。磁场在32亿年前就显著减少，在大约15亿年前消失。如果没有磁场，太阳风就会将大气层剥离。这也是火星失去大气层的原因：太阳辐射将大气层剥离。</p>
<img src="img/6/3/1/4.jpg" /><center><i>图中显示了地球今天产生的磁场线。月球不再有磁场。<br />
影像来源：美国国家航空航天局</i></center>
<p>科学家们说，如果我们的月球在关键的早期起到了保护我们的星球免受有害辐射的作用，那么在银河系中，可能还有其他的卫星在类地系外行星周围，以类似的方式帮助它们的主行星保持大气层，甚至有助于创造适宜居住的条件。这对研究生命起源和寻找地球以外的生命的天体生物学领域来说是很有意义的。</p>
<h2>人类探索可以告诉我们更多</h2>
<p>这项模拟研究为地球和月球的远古历史如何有助于地球早期大气的保存提供了思路。神秘而复杂的过程很难弄清楚，但来自月球表面的新样本将提供解开谜团的线索。</p>
<p>随着NASA计划通过阿耳忒弥斯项目在月球上建立一个可持续的人类存在，可能会有多种机会来验证这些想法。当宇航员从地球和月球磁场联系最紧密的月球南极带回第一批样品时，科学家可以寻找地球古代大气的化学特征，以及由陨石和小行星撞击产生的水等挥发性物质。科学家们对月球南极数十亿年来从未见过阳光的地区——即“永久阴影区”——特别感兴趣，因为严酷的太阳粒子不会带走挥发性物质。</p>
<p>例如，氮和氧可能沿着磁场线从地球到月球，并被困在这些岩石中。</p>
<p>格林说：“来自这些永久阴影区域的重要样本对于我们理清地球挥发物质的早期演化，检验我们的模型假设至关重要。”</p>
<p>论文的其他合著者是来自巴尔的摩县马里兰大学的斯科特·博德森（Scott Boardsen）和新泽西州普林斯顿大学的董传飞（Chuanfei Dong）。</p>
<p><strong>参考来源：</strong></p>
<p><a href="https://www.nasa.gov/feature/earth-and-moon-once-shared-a-magnetic-shield-protecting-their-atmospheres" target="_blank">https://www.nasa.gov/feature/earth-and-moon-once-shared-a-magnetic-shield-protecting-their-atmospheres</a></p>
			</section>
		<div class="backtotop"></div>
	</body>
</html>
