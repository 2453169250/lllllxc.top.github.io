<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../Connections/lianjie.asp" -->
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
' *** Redirect if username exists
MM_flag = "MM_insert"
If (CStr(Request(MM_flag)) <> "") Then
  Dim MM_rsKey
  Dim MM_rsKey_cmd
  
  MM_dupKeyRedirect = "zhuce.asp"
  MM_dupKeyUsernameValue = CStr(Request.Form("Element2"))
  Set MM_rsKey_cmd = Server.CreateObject ("ADODB.Command")
  MM_rsKey_cmd.ActiveConnection = MM_lianjie_STRING
  MM_rsKey_cmd.CommandText = "SELECT [账号] FROM [用户表] WHERE [账号] = ?"
  MM_rsKey_cmd.Prepared = true
  MM_rsKey_cmd.Parameters.Append MM_rsKey_cmd.CreateParameter("param1", 200, 1, 255, MM_dupKeyUsernameValue) ' adVarChar
  Set MM_rsKey = MM_rsKey_cmd.Execute
  If Not MM_rsKey.EOF Or Not MM_rsKey.BOF Then 
    ' the username was found - can not add the requested username
    MM_qsChar = "?"
    If (InStr(1, MM_dupKeyRedirect, "?") >= 1) Then MM_qsChar = "&"
    MM_dupKeyRedirect = MM_dupKeyRedirect & MM_qsChar & "requsername=" & MM_dupKeyUsernameValue
    Response.Redirect(MM_dupKeyRedirect)
  End If
  MM_rsKey.Close
End If
%>
<%
If (CStr(Request("MM_insert")) = "form1") Then
  If (Not MM_abortEdit) Then
    ' execute the insert
    Dim MM_editCmd

    Set MM_editCmd = Server.CreateObject ("ADODB.Command")
    MM_editCmd.ActiveConnection = MM_lianjie_STRING
    MM_editCmd.CommandText = "INSERT INTO [用户表] ([账号], [密码]) VALUES (?, ?)" 
    MM_editCmd.Prepared = true
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param1", 201, 1, 255, Request.Form("Element2")) ' adLongVarChar
    MM_editCmd.Parameters.Append MM_editCmd.CreateParameter("param2", 201, 1, 255, Request.Form("Element")) ' adLongVarChar
    MM_editCmd.Execute
    MM_editCmd.ActiveConnection.Close

    ' append the query string to the redirect URL
    Dim MM_editRedirectUrl
    MM_editRedirectUrl = "denglu.asp"
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

<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>注册</title>
<script src="../js/jquery.min.js"></script>
<script src="../js/index.js"></script>
<link rel="icon" href="../img/favicon.png" type="image/x-icon">
<link rel="stylesheet" href="../font/iconfont.css">
<link rel="stylesheet" href="../css/wz.css"/>
<link rel="stylesheet" href="../css/index.css"/>
<style>
	body{
		background:url(../img/bg3.jpg) no-repeat center;
		background-size: cover;
		background-attachment: fixed;
	}
	.form2{
		margin:50px auto;
		width:450px;
		padding:50px 200px;
		background:rgba(255,255,255,1);
		border-radius:5px;
		font-weight: bold;
	}
	.form-input{
		padding:10px 15px;
		font-size:18px;
		margin:5px 0px 5px 5px;
		outline:none;
		border:1px solid #ddd;
		border-radius:5px;
		font-weight: bold;
	}
	#button,#button1{
		transition: .5s !important;
		border: 1px solid #ddd;
		border-radius: 5px;
		letter-spacing: 2px;
		margin-left: 5px;
		outline: none;
	}
	#button1:hover{
		background-color: #009cde !important;
	}
	#button:hover{
		background-color:#dadada !important;
	}
</style>
</head>

<body>
	<header>
		<div class="top">
			<a href="#"><img src="../img/logoko0.png"></a>
		</div>
		<nav>
			<ul class="nav-0">
				<li><a href="../index.html" class="nav-0-a">首页</a></li>
				<li class="a1"><a href="#" class="nav-0-a">每日一图<span class="bottom"></span></a>
					<ul class="nav-1">
						<li><a href="../mryt-nasa.html" class="nav-1-a">NASA·每日一图</a></li>
						<li><a href="../mryt-tw.html" class="nav-1-a">天文·每日一图</a></li>
					</ul>
				</li>
				<li  class="a2"><a class="nav-0-a">文章分类<span class="bottom"></span></a>
					<ul class="nav-1">
						<li><a href="../wz.html?type=1" class="nav-1-a">咨讯</a></li>
						<li><a href="../wz.html?type=2" class="nav-1-a">新闻</a></li>
						<li><a href="../wz.html?type=3" class="nav-1-a">科普</a></li>
						<li><a href="../wz.html?type=4" class="nav-1-a">历史</a></li>
					</ul>
				</li>
				<li><a href="../zght.html" class="nav-0-a">中国航天</a></li>
				<li><a href="denglu.asp" class="nav-0-a">登录</a></li>
				<li><a href="zhuce.asp" class="nav-0-a">注册</a></li>
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
<h1 style="text-align:center; margin:100px 0 50px;color:#fff; font-size: 40px;text-shadow: 1px 1px 5px rgba(65, 65, 65, 1.0);">注册</h1>
<form method="post" action="<%=MM_editAction%>" name="form1" class="form2">
  <table align="center">
    <tr >
      <td><p>账号:
        </p><br/>
        <p>
          <input type="text" name="Element2" value="" style="width: 400px;" class="form-input" required><br/><br/>
      </p></td>
    </tr>
    <tr >
      <td><p>密码:
        </p><br/>
        <p>
          <input type="password" name="Element" value="" style="width: 400px;" class="form-input" required>
      </p></td>
    </tr>
    <tr>
      <td><br/><input type="submit" id="button1" style="cursor: pointer;font-size:13px;width:200px;height:40px;background:#58AACD;color:#fff;margin-right:20px;" value="注册">
      <input type="reset" name="button" style="cursor: pointer;font-size:13px;width:200px;height:40px;" id="button" value="重置"></td>
    </tr>
  </table>
  <input type="hidden" name="MM_insert" value="form1">
</form>
<p>&nbsp;</p>
</body>
</html>
<%
Recordset1.Close()
Set Recordset1 = Nothing
%>
