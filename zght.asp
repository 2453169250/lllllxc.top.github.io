<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
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
MM_authFailedURL="zght.html"
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
<!--#include file="Connections/lianjie.asp" -->
<%
Dim Recordset1
Dim Recordset1_cmd
Dim Recordset1_numRows

Set Recordset1_cmd = Server.CreateObject ("ADODB.Command")
Recordset1_cmd.ActiveConnection = MM_lianjie_STRING
Recordset1_cmd.CommandText = "SELECT * FROM 用户表" 
Recordset1_cmd.Prepared = true

Set Recordset1 = Recordset1_cmd.Execute
Recordset1_numRows = 0
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<meta name="apple-mobile-web-app-title" content="太空旅客"/>
		<title>中国航天</title>
		<link rel="stylesheet" href="css/index.css"/>
		<!-- <base target="_blank"/> -->
		<script src="js/jquery.min.js"></script>
		<script src="js/index.js"></script>
		<link rel="icon" href="img/favicon.png" type="image/x-icon">
		<link rel="stylesheet" href="font/iconfont.css">
		<link rel="stylesheet" href="css/zght.css">
		<script src="js/zght.js"></script>
		<style type="text/css">
			body{
				position: absolute;
				z-index: -999;
				padding-bottom: 200px;
			}
		</style>
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
		<main>
			<div class="sale sale-zght">
				<div class="game">
					<ul class="ul1 sale-game-ul1">
						<li class="cur sale-ul1-li">&#xe61a; 火箭产品</li>
						<li class="sale-ul1-li">&#xe608; 卫星产品</li>
						<li class="sale-ul1-li">&#xe600; 航天器产品</li>
						<li class="sale-ul1-li">&#xe698; 飞船产品</li>
					</ul>
					<ul class="d0">
						<div class="ye1 clear">
							<li class="d0-li"><a href="zghtcp/1.html" target="iframe1"><img src="img/1/001.jpg" class="sale-img"/></a></li>
							<li class="d0-li"><a href="zghtcp/2.html" target="iframe1"><img src="img/1/002.jpg" class="sale-img"/></a></li>
							<li class="d0-li"><a href="zghtcp/3.html" target="iframe1"><img src="img/1/003.jpg" class="sale-img"/></a></li>
							<li class="d0-li"><a href="zghtcp/4.html" target="iframe1"><img src="img/1/004.jpg" class="sale-img"/></a></li>
							<li class="d0-li"><a href="zghtcp/5.html" target="iframe1"><img src="img/1/005.jpg" class="sale-img"/></a></li>
							<li class="d0-li"><a href="zghtcp/6.html" target="iframe1"><img src="img/1/006.jpg" class="sale-img"/></a></li>
							<li class="d0-li"><a href="zghtcp/7.html" target="iframe1"><img src="img/1/007.jpg" class="sale-img"/></a></li>
							<li class="d0-li"><a href="zghtcp/8.html" target="iframe1"><img src="img/1/008.jpg" class="sale-img"/></a></li>
							<li class="d0-li"><a href="zghtcp/9.html" target="iframe1"><img src="img/1/009.jpg" class="sale-img"/></a></li>
							<li class="d0-li"><a href="zghtcp/10.html" target="iframe1"><img src="img/1/010.jpg" class="sale-img"/></a></li>
							<li class="d0-li"><a href="zghtcp/11.html" target="iframe1"><img src="img/1/011.jpg" class="sale-img"/></a></li>
							<li class="d0-li"><a href="zghtcp/12.html" target="iframe1"><img src="img/1/012.jpg" class="sale-img"/></a></li>
						</div>
						<div class="ye2 clear" style="display: none;">
							<li class="d0-li d0-li2"><a href="zghtcp/13.html" target="iframe1"><img src="img/1/013.jpg" class="sale-img"/></a></li>
							<li class="d0-li d0-li2"><a href="zghtcp/14.html" target="iframe1"><img src="img/1/014.jpg" class="sale-img"/></a></li>
							<li class="d0-li d0-li2"><a href="zghtcp/15.html" target="iframe1"><img src="img/1/0015.jpg" class="sale-img"/></a></li>
							<li class="d0-li d0-li2"><a href="zghtcp/16.html" target="iframe1"><img src="img/1/0016.jpg" class="sale-img"/></a></li>
							<li class="d0-li d0-li2"><a href="zghtcp/17.html" target="iframe1"><img src="img/1/017.jpg" class="sale-img"/></a></li>
						</div>
						<div class="page"><span class="one bgcolor">1</span><span class="two">2</span></div>
					</ul>
					<ul class="d1 clear" style="display: none;">
						<li class="d1-li"><a href="zghtcp/18.html" target="iframe1"><img src="img/2/001.jpg" class="sale-img"/></a></li>
						<li class="d1-li"><a href="zghtcp/19.html" target="iframe1"><img src="img/2/002.jpg" class="sale-img"/></a></li>
						<li class="d1-li"><a href="zghtcp/20.html" target="iframe1"><img src="img/2/003.jpg" class="sale-img"/></a></li>
						<li class="d1-li"><a href="zghtcp/21.html" target="iframe1"><img src="img/2/004.jpg" class="sale-img"/></a></li>
						<li class="d1-li"><a href="zghtcp/22.html" target="iframe1"><img src="img/2/005.jpg" class="sale-img"/></a></li>
						<li class="d1-li"><a href="zghtcp/23.html" target="iframe1"><img src="img/2/006.jpg" class="sale-img"/></a></li>
					</ul>
					<ul class="d2 clear" style="display: none;">
						<li class="d2-li"><a href="zghtcp/24.html" target="iframe1"><img src="img/3/001.jpg" class="sale-img"/></a></li>
						<li class="d2-li"><a href="zghtcp/25.html" target="iframe1"><img src="img/3/002.jpg" class="sale-img"/></a></li>
						<li class="d2-li"><a href="zghtcp/26.html" target="iframe1"><img src="img/3/003.jpg" class="sale-img"/></a></li>
						<li class="d2-li"><a href="zghtcp/27.html" target="iframe1"><img src="img/3/004.jpg" class="sale-img"/></a></li>
						<li class="d2-li"><a href="zghtcp/28.html" target="iframe1"><img src="img/3/005.jpg" class="sale-img"/></a></li>
					</ul>
					<ul class="d3 clear" style="display: none;">
						<li class="d3-li"><a href="zghtcp/29.html" target="iframe1"><img src="img/4/001.jpg" class="sale-img"/></a></li>
						<li class="d3-li"><a href="zghtcp/30.html" target="iframe1"><img src="img/4/002.jpg" class="sale-img"/></a></li>
						<li class="d3-li"><a href="zghtcp/31.html" target="iframe1"><img src="img/4/003.jpg" class="sale-img"/></a></li>
						<li class="d3-li"><a href="zghtcp/32.html" target="iframe1"><img src="img/4/004.jpg" class="sale-img"/></a></li>
						<li class="d3-li"><a href="zghtcp/33.html" target="iframe1"><img src="img/4/005.jpg" class="sale-img"/></a></li>
						<li class="d3-li"><a href="zghtcp/34.html" target="iframe1"><img src="img/4/006.jpg" class="sale-img"/></a></li>
						<li class="d3-li"><a href="zghtcp/35.html" target="iframe1"><img src="img/4/007.jpg" class="sale-img"/></a></li>
						<li class="d3-li"><a href="zghtcp/36.html" target="iframe1"><img src="img/4/008.jpg" class="sale-img"/></a></li>
						<li class="d3-li"><a href="zghtcp/37.html" target="iframe1"><img src="img/4/009.jpg" class="sale-img"/></a></li>
						<li class="d3-li"><a href="zghtcp/38.html" target="iframe1"><img src="img/4/010.jpg" class="sale-img"/></a></li>
						<li class="d3-li"><a href="zghtcp/39.html" target="iframe1"><img src="img/4/011.jpg" class="sale-img"/></a></li>
						<li class="d3-li"><a href="zghtcp/40.html" target="iframe1"><img src="img/4/012.jpg" class="sale-img"/></a></li>
					</ul>
				</div>
				<div class="aside">
					<iframe src="zghtcp/0.html" name="iframe1" class="aside-iframe"></iframe>
				</div>
			</div>
		</main>
		<div class="backtotop"></div>
	</body>
</html>
<%
Recordset1.Close()
Set Recordset1 = Nothing
%>
