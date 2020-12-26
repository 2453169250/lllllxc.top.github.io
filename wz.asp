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
<!--#include file="Connections/lianjie.asp" -->
<%
' *** Restrict Access To Page: Grant or deny access to this page
MM_authorizedUsers=""
MM_authFailedURL="wz.html"
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
		<title>文章</title>
		<link rel="stylesheet" href="css/index.css"/>
		<!-- <base target="_blank"/> -->
		<script src="js/jquery.min.js"></script>
		<script src="js/index.js"></script>
		<link rel="icon" href="img/favicon.png" type="image/x-icon">
		<link rel="stylesheet" href="font/iconfont.css">
		<link rel="stylesheet" href="css/wz.css"/>
		<style type="text/css">
			body{
				position: absolute;
				z-index: -999;
				height: 2400px;
			}
		</style>
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
								<li><a href="javascript:;" class="nav-1-a">咨讯</a></li>
								<li><a href="javascript:;" class="nav-1-a">新闻</a></li>
								<li><a href="javascript:;" class="nav-1-a">科普</a></li>
								<li><a href="javascript:;" class="nav-1-a">历史</a></li>
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
			<div class="sale beijing3">
				<div class="game">
					<ul class="ul1 ul1-d0">
						<li class="cur sale-ul1-li" id="#ul1-1">咨讯</li>
						<li class="sale-ul1-li" id="#ul1-2">新闻</li>
						<li class="sale-ul1-li" id="#ul1-3">科普</li>
						<li class="sale-ul1-li" id="#ul1-1">历史</li>
					</ul>
					<ul class="d0 dd0">
						<li class="zx">
							<div class="zx-div0"><img src="img/6/1/001.jpg"/></div>
							<div class="zx-div1"><h1 class="zx-h1"><a href="wz-zx1.asp" target="_blank">土星与木星的大近合</a></h1></div>
						</li>
						<li class="zx">
							<div class="zx-div0"><img src="img/6/1/002.png"/></div>
							<div class="zx-div1"><h1 class="zx-h1"><a href="wz-zx2.asp" target="_blank">哈勃望远镜确定了奇异的系外行星与遥远的轨道</a></h1></div>
						</li>
						<li class="zx">
							<div class="zx-div0"><img src="img/6/1/003.jpg"/></div>
							<div class="zx-div1"><h1 class="zx-h1"><a href="wz-zx3.asp" target="_blank">NASA为首次载人登月的阿尔忒弥斯任务制定了科学优先事项</a></h1></div>
						</li>
						<li class="zx">
							<div class="zx-div0"><img src="img/6/1/004.jpg"/></div>
							<div class="zx-div1"><h1 class="zx-h1"><a href="wz-zx4.asp" target="_blank">来自哈勃的新数据，解释了消失的暗物质</a></h1></div>
						</li>
						<li class="zx">
							<div class="zx-div0"><img src="img/6/1/005.png"/></div>
							<div class="zx-div1"><h1 class="zx-h1"><a href="wz-zx5.asp" target="_blank">12月的天象</a></h1></div>
						</li>
						<li class="zx">
							<div class="zx-div0"><img src="img/6/1/006.jpg"/></div>
							<div class="zx-div1"><h1 class="zx-h1"><a href="wz-zx6.asp" target="_blank">无情的辐射冲击，让木卫二的“夜侧面”也能发光</a></h1></div>
						</li>
					</ul>
					<ul class="d1 dd1" style="display: none;">
						<li class="zx">
							<div class="zx-div0"><img src="img/6/2/001.jpg"/></div>
							<div class="zx-div1"><h1 class="xw-h1"><a href="wz-xw1.asp" target="_blank">NASA将召开火星样本返回任务媒体电话会议</a></h1></div>
						</li>
						<li class="zx">
							<div class="zx-div0"><img src="img/6/2/002.gif" style="transform: scale(1.3);"/></div>
							<div class="zx-div1"><h1 class="xw-h1"><a href="wz-xw2.asp" target="_blank">NASA的OSIRIS-REX航天器收集了大量的小行星样本</a></h1></div>
						</li>
						<li class="zx">
							<div class="zx-div0"><img src="img/6/2/003.png" style="transform: scale(1.3);"/></div>
							<div class="zx-div1"><h1 class="xw-h1"><a href="wz-xw3.asp" target="_blank">NASA的OSIRIS-REX太空船成功降落小行星</a></h1></div>
						</li>
						<li class="zx">
							<div class="zx-div0"><img src="img/6/2/004.jpg" style="transform: scale(1.5);"/></div>
							<div class="zx-div1"><h1 class="xw-h1"><a href="wz-xw4.asp" target="_blank">NASA和SPACEX将首次向国际空间站执行商业人员轮换任务</a></h1></div>
						</li>
						<li class="zx">
							<div class="zx-div0"><img src="img/6/2/005.png"/></div>
							<div class="zx-div1"><h1 class="xw-h1"><a href="wz-xw5.asp" target="_blank">OSIRIS-REX小行星采集样品任务开始倒计时</a></h1></div>
						</li>
						<li class="zx">
							<div class="zx-div0"><img src="img/6/2/006.png"/></div>
							<div class="zx-div1"><h1 class="xw-h1"><a href="wz-xw6.asp" target="_blank">SPACEX的第100次发射，成功发射第11批星链卫星</a></h1></div>
						</li>
					</ul>
					<ul class="d2 dd2" style="display: none;">
						<li class="zx">
							<div class="zx-div0"><img src="img/6/3/001.jpg"/></div>
							<div class="zx-div1"><h1 class="kp-h1"><a href="wz-kp1.asp" target="_blank">地球和月球曾经共享一个磁场屏障，保护它们的大气层</a></h1></div>
						</li>
						<li class="zx">
							<div class="zx-div0"><img src="img/6/3/002.jpg"/></div>
							<div class="zx-div1"><h1 class="kp-h1"><a href="wz-kp2.asp" target="_blank">行星上的季节变化</a></h1></div>
						</li>
						<li class="zx">
							<div class="zx-div0"><img src="img/6/3/003.jpg"/></div>
							<div class="zx-div1"><h1 class="kp-h1"><a href="wz-kp3.asp" target="_blank">有关金星大气层中生命迹象的十个问答</a></h1></div>
						</li>
						<li class="zx">
							<div class="zx-div0"><img src="img/6/3/004.jpg"/></div>
							<div class="zx-div1"><h1 class="kp-h1"><a href="wz-kp4.asp" target="_blank">关于NASA-SPACEX DEMO-2任务宇航员返回地球 需要知道的10件事</a></h1></div>
						</li>
						<li class="zx">
							<div class="zx-div0"><img src="img/6/3/005.jpg"/></div>
							<div class="zx-div1"><h1 class="kp-h1"><a href="wz-kp5.asp" target="_blank">火箭想要飞得更快，可能还得靠核动力推进</a></h1></div>
						</li>
						<li class="zx">
							<div class="zx-div0"><img src="img/6/3/006.jpg"/></div>
							<div class="zx-div1"><h1 class="kp-h1"><a href="wz-kp6.asp" target="_blank">火星的基本事实</a></h1></div>
						</li>
					</ul>
					<ul class="d3 dd3" style="display: none;">
						<li class="zx">
							<div class="zx-div0"><img src="img/6/4/001.png"/></div>
							<div class="zx-div1"><h1 class="ls-h1"><a href="wz-ls1.asp" target="_blank">沃洛普斯：75年的默默支持，推动着美国航天的历史与未来</a></h1></div>
						</li>
						<li class="zx">
							<div class="zx-div0"><img src="img/6/4/002.jpg"/></div>
							<div class="zx-div1"><h1 class="ls-h1"><a href="wz-ls2.asp" target="_blank">历史上的今天 惠更斯发现了灭霸的故乡</a></h1></div>
						</li>
						<li class="zx">
							<div class="zx-div0"><img src="img/6/4/003.jpg"/></div>
							<div class="zx-div1"><h1 class="ls-h1"><a href="wz-ls3.asp" target="_blank">50年前人类迈出了划时代的一大步</a></h1></div>
						</li>
						<li class="zx">
							<div class="zx-div0"><img src="img/6/4/004.jpg"/></div>
							<div class="zx-div1"><h1 class="ls-h1"><a href="wz-ls4.asp" target="_blank">机遇号的一生</a></h1></div>
						</li>
						<li class="zx">
							<div class="zx-div0"><img src="img/6/4/005.jpg"/></div>
							<div class="zx-div1"><h1 class="ls-h1"><a href="wz-ls5.asp" target="_blank">50年前的今天，阿波罗12号发射升空</a></h1></div>
						</li>
						<li class="zx">
							<div class="zx-div0"><img src="img/6/4/006.jpg"/></div>
							<div class="zx-div1"><h1 class="ls-h1"><a href="wz-ls6.asp" target="_blank">哈勃祝斯皮策16岁生日快乐</a></h1></div>
						</li>
					</ul>
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
