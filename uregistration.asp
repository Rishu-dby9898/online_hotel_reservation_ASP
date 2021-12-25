<html>
<head>
<title>Online Hotel Reservation</title>
<link rel="stylesheet" type="text/css" href="style.css">
<script>
function check()
{
if(u.t3.value.length>5)
{
u.b.disabled=false
}
}
</script>
</head>
<body>
<iframe src="head.htm" scrolling="no" style="position:absolute;left:0;top:0;" height="200" width="1520">
</iframe>

<iframe src="link.htm" scrolling="no" style="position:absolute;left:0;top:202;" height="1000" width="200">
</iframe>

<iframe src="icon.htm" scrolling="no" style="position:absolute;left:202;top:202;" height="100" width="1320">
</iframe>

<iframe src="socail.htm" scrolling="no" style="position:absolute;left:202;bottom:-475;" height="200" width="1520">
</iframe>


<div style="position:absolute;left:202;top:300;" height="500" width="998">
<div style="position:absolute;left:10;top:3;width:400">
<h1>User Registration</h1>
<h2>Step 1. Check user id availability</h2>
<form  method="post" action="uregistration.asp">
<table>
<tr>
<td>Enter Userid</td><td><input type="text" name="t1"></td>
<td><input type="submit" class="bt" value="check userid"></td>
</tr>
</table>
</form>
</div>
<%
if (request.totalbytes>0) then
set con=server.createobject("adodb.connection")
con.open "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=d:\hotel project\hotel.accdb;"
set rs=server.createobject("adodb.recordset")
sql="select * from usereg where userid='"&request.form("t1")&"'"
rs.open sql,con
if rs.eof then
%>
<div style="position:absolute;left:10;top:160;width:400">
<h2>Step 2. Enter Registration details</h2>
<form name="u" method="post" action="createuser.asp">
<table>
<tr>
<td>User id</td>
<td><input type="text" value="<%=request.form("t1")%>"readonly name="t2"></td>
</tr>
<tr>
<td>Password</td>
<td><input type="password" onchange="check()" name="t3"></td>
</tr>
<tr>
<td>User Name</td>
<td><input type="text" name="t4"></td>
</tr>
<tr>
<td>User Address</td>
<td><input type="text" name="t5"></td>
</tr>
<tr>
<td>City</td>
<td><input type="text" name="t6"></td>
</tr>
<tr>
<td>State</td>
<td><input type="text" name="t7"></td>
</tr>
<tr>
<td>Contact No</td>
<td><input type="text" name="t8"></td>
</tr>
<tr>
<td>Email id</td>
<td><input type="text" name="t9"></td>
</tr>
<tr>
<td><input type="submit" disabled name="b" value="register"></td>
<td><input type="reset" value="clear"></td>
</tr>
</table>
</form>
</div>
<%
else
%>
<script language="javascript">
alert("userid already exists in the system")
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