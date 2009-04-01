<jsp:directive.page import="mx.itesm.assistadmin.database.AccessManager"/>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../styles.css" />
<title>AssistAdmin: Control de accesos CCA</title>
</head>
<body>
<table class="mainlayout" border="0">
  <tr>
    <td><table class="header">	
  <tr>
    <td class="left"><img src="../media/logo.gif" alt="logo"></td>
    <td class="right"><img src="../media/cca.gif" alt="cca"></td>
  </tr>
</table>
</td>
  </tr>
    <tr>
    <td>
	<table class="menubar" width="100%" border="0">
      <tr>
        <td><table border="0">
  <tr>
    <td><a href="index.jsp"><img src="../media/principal.jpg" alt="Principal" border="0"></a></td>
    <td><a href="users-admin.jsp"><img src="../media/adminusuarios.jpg" alt="Administracion de Usuarios" border="0"></a></td>
    <td><a href="reports.jsp"><img src="../media/reportesactive.jpg" alt="Reportes" border="0"></a></td>
  </tr>
</table>
</td>
        <td class="right"><a href="../logout.jsp"><img src="../media/logout.jpg" alt="Logout" width="66" height="36" border="0"></a></td>
      </tr>
    </table>
	</td>
  </tr>
  <tr>
    <td>
		<h5 align="left">Nombre: <% out.print(session.getAttribute("name")); %><br>
		Usuario: <% out.print(session.getAttribute("username") + " (" + session.getAttribute("role") + ")"); %><br>
		</h5>
		<h5 align="left">Actualmente, est&aacute;n dentro del CCA las siguientes personas:</h5>
		<table width="600" border="1" cellspacing="0" cellpadding="0" class="content" bordercolor="#000000">
          <tr>
            <td><div align="center"><strong>Actividad</strong></div></td>
            <td><div align="center"><strong>Matr&iacute;cula</strong></div></td>
            <td><div align="center"><strong>Nombre</strong></div></td>
          </tr>
          <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
        </table>		
	    <br />
  </tr>
  <tr>
    <td class="footer">©2008 Alfredo Fern&aacute;ndez, Daniel Tapia, Juan Ortiz </td>
  </tr>
</table>
</body>
</html>