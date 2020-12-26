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
MM_authFailedURL="wz-kp4.html"
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
		<title>关于NASA-SpaceX Demo-2任务宇航员返回地球 需要知道的10件事</title>
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
				<h1>关于NASA-SpaceX Demo-2任务宇航员返回地球 需要知道的10件事</h1>
			<img src="img/6/3/4/1.png"><center><i>2020年8月2日，美国太空探索技术公司（SpaceX）的奋进号载人龙飞船在佛罗里达彭萨科拉海岸附近的墨西哥湾溅落后不久，宇航员罗伯特•本肯(Robert Behnken，左)和道格拉斯•赫尔利（Douglas Hurley）在SpaceX的GO Navigator救援船上出现。NASA商业载人计划的Demo-2测试飞行是第一次将宇航员送入国际空间站，并在一艘商用建造和操作的飞船上安全返回地球。本肯和赫尔利在太空中度过64天后返回了地球。<br/>
图片来源：NASA/比尔•英格尔斯（Bill Ingalls）</i></center>
			<p>2020年8月3日，宇航员赫尔利和本肯成功降落在墨西哥湾。</p>
			<img src="img/6/3/4/2.png" ><center><i>2019年8月13日，NASA宇航员赫尔利（左）和本肯在佛罗里达州卡纳维拉尔角的三叉戟盆地，进行SpaceX载人龙飞船的机组人员撤离演练。<br/>
图片来源：NASA /比尔•英格尔斯</i></center>
<img src="img/6/3/4/3.jpg" ><center><i>2019年3月8日，SpaceX载人龙飞船从国际空间站返回后，在4个降落伞的引导下溅落在大西洋上。<br/>
图片来源：NASA /科里•休斯顿（Cory Huston）</i></center>
			<p>2020年5月30日，NASA宇航员罗伯特•本肯（Robert Behnken）和道格拉斯•赫尔利（Douglas Hurley）乘坐由美国私营企业建造和运营的美国载人飞船从美国本土发射升空，前往国际空间站，实现了人类历史上首次商业载人飞行。5月31日，SpaceX的“猎鹰9号”火箭搭载龙飞船（后取名为“奋进号”，Endeavour）从位于佛罗里达州肯尼迪航天中心的39A发射台发射升空，与国际空间站对接。8月2日，两名宇航员乘坐载人龙飞船，从国际空间站分离并返回地球。经过约19小时的飞行，于8月3日成功降落在墨西哥湾，结束了对SpaceX载人航天系统的测试任务。</p>
			<p><strong>1. 载人龙飞船的备选溅落点是哪些？</strong></p>
			<p>NASA和SpaceX能够为载人龙飞船在佛罗里达洲沿海的7个降落点提供支持，以帮助载人龙飞船返回。作为NASA商业载人计划的一部分，从国际空间站返回的NASA宇航员本肯和赫尔利一起进行载人龙飞船试航。载人龙飞船的7个备选溅落点分别位于彭萨科拉（Pensacola）、坦帕（Tampa）、塔拉哈西（Tallahassee）、巴拿马城（Panama City,）、卡纳维拉尔角（Cape Canaveral）、代托纳（Daytona）和杰克逊维尔（Jacksonville）。</p>
			<p><strong>2. 如何选择溅落位置?</strong></p>
			<p>溅落地点的选择依据明确的优先级，首先，在与空间站分离的日期和时间的选择上，要使不同地理位置的溅落点有最大的返回几率，同时也要考虑天气因素。任务团队还会根据轨道力学，对分离和溅落之间耗费时间最短的地点进行优先排序，并纳入在白天溅落的几率这一因素。</p>
			<p>具体信息请查阅《分离和溅落条件情况说明书》（Departure and Splashdown Criteria Fact Sheet），以深入了解如何选择返航溅落点，回程途中的决策点，以及详细的天气条件。</p>
			<p><strong>3. 本肯和赫尔利需要多长时间返回地球？</strong></p>
			<p>本肯和赫尔利的返回时间会根据所选的分离和溅落机会而有所不同，大概需要6到30个小时。</p>
			<p><strong>4. 返回过程是什么样的？主要节点有哪些？</strong></p>
			<img src="img/6/3/4/4.jpg" ><center><i>2019年3月8日，SpaceX载人龙飞船在从国际空间站执行Demo-1任务返回后，溅落佛罗里达州东海岸约200英里处海面，被Go Searcher救援船回收。（本次测试为无载人测试。）<br/>
图片来源：SpaceX</i></center>
			<p>载人龙飞船的返航将从与国际空间站分离开始。在分离时，奋进号载人龙飞船和非密封舱总重约12.5吨（27,600磅）。NASA 会对返回过程进行全程直播。</p>
			<p>将载人龙飞船固定在空间站上的挂钩松开后，两个非常小的引擎随即点火，以使飞船与空间站分离。分离后，奋进号龙飞船会自主执行四次分离点火，返回地球。几个小时后，一个分离阶段开启，引擎点火，持续大约6分钟，通过燃烧产生反推力助飞船进入一个低轨道，使其与溅落区对齐。</p>
			<p>在最后一次脱轨燃烧前不久，龙飞船与非密封舱分离（该舱体将在大气层中燃烧殆尽），以减轻重量。之后，脱轨燃烧开启，将飞船安置在合适的轨道上为溅落做准备。在舱体分离和脱轨燃烧完成后，龙飞船太空舱重约9.62吨（2.12万磅）。</p>
			<p><strong>5.龙飞船重返地球大气层的速度有多快？温度又有多高？</strong></p>
			<p>龙飞船在重返地球大气层前将以轨道速度飞行，速度约为每小时28164千米（每小时17,500英里）。它重返地球大气层的最高温度约为1927摄氏度（3500华氏度）。重返大气层还会造成飞船和地球之间的通信中断，持续大约6分钟。</p>
			<p><strong>6.降落伞何时展开？</strong></p>
			<p>奋进号龙飞船有两套降落伞，一旦返回地球大气层就会展开，以在溅落前减缓速度。两个锥管降落伞在约5.49千米（18,000英尺）的高空展开，届时飞船的速度约为每小时563千米（每小时350英里）。四个主降落伞在约1.83千米（6000英尺）的高空展开，届时飞船的速度约为每小时191千米（每小时119英里）。</p>
			<p><strong>7.由谁来打捞机组人员及龙飞船？涉及哪些工具和人员？</strong></p>
			<p>不论最终选择7个溅落点中的哪一个，SpaceX的工作人员都会提前到达备选溅落点，做好打捞准备。两艘救援船“搜寻者”(Go Searcher)和“领航员”(Go Navigator)分别停在墨西哥湾和佛罗里达州大西洋海域。这两艘船上都有40多名来自SpaceX和NASA的工作人员，包括飞船工程师、训练有素的水中打捞专家、医疗专业人员、船员、NASA货运专家以及其他协助回收工作的人员。</p>
			<img src="img/6/3/4/5.jpg" ><center><i>2019年8月13日，NASA宇航员赫尔利与NASA和SpaceX的团队在佛罗里达州卡纳维拉尔角的三叉戟盆地排练从SpaceX龙飞船的乘员舱中撤离机组人员。<br />
图片来源：NASA/Bill Ingalls</i></center>
			<p><strong>8. 从龙飞船溅落到赫尔利和本肯从乘员舱出来，需要多长时间？</strong></p>
			<p>溅落发生后，主救援船会立即派出搭载SpaceX人员的两艘快艇。第一艘快艇检查太空舱的完整性，并测试龙飞船周围区域是否存在任何自燃推进剂蒸气。一旦检查结束确认没有问题，快艇上的工作人员就开始为飞船回收做准备。第二艘快艇负责安全回收龙飞船的降落伞，届时，降落伞已经从太空舱脱离并落入水中。</p>
			<p>这个时候，主救援船船可以驶来并将龙飞船乘员舱吊到主甲板上，并放置在稳定的位置以便打开舱门，等待医务人员进行初步检查，以及协助两位宇航员出舱。</p>
			<p>整个过程预计需要大约45到60分钟，具体时间取决于飞船状况和海况。</p>
			<p><strong>9. 本肯和赫尔利出舱后去哪里？</strong></p>
			<p>离开龙飞船乘员舱后，两名宇航员立即被送往救援船船上的医疗区进行初步评估。这类似于联盟号降落在哈萨克斯坦后，迎接长期飞行的宇航员返回地球的程序。</p>
			<p>经过初步医疗检查，本肯和赫尔利将被送回岸上（要么乘坐主救援船，要么乘坐直升机）。除卡纳维拉尔角溅落点外，直升飞机从主回收船飞到岸上需要约10至80分钟。溅落点到海岸的距离从大约41千米到324千米不等。</p>
			<p>一旦两名宇航员回到岸上，将立即登上已提前等候的NASA飞机，飞回休斯顿的艾灵顿机场。</p>
			<p><strong>10.接下来有何计划？</strong></p>
			<p>与此同时，载人龙飞船将被送回佛罗里达州的SpaceX分部进行检查和处理。任务团队会检查飞船在整个测试飞行过程中的数据和性能，以完成NASA商业载人计划与国际空间站项目飞行操作任务的系统认证。认证过程预计需要大约六周时间。成功认证后，来自NASA的载人龙飞船指挥官迈克尔•霍普金斯（Michael Hopkins）、飞行员维克多•格洛弗（Victor Glover）和任务专家香农•沃克（Shannon Walker），以及来自日本宇宙航空研究开发机构（JAXA）的任务专家野口宗一（Soichi Noguchi），将执行首次操作任务，即Crew-1任务。该任务将于佛罗里达州肯尼迪航天中心的9A发射场发射。以上4名宇航员将在空间站度过六个月时间。</p>
			<p>该任务预计将于今年9月底之后发射。</p>
			</section>
		<div class="backtotop"></div>
	</body>
</html>
