<html>
<head>
<title>Online Hotel Reservation</title>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

<iframe src="head.htm" scrolling="no" style="position:absolute;left:0;top:0;" height="200" width="1520">
</iframe>

<iframe src="link.htm" scrolling="no" style="position:absolute;left:0;top:202;" height="1000" width="200">
</iframe>

<iframe src="icon.htm" scrolling="no" style="position:absolute;left:202;top:202;" height="100" width="1320">
</iframe>

<iframe  scrolling="no" style="position:absolute;left:0;top:1204;" height="150" width="1520">
</iframe>

<iframe src="socail.htm" scrolling="no" style="position:absolute;left:202;bottom:-475;" height="200" width="1520">
</iframe>


<div style="position:absolute;left:202;top:300;" height="500" width="998">
<div style="position:absolute;left:10;top:3;width:400">
<h2>Hotel Login</h2>
<form method="post" action="hlogin.asp">
<table>
<tr>
<td>Hotel Id</td>
<td>
<input type="text" name="t1">
</td>
</tr>
<tr>
<td>Password</td>
<td>
<input type="password" name="t2">
</td>
</tr>
<tr>
<td><input type="submit" value="login"></td>
<td>
<input type="reset" value="clear">
</td>
</tr>
</table>
</form>
</div>
<%
if (request.totalbytes>0) then
set con=server.createobject("adodb.connection")
con.open "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=d:\hotel project\hotel.accdb;"
set rs=server.createobject("adodb.recordset")
sql="select * from hotelreg where hotelid='"&request.form("t1")&"' and password='" &request.form("t2")&"'"
rs.open sql,con
if (not rs.eof) then
session("hid")=request.form("t1")

%>
<script language="javascript">
alert("login successful")
window.open("hotelhome.asp","_parent")

</script>
<%
else
%>
<script language="javascript">
alert("invalid Hotel id or password")
</script>
<%
end if
rs.close
con.close
end if
%>

</div>

</body>
</html>