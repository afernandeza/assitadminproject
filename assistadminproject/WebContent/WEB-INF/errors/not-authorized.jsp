<jsp:directive.page isErrorPage="true"/>
<jsp:scriptlet>String context = this.getServletConfig().getServletContext().getServletContextName();</jsp:scriptlet>
<html>
<head>
<link rel="stylesheet" type="text/css" href="/assistadminproject/styles.css" />
<title>AssistAdmin: Control de accesos CCA</title>
</head>
<body>
<table class="mainlayout" border="0">
  <tr>
    <td><table class="header">	
  <tr>
    <td class="left"><img src="/<jsp:expression>context</jsp:expression>/media/logo.gif" alt="logo"></td>
    <td class="right"><img src="/<jsp:expression>context</jsp:expression>/media/cca.gif" alt="cca"></td>
  </tr>
</table>
</td>
  </tr>
  <tr>
    <td class="error" height="50px">Error: Usted no cuenta con los privilegios suficientes para ver esta p&aacute;gina.
	<br>
	<jsp:directive.include file="/WEB-INF/footers/footer.jspf"/>
	</td>
  </tr>
  <tr>
    <td class="footer">©2008 Alfredo Fern&aacute;ndez, Daniel Tapia, Juan Ortiz </td>
  </tr>
</table>
</body>
</html>