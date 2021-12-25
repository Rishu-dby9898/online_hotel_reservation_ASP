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

<iframe src="usericon.htm" scrolling="no" style="position:absolute;left:202;top:202;" height="100" width="1320">
</iframe>

<iframe src="socail.htm" scrolling="no" style="position:absolute;left:202;bottom:-475;" height="200" width="1520">
</iframe>

<div style="position:absolute;left:250;top:330;" height="500" >
<%
if (not session("uid")="") then

else
%>
<script language="javascript">
alert("not logged in")
window.open("ulogin.asp","_parent")
</script>
<%
end if
%>
<center>
<h1>Search Hotel</h1><br>
<form method="post" action="search.asp">
Enter City <input type="text" name="t1"><input type="submit" value="search">
</form></center>
<br>
<%
if request.totalbytes>0 then
set con=server.createobject("adodb.connection")
con.open "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=d:\hotel project\hotel.accdb;"
set rs=server.createobject("adodb.recordset")
sql="select * from hotelreg where city='"&request.form("t1")&"'"
rs.open sql,con
%>
<%
do until rs.eof
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
<a href="rating.asp?hotelid=<%=rs.fields(0)%>" target="_parent">rating</a>
<a href="viewdeal.asp?hotelid=<%=rs.fields(0)%>" target="_parent">view deal</a>
<a href="check.asp?hotelid=<%=rs.fields(0)%>" target="_parent">check availability</a>
<a style="background-color:green" href="booking.asp?hotelid=<%=rs.fields(0)%>" target="_parent">book room</a>

<hr>
<%
rs.movenext
loop
%>
<%
rs.close
con.close
end if
%>


</div>

</body>
</html>