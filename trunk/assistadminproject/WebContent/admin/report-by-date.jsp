<jsp:directive.page import="mx.itesm.assistadmin.database.DatabaseManager"/>
<jsp:directive.page import="mx.itesm.assistadmin.database.ReportManager"/>
<%

Object[][] res;
String dia = request.getParameter("date10_date");
String mes = request.getParameter("date10_month");
String ano = request.getParameter("date10_year");
String hora = request.getParameter("horas");

if(dia != null && !dia.equals("")){
	if(hora.equals("0")){
		res = ReportManager.reportByDate(ano+"-"+mes+"-"+dia);
	}else{
		int horaint = Integer.parseInt(hora);
		res = ReportManager.reportByDateHour(ano+"-"+mes+"-"+dia, horaint);
	}
	
}else{
	res = new Object[1][5];
}

%>
<html>
<head>
<link rel="stylesheet" type="text/css" href="../styles.css" />
<title>AssistAdmin: Control de accesos CCA</title>
<script language="JavaScript" src="CalendarPopup.js"></script>
<script src="usrname.js"></script>
	<script language="JavaScript">
	var cal = new CalendarPopup();
	cal.showYearNavigation();
	cal.setReturnFunction("setMultipleValues2");
	function setMultipleValues2(y,m,d) {
		document.forms[0].date10_date.value=LZ(d);
		document.forms[0].date10_month.value=LZ(m);
		document.forms[0].date10_year.value=y;
	}
	
	function valida(){
		valid = true;
		
		if ( document.forms[0].date10_date.value == "" ){
        	alert ( "Por favor llena el campo 'dd'."  );
        	valid = false;
			return;
		}
		
		if ( document.forms[0].date10_month.value == "" ){
        	alert ( "Por favor llena el campo 'mm'."  );
        	valid = false;
			return;
		}
		
		if ( document.forms[0].date10_year.value == "" ){
        	alert ( "Por favor llena el campo 'aaaa'."  );
        	valid = false;
			return;
		}
		
		if ( document.forms[0].date10_date.value.length < 2 || document.forms[0].date10_month.value.length < 2 || document.forms[0].date10_year.value.length < 4 ){
        	alert ( "Formato incorrecto en 'Fecha'."  );
        	valid = false;
			return;
		}
		
		if ( ((document.forms[0].date10_date.value < "01") || (document.forms[0].date10_date.value > "31")) || ((document.forms[0].date10_month.value < "01") || (document.forms[0].date10_month.value > "12")) || ((document.forms[0].date10_year.value < "1900") || (document.forms[0].date10_year.value > "2100")) ){
        	alert ( "Datos inválidos en 'Fecha'."  );
        	valid = false;
			return;
		}
		
		if(valid == true){
			document.forms[0].submit();
		}
	}
</script>
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
		<form action="" id="r_fecha" name="r_fecha">
		<p>
		Fecha (dd/mm/aaaa): 
		<input type="text" name="date10_date" size="2" />/
		<input type="text" name="date10_month" size="2" />/
		<input type="text" name="date10_year" size="4" />
		<a href="#" onclick="cal.showCalendar('anchor10'); return false;" title="cal.showCalendar('anchor10'); return false;" name="anchor10" id="anchor10"><img src="../media/pop_up_cal.gif" width="20" height="20" border="0" align="absbottom" /></a>
		Hora:
		<select name="horas">
			<option value="0">Todo el d&iacute;a</option>
			<option value="1">1</option>
			<option value="2">2</option>
			<option value="3">3</option>
			<option value="4">4</option>
			<option value="5">5</option>
			<option value="6">6</option>
			<option value="7">7</option>
			<option value="8">8</option>
			<option value="9">9</option>
			<option value="10">10</option>
			<option value="11">11</option>
			<option value="12">12</option>
			<option value="13">13</option>
			<option value="14">14</option>
			<option value="15">15</option>
			<option value="16">16</option>
			<option value="17">17</option>
			<option value="18">18</option>
			<option value="19">19</option>
			<option value="20">20</option>
			<option value="21">21</option>
			<option value="22">22</option>
			<option value="23">23</option>
			<option value="24">24</option>
		</select>
		hrs.
		</form>
		<input type="button" name="mostrar" value="Mostrar" onclick="valida()" />
		<p>
	    <table width="600" border="1" cellspacing="0" cellpadding="0" bordercolor="#000000" class="content" align="center">
	  		<tr>
			    <td><div align="center"><strong>Nombre de usuario</strong></td>
			    <td><div align="center"><strong>Fecha</strong></td>
			    <td><div align="center"><strong>Hora de entrada</strong></td>
			    <td><div align="center"><strong>Hora de salida</strong></td>
			    <td><div align="center"><strong>Actividad</strong></td>
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
	    	    <br>
	</td>
  </tr>
  <tr>
    <td class="footer">©2008 Alfredo Fern&aacute;ndez, Daniel Tapia, Juan Ortiz </td>
  </tr>
</table>
</body>
</html>