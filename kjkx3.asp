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
MM_authFailedURL="kjkx3.html"
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
		<title>除了导航，“北斗”还能干什么</title>
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
				<h1>除了导航，“北斗”还能干什么</h1>
				<center style="margin-top: -50px;">发布日期：2019年11月22日</center>
				<p>11月5日，我国成功发射了第49颗“北斗”导航卫星。很多人可能认为，“北斗”的作用就是导航。其实，“北斗”系统具有实时导航、快速定位、精确授时、位置报告和短报文通信服务五大功能。它不仅已广泛用于交通运输、基础测绘和搜救打捞等领域，还正在金融、通信、电力、工程勘测、精准农业、资源调查、地震监测、公共安全、应急救灾、全球搜救和国防建设等许多方面大显身手。就在刚刚过去的“双11”活动中，北斗也在智慧物流方面发挥着重要作用。</p>
				<p><strong>工程建设的利器</strong></p>
				<p>“北斗”系统可为建筑、挖掘、路基、规划设计、物理勘探、石油钻探和地壳运动监测等许多工程提供高精度定位，因此能大大提高工程建设的生产力，并提升相关活动的精度和效率，比传统测量方法的效率高3倍以上。

</p>
				<p>比如，应用该技术已使道路、桥梁的建设精度达到毫米级，大大提高了隧道、地铁等重要交通基础设施的测量与建设精度，降低了建设成本。“北斗”技术用于公路边坡、桥梁变形监测后，由于不受通视条件的限制，因而选点灵活，能根据监测需要，将监测点布设在对变形体的形变比较敏感的特征点上。</p>
				<p>最简单的例子是：盖高楼时，用“北斗”终端可随时测量楼房歪不歪;在洪灾来临时，用“北斗”终端能及时了解水坝是否移动;在挖山洞或地铁时，用“北斗”终端就不用担心从双向往中间掘进时出现错位了，比单向掘进隧道效率提高50%。</p>
				<p><strong>助力精细农业增产</strong></p>
				<p>导航卫星的精确定位功能可广泛用于农场规划、田间测图、土壤取样、拖拉机引导、作物田间检测和播种速度选择以及肥料、杀虫剂和产量检测系统等。</p>
				<p>它能够提升农药、除草剂和肥料使用的精度，同时更好地控制化学物质的扩散，从而降低成本、扩大产量，创造环境友好型的新农场，使不同地区、不同条件下的作物增产3%-50%，大大降低农业生产的人力、资金(机器和设备)和原材料(种子、肥料、杀虫剂、其他化学药品、燃料、油和电)成本，降低的投入占总成本的1%-50%不等。据估计，卫星导航技术带动的平均增产可以达到10%，平均成本能够降低15%。</p>
				<p>基于“北斗”的农机作业监管平台，已实现农机远程管理与精准作业，服务农机设备超过5万台，精细农业产量提高5%，农机油耗节约10%。</p>
				<p><strong>海洋渔业的帮手</strong></p>
				<p>渔业是“北斗”卫星导航系统应用最早也最为广泛的行业之一。安装了“北斗”用户机，不仅可以为船只导航，还可以通过“北斗”独有的短报文通信技术，报告船只位置和船上人员的情况。我国已经有约10万艘出海渔船安装了“北斗”用户机。</p>
				<p>对渔民来说，“北斗”的短报文功能至少有四大好处。一是与家人联络，满足情感需要。二是与国内市场联络，打了什么鱼，有多少斤，可以提前通知预售，提高收入。三是与周边渔船联络，遇险时及时自救和互救。四是有了准确定位，可以避免打鱼越境的纠纷。</p>
				<p>我国已通过“北斗”先后向渔民发送了数万次热带气旋等危险气象信息警报，救助了多艘渔船、渔民、病人等，累计救助1万余人，有效避免涉外事件多起，挽回经济损失上亿元。</p>
				<p><strong>金融电力的保障</strong></p>
				<p>现在，网络已经成为现代金融业的重要基础。在网络条件下的金融服务体系中，时间的同步是至关重要的，用“北斗”系统提供的精确授时服务可使现代金融体系实现网络时间同步段，保证现代金融系统安全运行，而全国各金融单位的1秒钟误差，就有可能带来巨额的损失。</p>
				<p>电力系统的安全运行也需要在很大的范围内实现较高精度的时间同步，这样可实现整个电网高精度的时间同步，实现同步相位测量、运行稳定性判断、故障定位、高可靠性的电流纵差保护、继电保护等，从而提高电力网络运行的稳定性、可靠性和安全性。</p>
				<p>基于“北斗”卫星导航系统的“北斗电力全网时间同步管理系统”投入使用后，结束了我国电力运行时间完全依赖美国GPS的历史，有效地保障了我国电力安全和国家安全。</p>
				<p><strong>实现防灾救灾实时调度</strong></p>
				<p>在紧急救援上，基于“北斗”系统的导航定位、短报文通信以及位置报告等功能，已实现全国范围的实时救灾指挥调度、应急通信、灾情信息快速上报与共享等服务，极大地提高了灾害应急救援的快速反应能力和决策能力。</p>
				<p>2008年汶川地震时，震区通信中断。救援部队通过“北斗”的短报文功能，让救援部队和指挥部的联系保持顺畅，从而保证了指挥命令及时下达、灾情信息实时上报等整个救灾的指挥调度，在决策、搜救、医疗等工作中发挥了关键作用。</p>
				<p>我国已把“北斗”技术与井下监测技术相结合，实现了对井下瓦斯浓度、风机转停等关键参数的实时监测。我国还将“北斗”引入自动气象站，增强了自动气象站适应性。</p>
				<p>由于“北斗”可实现全国范围的无缝覆盖，具有定位、授时和短报文等功能，所以为森林防火、扑火的指挥调度提供了新的技术，有效解决了火场定位、侦察、引导扑救、后勤保障、损失评估等问题。目前，全国各地森林防火系统已经配备多台套“北斗”用户机，取得了明显的经济和社会效益。</p>
				<p><strong>依托大数据实现智慧物流</strong></p>
				<p>物联网是未来社会的发展方向。“北斗”系统可作为物联网的一个重要组成部分，应用在感知、网络两个层面。这里我们侧重说说“北斗”在智慧物流方面的应用。</p>
				<p>比如，北京近年来逐步在物流车辆上安装“北斗”设备，结合自身的物流大数据，进行了物流智慧管理。通过对车辆速度和路线的实时监控，保障驾驶安全;结合“北斗”卫星导航系统的地理位置数据，进行数据分析和挖掘，定制服务线路，提高物流效率，管控成本，也让信息更透明。</p>
				<p>“互联网+北斗物流”项目，通过手机货源APP终端，能让行进中的空货车找到离自己最近的货源。有了这款APP终端，包裹能更加及时地进行运输，早一天开始运输，就能早一天送达目的地。</p>
				<p>此外，国内电商平台还研制出了“北斗”智能车载终端及人员佩戴式手环设备等北斗产品，并接入物流云平台进行有效运转，能实时掌握和调度车辆、人员位置、状态和载货信息，为客户提供最适合的配送方案，并根据需求变化迅速调整。</p>
				<p><strong>“只受想象力的限制”</strong></p>
				<p>随着卫星导航接收机的集成微小型化，它可以被嵌入到其他的通信、计算机、安全和消费类电子产品中，使其应用领域更加广泛。卫星导航系统与消费类电子产品的融合是目前导航系统在社会中最广泛应用的一种方式，如在MP3、MP4、笔记本电脑、手机和数码相机等电子产品中集成导航功能，提供一种基于位置的服务。</p>
				<p>在今年10月1日天安门广场的国庆盛大阅兵式上，来自32个装备方队的580台车辆，以整齐划一的行进速度，前后左右一致的车距，给人留下了深刻印象。这背后的“秘密武器”就是“北斗阅兵训练考核辅助系统”，它可以保障32个方队整体车速控制在10千米/小时，骑线偏差不超过1厘米，厘米级的定位精度已赶超世界先进水平。同时，该系统也精准助力阅兵训练，使训练高质高效。</p>
				<p>在科学研究上，“北斗”已用于电离层和中性大气反演以及气象学研究，卫星跟踪地球重力场和大气探测，以及航天器或地球卫星精密定轨、导航与对接等科学目的，为科学发展服务。</p>
				<p>在水利上，基于“北斗”卫星导航系统的水文监测系统已建设完成，实现了多山地域水文测报信息的实时传输，大大提高了灾情预报的准确性，为制定防洪抗旱调度方案提供重要的保障。</p>
				<p>在气象观测预报上，一系列气象测报型“北斗”用户设备研制成功，提出了实用可行的系统应用解决方案，解决了国家气象局和各地气象中心气象站的数字报文自动传输和可视化问题……</p>
				<p>“北斗”的用途远不止如今的车辆导航、手机定位、电子地图。由于智能产业与时空信息密切相关，能提供位置和时间信息的卫星导航技术必将被用于智能网络、智能传感、智能交通、智能通信、智能物流、智能社区、智能电网等所有智能产业中，并形成各种前所未有的新型商业模式。</p>
				<p>有关“北斗”应用的例子举不胜举。当它与云计算等新技术结合时，其应用“只受想象力限制”绝不是一句空话。</p>
			</section>
		<div class="backtotop"></div>
	</body>
</html>
