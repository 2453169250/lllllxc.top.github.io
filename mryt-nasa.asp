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
MM_authFailedURL="mryt-nasa.html"
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
		<title>NASA·每日一图</title>
		<link rel="stylesheet" href="css/index.css"/>
		<!-- <base target="_blank"/> -->
		<script src="js/jquery.min.js"></script>
		<script src="js/index.js"></script>
		<script src="js/mryt.js" type="text/javascript" charset="utf-8"></script>
		<!-- <script src="js/SmoothScroll.min.js" type="text/javascript" charset="utf-8"></script> -->
		<link rel="icon" href="img/favicon.png" type="image/x-icon">
		<link rel="stylesheet" href="css/mryt.css"/>
		<link rel="stylesheet" href="font/iconfont.css">
		<style type="text/css">
			body{
				position: absolute;
				z-index: -999;
				height: 3500px;
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
		<main class="mryt clear">
			<div class="box2 clear mryt-img">
				<ul class="ul2">
					<li><a href="img/5/nasa/001.jpg"><img src="img/5/nasa/001.jpg" title="介绍阿尔忒弥斯宇航员"/></a><span>介绍阿尔忒弥斯宇航员</span></li>
					<li><a href="img/5/nasa/002.jpg"><img src="img/5/nasa/002.jpg" title="3D打印火箭部件和宇宙飞船的未来"/></a><span>3D打印火箭部件和宇宙飞船的未来</span></li>
					<li><a href="img/5/nasa/003.jpg"><img src="img/5/nasa/003.jpg" title="NASA和波音公司完成了一系列星际客机的降落伞测试"/></a><span>NASA和波音公司完成了一系列星际客机的降落伞测试</span></li>
					<li><a href="img/5/nasa/004.jpg"><img src="img/5/nasa/004.jpg" title="从地球上看空间站"/></a><span>从地球上看空间站</span></li>
					<li><a href="img/5/nasa/005.jpg"><img src="img/5/nasa/005.jpg" title="哈勃望远镜凝视着宇宙仙境"/></a><span>哈勃望远镜凝视着宇宙仙境</span></li>
					<li><a href="img/5/nasa/006.jpg"><img src="img/5/nasa/006.jpg" title="在国际空间站的世界之窗内放松"/></a><span>在国际空间站的世界之窗内放松</span></li>
					<li><a href="img/5/nasa/007.jpg"><img src="img/5/nasa/007.jpg" title="觉醒的新生恒星"/></a><span>觉醒的新生恒星</span></li>
					<li><a href="img/5/nasa/008.jpg"><img src="img/5/nasa/008.jpg" title="地球可能被毛状暗物质包围着"/></a><span>地球可能被毛状暗物质包围着</span></li>
					<li><a href="img/5/nasa/009.jpg"><img src="img/5/nasa/009.jpg" title="卡罗尔·哈里森 (CAROL HARRISON)：看到所有事物的美"/></a><span>卡罗尔·哈里森 (CAROL HARRISON)：看到所有事物的美</span></li>
					<li><a href="img/5/nasa/010.jpg"><img src="img/5/nasa/010.jpg" title="今天是黑洞星期五！"/></a><span>今天是黑洞星期五！</span></li>
					<li><a href="img/5/nasa/011.jpg"><img src="img/5/nasa/011.jpg" title="阿尔忒弥斯1号堆叠起来"/></a><span>阿尔忒弥斯1号堆叠起来</span></li>
					<li><a href="img/5/nasa/012.jpg"><img src="img/5/nasa/012.jpg" title="哨兵6号迈克尔·弗雷里奇卫星发射升空，监测全球海洋"/></a><span>哨兵6号迈克尔·弗雷里奇卫星发射升空，监测全球海洋</span></li>
					<li><a href="img/5/nasa/013.jpg"><img src="img/5/nasa/013.jpg" title="哈勃望远镜拍摄到了宇宙肉桂面包"/></a><span>哈勃望远镜拍摄到了宇宙肉桂面包</span></li>
					<li><a href="img/5/nasa/014.jpg"><img src="img/5/nasa/014.jpg" title="SPACEX载人龙飞船接近国际空间站"/></a><span>SPACEX载人龙飞船接近国际空间站</span></li>
					<li><a href="img/5/nasa/015.jpg"><img src="img/5/nasa/015.jpg" title="哈勃望远镜通过宇宙透镜观测星系"/></a><span>哈勃望远镜通过宇宙透镜观测星系</span></li>
					<li><a href="img/5/nasa/016.jpg"><img src="img/5/nasa/016.jpg" title="CREW-1开启历史性旅程"/></a><span>CREW-1开启历史性旅程</span></li>
					<li><a href="img/5/nasa/017.jpg"><img src="img/5/nasa/017.jpg" title="哈勃望远镜拍摄的宇宙瀑布"/></a><span>哈勃望远镜拍摄的宇宙瀑布</span></li>
					<li><a href="img/5/nasa/018.jpg"><img src="img/5/nasa/018.jpg" title="空间站之夜"/></a><span>空间站之夜</span></li>
					<li><a href="img/5/nasa/019.jpg"><img src="img/5/nasa/019.jpg" title="我们的万圣节太阳"/></a><span>我们的万圣节太阳</span></li>
					<li><a href="img/5/nasa/020.jpg"><img src="img/5/nasa/020.jpg" title="杰泽罗火山口是火星远古时代的一个湖泊"/></a><span>杰泽罗火山口是火星远古时代的一个湖泊</span></li>
					<li><a href="img/5/nasa/021.jpg"><img src="img/5/nasa/021.jpg" title="哈勃看到了银河瀑布"/></a><span>哈勃看到了银河瀑布</span></li>
					<li><a href="img/5/nasa/022.jpg"><img src="img/5/nasa/022.jpg" title="使用兰利的14乘22英尺亚音速风洞进行50年的研究"/></a><span>使用兰利的14乘22英尺亚音速风洞进行50年的研究</span></li>
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
