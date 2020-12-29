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
MM_authFailedURL="wz-zx6.html"
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
		<title>无情的辐射冲击，让木卫二的“夜侧面”也能发光</title>
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
							<li class="nav-2-li"><a href="index.html" class="nav-2-a" style="color: #bfbfbf;">首页</a></li>
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
				<h1>无情的辐射冲击，让木卫二的“夜侧面”也能发光</h1>
				<img src="img/6/1/6/1.jpg"/>
				<center><i>上图为木星的卫星木卫二的艺术概念图，显示了在木卫二背向太阳的“夜侧面”，它冰冷的表面也会发光。辉光的变化和辉光本身的颜色可以揭示木卫二表面冰成分的相关信息。<br />
图片来源：NASA / 加州理工-喷气推进实验室</i></center>
				<p>新的实验在实验室中再现了木卫二（Europa）的环境，发现即使在背向太阳的“夜侧面”（nightside），这颗冰冷的卫星也闪耀着光辉，这一景象带给我们的，将远不只是炫酷的视觉效果。</p>
				<p>天寒地冻、海洋遍布的木卫二默默地围绕木星运行，承受着辐射没完没了的无情冲击。木星用电子和其他粒子没日没夜地轰击木卫二表面，让它身处高能辐射的炼狱。然而，在这些粒子对木卫二拳打脚踢的同时，它们可能也导致了一些超乎寻常的现象：让木卫二在黑暗中也发出了光芒。</p>
				<p>美国航空航天局（NASA）位于南加州喷气推进实验室（Jet Propulsion Laboratory）的科学家进行的新研究，首次详细介绍了这一特殊辉光的样子，以及它可能揭示出木卫二表面冰的成分的哪些信息。不同的盐类化合物对辐射的反应不同，会发出自己独特的微光。用裸眼看，这种辉光有时候看起来是绿色的，有时看起来又是蓝色或白色的，并且亮度不同，这取决于它的化学组成。</p>
				<p>科学家用分光计将光分成不同的波长，并将不同的“特征”，也就是光谱对应到冰层的不同成分上。对于像木卫二这样的卫星，用分光计进行的大多数观测都是在卫星白天的时候通过反射的太阳光进行的，但是这些新的结果描绘了木卫二在黑暗中的样子。</p>
				<p>“我们可以预见的是，这种夜侧面的冰冷光辉能为我们提供木卫二表面组成的更多相关信息。木卫二表面组成的变化方式可以给我们带来木卫二是否具有适宜生命存活条件的线索。”喷气推进实验室的穆尔蒂·古迪帕蒂（Murthy Gudipati）说道，他是新研究的主要作者，论文已于9月发表在《自然·天文学》（Nature Astronomy）杂志上。</p>
				<p>这是因为木卫二拥有一片巨大的全球性内部海洋，这片海洋可能会通过木卫二厚厚的冰壳渗透到星球表面。通过对表面进行分析，科学家可以了解更多木卫二表面之下物质的相关信息。</p>
				<h2>发光的“夜侧面”</h2>
				<p>科学家从先前的观测中推断出，木卫二的表面可能是由冰和地球上被称为“盐”的混合物组成的，这里的“盐”指的是像硫酸镁（泻盐）和氯化钠（食盐）这样的化合物。这项新的研究表明，在模拟木卫二的环境条件下，将这些盐掺入水冰中并用辐射对其进行轰炸时，会产生辉光。</p>
				<p>这一现象还不足为奇，我们很容易就能想到受辐射照射的表面会发光，科学家也知道，这种光辉是由高能电子穿透星球表面、激活下方的分子而引起的。当这些分子松弛下来，它们就会将能量以可见光的形式释放掉。</p>
				<p>“但是我们从来没有想到过会看到我们最终看到的东西，”这项研究的共同作者、喷气推进实验室的布里亚纳·亨德森（Bryana Henderson）说道，“当我们尝试用新的成分组成模拟木卫二冰层时，它发出的光辉看起来就不太一样了。我们都盯着它看了一会儿，然后说：’这和之前的不太一样，对吗？这得是另一种光辉吧？’因此，我们用分光计对它进行了测量，每种类型的冰都拥有不同的光谱。”</p>
				<p>为了能在实验室中研究木卫二表面的实体模型，喷气推进实验室团队为木卫二的高能电子和辐射环境测试（High-Energy Electron and Radiation Environment Testing，ICE-HEART）建造了一种被称为“冰室”（Ice Chamber）的独特仪器。他们将ICE-HEART带到位于马里兰州盖瑟斯堡的一处高能电子束工厂，然后开始进行另一项完全不同的研究：观察木卫二冰层下的有机物质对辐射冲击会作何反应。</p>
				<p>他们并没有料到会看到辉光本身的变化与不同的冰层成分具有相关性，正如这项研究的作者所说，它完全出于机缘巧合。</p>
				<p>“我们看到氯化钠盐成分发出的辉光水平非常低，这一瞬间正是我们改换研究思路的转折点。”论文的共同作者弗雷德·贝特曼（Fred Bateman）说道。贝特曼对实验的进行做出了贡献，他还向位于马里兰州美国国家标准与技术研究院（National Institute of Standards and Technology，NIST）的医疗工业辐射设施（Medical Industrial Radiation Facility）的冰层样品送去了辐射光束。</p>
				<p>一颗卫星能在黑暗天空中可见似乎并不是一件反常的事情，在地球上我们就能看到月亮，因为在夜里它也能反射阳光。但科学家表示，木卫二发出的光是由完全不同的机制引起的，想象一下，有一颗卫星能持续不断地发出光辉，即使是在它背对太阳的“夜侧面”，也能发光。</p>
				<p>“如果木卫二不处在这种辐射之下，它看起来就会像我们所看到的月球一样，即背向太阳的一侧是黑暗的，”古迪帕蒂说，“但正是因为它遭受着木星的辐射轰炸，所以它在黑暗中也能发光。”</p>
				<p>NASA即将进行的旗舰飞越任务木卫二快船（Europa Clipper）计划于2020年代中期发射，它将在绕木星轨道运行时多次飞越木卫二观察它的表面。任务科学家正在审查上述研究的发现，评估探测器上的科学仪器是否能够检测到这种辉光。探测器收集到的信息可能会与这项研究中的测量结果进行比较，来确认木卫二表面上的盐成分，或缩小可能含有的化学物质范围。</p>
				<p>“在实验室中你通常不会说，’到了那边我们可能就会发现它。’”古迪帕蒂表示，“通常情况正好相反：去到那边之后，发现一些新东西，然后尝试在实验室中进行解释；而我们的假设又能再通过一种简单的观察来验证，这就是科学的意义所在。”</p>
				<p>类似木卫二快船这样的任务，将有助于天体生物学领域的发展，对于我们认为可能承载着生命的遥远星球，这些任务是对相关变量和条件的一种跨学科研究。虽说木卫二快船不是一次探测地外生命的任务，但它将对木卫二进行详细的侦察，调查这颗冰冷的卫星及其地下海洋是否具有维持生命存在的能力。了解木卫二的可居住性将有助于科学家更好地了解地球生命是如何发展演化的，还能为我们在地球之外寻找生命带来希望。</p>
				<p>想了解木卫二和木卫二快船的更多相关信息，请访问：europa.nasa.gov。</p>
				
				<p><strong>参考来源：</strong></p>
				<p><a href="https://www.nasa.gov/feature/jpl/europa-glows-radiation-does-a-bright-number-on-jupiters-moon" target="_blank">https://www.nasa.gov/feature/jpl/europa-glows-radiation-does-a-bright-number-on-jupiters-moon</a></p>
			</section>
		<div class="backtotop"></div>
	</body>
</html>
