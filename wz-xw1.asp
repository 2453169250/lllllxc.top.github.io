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
MM_authFailedURL="wz-xw1.html"
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
		<title>NASA将召开火星样本返回任务媒体电话会议</title>
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
				<h1>NASA将召开火星样本返回任务媒体电话会议</h1>
				<img src="img/6/2/1/1.jpg"/>
				<center><i>Credits: NASA/JPL-Caltech</i></center>
				<p>美国宇航局将在11月10日美国东部时间周二上午11点召开媒体电话会议，讨论由该机构委托的独立委员会就NASA与欧洲航天局(ESA)火星样本返回任务计划的报告中的发现和建议。</p>
				<p>美国宇航局成立了火星样本返回(MSR)独立审查委员会(IRB)，以评估该机构与欧洲航天局建立国际合作伙伴关系以从另一颗行星返回第一批样本的早期构想。这份报告将于11月10日星期二上午9点在该机构的报告和文字记录网页上发布，其中包括MSR IRB的发现和建议以及NASA的回应。</p>
				<p>在电话会议上，NASA的科学领导和MSR IRB的成员将讨论IRB的发现和对该机构MSR架构的建议，以及NASA接下来要做的，从火星收集原始样本并返回地球的宏伟计划。</p>
				<p>电话会议音频将在以下位置直播：</p>
				<p><a href="http://www.nasa.gov/live">http://www.nasa.gov/live</a></p>
				<p>会议的参与者包括:</p>
				<p>托马斯·祖布臣（Thomas Zurbuchen），NASA总部科学任务理事会副局长</p>
				<p>杰弗里·格拉姆林（Jeffrey Gramling），NASA总部火星样本返回项目主任</p>
				<p>大卫·汤普森（David Thompson），MSR IRB主席，轨道ATK公司退休总裁</p>
				<p>玛丽亚·祖伯（Maria Zuber）, MSR IRB成员，常务审查委员会主席，麻省理工学院研究副院长</p>
				<p>彼得·泰辛格（Peter Theisinger），MSR IRB成员，NASA喷气推进实验室员工</p>
				<p>有关拨入信息，媒体必须在11月10日星期二上午10:30之前将其姓名、工作单位和电话号码发送给Alana Johnson: alana.r.j son@nasa.gov。</p>
				<p>将火星样本返回地球是几代行星科学家的一个目标，美国宇航局已经采取了一种有系统的方法来为这一努力奠定基础。返回火星样本是很重要的，因为在地球上，研究人员可以利用地球科学实验室的全部能力来调查样本，包括许多太大、太复杂而无法送到火星的仪器，以及尚未发明的技术。研究人员继续研究50多年前阿波罗计划返回的月球样本，而这颗红色星球的样本有望在未来几十年为科学理解和发现提供更大的帮助。</p>
				<p>欲了解更多美国宇航局在火星上的活动，请访问:</p>
				<p><a href="http://www.nasa.gov/mars">http://www.nasa.gov/mars</a></p>
				<video src="img/6/2/1/2.mp4" controls="controls" width="100%" height="100%"></video>
				<center><i>我们可以通过这部短片简单了解下火星样品返回任务<br/>
Credit：ESA</i></center>
				<p><strong>参考：</strong></p>
				<p><a href="https://www.nasa.gov/press-release/nasa-invites-media-to-briefing-on-mars-sample-return-independent-review-board-report" target="_blank">https://www.nasa.gov/press-release/nasa-invites-media-to-briefing-on-mars-sample-return-independent-review-board-report</a></p>
			</section>
		<div class="backtotop"></div>
	</body>
</html>
