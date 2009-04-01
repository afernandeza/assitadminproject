<jsp:directive.page import="mx.itesm.assistadmin.database.ReportManager"/>
<% int userid = (Integer)session.getAttribute("userid"); %>

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
    <td><a href="index.jsp"><img src="../media/asistencia.jpg" alt="Principal" border="0"></a></td>
    <td><a href="personal-data.jsp"><img src="../media/datospersonales.jpg" alt="Administracion de Usuarios" border="0"></a></td>
    <td><a href="records.jsp"><img src="../media/verregistroactive.jpg" alt="Reportes" border="0"></a></td>
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
		<table width="650" border="1" cellspacing="0" cellpadding="0" bordercolor="#000000" class="content">
          <tr>
            <td><div align="center"><strong>Fecha</strong></div></td>
            <td><div align="center"><strong>Actividad</strong></div></td>
            <td><div align="center"><strong>Entrada</strong></div></td>
            <td><div align="center"><strong>Salida</strong></div></td>
            <td><div align="center"><strong>Horas</strong></div></td>
          </tr>
          <% 
          
          Object[][] res = ReportManager.reportByUser(userid);
	      for(int i = 0; i < res.length; i++){
	    	out.println("<tr>");
			for(int j = 0; j < res[0].length; j++){
				out.print("<td>");
				if(res[i][j] != null){
					out.print(res[i][j]);
				}else{
					out.print("&nbsp;");
				}
				out.print("</td>");
			}
			out.println("</tr>");
		   }
	    %>
        </table>
		<br />
    </tr>
  <tr>
    <td class="footer">©2008 Alfredo Fern&aacute;ndez, Daniel Tapia, Juan Ortiz </td>
  </tr>
</table>
</body>
</html>