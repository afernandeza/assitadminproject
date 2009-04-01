<html>
<head>
<link rel="stylesheet" type="text/css" href="../styles.css" />
<title>AssistAdmin: Control de accesos CCA</title>
<style type="text/css">
<!--
.style1 {color: #FF0000}
-->
</style>
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
		<h5 align="left">Seleccione el tipo de reporte que desea visualizar: </h5>
		<table width="300" border="0" cellspacing="6" cellpadding="0">
  <tr>
    <td><a href="report-by-user.jsp"><img src="../media/rep_usr.jpg" alt="" border="0"></a></td>
  </tr>
  <tr>
    <td><a href="report-by-date.jsp"><img src="../media/rep_fech.jpg" alt="" border="0"></a></td>
  </tr>
  <!-- 
  <tr>
    <td><a href="report-by-everything.jsp"><img src="../media/rep_act.jpg" alt="" border="0"></a></td>
  </tr>
  -->
</table>
	
	    <br />
  </tr>
  <tr>
    <td class="footer">©2008 Alfredo Fern&aacute;ndez, Daniel Tapia, Juan Ortiz </td>
  </tr>
</table>
</body>
</html>