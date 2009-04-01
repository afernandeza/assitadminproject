<jsp:directive.page import="mx.itesm.assistadmin.database.UsersManager"/>
<%
String useridstring = request.getParameter("userid");
int userid = Integer.parseInt(useridstring);

String nombre = request.getParameter("nombre");
String appat = request.getParameter("apellidoPa");
String apmat = request.getParameter("apellidoMa");
String username = request.getParameter("username");
String rol = request.getParameter("tipoUsuario");
String contrasena = request.getParameter("contrasena");

boolean success = false;

if(nombre != null){
	success = UsersManager.updateUser(nombre, appat, apmat, rol, username, contrasena, userid);
}

%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../styles.css" />
<title>AssistAdmin: Control de accesos CCA</title>
<script language="JavaScript">
	function valida(){
		valid = true;
		if ( document.forms[0].nombre.value == "" ){
        	alert ( "Por favor llena el campo 'Nombre'." );
        	valid = false;
			return;
		}
		
		if ( document.forms[0].apellidoPa.value == "" ){
        	alert ( "Por favor llena el campo 'Apellido paterno'." );
        	valid = false;
			return;
		}
		
		if ( document.forms[0].apellidoMa.value == "" ){
        	alert ( "Por favor llena el campo 'Apellido materno'."  );
        	valid = false;
			return;
		}		
		
		if ( document.forms[0].username.value == '' ){
        	alert ( "Por favor llena el campo 'Nombre de usuario'."  );
        	valid = false;
			return;
		}
		
		if ( document.forms[0].tipoUsuario.selectedIndex == 0 ){
        	alert ( "Por favor selecciona una opción en 'Tipo de usuario'."  );
        	valid = false;
			return;
		}
		
		if ( document.forms[0].contrasena.value == "" ){
        	alert ( "Por favor llena el campo 'Contraseña'."  );
        	valid = false;
			return;
		}
		
		if(valid == true){
			document.forms[0].submit();
		}
	}
	
	function getRandomNum(lbound, ubound) {
		return (Math.floor(Math.random() * (ubound - lbound)) + lbound);
	}
	function getRandomChar(number, lower, upper, other, extra) {
		var numberChars = "0123456789";
		var lowerChars = "abcdefghijklmnopqrstuvwxyz";
		var upperChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		var otherChars = "`~!@#$%^&*()-_=+[{]}\\|;:'\",<.>/? ";
		var charSet = extra;
		if (number == true)
			charSet += numberChars;
		if (lower == true)
			charSet += lowerChars;
		if (upper == true)
			charSet += upperChars;
		if (other == true)
			charSet += otherChars;
		return charSet.charAt(getRandomNum(0, charSet.length));
	}
	function getPassword(length, extraChars, firstNumber, firstLower, firstUpper, firstOther, latterNumber, latterLower, latterUpper, latterOther) {
		var rc = "";
		if (length > 0)
			rc = rc + getRandomChar(firstNumber, firstLower, firstUpper, firstOther, extraChars);
		for (var idx = 1; idx < length; ++idx) {
			rc = rc + getRandomChar(latterNumber, latterLower, latterUpper, latterOther, extraChars);
		}
		return rc;
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
	<form action="" method="post">
	<br />
<table border="0" class="content">
<% if(success){ %>
	<tr>
		<td><div class="notification">Actualizaci&oacute;n exitosa.</div></td>
	</tr>
	<tr>
<% }  %>
	<tr>
		<td align="left"colspan="2">
		<h4>Introduzca los datos del usuario</h4>
		</td>
	</tr>
	<tr>
		<td align="center"colspan="2">&nbsp;
		</td>
	</tr>
	<tr>
		<td>Nombre (s)</td>
		<td><input type="text" name="nombre" value="<%=UsersManager.getAttribute("nombre", userid)%>">
		  <span class="style1">*</span></td>
	</tr>
	<tr>
		<td>Apellido paterno</td>
		<td><input type="text" name="apellidoPa" value="<%=UsersManager.getAttribute("appaterno", userid)%>">
		  <span class="style1">*</span></td>
	</tr>
	<tr>
		<td>Apellido materno</td>
		<td><input type="text" name="apellidoMa" value="<%=UsersManager.getAttribute("apmaterno", userid)%>">
		<span class="style1">*</span></td>
	</tr>
		<tr>
		<td>Nombre de usuario:</td>
		<td><input type="text" name="username" value="<%=UsersManager.getAttribute("username", userid)%>">
		<span class="style1">*</span></td>
	</tr>
	<tr>
		<td>Tipo de usuario</td>
		<td><select name="tipoUsuario">
			<option value="indef" >Tipo...</option>
			<option value="alumno">Alumno</option>
			<option value="tutor">Tutor</option>
			<option value="admin">Administrador</option>
			</select>
		<span class="style1">*</span></td>
		</tr>
	<tr>
		<td>Contrase&ntilde;a</td>
		<td><input type="text" name="contrasena" value="<%=UsersManager.getAttribute("password", userid)%>">
		<span class="style1">*</span></td>
		<td><input type="button" name="genPwd" value="Generar" onClick="document.forms[0].contrasena.value =
		getPassword(8, 0, true, true, true, false, true, true, false);"/></td>
	</tr>
<tr>
		<td align="center"colspan="2">&nbsp;
		</td>
	</tr>
	<tr>
		<td><input type="button" name="registrar" value="Actualizar usuario" onClick="valida()"></td>
		<td><input type="reset" name="reset" value="Limpiar forma"></td>
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