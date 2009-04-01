<jsp:directive.page isErrorPage="true" import="java.io.PrintWriter"/>
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
    <td height="50px" class="error"><div align="center">Error: Se ha generado un error inesperado:
    <br>Intente <a href="/<jsp:expression>context</jsp:expression>/logout.jsp">entrar</a> nuevamente al sistema
    </div>
    <br>
    <p>El error es:</p>
    <jsp:scriptlet>exception.printStackTrace(new PrintWriter(out));</jsp:scriptlet></td>
  </tr>
  <tr>
    <td class="footer">©2008 Alfredo Fern&aacute;ndez, Daniel Tapia, Juan Ortiz </td>
  </tr>
</table>
<jsp:directive.include file="/WEB-INF/footers/footer.jspf"/>
</body>
</html>