<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

<iframe src="head.htm" scrolling="no" style="position:absolute;left:0;top:0;" height="200" width="1520">
</iframe>

<iframe src="link.htm" scrolling="no" style="position:absolute;left:0;top:202;" height="1000" width="200">
</iframe>

<iframe src="usericon.htm" scrolling="no" style="position:absolute;left:202;top:202;" height="100" width="1320">
</iframe>

<iframe src="socail.htm" scrolling="no" style="position:absolute;left:202;bottom:-475;" height="200" width="1520">
</iframe>


<div style="position:absolute;left:202;top:300;" height="500" width="998">
<div style="position:absolute;left:10;top:5;width:400">
<h2 style="color:blue;">User Profile</h2>

<%
if (not session("uid")="") then
set con=server.createobject("adodb.connection")
con.open "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=d:\hotel project\hotel.accdb;"
set rs=server.createobject("adodb.recordset")
if request.totalbytes>0 then
sql="select * from usereg where userid='"&session("uid")&"'"
rs.open sql,con,2,2
rs.fields(2)=request.form("t2")
rs.fields(3)=request.form("t3")
rs.fields(4)=request.form("t4")
rs.fields(5)=request.form("t5")
rs.fields(6)=request.form("t6")
rs.fields(7)=request.form("t7")
rs.update
rs.close
%>
<script>
alert("profile edited successfully")
</script>
<%
end if

sql="select * from usereg where userid='"&session("uid")&"'"
rs.open sql,con
if (not rs.eof) then
%>
<form method="post" action="profile.asp">
<table style="text-align:left;width:600;">
<tr>
<th>User Id</th>
<td><input readonly type="text" value="<%=rs.fields(0)%>"name="t1"></td>
</tr>
<tr>
<th>User Name</th>
<td><input type="text" value="<%=rs.fields(2)%>"name="t2"></td>
</tr>
<tr>
<th>Address</th>
<td><input type="text" value="<%=rs.fields(3)%>"name="t3"></td>
</tr>
<tr>
<th>City</th>
<td><input type="text" value="<%=rs.fields(4)%>"name="t4"></td>
</tr>
<tr>
<th>State</th>
<td><input type="text" value="<%=rs.fields(5)%>"name="t5"></td>
</tr>
<tr>
<th>Contact No</th>
<td><input type="text" value="<%=rs.fields(6)%>"name="t6"></td>
</tr>
<tr>
<th>Email id</th>
<td><input type="text" value="<%=rs.fields(7)%>"name="t7"></td>
</tr>
<tr>
<td colspan="2"><input type="submit" value="edit profile"></td></tr>
</table>
</form>
<div>
<%
end if
rs.close

con.close

else
%>
<script language="javascript">
window.open("ulogin.asp","_parent")
</script>
<%
end if
%>
</div>

</body>
</html>