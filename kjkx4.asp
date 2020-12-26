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
MM_authFailedURL="kjkx4.html"
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
		<title>25年持续蓄力，北斗向全球组网发起全面冲刺</title>
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
			</header>
			<section class="wz-section">
				<h1>25年持续蓄力，北斗向全球组网发起全面冲刺</h1>
				<center style="margin-top: -50px;">发布日期：2019年09月24日</center>
				<p>2019年9月23日5时10分，我国在西昌卫星发射中心以“一箭双星”方式，成功发射第47、48颗北斗导航卫星。</p>
				<p>这次发射正式拉开了北斗三号从基本系统向完整系统大步迈进的高密度发射序幕。</p>
				<p>自1994年我国启动北斗一号系统工程建设，中国北斗砥砺前行，按照“三步走”发展战略，闯出了一条适合中国国情的创新发展道路。</p>
				<p>如今，北斗已成为全球卫星导航系统中不可忽视的重要力量。面向全球组网，北斗已发起全面冲刺。未来，中国北斗将与其他卫星导航系统并肩，提供精度更高、运行更稳定、功能更可靠的定位、导航和授时服务，成为面向全世界的重大公共服务空间基础设施，为构建人类命运共同体作出“中国贡献”。</p>
				<p><strong>“关门”前抢入“导航俱乐部”</strong></p>
				<p>1990年的海湾战争中，装载GPS的精确打击武器首次大规模使用，作战效能令全球震惊。</p>
				<p>如果说导弹是枪，原子弹是弹，卫星导航就是精确瞄准镜。早在20世纪70年代，中国航天人就启动过“灯塔一号”工程进行探索，但因经济和技术方面难以支撑，工程被迫下马。</p>
				<p>但中国人建设卫星导航系统的决心没有动摇。经过不断探索，我国逐渐形成了从建设北斗一号试验系统，到北斗二号区域导航系统，再到北斗三号全球系统的“三步走”战略。</p>
				<p>2000年，我国发射2颗地球静止轨道北斗卫星，创造性地实现了双星有源定位，同时能提供授时和短报文通信服务。该方案利用我国现有成熟技术，以最小投入、最短周期，实现了卫星导航系统建设的自主可控。</p>
				<p>北斗一号工程启动时，美国GPS、俄罗斯格洛纳斯已分别发射了20多颗导航卫星，占用了最适合卫星导航的黄金频段。中国与正在建设伽利略系统的欧盟，推动国际电联从航空导航频段中挤出一小段以供使用。2000年4月18日，北斗和伽利略系统同时申报。按照国际电联规则，必须在7年内发射导航卫星，并成功发射和接收相应频率信号，才能获得该轨道位置和频率资源，否则不能取得合法地位。</p>
				<p>2005年，欧盟发射了首颗伽利略导航卫星。此时我国虽已发射3颗北斗试验卫星，但其不具备主动发射下行信号的能力。符合国际电联规则的北斗二号卫星仍在研制，时间紧迫。</p>
				<p>北斗人背水一战，倒排工期，将研制周期大大缩短。同时，西昌卫星发射中心也攻克了首次使用新改建发射工位、首次使用远控模式、首次发射中圆轨道卫星等多项挑战，针对此次任务分析风险、制定措施、把控节点，扎实做好了各项准备。</p>
				<p>2007年4月14日4时11分，这颗肩负着重要使命的北斗卫星起飞，于4月17日20时许传回了信号。此时。距离国际电联的“七年之限”只剩不到4个小时。</p>
				<p><strong>首创混合导航星座</strong></p>
				<p>GPS等卫星导航系统均采取单一轨道星座构型，全部组网卫星都运行在2万公里高度的中圆轨道。</p>
				<p>但北斗系统不可能像GPS那样，在全球建立地面测控站。北斗二号工程卫星系统总设计师杨慧说，受国土布站局限，北斗必须造出能在国土范围内管辖的星座，为此必须采取高、中轨卫星混合的组网方式。但这面临一系列世界性难题。</p>
				<p>经过不懈努力，北斗团队解决了高轨导航卫星姿态控制、高精度温控等难题，提升了系统服务的精度、连续性和可用性。2012年底，由14颗卫星构成的北斗二号区域卫星导航系统建成，实现了全天时全天候为亚太大部分地区提供定位导航授时服务。</p>
				<p>“北斗二号在国际上首创同步轨道导航卫星，同时首创了以地球同步轨道卫星、倾斜地球同步轨道卫星为骨干，兼有中轨道卫星的混合导航星座。”该工程原副总设计师、北斗系统高级顾问李祖洪说，对于区域导航系统而言，这种组合可以用最少的卫星数量实现最好的覆盖效果，已获得了国际上的认可。</p>
				<p>在北斗二号工程建设的同时，我国于2009年启动了北斗三号全球系统的建设。</p>
				<p>行波管放大器是通信卫星的关键元器件，曾长期依赖进口。2014年，我国正在进行北斗三号试验卫星研制时，外方突然通知，由于政府原因停止供货。</p>
				<p>不过，北斗团队早已认识到国产化对于北斗系统建设和稳定运行的重要性。在北斗三号系统建设启动的同时，中国航天科技集团五院就联合国内多家单位，开展了行波管放大器等关键元器件国产化的技术攻关。</p>
				<p>外方得知我国行波管放大器技术攻关已经取得了突破，北斗团队决定用国货替代进口产品后，急忙表示可以供货，并把价格降低了一半。这让北斗团队尝到了核心在握的甜头，更加坚定了走国产化道路的决心。</p>
				<p>经过数年努力，长期依靠进口的行波管放大器组件、微波开关、大功率电源控制器、动量轮组件、星敏感器等关键产品，已实现主、备份全部国产化。北斗三号卫星部件国产化率达到100%。</p>
				<p><strong>中国北斗向世界敞开胸怀</strong></p>
				<p>2017年2月28日，我国首个自主研制的“米级快速定位北斗芯片”正式推出，实现了基础产品的自主可控并达到国际先进水平。</p>
				<p>“全世界绝大部分的智能手机都已经采用了支持北斗的芯片。”中国卫星导航系统管理办公室主任冉承其在国新办2018年12月27日举行的发布会上透露，北斗系统已进入3GPP国际移动通信组织。</p>
				<p>除了“北斗芯”，中国北斗还形成了由基础产品、应用终端、应用系统和运营服务构成的完整产业链。北斗已在国家关键行业和重点领域标配化使用，在大众消费领域规模化应用。</p>
				<p>据统计，2018年国内卫星导航产业产值已超过3000亿元;预计至2020年，我国卫星导航产业的规模将超过4000亿元，北斗将拉动超过3000亿元规模的市场份额。</p>
				<p>截至2019年4月，国内超过620万辆营运车辆、3万辆邮政和快递车辆，36个城市的约8万辆公交车、3200余座内河导航设施、2900余座海上导航设施已应用北斗系统，服务农机设备超过5万台，推广北斗终端超过4.5万台……</p>
				<p>随着与互联网+、5G、人工智能以及共享经济等新兴技术和产业模式的融合应用，卫星导航技术还催生了精细农业、精准物流、自动驾驶、智能交通、智慧城市等经济发展新模式和产业发展新业态，其正以前所未有的深度和广度融入社会的方方面面。</p>
				<p>当今世界，GPS、北斗、格洛纳斯、伽利略四大卫星导航系统争奇斗艳。如何看待与其他导航系统的关系?北斗系统自建设之初就给出了答案：始终践行 “中国的北斗，世界的北斗”理念，要与其他卫星导航系统相互兼容、共同发展，造福全球“一家人”。</p>
				<p>如今，中国北斗已敞开胸怀，等待世界的接纳。</p>
			</section>
		<div class="backtotop"></div>
	</body>
</html>
