<%
String context = this.getServletConfig().getServletContext().getServletContextName();
session.invalidate();
response.sendRedirect("/" + context + "/index.jsp");
%>