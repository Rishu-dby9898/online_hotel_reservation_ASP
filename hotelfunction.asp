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
<div style="position:absolute;left:215;top:310;" height="500" width="998">
<%
if (not session("hid")="") then
%>
<h2>Add Rooms Details</h2>
<form method="post" action="hotelfunction.asp">
<table>
<tr>
<td>Room Type</td>
<td><select name="t1">
<option value="single ac">single ac</option>
<option value="double ac">double ac</option>
<option value="single non ac">single non ac</option>
<option value="double non ac">double non ac</option>
</select>
</td>
</tr>
<tr>
<td>Total Rooms</td>
<td><input type="text" name="t2">
</td>
</tr>
<tr>
<td>Room price</td>
<td><input type="text" name="t3">
</td>
</tr>
<tr><td colspan="2"><input type="submit" value="add room"></td>
</tr>
</table>
</form>
<%
if (request.form("t2")<>"") then
set con=server.createobject("adodb.connection")
con.open "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=d:\hotel project\hotel.accdb;"
set rs=server.createobject("adodb.recordset")
sql="select * from rooms"
rs.open sql,con,2,2
rs.addnew
rs.fields(0)=session("hid")
rs.fields(1)=request.form("t1")
rs.fields(2)=request.form("t2")
rs.fields(3)=request.form("t3")
rs.update
response.write("Room added successfully")
rs.close
con.close
end if
%>
<div style="position:absolute;left:380;top:0;width:400">
<h2>Add Hotel Amenities Details</h2>
<form method="post" action="hotelfunction.asp">
<table>
<tr>
<td>Facility</td>
<td><select name="s1">
<option value="restaurant">restaurant</option>
<option value="banquet">banquet</option>
<option value="wifi">wifi</option>
<option value="fitness centre">fitness centre</option>
<option value="Spa">Spa</option>
<option value="Bar">Bar</option>
<option value="Swimming">Swimming Pool</option>
<option value="Laundry">Laundry</option>
<option value="children Park">children Park</option>
<option value="Parking">Parking</option>
<option value="Room Service">Room Service</option>
</select>
</td>
</tr>
<tr><td colspan="2"><input type="submit" value="add facility"></td>
</tr>
</table>
</form>
<%
if (request.form("s1")<>"") then
set con=server.createobject("adodb.connection")
con.open "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=d:\hotel project\hotel.accdb;"
set rs=server.createobject("adodb.recordset")
sql="select * from amenities"
rs.open sql,con,2,2
rs.addnew
rs.fields(0)=session("hid")
rs.fields(1)=request.form("s1")
rs.update
response.write("Facility added successfully")
rs.close
con.close
end if
%>
</div>
<%
end if
%>
</div>
</body>
</html>