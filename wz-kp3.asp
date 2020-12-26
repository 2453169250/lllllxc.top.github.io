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
MM_authFailedURL="wz-kp3.html"
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
		<title>有关金星大气层中生命迹象的十个问答</title>
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
				<h1>有关金星大气层中生命迹象的十个问答</h1>
				<p>我们来自何处？是否是唯一的存在？在地球以外的其他行星上寻找生命迹象，将是迄今为止我们作为生命存在所面临最大问题之一。</p>
				<p>下面这段视频来自麻省理工学院的两名科学家，为大家讲解9月14日在金星大气中的发现。</p>
				<video src="img/6/3/3/1.mp4" controls="controls" width="100%" height="100%"></video>
				<center><i>Credit：MIT</i></center>
				<p>2020年9月4日，天文学家们宣布在金星大气中，发现了磷化氢（phosphine），这是一种潜在的生物标记（biomarker），以下是英国皇家天文学会有关这次发现的十个问答。</p>
				<img src="img/6/3/3/2.jpg" >
				<center><i>Credit ESO / M. Kornmesser / L. Calçada & NASA / JPL / Caltech</i></center>
				<p><strong>问题一：这次发现了什么？</strong></p>
				<p>答：天文学家们在金星大气层中发现了磷化氢分子。</p>
				<p><strong>问题二：为什么会（如此）令人关注呢？</strong></p>
				<p>答：科学家们在金星大气中检测到的磷化氢数量相对较大，在地球上，磷化氢可以通过闪电，火山等自然活动产生，也可以通过微生物的代谢产生，但自然活动产生的数量很少，在地球上这么多量的磷化氢，唯一已知的方式是生物代谢。</p>
				<p><strong>问题三，这是否意味着在金星上存在着生命？</strong></p>
				<p>答：不能这么说，令人兴奋的是，这是我们首次在金星大气中发现生命可能存在的迹象，对此我们没有其他合理的解释。这并不意味着金星大气中一定有生命的存在，因为我们可能会错过其他一些未知的可能，未来我们还需要进一步的调查研究。</p>
				<p><strong>问题四，磷化氢分子是如何检测到的？</strong></p>
				<p>答：科学家们使用位于夏威夷的麦克斯韦望远镜（JCMT），对金星大气进行了光谱观测，原子和分子能够吸收特定波长的光，在吸收谱（absorption spectrum）磷化氢波长处出现缺口，证明了金星大气中磷化氢的存在。（简单说，就是不同的物质具有不同的光谱线，从光谱线中我们可以鉴定出化学成分。）</p>
				<p><strong>问题五，能确定是磷化氢吗？</strong></p>
				<p>答：是的，可以，科学家们再次使用位于智利的ALMA阵列进行了进一步观测，确认了JCMT望远镜的发现。</p>
				<p><strong>问题六，还有什么活动能产生磷化氢？</strong></p>
				<p>答：在地球上，诸如闪电，火山等活动能产生少量的磷化氢，还可以通过陨石传递，或者与太阳风相互作用产生，但是这些自然过程中产生的磷化氢数量都很少，不能解释我们在金星大气中观测到如此多的磷化氢。</p>
				<p><strong>问题七，有没有可能是早期派往金星的探测器给金星带去了污染？</strong></p>
				<p>答：在上世纪60年代至80年代，人类发射了许多的探测器前往金星，有些进入了金星大气层，有些安全着陆在金星表面，虽然存在着污染金星的可能性，但我们观测到的磷化氢数量很多，另地球上仅有极少数的生物体才能产生磷化氢，且极少能在金星的极端环境存活，综上，不太可能是来自地球的生物污染。</p>
				<p><strong>问题八，为了确认是否有生命的存在，还需要做什么进一步的研究呢？</strong></p>
				<p>答：最好的办法是直接检测，未来最终需要派遣探测器重新造访金星，对其大气层进行检测，或者在大气层中采样并带回地球进行分析。</p>
				<p><strong>问题九，水星或火星上有类似的生命迹象吗？</strong></p>
				<p>答：水星上没有大气层，水星朝着太阳的一面非常热，背对太阳的一面又非常寒冷，所以几乎不可能有生命的存在。<br/>
而火星不同，至少从火星的历史上说，火星上是有生命存在的可能，因为我们知道火星上曾经有一段时间温暖且潮湿，眼下也在火星上进行着生命迹象的寻找。</p>
				<p><strong>问题十，木星上有生命吗？</strong></p>
				<p>答：木星是一个巨大的气态行星，它的主要成分是氢气，而不是二氧化碳，所以在木星大气中几乎不可能有生命的存在。然而在木星的卫星上，如木卫二，木卫三，在它们的冰层下面有着液态海洋，那里生命存在的可能性很大。</p>
			<p><strong>参见：</strong></p>
			<p><a href="https://ras.ac.uk/news-and-press/news/venus-phosphine-detection-factsheet" target="_blank">https://ras.ac.uk/news-and-press/news/venus-phosphine-detection-factsheet</a></p>
			</section>
		<div class="backtotop"></div>
	</body>
</html>
