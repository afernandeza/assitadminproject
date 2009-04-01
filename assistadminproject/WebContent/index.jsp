<%@page import="mx.itesm.assistadmin.database.UsersManager"%>
<%

String studentRole = "alumno";
String tutorRole = "tutor";
String adminRole = "admin";

String usersFolder = "users/";
String adminFolder = "admin/";

String name = request.getUserPrincipal().getName();
int userid = UsersManager.getUserId(name);
String fullName = UsersManager.getFullName(userid);

session.setAttribute("username", name);
session.setAttribute("userid", userid);
session.setAttribute("name", fullName);

if(request.isUserInRole(studentRole)){
	session.setAttribute("role", studentRole);
	response.sendRedirect(usersFolder);
} else if (request.isUserInRole(tutorRole)){
	session.setAttribute("role", tutorRole);
	response.sendRedirect(usersFolder);
} else if (request.isUserInRole(adminRole)){
	session.setAttribute("role", adminRole);
	response.sendRedirect(adminFolder);
} else {
	session.invalidate();
}
%>