<html>
<head>
<title>Online Hotel Reservation</title>
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

<div style="position:absolute;left:202;top:300;" height="500" width="998">
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

</div>

</body>
</html>