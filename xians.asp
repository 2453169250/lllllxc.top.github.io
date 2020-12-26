<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%>
<!--#include file="Connections/lianjie.asp" -->
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
<%
Dim Repeat1__numRows
Dim Repeat1__index

Repeat1__numRows = -1
Repeat1__index = 0
Recordset1_numRows = Recordset1_numRows + Repeat1__numRows
%>
<!DOCTYPE HTML>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<meta http-equiv="refresh" content="10">
<title></title>
<style>
	::selection {
	    background:#9cbbd3; 
	    color:#ffffff;
	}
	::-webkit-scrollbar {
	    width: 8px;
	}
	::-webkit-scrollbar-thumb {
	    background: rgba(104, 123, 140, 1.0);
	    border-radius: 4px;
	}
	::-webkit-scrollbar-thumb:hover{
	    background: rgba(136, 158, 180, 1.0);
	    border-radius: 4px;
	}
	::-webkit-scrollbar-thumb:active{
	    background: rgba(166, 195, 220, 1.0);
	    border-radius: 4px;
	}
	::-webkit-scrollbar-track {
	    background: rgba(34, 42, 53, 1.0);
	}
	table{
		border-collapse: collapse;
		border: 2px solid #717171;
	}
	tr{
		background-color: rgba(34, 42, 53,.5);
	}
	td{
		padding:10px ;
		color: #eee;
		font-family:幼圆;
		letter-spacing: 1.1px;
	}
	input{
		outline:none;
	}
</style>
</head>

<body>
<table width="980" border="2" cellpadding="0" cellspacing="0">
  <% While ((Repeat1__numRows <> 0) AND (NOT Recordset1.EOF)) %>
    <tr>
      <td width="116"><%=(Recordset1.Fields.Item("用户名/账号").Value)%></td>
      <td width="676"><%=(Recordset1.Fields.Item("留言").Value)%></td>
      <td width="180"><%=(Recordset1.Fields.Item("日期").Value)%></td>
    </tr>
    <% 
  Repeat1__index=Repeat1__index+1
  Repeat1__numRows=Repeat1__numRows-1
  Recordset1.MoveNext()
Wend
%>
</table>
</body>
</html>
<%
Recordset1.Close()
Set Recordset1 = Nothing
%>
