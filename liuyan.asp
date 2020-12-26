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
Dim MM_editAction
MM_editAction = CStr(Request.ServerVariables("SCRIPT_NAME"))
If (Request.QueryString <> "") Then
  MM_editAction = MM_editAction & "?" & Server.HTMLEncode(Request.QueryString)
End If

' boolean to abort record edit
Dim MM_abortEdit
MM_abortEdit = false
%>
<%
If (CStr(Request("MM_insert")) = "form1") Then
  If (Not MM_abortEdit) Then
    ' execute the insert
    Dim MM_editCmd

    Set MM_editCmd = Server.CreateObject ("ADODB.Command")
    MM_editCmd.ActiveConnection = MM_lianjie_STRING
    MM_editCmd.CommandText = "INSERT INTO [留言表] ([用户名/账号], [留言]) VALUES (?, ?)" 
    MM_editCmd.Prepared = true
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param1", 201, 1, 255, Request.Form("Element3")) ' adLongVarChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param2", 201, 1, 536870910, Request.Form("Element")) ' adLongVarChar
    MM_editCmd.Execute
    MM_editCmd.ActiveConnection.Close

    ' append the query string to the redirect URL
    Dim MM_editRedirectUrl
    MM_editRedirectUrl = "liuyan.asp"
    If (Request.QueryString <> "") Then
      If (InStr(1, MM_editRedirectUrl, "?", vbTextCompare) = 0) Then
        MM_editRedirectUrl = MM_editRedirectUrl & "?" & Request.QueryString
      Else
        MM_editRedirectUrl = MM_editRedirectUrl & "&" & Request.QueryString
      End If
    End If
    Response.Redirect(MM_editRedirectUrl)
  End If
End If
%>
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
Recordset1_cmd.CommandText = "SELECT * FROM 留言表" 
Recordset1_cmd.Prepared = true

Set Recordset1 = Recordset1_cmd.Execute
Recordset1_numRows = 0
%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
		<link rel="stylesheet" href="css/index.css"/>
		<!-- <base target="_blank" /> -->
		<script src="js/jquery.min.js"></script>
		<script src="js/index.js"></script>
		<script src="js/SmoothScroll.min.js" type="text/javascript" charset="utf-8"></script>
		<link rel="icon" href="img/favicon.png" type="image/x-icon">
		<link rel="stylesheet" href="font/iconfont.css">
<title>留言板</title>
	<style>
		textarea{
			border: 2px solid #fff;
			outline: none;
			background-color:rgba(0,0,0,.5);
			color: #fff;
			font-size: 20px;
			width: 1004px;
			display: block;
			margin-left: -2px;
			padding: 10px;
			box-sizing: border-box;
			font-family: 幼圆;
			letter-spacing: 2px;
			transition: .5s;
		}
		textarea:focus{
			border: 2px solid #009cde;
		}
		iframe{
			border: 2px solid rgba(255,255,255,.9);
			background-color: rgba(34, 42, 53,.8);
		}
		.bt1{
			width: 100px;
			height: 30px;
			margin: 4px;
			margin-left: -2px;
			background-color: #009CDE;
			color: #ffffff;
			border: 2px solid #42c8c8;
			cursor: pointer;
			outline: none;
			transition: .2s;
		}
		.bt1:hover{
			background-color: #007aaa;
		}
	</style>
</head>

<body>
	<header>
		<div class="beijing1"></div>
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
<div style="margin:50px auto;width:1000px;">
  <h1 style="color: #fff;margin:10px 0;">留言板</h1>
  <iframe src="xians.asp" width="1000" height="500"></iframe>
  <form method="post" action="<%=MM_editAction%>" name="form1">
    <table align="center">
      <tr valign="baseline">
        <td><textarea name="Element" rows="4" required style="resize: none;"></textarea></td>
      </tr>
      <tr valign="baseline">
        <td><input type="submit" class="bt1" value="发表"></td>
      </tr>
    </table>
    <input type="hidden" name="Element3" value="<%=Session("MM_Username") %>" >
    <input type="hidden" name="MM_insert" value="form1">
  </form>
  <p>&nbsp;</p>
</div>
<div class="backtotop"></div>
</body>
</html>
<%
Recordset1.Close()
Set Recordset1 = Nothing
%>
