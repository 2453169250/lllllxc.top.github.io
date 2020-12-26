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
MM_authFailedURL="mryt-tw.html"
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
		<title>天文·每日一图</title>
		<link rel="stylesheet" href="css/index.css"/>
		<!-- <base target="_blank"/> -->
		<script src="js/jquery.min.js"></script>
		<!-- <script src="js/SmoothScroll.min.js"></script> -->
		<script src="js/index.js"></script>
		<script src="js/mryt.js" type="text/javascript" charset="utf-8"></script>
		<link rel="icon" href="img/favicon.png" type="image/x-icon">
		<link rel="stylesheet" href="css/mryt.css"/>
		<link rel="stylesheet" href="font/iconfont.css">
		<style type="text/css">
			body{
				position: absolute;
				z-index: -999;
				height: 3800px;
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
		<main class="mryt">
			<div class="box2 mryt-img">
				<ul class="ul2">
					<li><a href="img/5/tw/001.jpg"><img src="img/5/tw/001.jpg" title="碰撞中的触须星系"/></a><span class="tw">碰撞中的触须星系</span></li>
					<li><a href="img/5/tw/002.jpg"><img src="img/5/tw/002.jpg" title="月之眼"/></a><span class="tw">月之眼</span></li>
					<li><a href="img/5/tw/003.jpg"><img src="img/5/tw/003.jpg" title="NGC 346：小麦哲伦星系内的恒星形成区"/></a><span class="tw">NGC 346：小麦哲伦星系内的恒星形成区</span></li>
					<li><a href="img/5/tw/004.jpg"><img src="img/5/tw/004.jpg" title="移除恒星后的天鹅座"/></a><span class="tw">移除恒星后的天鹅座</span></li>
					<li><a href="img/5/tw/005.jpg"><img src="img/5/tw/005.jpg" title="维罗纳峭壁: 太阳系现知最高耸的悬崖"/></a><span class="tw">维罗纳峭壁: 太阳系现知最高耸的悬崖</span></li>
					<li><a href="img/5/tw/006.jpg"><img src="img/5/tw/006.jpg" title="NGC 6822: 巴纳德星系"/></a><span class="tw">NGC 6822: 巴纳德星系</span></li>
					<li><a href="img/5/tw/007.jpg"><img src="img/5/tw/007.jpg" title="嫦娥五号发射"/></a><span class="tw">嫦娥五号发射</span></li>
					<li><a href="img/5/tw/008.jpg"><img src="img/5/tw/008.jpg" title="火鸡大星云"/></a><span class="tw">火鸡大星云</span></li>
					<li><a href="img/5/tw/009.jpg"><img src="img/5/tw/009.jpg" title="巴塔哥尼亚上空的仙女大星系"/></a><span class="tw">巴塔哥尼亚上空的仙女大星系</span></li>
					<li><a href="img/5/tw/010.jpg"><img src="img/5/tw/010.jpg" title="加法夏望远镜拍摄的螺旋星云"/></a><span class="tw">加法夏望远镜拍摄的螺旋星云</span></li>
					<li><a href="img/5/tw/011.jpg"><img src="img/5/tw/011.jpg" title="兴隆观测站上空的双子流星"/></a><span class="tw">兴隆观测站上空的双子流星</span></li>
					<li><a href="img/5/tw/012.jpg"><img src="img/5/tw/012.jpg" title="2020年夏天的土星与木星"/></a><span class="tw">2020年夏天的土星与木星</span></li>
					<li><a href="img/5/tw/013.jpg"><img src="img/5/tw/013.jpg" title="梅西耶陨石坑的立体影像"/></a><span class="tw">梅西耶陨石坑的立体影像</span></li>
					<li><a href="img/5/tw/014.jpg"><img src="img/5/tw/014.jpg" title="SIMEIS 147：超新星遗迹"/></a><span class="tw">SIMEIS 147：超新星遗迹</span></li>
					<li><a href="img/5/tw/015.png"><img src="img/5/tw/015.png" title="阿雷西博望远镜垮塌"/></a><span class="tw">阿雷西博望远镜垮塌</span></li>
					<li><a href="img/5/tw/016.jpg"><img src="img/5/tw/016.jpg" title="西西里灯塔上空的天体大近合"/></a><span class="tw">西西里灯塔上空的天体大近合</span></li>
					<li><a href="img/5/tw/017.jpg"><img src="img/5/tw/017.jpg" title="美国拉什莫尔山上空的乳状云"/></a><span class="tw">美国拉什莫尔山上空的乳状云</span></li>
					<li><a href="img/5/tw/018.jpg"><img src="img/5/tw/018.jpg" title="M16: 恒星诞生之柱"/></a><span class="tw">M16: 恒星诞生之柱</span></li>
					<li><a href="img/5/tw/019.jpg"><img src="img/5/tw/019.jpg" title="风暴洋的吕姆克山"/></a><span class="tw">风暴洋的吕姆克山</span></li>
					<li><a href="img/5/tw/020.jpg"><img src="img/5/tw/020.jpg" title="M63: 向日葵星系"/></a><span class="tw">M63: 向日葵星系</span></li>
					<li><a href="img/5/tw/021.jpg"><img src="img/5/tw/021.jpg" title="朱诺号的木星景观"/></a><span class="tw">朱诺号的木星景观</span></li>
					<li><a href="img/5/tw/022.png"><img src="img/5/tw/022.png" title="承载龙宫小行星的样品舱返回地球"/></a><span class="tw">承载龙宫小行星的样品舱返回地球</span></li>
				</ul>
			</div>
		</main>
		<div class="backtotop"></div>
	</body>
</html>
<%
Recordset1.Close()
Set Recordset1 = Nothing
%>
