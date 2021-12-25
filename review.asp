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

<div style="position:absolute;left:208;top:300;" height="500" width="998">
<h2 style="color:blue;">User Feedback about hotel </h2>

<%
if (not session("uid")="") then
%>
<form method="post" action="review.asp">
<table>
<tr>
<td>Booking Id</td>
<td><input type="text" name="t1" value="<%=request.querystring("bid")%>"></td>
</tr>
<tr>
<td>User Review of hotel</td>
<td><textarea name="t2" rows="3" cols="20">enter hotel review</textarea></td>
</tr>

<tr>
<td>Rating</td>
<td>
<select name="t3">
<option style="background-color:red;" value="1">*</option>
<option style="background-color:red;" value="2">**</option>
<option style="background-color:yellow;" value="3">***</option>
<option style="background-color:yellow;" value="4">****</option>
<option style="background-color:green;" value="5">*****</option>
</select>
</td>
</tr>
<tr><td colspan="2"><input type="submit" value="feedback"></td></tr>
</table>
</form>
<%
if request.totalbytes>0 then
set con=server.createobject("adodb.connection")
con.open "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=d:\hotel project\hotel.accdb;"
set rs=server.createobject("adodb.recordset")
rs.open "select * from booking",con,1,2
rs.find("bookingid=" & request.form("t1"))
rs.fields(7)=request.form("t2")
rs.fields(8)=request.form("t3")
rs.update
rs.close
con.close
%>
<script language="javascript">
alert("thankyou for your feedback")
window.open("mybooking.asp","_parent")
</script>
<%
end if
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