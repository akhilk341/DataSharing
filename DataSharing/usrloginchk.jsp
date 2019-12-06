<%@ page  import="java.sql.*" import="databaseconnection.*"%>
<%
String uid = request.getParameter("uid");
String b= request.getParameter("pwd");
String name=null,u=null,test2=null;

try{
Connection con1 = databasecon.getconnection();
Statement st1 = con1.createStatement();
	
String sss1 = "select * from users where email='"+uid+"' && pwd='"+b+"' ";

	ResultSet rs1=st1.executeQuery(sss1);
	if(rs1.next())
	{

		name=rs1.getString("name");
		session.setAttribute("name",name);
		session.setAttribute("user",uid);
		session.setAttribute("group",rs1.getString("group_"));
		response.sendRedirect("user_home.jsp");
		}
		else{
		response.sendRedirect("user.jsp?msg2=fail");
		}
}


catch(Exception e1)
{
out.println(e1.getMessage());
}

%>