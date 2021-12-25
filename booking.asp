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

<iframe src="usericon.htm" scrolling="no" style="position:absolute;left:202;top:202;" height="100" width="1320">
</iframe>

<iframe src="socail.htm" scrolling="no" style="position:absolute;left:202;bottom:-475;" height="200" width="1520">
</iframe>

<div style="position:absolute;left:210;top:310;" height="500" width="998">
<h2 style="color:blue;">Book Room</h2>
<%
if (not session("uid")="") then
%>
<form method="post" action="booking.asp">
<table>
<tr>
<td>hotel id</td>
<td><input type="text" name="t0" value=<%=request.queryString("hotelid")%> readonly>
</td>
</tr>
<tr>
<td>Room Type</td><td><select name="t1">
<option value="single ac">single ac</option>
<option value="double ac">double ac</option>
<option value="single non ac">single non ac</option>
<option value="double non ac">double non ac</option>
</td></tr></table></select>
<br>
<table>
<tr>
<td>Checkin Date
Day</td><td><select name="t2d">
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option>
<option value="6">6</option>
<option value="7">7</option>
<option value="8">8</option>
<option value="9">9</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
<option value="13">13</option>
<option value="14">14</option>
<option value="15">15</option>
<option value="16">16</option>
<option value="17">17</option>
<option value="18">18</option>
<option value="19">19</option>
<option value="20">20</option>
<option value="21">21</option>
<option value="22">22</option>
<option value="23">23</option>
<option value="24">24</option>
<option value="25">25</option>
<option value="26">26</option>
<option value="27">27</option>
<option value="28">28</option>
<option value="29">29</option>
<option value="30">30</option>
<option value="31">31</option>
</select>
</td><td>Month</td><td><select name="t2m">
<option value="1">1</option>
<option value="2">2</option>
<option value="3">3</option>
<option value="4">4</option>
<option value="5">5</option>
<option value="6">6</option>
<option value="7">7</option>
<option value="8">8</option>
<option value="9">9</option>
<option value="10">10</option>
<option value="11">11</option>
<option value="12">12</option>
</select>
</td><td>Year</td><td><select name="t2y">
<option value="2019">2019</option>
<option value="2020">2020</option>
<option value="2021">2021</option>
</select>
</td></tr></table></select>
<br>
<table>
<tr><td>No of Days</td><td><input type="text" name="t3"></td>
<td><input type="submit" value="book room"></td></tr></table>
</form>
<%
if request.totalbytes>0 then
set con=server.createobject("adodb.connection")
con.open "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=d:\hotel project\hotel.accdb;"
set rs=server.createobject("adodb.recordset")
sql="select * from booking"
rs.open sql,con,2,2
rs.addnew
rs.fields(1)=request.form("t0")
rs.fields(2)=session("uid")
rs.fields(3)=Date()
cind=Cdate(request.form("t2d")&"/"&request.form("t2m")&"/"&request.form("t2y"))
coutd=cind+cint(request.form("t3"))
rs.fields(4)=cind
rs.fields(5)=coutd
rs.fields(6)=request.form("t1")
rs.update
rs.close

set rs1=server.createobject("adodb.recordset")

sql="select * from bookdays"
rs1.open sql,con,2,2
n=cint(request.form("t3"))
for d=1 to n
rs1.addnew
rs1.fields(0)=request.form("t0")
rs1.fields(1)=request.form("t1")
rs1.fields(2)=cind
cind=cind+1
rs1.update
next


rs1.close
con.close
%>
<script language="javascript">
alert("booking done successfully")
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