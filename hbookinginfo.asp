<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

<iframe src="head.htm" scrolling="no" style="position:absolute;left:0;top:0;" height="200" width="1520">
</iframe>

<iframe src="link.htm" scrolling="no" style="position:absolute;left:0;top:202;" height="1000" width="200">
</iframe>

<iframe src="hotelicon.htm" scrolling="no" style="position:absolute;left:202;top:202;" height="100" width="1320">
</iframe>

<iframe src="socail.htm" scrolling="no" style="position:absolute;left:202;bottom:-475;" height="200" width="1520">
</iframe>


<div style="position:absolute;left:206;top:310;" height="500" width="998">
<center>
<h1 style="color:#000000;">User Booking Details</h1>

<%
if (not session("hid")="") then
set con=server.createobject("adodb.connection")
con.open "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=d:\hotel project\hotel.accdb;"
set rs=server.createobject("adodb.recordset")
sql="select * from booking where hotelid='"&session("hid")&"'"
rs.open sql,con
%>
<table style="text-align:left;" width="130%">
<tr>
<th>Booking Id</th>
<th>Hotel Id</th>
<th>User Id</th>
<th>Booking date</th>
<th>checkin Date</th>
<th>Checkout Date</th>
<th>Room Type</th>
</tr>
<%
do while not rs.eof
%>
<tr>
<td><%=rs.fields(0)%></td>
<td><%=rs.fields(1)%></td>
<td><%=rs.fields(2)%></td>
<td><%=rs.fields(3)%></td>
<td><%=rs.fields(4)%></td>
<td><%=rs.fields(5)%></td>
<td><%=rs.fields(6)%></td>
</tr>
<%
rs.movenext
loop
rs.close
con.close
%>
</table>
</center>
<%
else
%>
<script language="javascript">
window.open("hlogin.asp","_parent")
</script>
<%
end if
%>
</div>
</body>
</html>