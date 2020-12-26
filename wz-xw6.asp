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
MM_authFailedURL="wz-xw6.html"
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
		<title>SpaceX的第100次发射，成功发射第11批星链卫星</title>
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
				<h1>SpaceX的第100次发射，成功发射第11批星链卫星</h1>
				<video src="img/6/2/6/1.mp4" controls="controls" width="100%" height="100%"></video>
				<center><i>北京时间8月18日22时31分,六手猎鹰9号(B1049.6)发射升空。<br/>
Credit：SpaceX</i></center>
				<p>北京时间8月18日22时31分，SpaceX在卡纳维拉尔角空军基地SLC-40使用六手猎鹰9号(B1049.6)成功发射58颗星链卫星，以及三颗SkySats 19-21对地观测卫星。</p>
				<video src="img/6/2/6/2.mp4" controls="controls" width="100%" height="100%"></video>
				<center><i>猎鹰9号一级火箭成功着陆在当然我依然爱你的海上驳船，这是B1049的第六次回收。<br/>
Credit：SpaceX</i></center>
				<p>这次发射对SpaceX来说，是一个重要的里程碑，这是SpaceX的第100次发射，猎鹰9号的第92次发射，以及一枚猎鹰9号的第6次复用回收。</p>
				<img src="img/6/2/6/3.png">
				<center><i>准备回收整流罩<br/>
Credit：SpaceX</i></center>
				<p><strong>天空卫星（SkySats ）轨道</strong></p>
				<video src="img/6/2/6/4.mp4" controls="controls" width="100%" height="100%"></video>
				<center><i>天空卫星轨道<br/>
Credit:Planet</i></center>
				<p>天空卫星（SkySats 1-15）运行在太阳同步轨道(SSO)，这是近地轨道的一种特殊形式。</p>
				<p>当卫星运行在太阳同步轨道对地拍照时，地球表面总是以相同的角度被太阳光照射。天空卫星（SkySats 16-21）则在轨道倾角53度上运行，这是对太阳同步轨道的一种补充。</p>
				<img src="img/6/2/6/5.gif" ><center><i>SkySat对地观测卫星拍摄到的若潮号一分为二画面<br/>
Credit:Planet</i></center>
				<p>我们来看一下SkySat对地观测卫星传回的近乎实时图像，上面这张图是它拍摄到的若潮号一分为二画面，日本货船若潮号（MV Wakashio）于7月25日在毛里求斯水域触礁搁浅，泄漏了大约1000吨燃油，殃及当地海洋生命，这是印度洋有史以来最大的生态灾难之一，事故的原因竟然是为了连接WIFI，从这方面说，星链卫星未来会有很大的需求市场。</p>
				<img src="img/6/2/6/6.jpg" >
			</section>
		<div class="backtotop"></div>
	</body>
</html>
