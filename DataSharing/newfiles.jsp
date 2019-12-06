<%@ page import="java.sql.*,databaseconnection.*"%>
<%@ include file="csheader.jsp"%>
		  <head>

</head>

<h2>New Files</h1><br>

 <table id="tab" width="95%">
		  <tr>
			<th class="t-head ">File Id</th>
			<th class="t-head ">File Name</th>
			<th class="t-head ">User Group</th>
			<th class="t-head ">Email</th>
			<th class="t-head ">Action</th>
			</tr>
		
<%


    String message=request.getParameter("msg");
    if(message!=null){
    out.println("<script type=text/javascript>alert('Encrypted File Upload into Cloud Successfully..!')</script>");

	out.println("<script type=text/javascript>alert('Decryption Keys are Sent to Users..!')</script>");
	}
String message1=request.getParameter("msg1");
    if(message1!=null){
out.println("<script type=text/javascript>alert('Failed to Verify the Proof')</script>");
	}


%>



<%
Connection con1 = databasecon.getconnection();
try
{
	String ss=null;
	Statement st1 = con1.createStatement();
	String sss1 = " select * from temp where status='new' ";
	System.out.println(sss1);
	ResultSet rs=st1.executeQuery(sss1);
	while(rs.next()){
	%>
		 <tr class="cross"><td class="ring-in t-data"><h3><font size="3" color="#ff2020"><%=rs.getString(1)%><td class="ring-in t-data"><h3><font size="3" color="#ff2020"><%=rs.getString(2)%><td class="ring-in t-data"><h3><font size="3" color="#ff2020"><%=rs.getString(4)%><td class="ring-in t-data"><h3><font size="3" color="#ff2020"><%=rs.getString(5)%><td class="ring-in t-data"><h3><a href="execute.jsp?id=<%=rs.getString(1)%>"><font size="3" color="#ff2020">Execute</a>

	<%
	}
}
catch(Exception e){System.out.println(e);
e.printStackTrace();}
%>




</table>

<br><br><br><br><br>



<%@ include file="csfooter.jsp"%>
