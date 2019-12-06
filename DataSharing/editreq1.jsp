<%@ page  import="java.sql.*" import="databaseconnection.*" %>
<%@ include file="csheader.jsp"%>
		


<%
                                                       String message=request.getParameter("id");
                                                       if(message!=null && message.equalsIgnoreCase("succ"))
                                                       {
                out.println("<script type=text/javascript>alert('Update Completed'); </script>															   ");
                                                       }
                                                       if(message!=null && message.equalsIgnoreCase("fail"))
                                                       {
                out.println("<script type=text/javascript>alert('Key was incorrect!! '); </script>															   ");
                                                       }
                                               %>

<h1>Update Requests </font></h1>
<br>
<font size="3" color="#ff0099"><b>
  <%
int c=0;
  try{


Connection con=databasecon.getconnection();
	Statement st1 = con.createStatement();
	
	String sss1 = "select * from updatereq where status='new' ";

	ResultSet rs=st1.executeQuery(sss1);
	%>

	<table id="tab" width="95%">
	<tr><th class="t-head ">File Id<th class="t-head ">User<th class="t-head ">Group<th class="t-head ">Key<th class="t-head ">Action</tr>
	<%
	while(rs.next())	
	 {%>
	 <tr class="cross"><td class="ring-in t-data"><font size="3" color="#800000"><%=rs.getString(3)%><td class="ring-in t-data"><font size="3" color="#800000"><%=rs.getString(2)%><td class="ring-in t-data"><font size="3" color="#800000"><%=rs.getString(4)%><td class="ring-in t-data"><font size="3" color="#800000"><%=rs.getString("sk")%><td class="ring-in t-data"><a href="editreq2.jsp?sno=<%=rs.getString(1)%>&&fid=<%=rs.getString(3)%>&&email=<%=rs.getString("email")%>"> <font size="3" color="#800000">Execute</a>
	 <%
	}
  }
  catch(Exception e){
  
  }
  %>

</table>
</font>
  <br>  <br>  <br>  <br>  <br>  <br>  <br>  <br>  <br>  <br>  <br>  <br>  <br>
<%@ include file="csfooter.jsp"%>