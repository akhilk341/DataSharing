
<%@ page  import="java.sql.*" import="databaseconnection.*" import="javax.swing.JOptionPane"%>


<%

Connection con1 = databasecon.getconnection();


try
{
	
	Statement st1 = con1.createStatement();
	Statement st2 = con1.createStatement();
	String sss1 = "select * from request where email='"+session.getAttribute("user")+"' ";
	ResultSet rs=st1.executeQuery(sss1);
	if(rs.next())
	{
		if(rs.getString("status").equals("valid"))
		response.sendRedirect("request3.jsp");
		
		else
		response.sendRedirect("sharedfiles.jsp?id=fail");

	}

	
	
}
catch(Exception e){System.out.println(e);
e.printStackTrace();
}

%>





