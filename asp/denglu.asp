<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="../Connections/lianjie.asp" -->
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
<%
' *** Validate request to log in to this site.
MM_LoginAction = Request.ServerVariables("URL")
If Request.QueryString <> "" Then MM_LoginAction = MM_LoginAction + "?" + Server.HTMLEncode(Request.QueryString)
MM_valUsername = CStr(Request.Form("textfield"))
If MM_valUsername <> "" Then
  Dim MM_fldUserAuthorization
  Dim MM_redirectLoginSuccess
  Dim MM_redirectLoginFailed
  Dim MM_loginSQL
  Dim MM_rsUser
  Dim MM_rsUser_cmd
  
  MM_fldUserAuthorization = ""
  MM_redirectLoginSuccess = "../index.asp"
  MM_redirectLoginFailed = "denglu.asp"

  MM_loginSQL = "SELECT [账号], [密码]"
  If MM_fldUserAuthorization <> "" Then MM_loginSQL = MM_loginSQL & "," & MM_fldUserAuthorization
  MM_loginSQL = MM_loginSQL & " FROM [用户表] WHERE [账号] = ? AND [密码] = ?"
  Set MM_rsUser_cmd = Server.CreateObject ("ADODB.Command")
  MM_rsUser_cmd.ActiveConnection = MM_lianjie_STRING
  MM_rsUser_cmd.CommandText = MM_loginSQL
  MM_rsUser_cmd.Parameters.Append MM_rsUser_cmd.CreateParameter("param1", 200, 1, 255, MM_valUsername) ' adVarChar
  MM_rsUser_cmd.Parameters.Append MM_rsUser_cmd.CreateParameter("param2", 200, 1, 255, Request.Form("textfield2")) ' adVarChar
  MM_rsUser_cmd.Prepared = true
  Set MM_rsUser = MM_rsUser_cmd.Execute

  If Not MM_rsUser.EOF Or Not MM_rsUser.BOF Then 
    ' username and password match - this is a valid user
    Session("MM_Username") = MM_valUsername
    If (MM_fldUserAuthorization <> "") Then
      Session("MM_UserAuthorization") = CStr(MM_rsUser.Fields.Item(MM_fldUserAuthorization).Value)
    Else
      Session("MM_UserAuthorization") = ""
    End If
    if CStr(Request.QueryString("accessdenied")) <> "" And false Then
      MM_redirectLoginSuccess = Request.QueryString("accessdenied")
    End If
    MM_rsUser.Close
    Response.Redirect(MM_redirectLoginSuccess)
  End If
  MM_rsUser.Close
  Response.Redirect(MM_redirectLoginFailed)
End If
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<script src="../js/jquery.min.js"></script>
<script src="../js/index.js"></script>
<link rel="icon" href="../img/favicon.png" type="image/x-icon">
<link rel="stylesheet" href="../font/iconfont.css">
<link rel="stylesheet" href="../css/wz.css"/>
<link rel="stylesheet" href="../css/index.css"/>
<title>登录</title>
<style>
	body{
		background:url(../img/bg1.jpg) no-repeat center;
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
		letter-spacing: 2px;
	}
	#button,#button2{
		transition: .5s !important;
	}
	#button:hover{
		background-color: #009cde !important;
	}
	#button2:hover{
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
								<input type="search" name="wd" class="search_text" placeholder="探索"/> 
								<button class="search icon-search"></button>
						</form>
					</div>
				</li>
			</ul>
		</nav>
	</header>
<h1 style="text-align:center; margin:100px 0 50px;color:#fff; font-size: 40px;text-shadow: 1px 1px 5px rgba(66, 66, 66, 1.0);">登录</h1>
<form id="form1" name="form1" method="POST" action="<%=MM_LoginAction%>" class="form2">
	
  <p> 用户名：<br/><br/>
    <input name="textfield" type="text" id="textfield2" style="width: 400px;" class="form-input" required/>
  </p><br/>
  <p> 密码： <br/><br/>
    <input name="textfield2" type="password" id="textfield3" style="width: 400px;" class="form-input" required/>
  </p>
  <p>
	  <br />
    <input name="button" type="submit" id="button" style="cursor: pointer; font-size:13px;width:200px;height:40px;background:#58AACD;color:#fff;margin-right:20px;" value="登录" />
    <input type="button" onclick="window.open('zhuce.asp')" name="button2" id="button2" style="cursor: pointer;font-size:13px;width:200px;height:40px;" value="注册" />
  </p>
</form>
</body>
</html>
<%
Recordset1.Close()
Set Recordset1 = Nothing
%>
