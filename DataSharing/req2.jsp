

<%@ page  import="java.sql.*" import="databaseconnection.*,CT.*" import="javax.swing.JOptionPane"%>

<%
String sno=request.getParameter("sno");
String email=request.getParameter("email");
String fid=request.getParameter("fid");
String K3=request.getParameter("key");



Connection con1 = databasecon.getconnection();


try
{
	
	Statement st1 = con1.createStatement();
	Statement st2 = con1.createStatement();
	String sss1 = "select fkey from acl where fid='"+fid+"' and uemail='"+email+"' ";
	ResultSet rs=st1.executeQuery(sss1);
	if(rs.next())
	{

String K2=rs.getString(1);
int K=Integer.parseInt(K2) ^ Integer.parseInt(K3);

String sk=SHA_256.hashCode(new Integer(K).toString());

		response.sendRedirect("req3.jsp?sno="+sno+"&fid="+fid+"&key="+sk+"&email="+email+"");
	}
	
}
catch(Exception e){System.out.println(e);
e.printStackTrace();
}

%>





