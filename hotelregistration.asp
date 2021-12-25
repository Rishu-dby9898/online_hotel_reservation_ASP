<html>
<head>
<title>Online Hotel Reservation</title>
</head>
<body>

<iframe src="head.htm" scrolling="no" style="position:absolute;left:0;top:0;" height="200" width="1200">
</iframe>

<iframe src="link.htm" scrolling="no" style="position:absolute;left:0;top:201;" height="600" width="200">
</iframe>

<iframe src="icon.htm" scrolling="no" style="position:absolute;left:202;top:201;" height="100" width="998">
</iframe>

<iframe src="socail.htm" scrolling="no" style="position:absolute;left:202;bottom:-475;" height="200" width="1520">
</iframe>

<div style="position:absolute;left:202;top:300;" height="500" width="998">
<% 
set con=server.createobject("adodb.connection")
con.open "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=d:\hotel project\hotel.accdb;"
set rs=server.createobject("adodb.recordset")
sql="select * from hotelreg"
rs.open sql,con,2,2
rs.addnew
rs.fields(0)=request.form("t2")
rs.fields(1)=request.form("t3")
rs.fields(2)=request.form("t4")
rs.fields(3)=request.form("t5")
rs.fields(4)=request.form("t6")
rs.fields(5)=request.form("t7")
rs.fields(6)=request.form("t8")
rs.fields(7)=request.form("t9")
rs.fields(8)=request.form("t10")
rs.update
%>
<div style="position:absolute;left:10;top:5;width:400">
<table style="width:400;">
<tr>
<td><%response.write("Hotel successfully registered in the system")%></td></tr>
<tr><td><%response.write("<br>Kindly note your Hotel id :"&request.form("t2"))%></td></tr>
<tr><td><%response.write("<br><a href='hlogin.asp'>click here to login</a>")%></td></tr>
</table>
</div>
<%
rs.close
con.close
%>
</div>

</body>
</html>