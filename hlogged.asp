<html>
<head>
</head>
<body>

<%
if (not session("hid")="") then
session.contents.remove("hid")
%>
<script language="javascript">
alert("logged out successfully from account")
window.open("default.asp","_parent")
</script>
<%
else
%>
<script language="javascript">
window.open("hlogin.asp","_parent")
</script>
<%
end if
%>

</body>
</html>