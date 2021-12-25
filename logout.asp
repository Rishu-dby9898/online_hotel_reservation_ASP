<html>
<head>
</head>
<body>

<%
if (not session("uid")="") then
session.contents.remove("uid")
%>
<script language="javascript">
alert("logged out successfully from account")
window.open("default.asp","_parent")
</script>
<%
else
%>
<script language="javascript">
window.open("ulogin.asp","_parent")
</script>
<%
end if
%>

</body>
</html>