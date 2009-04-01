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
    <td height="200px">
    <form method="post" action="j_security_check">
	<table class="login" border="0">
      <tr>
        <td>Login</td>
      </tr>
      <tr>
        <td><table class="center" border="0">
          <tr>
            <td class="right">Usuario:</td>
            <td><input type="text" name="j_username" size="15"></td>
          </tr>
          <tr>
            <td class="right">Contrase&ntilde;a:</td>
            <td><input type="password" name="j_password" size="15"></td>
          </tr>
        </table></td>
      </tr>
      <tr>
        <td><input type="submit" value="Entrar"></td>
      </tr>
    </table>
	</form>
	</td>
  </tr>
  <tr>
    <td class="footer">©2008 Alfredo Fern&aacute;ndez, Daniel Tapia, Juan Ortiz </td>
  </tr>
</table>
</body>
</html>