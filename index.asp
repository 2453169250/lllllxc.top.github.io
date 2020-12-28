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
MM_authFailedURL="index.html"
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
		<meta name="viewport" content="width=device-width,initial-scale=1,minimum-scale=1,maximum-scale=1,user-scalable=no" />
		<meta name="apple-mobile-web-app-title" content="太空旅客"/>
		<title>太空旅客</title>
		<link rel="stylesheet" href="css/index.css"/>
		<!-- <base target="_blank" /> -->
		<script src="js/jquery.min.js"></script>
		<script src="js/index.js"></script>
		<script src="js/SmoothScroll.min.js" type="text/javascript" charset="utf-8"></script>
		<link rel="icon" href="img/favicon.png" type="image/x-icon">
		<link rel="stylesheet" href="font/iconfont.css">
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
		<main class="clear">
			<section>
				<div class="scroll-wrap">
				    <div class="scoller">
				        <ul>
				            <li style="display: block;"><a href="xwfb1.asp" target="_blank"><img src="img/01.jpg"></a></li>
				            <li><a href="dhl2.asp" target="_blank"><img src="img/02.jpg" class="section-img"></a></li>
				            <li><a href="wz-xw7.asp" target="_blank"><img src="img/03.jpg" class="section-img"></a></li>
				            <li><a href="wz-xw1.asp" target="_blank"><img src="img/04.jpg" class="section-img"></a></li>
				            <li><a href="wz-zx7.asp" target="_blank"><img src="img/05.jpg" class="section-img"></a></li>
				            <li><a href="wz-zx1.asp" target="_blank"><img src="img/06.jpg" class="section-img"></a></li>
				            <li><a href="dhl7.asp" target="_blank"><img src="img/07.jpg" class="section-img"></a></li>
				        </ul>
				    </div>
				    <span class="arrow_left"></span>
				    <span class="arrow_right"></span>
					<ol>
						<li class="on">1</li>
				        <li>2</li>
				        <li>3</li>
				        <li>4</li>
				        <li>5</li>
				        <li>6</li>
				        <li>7</li>
				    </ol>
				</div>
			</section>
			<section class="index clear">
<div class="index-juz">
					<div class="xx clear">
						<h1><a>信息发布</a></h1>
						<h4 style="margin-top:25px;">长征八号运载火箭首次飞行试验取得圆满成功</h4>
						<p class="index-p">12月22日12时37分，我国自主研制的新型中型运载火箭长征八号首次飞行试验，在中国文...<a href="xwfb1.html" target="_blank">[详细]</a></p>
						<h4>嫦娥五号任务月球样品交接仪式在京举行</h4>
						<p class="index-p">12月19日上午，国家航天局在京举行探月工程嫦娥五号任务月球样品交接仪式，与部分参研...<a href="xwfb2.html">[详细]</a></p>
						<ul class="ul3">
							<li><a href="xwfb3.html" target="_blank">习近平致电代表党中央、国务院和中央军委祝贺探月工程嫦娥五号任务取得圆满成...</a></li>
							<li><a href="xwfb4.html" target="_blank">嫦娥五号探测器圆满完成我国首次地外天体采样返回任务</a></li>
							<li><a href="xwfb5.html" target="_blank">嫦娥五号探测器完成第二次月地转移轨道修正</a></li>
							<li><a href="xwfb6.html" target="_blank">嫦娥五号轨道器和返回器组合体实施第二次月地转移入射</a></li>
							<span class="a-img1"></span>
						</ul>
						<!-- <a href="javascript:;" class="a-img1"><img src="img/002.jpg"/></a> -->
					</div>
					<div class="xx clear">
						<h1><a>空间科学 • 空间应用</a></h1>
						<ul class="ul4 clear">
							<li><a href="kjkx1.html" target="_blank">国际最小高能绿色推力器在轨验证成功</a></li>
							<li><a href="kjkx2.html" target="_blank">一颗近地小行星飞掠地球，轨道非常特殊</a></li>
							<li><a href="kjkx3.html" target="_blank">除了导航，“北斗”还能干什么</a></li>
							<li><a href="kjkx4.html" target="_blank">25年持续蓄力，北斗向全球组网发起全面冲刺</a></li>
							<li><a href="kjkx5.html" target="_blank">“太极一号”：我国空间引力波探测迈出第一步</a></li>
						</ul>
						
						<h1 class="clear" style="padding:0;margin:0;border: 0;position:relative;margin-top:-59px;margin-left: 430px;"><a>国际航天</a></h1>
						<ul class="ul4 clear" style="position:relative;left:420px;top:-180px;">
							<li><a href="gjht1.html" target="_blank">阿联酋发力太空探索 “拉希德”2024年登月</a></li>
							<li><a href="gjht2.html" target="_blank">NASA持续推进太空“引爆点”技术</a></li>
							<li><a href="gjht3.html" target="_blank">德国计划重返航天角力场</a></li>
							<li><a href="gjht4.html" target="_blank">美国宇航局计划在小行星表面采集岩石样本</a></li>
							<li><a href="gjht5.html" target="_blank">2024年将宇航员送上月球 分三步走</a></li>
							<span class="a-img2"></span>
						</ul>
						<!-- <a href="javascript:;" class="a-img2"><img src="img/001.jpg"/></a> -->
					</div>
				</div>
				<div class="wallpaper clear">
					<div class="juz clear">
						<h2>画廊</h2>
						<p class="wallpaper-p"></p>
						<div class="wallpaper-div clear">
							<a href="javascript:;" class="wallpaper-a"><img src="img/0/gallery1.jpg"/></a>
							<a href="javascript:;" class="wallpaper-a"><img src="img/0/gallery2.jpg"/></a>
							<a href="javascript:;" class="wallpaper-a"><img src="img/0/gallery3.jpg"/></a>
							<a href="javascript:;" class="wallpaper-a"><img src="img/0/gallery4.jpg"/></a>
							<a href="javascript:;" class="wallpaper-a"><img src="img/0/gallery5.jpg"/></a>
							<a href="javascript:;" class="wallpaper-a"><img src="img/0/gallery6.jpg"/></a>
							<a href="javascript:;" class="wallpaper-a"><img src="img/0/gallery7.jpg"/></a>
							<a href="javascript:;" class="wallpaper-a"><img src="img/0/gallery8.jpg"/></a>
							<a href="javascript:;" class="wallpaper-a"><img src="img/0/gallery9.jpg"/></a>
							<a href="javascript:;" class="wallpaper-a"><img src="img/0/gallery10.jpg"/></a>
							<a href="javascript:;" class="wallpaper-a"><img src="img/0/gallery11.jpg"/></a>
							<a href="javascript:;" class="wallpaper-a"><img src="img/0/gallery12.jpg"/></a>
						</div>
					</div>
				</div>
				</section>
			</main>
			<footer>
				<div class="footer-div clear">
					<ul class="ul5 clear">关于我们
						<li><span>&#xe7b9;</span>&nbsp;&nbsp;东莞经济贸易学校</li>
						<li><span>&#xe615;</span>&nbsp;&nbsp;+86&nbsp;136&nbsp;****&nbsp;****</li>
						<li><span>&#xe61b;</span>&nbsp;&nbsp;**********@gmail.com</li>
					</ul>
					<form action="" method="post" class="form1">订阅我们
						<input type="email" placeholder="Email" required/>
						<input type="text" placeholder="Name" required/>
						<input type="submit" value="提交"/>
					</form>
				</div>
				<hr class="footer-hr"/>
			</footer>
			<div class="backtotop"></div>
			<div class="over"></div><!--背景层-->
	</body>
</html>
<%
Recordset1.Close()
Set Recordset1 = Nothing
%>
