<%@ page import="java.sql.*,databaseconnection.*, CT.*"%>
<%@ include file="uheader.jsp"%>





<%out.println("<script type=text/javascript>alert('Got Response from CS '); </script> ");


Connection con1 = databasecon.getconnection();
try
{
	String ss=null;
	Statement st1 = con1.createStatement();
	String sss1 = " select * from request where email='"+session.getAttribute("user")+"' ";
	System.out.println(sss1);
	ResultSet rs=st1.executeQuery(sss1);
	if(rs.next()){
	Blob data=null;
		data=rs.getBlob("file_");
		session.setAttribute("file", data);

	%>
	
<div class="panel panel-widget forms-panel">
						<div class="forms">
							<div class="form-grids widget-shadow" data-example-id="basic-forms"> 
								<div class="form-title">
									<h4>View File Data</h4>
								</div>
								<div class="form-body">
									<form name="f1" action="download.jsp" method="post" > 
									
									
									<div class="form-group"> 
									<label for="exampleInputEmail1">File Id:</label> 
									<input type="text" name="fid" class="form-control"  value="<%=rs.getString("fid")%>" id="exampleInputEmail1"  required> 
									</div> 

									<div class="form-group"> 
									<label for="exampleInputEmail1">Group:</label> 
									<input type="text" name="fid" class="form-control"  value="<%=rs.getString("group_")%>" id="exampleInputEmail1"  required> 
									</div> 

									<div class="form-group"> 
									<label for="exampleInputEmail1">File Data ( F ):</label> 
									<textarea name="" rows="5" class="form-control" cols="150" ><%=rs.getBytes("file_")%></textarea> 
									</div> 
									
									<div class="form-group"> 
									
									<input type="hidden" name="fid" value="<%=rs.getString("fid")%>">
									</div> 


									
									<div class="form-group"> 
									<button type="submit"  class="btn btn-default">Download</button>
									</div> 
									</div>
							</div>
						</div>
					</div>



<%
	}
}
catch(Exception e){System.out.println(e);
e.printStackTrace();}
%>

<br><br><br><br><br>
<%@ include file="ufooter.jsp"%>
