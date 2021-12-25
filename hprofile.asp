<html>
<head>
<title>Online Hotel Reservation</title>
<link rel="stylesheet" type="text/css" href="style.css">

</head>
<body>

<iframe src="head.htm" scrolling="no" style="position:absolute;left:0;top:0;" height="200" width="1520">
</iframe>

<iframe src="link.htm" scrolling="no" style="position:absolute;left:0;top:202;" height="600" width="200">
</iframe>

<iframe src="hotelicon.htm" scrolling="no" style="position:absolute;left:202;top:202;" height="100" width="1320">
</iframe>

<iframe src="socail.htm" scrolling="no" style="position:absolute;left:202;bottom:-475;" height="200" width="1520">
</iframe>

<div style="position:absolute;left:210;top:300;" height="500" width="998">
<h2>Hotel Profile</h2>
<%
if (not session("hid")="") then
set con=server.createobject("adodb.connection")
con.open "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=d:\hotel project\hotel.accdb;"
set rs=server.createobject("adodb.recordset")
sql="select * from hotelreg where hotelid='"&session("hid")&"'"
rs.open sql,con
if (not rs.eof) then
%>
<table style="text-align:center;width:700;">
<tr>
<th>Hotel Id</th>
<th>Hotal Name</th>
<th>Address</th>
<th>City</th>
<th>State</th>
<th>Contact No</th>
<th>Email id</th>
<th>Stars</th>
</tr>
<tr>
<td><%=rs.fields(0)%></td>
<td><%=rs.fields(2)%></td>
<td><%=rs.fields(3)%></td>
<td><%=rs.fields(4)%></td>
<td><%=rs.fields(5)%></td>
<td><%=rs.fields(6)%></td>
<td><%=rs.fields(7)%></td>
<td><%=rs.fields(8)%></td>
</tr>
</table>
<%
end if
rs.close

sql="select * from rooms where hotelid='"&session("hid")&"'"
rs.open sql,con
%>
<h2>Room Details</h2>
<table style="text-align:left;">
<tr>
<th>Room Type</th>
<th>Total Rooms</th>
<th>Price</th>
</tr>
<%
do until rs.eof
%>
<tr>
<td><%=rs.fields(1)%></td>
<td><%=rs.fields(2)%></td>
<td><%=rs.fields(3)%></td>
</tr>
<%
rs.movenext
loop
%>
</table>
<%
rs.close

sql="select * from amenities where hotelid='"&session("hid")&"'"
rs.open sql,con
%>
<h2>Amenities</h2>
<h3>Facilities</h3>
<ul type="circle">
<%
do until rs.eof
%>
<li><%=rs.fields(1)%></li>
<%
rs.movenext
loop
%>
</ul>
<%
rs.close

con.close
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