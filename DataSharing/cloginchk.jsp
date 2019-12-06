
<%
String uname = request.getParameter("unm");
String password = request.getParameter("pwd");


if(uname.equals("cloud")&&password.equals("cloud")){
response.sendRedirect("cloud_home.jsp");
}
else{
response.sendRedirect("cloud.jsp?msg2=fail");
}
%>