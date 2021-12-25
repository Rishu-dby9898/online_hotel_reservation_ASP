<html>
<head>
<title>Online Hotel Reservation</title>
<meta name="viewport" content="width=device-width,initial-scale=1.0">
<link rel="stylesheet" type="text/css" href="style.css">
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


<div style="position:absolute;left:208;top:300;" height="1000" width="998">
<h2>Search Hotel</h2>
<form method="post" action="default.asp">
Enter City <input type="text" name="t1"><input type="submit" value="search">
</form>
<%
if request.totalbytes>0 then
set con=server.createobject("adodb.connection")
con.open "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=d:\hotel project\hotel.accdb;"
set rs=server.createobject("adodb.recordset")
sql="select * from hotelreg where city='"&request.form("t1")&"'"
rs.open sql,con
%>
<table width="120%"style="text-align:center;">
<tr>
<th>Hotel Id</hd>
<th>Hotel Name</th>
<th>Address</th>
<th>City</th>
<th>State</th>
<th>Contact No</th>
<th>Email id</th>
<th>Stars</th>
<th>Details</th>
</tr>
<%
do until rs.eof
%>
<tr>
<td><%=rs.fields(0)%></td>
<td><%=rs.fields(2)%></td>
<td><%=rs.fields(3)%></td>
<td><%=rs.fields(4)%></td>
<td><%=rs.fields(5)%></td>
<td><%=rs.fields(6)%></td>
<td><%=rs.fields(7)%></td>
<td><%=rs.fields(8)%></td>
<td><a href="ulogin.asp">view Details</a></td>
</tr>
<%
rs.movenext
loop
%>
</div>
</table>
<%
rs.close
con.close
end if
%>

</body>
</html>