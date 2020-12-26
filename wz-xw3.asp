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
MM_authFailedURL="wz-xw3.html"
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
		<title>NASA的OSIRIS-REx太空船成功降落小行星</title>
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
				<h1>NASA的OSIRIS-REx太空船成功降落小行星</h1>
				<img src="img/6/2/3/1.png"><center><i>NASA的OSIRIS-REx任务已经做好了接触小行星本努表面的准备。<br/>
影像来源：美国国家航空航天局/戈达德/亚利桑那大学</i></center>
				<p>NASA的源光谱释义资源安全风化层辨认探测器(OSIRIS-REx)周二展开了它的机械手臂，这是该机构首次短暂接触一颗小行星，收集小行星表面的尘埃和鹅卵石，并于2023年将其送往地球。</p>
				<p>这颗保存完好的古老小行星，名为贝努，目前距离地球超过2亿英里（3.21亿公里）。贝努为科学家们打开了一扇窗口，了解数十亿年前太阳系最初形成时的情况，并为地球提供了可能帮助孕育生命的成分。如果周二的样本采集活动，也就是所谓的“触碰即走”（TAG）提供了足够的样本，能够提供足够的样本，任务团队将命令航天器开始存放珍贵的原始货物，并于2021年3月开始返回地球的旅程。否则，他们将为明年1月的另一次尝试做准备。</p>
				<p>“对于NASA来说，这是一个令人惊叹的第一次，它展示了一个来自全国各地的团队是如何团结在一起，坚持不懈地面对各种难以置信的挑战，以扩大知识的范围。”NASA局长吉姆·布里登斯汀说，“我们的工业、学术和国际合作伙伴使我们有可能掌握最古老的太阳系的一部分。”</p>
				<p>美国东部时间下午1点50分，OSIRIS-REx点燃了推进器，将自己推离了围绕本努的轨道。它伸展其11英尺(3.35米)取样臂的肩部、肘部、手腕，即所谓的触碰式取样装置(TAGSAM)，在向小行星表面下降约半英里(805米)的过程中穿过贝努。在大约410英尺(125米)的高度下降了4个小时后，飞船执行了“检查点燃烧”，这是两次飞行中的第一次，目的是让它精确地瞄准被称为夜莺的样本采集地点。</p>
				<p>10分钟后，飞船启动推进器，开始了第二次“检查点燃烧”，以减缓下降速度，并与小行星接触时的旋转速度相匹配。然后，飞机继续飞行11分钟，经过了一个绰号为“末日火山”的两层楼高的巨石，最后降落在贝努北半球一个火山口的一个清晰的地方。南丁格尔遗址的面积只有一个小停车场那么大，是这块意外被巨石覆盖的太空岩石上为数不多的几个相对清晰的地点之一。</p>
				<p>“这是一项令人难以置信的壮举——今天我们在科学和工程上都取得了进步，也为未来研究这些太阳系神秘的古代说书人的任务带来了前景，”美国宇航局科学任务理事会副局长托马斯·祖布臣说。该机构位于华盛顿总部。“一块原始的岩石见证了我们太阳系的整个历史，现在它可能已经准备好了，为几代人的科学发现回家做准备，我们迫不及待地想知道接下来会发生什么。”</p>
				<p>“这真是令人难以置信的壮举-今天，我们已经提高了科学和工程技术的水平，也提高了未来研究太阳系这些神秘的古老故事的任务的前景，”位于华盛顿的美国宇航局科学任务局副局长托马斯·祖布兴（Thomas Zurbuchen）说，“见证了我们太阳系整个历史的一块原始岩石现在可能已经准备好为几代人的科学发现带回家，我们迫不及待地想知道接下来会发生什么。”</p>
				<p>“经过十多年的计划，研究小组对今天的成功取样感到非常高兴，”图森市亚利桑那大学欧西里斯-雷克斯首席研究员但丁·洛雷塔说。“但成功的接触，TAGSAM燃气点火以及从贝努撤退都是团队取得的重大成就。我期待着分析数据以确定所收集样品的数量。”。”</p>
				<p>所有航天器遥测数据表明标签事件按预期执行。然而，OSIRIS-REx小组将需要大约一个星期的时间来确认飞船收集了多少样本。</p>
				<p>实时数据显示，TAGSAM成功地与小行星表面接触并发射了一束氮气。这些气体应该搅动了贝努火山表面的尘埃和鹅卵石，其中一些应该已经被TAGSAM的样本采集头捕获。OSIRIS-REx的工程师还证实，在飞船与小行星表面接触后不久，它就启动了推进器，并安全离开了贝努。</p>
				<p>“今天的TAG行动具有历史意义，”位于华盛顿的NASA总部行星科学部主任洛里·格拉斯（Lori Glaze）说。“除了这项任务已经实现的所有其他里程碑之外，我们安全，成功地接触了贝努的表面这一事实证明了继续探索太阳系秘密的探索精神。”</p>
				<img src="img/6/2/3/2.gif"><center><i>这一系列图片拍摄于2020年8月11日，在OSIRIS-REx任务的样本收集活动的第二次预演中，显示了NASA航天器接近小行星贝努表面时，SamCam成像仪的视野。预演使飞船完成了采样序列的前三次行动，到达地面上方约131英尺（40米）的地方，之后航天器进行了一次向后点火。<br/>
影像来源：NASA/Goddard/University of Arizona</i></center>
				<p>“很难用语言来表达这一消息的激动之情，因为飞船成功地接触了火星表面并发射了其中一个气瓶。”位于马里兰州格林贝尔特的美国宇航局戈达德航天中心的OSIRIS-REx副项目经理迈克尔·莫罗（Michael Moreau）说。“团队迫不及待想从今晚深夜收到TAG事件的图像，并查看贝努的表面对TAG事件的响应。”</p>
				<p>该航天器按照地球工程师的预编程指令自主执行TAG。现在，OSIRIS-REx团队将开始评估航天器是否捕获了任何物质，如果捕获了，则捕获了多少物质。目标至少为60克，大致相当于一个标准尺寸的糖块。</p>
				<p>OSIRIS-REx的工程师和科学家将使用多种技术来远程识别和测量样品。首先，他们将比较TAG之前和之后夜莺站点的图像，以了解有多少地面物质随气体爆炸而移动。</p>
				<p>“10月21日，当我们下载从飞船上传回的录像时，就会第一次显示我们是否成功采集到了样本。”莫罗（Moreau）表示，“如果TAG严重干扰了表面，我们可能会收集很多样本。”</p>
				<p>接下来，团队将尝试确定收集的样本量。其中一种方法是用一种名为SamCam的相机拍摄TAGSAM头的照片，这种相机专门记录采样过程，并确定尘土和岩石是否进入了收集头。一个间接的指示是样品收集头周围发现的灰尘量。OSIRIS-REx的工程师们还将尝试拍摄照片，在合适的光照条件下，展示收集头内部，以便工程师们寻找其内部样本的证据。</p>
				<img src="img/6/2/3/3.png" ><center><i>这些图像显示了OSIRIS-REx触碰式取样装置（TAGSAM）采样头，该采样头从TAGSAM臂末端的航天器伸出。2018年11月14日，航天器上的SamCam相机捕捉到这些图像，这是对TAGSAM系统进行视觉检测的一部分。TAGSAM系统由洛克希德·马丁公司开发，用于在低重力环境下获取小行星物质样本。这次成像是样本采集后将在本努进行的一系列观测的预演。<br/>
影像来源：NASA/Goddard/University of Arizona</i></center>
				<p>在分析SamCam图像后的几天，航天器将尝试通过确定航天器惯性矩的变化来尝试另一种方法来测量收集的样品的质量，惯性矩惯性矩描述质量是如何分布，以及它是如何影响物体绕中心轴旋转。此操作需要将TAGSAM臂向外延伸到航天器的侧面，并围绕垂直于该臂的轴缓慢旋转航天器。此技术类似于一个人在伸直手臂的同时握住一根绳子（一端附有球）时旋转的状态。人可以通过弦中的张力来感知球的质量。在TAG之前和现在进行此操作之后，工程师可以测量由于内部样品而导致的采集头质量变化。</p>
				<p>“我们将结合TAG数据和TAG后图像以及质量测量结果，来评估我们对至少收集了60克样品的信心。”戈达OSIRIS-REx项目经理里奇·伯恩斯说，“如果我们有信心，我们将决定在10月30日存放样品。”</p>
				<p>为了存储样本，工程师将命令机械臂将样本收集头放入位于飞船主体中的样本返回舱（SRC）中。然后，样品臂将最后一次缩回到航天器侧面，SRC将关闭，航天器将为2021年3月从贝努出发做准备-这是贝努下一次与地球对齐最省油的返航飞行。</p>
				<p>但是，如果发现航天器在夜莺采样点没有收集到足够的样本，它将在2021年1月12日尝试进行另一次TAG行动。如果发生这种情况，它将在名为鱼鹰的备用地点着陆。这是贝努赤道附近的陨石坑内的另一个相对没有巨石的区域。</p>
				<p>OSIRIS-REx于2016年9月8日从卡纳维拉尔角空军基地发射升空。它于2018年12月3日抵达贝努，并于2018年12月31日首次开始绕小行星运行。该航天器计划返回到达地球的时间是2023年9月24日，届时它将把SRC降落到犹他州的西部沙漠，科学家将在那里等待收集它。</p>
				<p>戈达德为OSIRIS-REx提供总体任务管理，系统工程以及安全和任务保证。图森市亚利桑那大学的但丁·劳雷塔（Dante Lauretta）是首席研究员，亚利桑那大学还领导科学团队以及该特派团的科学观测计划和数据处理。丹佛的洛克希德·马丁航天公司制造了该航天器，并正在提供飞行操作。戈达德和KinetX航空航天公司负责OSIRIS-REx航天器的导航。OSIRIS-REx是NASA新边界计划的第三项任务，该计划由位于阿拉巴马州汉茨维尔的NASA马歇尔太空飞行中心管理，由该机构的华盛顿科学任务局负责。</p>
				<p>有关OSIRIS-REx的更多信息，请访问：</p>
				<p><center><a href="https://www.nasa.gov/osiris-rex" target="_blank" style="font-size: 20px;">https://www.nasa.gov/osiris-rex</a></center></p>
				<span style="font-size: 20px;text-align: center;display: block;">和</span>
				<p><center><a href="https://www.asteroidmission.org" target="_blank" style="font-size: 20px;">https://www.asteroidmission.org</a></center></p>
				<p><strong>参考来源：</strong></p>
				<p><a href="https://www.nasa.gov/press-release/nasa-s-osiris-rex-spacecraft-successfully-touches-asteroid" target="_blank">https://www.nasa.gov/press-release/nasa-s-osiris-rex-spacecraft-successfully-touches-asteroid</a></p>
			</section>
		<div class="backtotop"></div>
	</body>
</html>
