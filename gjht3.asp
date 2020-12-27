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
MM_authFailedURL="gjht3.html"
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
		<title>德国计划重返航天角力场</title>
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
				<h1>德国计划重返航天角力场</h1>
				<center style="margin-top: -50px;">发布日期：2020年10月22日</center>
				<p>近日，《美国国防新闻周刊》报道称，为确保国家安全和自主，德国工业联合会(BDI)希望在北海建造一座可发射小型航天器的航天发射场，以实现发射重量不超过1吨的小型卫星的目标。</p>
				<p>早在9月初，德国政府已开始考虑德国工业联合会的提案，即是否要在大西洋东北部的边缘海开发一个用于发射小型卫星的海上发射平台。该平台将通过公私合营的形式，由德国政府率先对其投资约3000万欧元(约3500万美元)，有望在后续逐渐实现商业化盈利。平台选址尚未敲定，但已确定设立于德国境内。</p>
				<p>《国际航空》资深主编王亚林表示，该消息的爆出不符合以往德国在欧洲航天领域甘做“配角”的形象，展现了德国航天工业发展的战略雄心。长期以来，德国一直缺乏自己的航天发射场，欧洲航天的主力重镇集中在法国、英国等国家。</p>
				<p>纵观历史，1945年，美、英、苏三大国对德进行管制。其主要政治原则是非军国主义化、民主化和肃清纳粹主义，主要经济原则为禁止军事生产、经济分散化等。实施这些措施是为了根除纳粹制度、以防德在未来再次发动侵略战争，阻止极权政治的再次出现，却也同时严重阻碍了德军事工业和国防实力的壮大。</p>
				<p>此外，国内反对声也不绝于耳。20世纪80年代，德国总理施密特奉行倾向国防的政策，计划让美国和北约在西欧部署中程导弹，遭到国内强烈反对，党内左派人士呼吁与莫斯科进行军备控制谈判而非军备竞赛，并最终迫使总理辞职。</p>
				<p>顺应太空商业化热潮</p>
				<p>据国防科技信息网报道，德国军方正式成立了首个空天行动中心，寻求通过卫星等手段保障国家安全。该中心位于德国乌德姆市，现有雇员50人，到2031年预计将增加到150人。该机构将重点监视太空垃圾对卫星或地面人员的潜在威胁，保护卫星免受干扰和攻击，并探测导弹威胁。德国国防部长称，该中心是规划和实施太空行动的第一步。德国已于2013年在乌德姆市建立了德国太空态势感知中心。</p>
				<p>与美国、俄罗斯等国不同，德国没有军事太空计划，是欧洲航天局的成员国，强调太空的民用用途。</p>
				<p>王亚林在接受采访时称，德方这一战略适应了以埃隆·马斯克为代表的全球新兴太空商业化浪潮。从投入产出比来衡量，航天工业一直以来在世界各国由国家力量自负盈亏，但仍具备巨大的商业潜力。</p>
				<p>早在2016年，美就出台小行星采矿相关法律法规，允许个人及私营企业探索太空矿产。美政府同时出台了一系列支持商业航天发展的配套计划，包括空间行动协议、商业载人航天与货物运输计划、商业轨道运输服务、商业补给服务、商业载人航天方案和商业载人一体化能力计划等。</p>
				<p>王亚林分析称，“目前世界航天商业化的形势良好。埃隆·马斯克做了一个很好的表率，证明了商业化航天可以实现盈利，同时能大幅降低航天工业发展成本。德国兴建航天发射场的背后力量就有三家商业航天创业企业，或许能为人类航天事业发展提供新的样本。”</p>
				<p>面临内外制约因素</p>
				<p>BDI提案称建设德国发射平台具有技术可行性以及战略和经济意义，然而有德国媒体表示，提案或将导致德国与欧洲合作伙伴的政治摩擦，因为欧盟、挪威和瑞典等合作伙伴有着类似的发展意图。</p>
				<p>中国人民大学国际关系学院教授、国际事务研究所所长王义桅在接受本报采访时表示，这一提案提出的背景有三方面。</p>
				<p>其一，德国总理默克尔早年提出“欧洲的命运要掌握在自己的手里”，面对美国霸权下对德的多层管制，德国越来越强调本国的战略自主、技术主权与数字主权。</p>
				<p>其二，当今世界技术发展已进入万物互联时代，德国在面对美国的技术挟持、中国的成就激励和俄罗斯的强势挤压下，迫切需求寻找本国的战略制高点。</p>
				<p>其三，德国已日渐走出战败国的阴影，开始主动在军事合作与敏感领域提出大胆倡议。</p>
				<p>王义桅表示，德国国内始终有跨大西洋派与欧洲派、本土派与民粹主义浪潮之间的政治话语争夺。德国长期依赖于美国保护，在金融、工业产业政策、基础设施建设领域仍然与世界强国存在一定差距。内部的政治争辩与外部拉拢、收买都是制约德国航天工业发展的重要因素。</p>
			</section>
		<div class="backtotop"></div>
	</body>
</html>
