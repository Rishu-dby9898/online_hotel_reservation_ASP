<html>
<head>
<title>Online Hotel Reservation</title>
<link rel="stylesheet" type="text/css" href="style.css">

<script language="javascript">
var a=new Array(7)
a[0]="image.jpg"
a[1]="image1.jpg"
a[2]="image2.jpg"
a[3]="image3.jpg"
a[4]="image4.jpg"
var i=0
function animation()
{
 i=(i+1)%5
 document.getElementById("i1").src=a[i]
}
window.setInterval("animation()",2400)
</script>
</head>
<body>

<iframe src="head.htm" scrolling="no" style="position:absolute;left:0;top:0;" height="200" width="1520">
</iframe>

<iframe src="link.htm" scrolling="no" style="position:absolute;left:0;top:202;" height="600" width="200">
</iframe>

<iframe src="usericon.htm" scrolling="no" style="position:absolute;left:202;top:202;" height="100" width="1320">
</iframe>

<iframe src="socail.htm" scrolling="no" style="position:absolute;left:202;bottom:-475;" height="200" width="1520">
</iframe>

<div style="position:absolute;left:210;top:300;" height="500" width="998">
<div style="position:absolute;left:650;top:6;width:620">
<img src="image.jpg" height="400" width="663" id="i1">
</div>
<h2 style="color:blue;">Hotel Details</h2>
<%
if (not session("uid")="") then
set con=server.createobject("adodb.connection")
con.open "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=d:\hotel project\hotel.accdb;"
set rs=server.createobject("adodb.recordset")
sql="select * from hotelreg where hotelid='"&request.queryString("hotelid")&"'"
rs.open sql,con
%>
Hotel Id <%=rs.fields(0)%>|
<%=rs.fields(2)%>
<br>
<%=rs.fields(3)%>,
<%=rs.fields(4)%>,
<%=rs.fields(5)%><br>
Contact-<%=rs.fields(6)%>,
<%=rs.fields(7)%>
<br>
Stars-
<%=rs.fields(8)%>
<br>
<%
rs.close

sql="select * from rooms where hotelid='"&request.queryString("hotelid")&"'"
rs.open sql,con

%>
<hr>
<h3>Rooms Details</h3>

<table>
<tr>
<th>Room Type</th>
<th>Total Rooms</th>
<th>Price</th>
</tr>
<%
do while not rs.eof
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
<hr>
<h3>Amenities</h3>
<%
rs.close
sql="select * from amenities where hotelid='"&request.queryString("hotelid")&"'"
rs.open sql,con
do while not rs.eof
%>
<%=rs.fields(1)%>  |
<%
rs.movenext
loop
rs.close


sql="select * from hotelreg where hotelid='"&request.queryString("hotelid")&"'"
rs.open sql,con
%>
<hr>

<a href="check.asp?hotelid=<%=rs.fields(0)%>"   target="_parent">check availability</a>
<a href="booking.asp?hotelid=<%=rs.fields(0)%>" target="_parent">book room</a>

<%
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