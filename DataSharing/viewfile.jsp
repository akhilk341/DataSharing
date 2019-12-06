<%@ page import="java.sql.*,databaseconnection.*, CT.*"%>
<%@ include file="cheader.jsp"%>
		  <head>
<style>
table, th, td {
}
th, td {
    padding: 15px;
    text-align: left;
}
</style>
</head>
<div class="description">
<h2>View File </h1><br>
<table cellspacing="10">




<%
Connection con1 = databasecon.getconnection();
try
{
	String ss=null;
	Statement st1 = con1.createStatement();
	String sss1 = " select * from files where fid='"+request.getParameter("id")+"' ";
	System.out.println(sss1);
	ResultSet rs=st1.executeQuery(sss1);
	if(rs.next()){
	%>
		
		 <tr><td><h3>File Id<td><h3><font size="3" color="#ff2020"><%=rs.getString(1)%>
		 <tr><td><h3>File Name<td><h3><font size="3" color="#ff2020"><%=rs.getString(2)%>
		 <tr><td><h3>File<td><textarea name="file" readonly rows="11" cols="50"><%=rs.getBytes("file_")%></textarea>

	</form>
	<%
	}
}
catch(Exception e){System.out.println(e);
e.printStackTrace();}
%>

</table>
</div>

<br><br><br><br><br>
<%@ include file="cfooter.jsp"%>
