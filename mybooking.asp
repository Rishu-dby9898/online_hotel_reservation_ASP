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


<div style="position:absolute;left:206;top:310;" height="500" width="998">
<h2 style="color:blue;">User Bookings </h2>

<%
if (not session("uid")="") then
set con=server.createobject("adodb.connection")
con.open "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=d:\hotel project\hotel.accdb;"
set rs=server.createobject("adodb.recordset")
sql="select * from booking where userid='"&session("uid")&"'"
rs.open sql,con
%>
<table>
<tr>
<th>Booking Id</th>
<th>Hotel Id</th>
<th>User Id</th>
<th>Booking Date</th>
<th>Checkin Date</th>
<th>Checkout Date</th>
<th>Room Type</th>
<th>Review and Rating</th>
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
<td><a href="review.asp?bid=<%=rs.fields(0)%>" style="background-color:green;color:white;" target="_parent">Review and Rating</a></td>
</tr>
<%
rs.movenext
loop
rs.close
con.close
%>
</table>
<%
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