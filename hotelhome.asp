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

<iframe src="hotelicon.htm" scrolling="no" style="position:absolute;left:202;top:202;" height="100" width="1320">
</iframe>

<iframe src="socail.htm" scrolling="no" style="position:absolute;left:202;bottom:-475;" height="200" width="1520">
</iframe>

<div style="position:absolute;left:202;top:300;" height="500" width="998">
<%
if (not session("hid")="") then

else
%>
<script language="javascript">
alert("not logged in")
window.open("hlogin.asp","_parent")
</script>
<%
end if
%>

</div>

</body>
</html>