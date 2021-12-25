<html>
<head>
<link rel="stylesheet" type="text/css" href="style.css">

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

<div style="position:absolute;left:210;top:310;" height="500" width="998">
<h2 style="color:blue;">User Reviews and Ratings</h2>

<%
if (not session("uid")="") then
set con=server.createobject("adodb.connection")
con.open "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=d:\hotel project\hotel.accdb;"
set rs=server.createobject("adodb.recordset")
sql="select uname,feedback,rating from booking,usereg where booking.userid=usereg.userid and  hotelid='"&request.querystring("hotelid")&"'"
rs.open sql,con
%>
<table>
<tr>
<th>User Name</th>
<th>Review</th>
<th>Rating</th>
</tr>
<%
do while not rs.eof
if (rs.fields(1)<>"") then
%>
<tr>
<td><%=rs.fields(0)%></td>
<td><%=rs.fields(1)%></td>
<td><%=rs.fields(2)%></td>
</tr>
<%
end if
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