<jsp:directive.page import="mx.itesm.assistadmin.database.DatabaseManager"/>
<jsp:directive.page import="mx.itesm.assistadmin.database.ReportManager"/>
<%

Object[][] resUsers, res;
resUsers = ReportManager.getUsers();
String usr = request.getParameter("select");

if(usr != null){
	int usrint = Integer.parseInt(usr);
	res = ReportManager.reportByUser(usrint);	
}else{
	res = new Object[1][5];
}

%>
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
    <table width="700" border="0" cellspacing="0" cellpadding="0">
  		<tr>
    	<td>
		<form id="usrs" name="usrs" method="post" action="">
  			<select name="select" multiple="multiple" size="10" >
  				<%
			    for(int i = 0; i < resUsers.length; i++){
			    	out.print("<option ");
					out.print("value=\"");
					out.print(resUsers[i][0]+"\">"+resUsers[i][1]);
					out.println("</option>");
				}
	    		%>
  			</select>
  			<script language="JavaScript">
				document.forms[0].select.selectedIndex = 0;
			</script>
			<br />
  			<input type="submit" name="getusr" value="Aceptar" />
		</form>
		</td>
    	<td>
	   <table width="600" border="1" cellspacing="0" cellpadding="0" bordercolor="#000000" class="content" align="center">
	  		<tr>
			    <td><div align="center"><strong>Fecha</strong></td>
			    <td><div align="center"><strong>Actividad</strong></td>
			    <td><div align="center"><strong>Hora de entrada</strong></td>
			    <td><div align="center"><strong>Hora de salida</strong></td>
			    <td><div align="center"><strong>Horas</strong></td>
			</tr>
	    <%
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
		</td>
  	</tr>
	</table>
	</td>
  </tr>
  <tr>
    <td class="footer">©2008 Alfredo Fern&aacute;ndez, Daniel Tapia, Juan Ortiz </td>
  </tr>
</table>
</body>
</html>