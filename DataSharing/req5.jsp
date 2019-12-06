

<%@ page import="java.sql.*,databaseconnection.*, CT.*"%>

		  <head>
<style>
table, th, td {
  border: 1px solid black;
}
th, td {
    padding: 15px;
    text-align: left;
}
</style>
</head>
<h1>File Get From Cloud</h1>
<table>
<%
String sno=request.getParameter("sno");
String fid=request.getParameter("fid");
//String file=request.getParameter("file");



Connection con1 = databasecon.getconnection();
Connection con2 = databasecon.getconnection();
String sk=(String)session.getAttribute("sk");
try
{
	Statement st = con2.createStatement();
	
	String sss1 = " select AES_Decrypt(file_,'"+sk+"') from files where fid='"+fid+"' ";
	System.out.println(sss1);
	ResultSet rs=st.executeQuery(sss1);
	if(rs.next()){
	PreparedStatement pst=con1.prepareStatement("update request set  status='valid', file_=? where sno='"+sno+"' ");
	pst.setBytes(1,rs.getBytes(1));
	pst.executeUpdate( );
		response.sendRedirect("req1.jsp?id=succ ");
	}

}
catch(Exception e){System.out.println(e);
e.printStackTrace();
}

%>


</table>


<br><br><br><br><br>
<%@ include file="footer.jsp"%>
