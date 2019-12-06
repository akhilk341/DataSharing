
<%
String uname = request.getParameter("unm");
String password = request.getParameter("pwd");


if(uname.equals("CS")&&password.equals("CS")){
response.sendRedirect("cs_home.jsp");
}
else{
response.sendRedirect("CS.jsp?msg2=fail");
}
%>