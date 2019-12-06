

<%@ page  import="java.sql.*" import="databaseconnection.*" import="javax.swing.JOptionPane"%>

<%
Connection con1 = databasecon.getconnection();
Statement st2 = con1.createStatement();
String sts=null;
try
{
	String ss=null;
	while(ss==null){
	Statement st1 = con1.createStatement();
	String sss1 = "select * from updatereq where status!='new' and email='"+session.getAttribute("user")+"' ";
	ResultSet rs=st1.executeQuery(sss1);
	if(rs.next())
	{
		ss="finish";
		sts=rs.getString("status");
	}
	System.out.println("waiting");
	Thread.sleep(7000);
	}
}
catch(Exception e){System.out.println(e);
e.printStackTrace();
}

%>

<%

if(sts.equals("valid")){

out.println("<script type=text/javascript>alert('File Updated Successfully '); </script> ");

response.sendRedirect("sharedfiles.jsp?id=succ");
}else{
	
	response.sendRedirect("sharedfiles.jsp?id=fail");
}


%>




