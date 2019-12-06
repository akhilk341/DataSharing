

<%@ page import="java.sql.*,databaseconnection.*"%>

<%@ include file="oheader.jsp"%>



<%
String id=request.getParameter("id");
Connection con1 = databasecon.getconnection();
try
{
	
	Statement st = con1.createStatement();
	Statement st2 = con1.createStatement();
	int i=st.executeUpdate("update users set ustatus='Revoke' where id='"+id+"'");
	if(i>0){
	response.sendRedirect("Owner_UserRevoke.jsp?id=succ");
	}
	else
		response.sendRedirect("Owner_UserRevoke.jsp?id=fail");
	
	}
catch(Exception e){System.out.println(e);
e.printStackTrace();}
%>




<%@ include file="footer.jsp"%>
