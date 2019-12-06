<%@ page import="java.sql.*,databaseconnection.*"%>
<%@ include file="cheader.jsp"%>


<h2>Storage Files are</h1><br>
<table  id="tab" width="95%">
<tr><th class="t-head ">File Id<th class="t-head ">File<th class="t-head ">User Group<th class="t-head ">Email<th class="t-head ">Action




<%
Connection con1 = databasecon.getconnection();
try
{
	String ss=null;
	Statement st1 = con1.createStatement();
	String sss1 = " select * from files where status='done' ";
	System.out.println(sss1);
	ResultSet rs=st1.executeQuery(sss1);
	while(rs.next()){
	%>
		 <tr class="cross"><td class="ring-in t-data"><h3><font size="3" color="#ff2020"><%=rs.getString(1)%><td class="ring-in t-data"><h3><font size="3" color="#ff2020"><%=rs.getString(2)%><td class="ring-in t-data"><h3><font size="3" color="#ff2020"><%=rs.getString(4)%><td class="ring-in t-data"><h3><font size="3" color="#ff2020"><%=rs.getString(5)%>
<td class="ring-in t-data"><h3><font size="3" color="#ff2020"><a href="viewfile.jsp?id=<%=rs.getString(1)%>">View</a>

	<%
	}
}
catch(Exception e){System.out.println(e);
e.printStackTrace();}
%>




</table>

<br><br><br><br><br>



<%@ include file="cfooter.jsp"%>
