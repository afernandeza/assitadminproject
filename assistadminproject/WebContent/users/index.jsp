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
    <td><table class="menubar" width="100%" border="0">
      <tr>
        <td><table border="0">
  <tr>
    <td><a href="index.jsp"><img src="../media/asistenciaactive.jpg" alt="Asistencia" width="104" height="36" border="0"></a></td>
    <td><a href="personal-data.jsp"><img src="../media/datospersonales.jpg" alt="Datos Personales" width="152" height="36" border="0"></a></td>
    <td><a href="records.jsp"><img src="../media/verregistro.jpg" alt="Ver Registro" width="118" height="36" border="0"></a></td>
  </tr>
</table>
</td>
        <td class="right"><a href="../logout.jsp"><img src="../media/logout.jpg" alt="Logout" width="66" height="36" border="0"></a></td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td class="home">
    <%
    String ip = request.getRemoteAddr();
    if( AccessManager.authorizedHost(ip) ){
    	if(request.getParameter("registro") != null){
    		String registro = request.getParameter("registro");
    		int userid = (Integer) session.getAttribute("userid");
			if(registro.equals("entrada")){
	    		String actividadid = request.getParameter("actividadid");
	    		int actividad = Integer.parseInt(actividadid);
				System.out.println(AccessManager.goIn(userid, actividad));
			} else if (registro.equals("salida")){
				System.out.println(AccessManager.goOut(userid));
			}
    	}
		
    	//out.println("registro: " + request.getParameter("registro"));
    	//out.println("actividadid: " + request.getParameter("actividadid"));
    	//out.println("userid: " + session.getAttribute("userid"));
    	//out.println("role: " + session.getAttribute("role"));
    	//out.println("usuario: " + session.getAttribute("username"));
    	//out.println("fullname: " + session.getAttribute("name"));
	%>
		<h5 align="left">Nombre: <% out.print(session.getAttribute("name")); %><br>
		Usuario: <% out.print(session.getAttribute("username") + " (" + session.getAttribute("role") + ")"); %><br>
		</h5>
    <form method="post" action="">
    
    <%  int id = (Integer)session.getAttribute("userid");
    	if( AccessManager.userIsOut(id) ) { %>
    	<select name="actividadid">
    		<% String[][] a = AccessManager.getActivities();
    		   for(int i = 0; i < a.length; i++) { %>
    			<option value="<%out.print(a[i][0]);%>"><%out.print(a[i][1]);%></option>
    		<% } %>
    	</select>
    	<input type="hidden" name="registro" value="entrada">
    	<input type="submit" value="Registrar entrada">
    
    	<% } else { %>
    
    	<input type="hidden" name="registro" value="salida">
    	<input type="submit" value="Registrar salida">
    
    	<% } %>
    
    </form>
    <br>
    
    <% } else { %>
    <br>
    En esta computadora no se puede registrar asistencia. Vaya al men&uacute; para seleccionar otra opci&oacute;n.
    <br>
    <br>
    <% } %>
	</td>
  </tr>
  <tr>
    <td class="footer">©2008 Alfredo Fern&aacute;ndez, Daniel Tapia, Juan Ortiz </td>
  </tr>
</table>
</body>
</html>