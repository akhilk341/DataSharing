
<%@ page import="java.sql.*,databaseconnection.*, CT.*"%>
<%@ include file="csheader.jsp"%>
		
<%
String sno=request.getParameter("sno");
String email=request.getParameter("email");
String fid=request.getParameter("fid");



Connection con1 = databasecon.getconnection();


try
{
	
	Statement st1 = con1.createStatement();
	Statement st2 = con1.createStatement();
	String sss1 = " select * from updatereq where fid='"+fid+"' ";
	System.out.println(sss1);
	ResultSet rs=st1.executeQuery(sss1);
	if(rs.next()){
	%>

<div class="progressbar-heading grids-heading">
</div>				
	<div class="panel panel-widget forms-panel">
						<div class="forms">
							<div class="form-grids widget-shadow" data-example-id="basic-forms"> 
								<div class="form-title">
									<h4>Update Request</h4>
								</div>
								<div class="form-body">
									<form name="f1"  action="editreq3.jsp?sno=<%=rs.getString(1)%>" method="post" > 
									
									
									<div class="form-group"> 
									<label for="exampleInputEmail1">File Id:</label> 
									<input type="text" name="fid" class="form-control"  value="<%=rs.getString("fid")%>" id="exampleInputEmail1"  required> <input type="hidden" name="email" value="<%=email%>"><input type="hidden" name="sno" value="<%=sno%>" >
									</div> 

									<div class="form-group"> 
									<label for="exampleInputEmail1">User:</label> 
									<input type="text"  class="form-control"  value="<%=rs.getString(2)%>" id="exampleInputEmail1"  required> 
									</div> 

									<div class="form-group"> 
									<label for="exampleInputEmail1">Group:</label> 
									<input type="text" value="<%=rs.getString("group_")%>" name="group"  class="form-control"  id="exampleInputEmail1"  required> 
									</div> 


									<div class="form-group"> 
									<label for="exampleInputEmail1">File Data ( F ):</label> 
									<textarea name="" rows="5" class="form-control" cols="150" ><%=rs.getBytes("file_")%></textarea> 
									</div> 

									
									<div class="form-group"> 
									<button type="submit"  class="btn btn-default">Encrypt & Upload Cloud</button>
									</div> 
									</div>
							</div>
						</div>
					</div>
<%
	}

}
catch(Exception e){System.out.println(e);
e.printStackTrace();
}

%>
<br><br><br><br><br>
<%@ include file="csfooter.jsp"%>
