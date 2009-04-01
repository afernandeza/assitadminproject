<jsp:directive.page import="mx.itesm.assistadmin.database.UsersManager"/>
<%
String action = request.getParameter("action");
String useridstring = request.getParameter("userid");

if(useridstring != null){
	int userid = Integer.parseInt(useridstring);
	if(action.equals("delete")){
		UsersManager.deleteUser(userid);
	}
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
    <td><a href="users-admin.jsp"><img src="../media/adminusuariosactive.jpg" alt="Administracion de Usuarios" border="0"></a></td>
    <td><a href="reports.jsp"><img src="../media/reportes.jpg" alt="Reportes" border="0"></a></td>
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
		<br />
		<div align="left"><a href="add-user.jsp"><img src="../media/agregar_usr.jpg" alt="" border="0"></a></div>
		<br />
	  <table width="600" border="1" bordercolor="#000000" cellspacing="0" cellpadding="0" class="content">
  <tr>
    <td width="123"><div align="center"><strong>Usuario</strong></div></td>
    <td width="263"><div align="center"><strong>Nombre</strong></div></td>
    <td colspan="2">&nbsp;</td>
    </tr>
    	<%
    	Object[][] res = UsersManager.getUsers();
	    for(int i = 0; i < res.length; i++){
	    	%><tr><%
			for(int j = 1; j < res[0].length; j++){
				%><td><%
				if(res[i][j] != null){
					out.print(res[i][j]);
				}else{
					out.print("&nbsp;");
				}
				%></td><%
			}
	    %>
    <td width="112"><a href="edit-user.jsp?userid=<%=res[i][0]%>"><img src="../media/editar.jpg" alt="" border="0"></a></td>
    <td width="102"><a href="users-admin.jsp?action=delete&amp;userid=<%=res[i][0]%>"><img src="../media/borrar.jpg" alt="" border="0"></a></td>
<% } %>
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