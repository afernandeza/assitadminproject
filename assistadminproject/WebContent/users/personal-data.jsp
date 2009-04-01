<jsp:directive.page import="mx.itesm.assistadmin.database.UsersManager"/>
<%
boolean successful = false;

int userid = (Integer)session.getAttribute("userid");

String correo = request.getParameter("correo");
String telefono = request.getParameter("telefono");
String calle_num = request.getParameter("calle_num");
String num_int = request.getParameter("num_int");
String celular = request.getParameter("celular");
String colonia = request.getParameter("colonia");
String deleg_mun = request.getParameter("deleg_mun");
String ciudad_pob = request.getParameter("ciudad_pob");
String estado = request.getParameter("estado");
String contrasena_act = request.getParameter("contrasena_act");
String contrasena_nueva = request.getParameter("contrasena_nueva");

if(correo != null && !correo.equals("")){
	successful = UsersManager.updateUser(userid, correo, telefono, 
										celular, calle_num, num_int, colonia, deleg_mun, ciudad_pob, 
										estado, contrasena_act, contrasena_nueva);
}

%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../styles.css" />
<title>AssistAdmin: Control de accesos CCA</title>
<script language="JavaScript">
	function valida(){
		valid = true;
		
		if ( document.forms[0].correo.value == "" ){
        	alert ( "Por favor llena el campo 'E-mail'." );
        	valid = false;
			return;
		}
		
		if ( document.forms[0].telefono.value == "" ){
        	alert ( "Por favor llena el campo 'Tel. casa'." );
        	valid = false;
			return;
		}
		
		if ( document.forms[0].calle_num.value == "" ){
        	alert ( "Por favor llena el campo 'Calle y número'."  );
        	valid = false;
			return;
		}		
		
		if ( document.forms[0].colonia.value == "" ){
        	alert ( "Por favor llena el campo 'Colonia'."  );
        	valid = false;
			return;
		}	
		
		if ( document.forms[0].deleg_mun.value == "" ){
        	alert ( "Por favor llena el campo 'Delegacion/Municipio'."  );
        	valid = false;
			return;
		}
		
		if ( document.forms[0].ciudad_pob.value == "" ){
        	alert ( "Por favor llena el campo 'Ciudad/Población'."  );
        	valid = false;
			return;
		}
		
		if ( document.forms[0].estado.value == "" ){
        	alert ( "Por favor llena el campo 'Estado'."  );
        	valid = false;
			return;
		}
		
		if ( document.forms[0].contrasena_act.value == "" ){
        	alert ( "Por favor llena el campo 'Contraseña'."  );
        	valid = false;
			return;
		}
		
		if ( document.forms[0].contrasena_nueva.value != document.forms[0].contrasena_conf.value ){
        	alert ( "Las contraseñas no concuerdan."  );
        	valid = false;
			return;
		}
		
		if(valid == true){
			document.forms[0].submit();
		}
	}
	</script>
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
    <td><a href="index.jsp"><img src="../media/asistencia.jpg" alt="Principal" border="0"></a></td>
    <td><a href="personal-data.jsp"><img src="../media/datospersonalesactive.jpg" alt="Administracion de Usuarios" border="0"></a></td>
    <td><a href="records.jsp"><img src="../media/verregistro.jpg" alt="Reportes" border="0"></a></td>
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
		<form action="personal-data.jsp" method="post">
	  	<table border="0" class="content">
<tr>
<td colspan="2"><% if(successful){ %><div class="notification">Actualizaci&oacute;n exitosa.</div><% } %></td>
</tr>
<tr>
<td>E-mail</td>
<td><input type="text" name="correo" value="<%=UsersManager.getAttribute("email", userid)%>"><span class="style1">*</span></td>
</tr>
<tr>
<td>Tel. casa</td>
<td><input type="text" name="telefono" value="<%=UsersManager.getAttribute("telcasa", userid)%>"><span class="style1">*</span></td>
</tr>
<tr>
<td>Tel. celular</td>
<td><input type="text" name="celular" value="<%=UsersManager.getAttribute("telcel", userid)%>"></td>
</tr>
<tr>
<td>Calle y n&uacute;mero</td>
<td><input type="text" name="calle_num" value="<%=UsersManager.getAttribute("callenumero", userid)%>"><span class="style1">*</span></td>
</tr>
<tr>
<td>N&iacute;mero interior</td>
<td><input type="text" name="num_int" value="<%=UsersManager.getAttribute("numint", userid)%>"></td>
</tr>
<tr>
<td>Colonia</td>
<td><input type="text" name="colonia" value="<%=UsersManager.getAttribute("colonia", userid)%>"><span class="style1">*</span></td>
</tr>
<tr>
<td>Delegaci&oacute;n/Municipio</td>
<td><input type="text" name="deleg_mun" value="<%=UsersManager.getAttribute("delegacion", userid)%>"><span class="style1">*</span></td>
</tr>
<tr>
<td>Ciudad/Poblaci&oacute;n</td>
<td><input type="text" name="ciudad_pob" value="<%=UsersManager.getAttribute("ciudad", userid)%>"><span class="style1">*</span></td>
</tr>
<tr>
<td>Estado</td>
<td><input type="text" name="estado" value="<%=UsersManager.getAttribute("estado", userid)%>"><span class="style1">*</span></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td>Contrase&ntilde;a actual</td>
<td><input type="password" name="contrasena_act"><span class="style1">*</span></td>
</tr>
<tr>
<td>Contrase&ntilde;a nueva</td>
<td><input type="password" name="contrasena_nueva"></td>
</tr>
<tr>
<td>Confirmar contrase&ntilde;a</td>
<td><input type="password" name="contrasena_conf"></td>
</tr>
<tr>
<td>&nbsp;</td>
<td>&nbsp;</td>
</tr>
<tr>
<td><input type="button" name="registrar" value="Registrar datos" onClick="valida()"></td>
<td><input type="reset" name="reset" value="Limpiar forma"></td>
</tr>
</table>
</form>
	  <br />
  </tr>
  <tr>
    <td class="footer">©2008 Alfredo Fern&aacute;ndez, Daniel Tapia, Juan Ortiz </td>
  </tr>
</table>
</body>
</html>