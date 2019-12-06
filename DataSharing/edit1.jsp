<%@ page import="java.sql.*,databaseconnection.*, CT.*"%>
<%@ include file="uheader.jsp"%>

<head>
		  		  <script>  
function f1Submit() {  


alert('Request sent to CS');  
alert('Wait until get the updated status');  
document.f1.action="editrequest.jsp";  
document.f1.submit(); 

}
</script>

</head>

 <form method="post" action="editrequest.jsp"  method="post">

<table cellspacing="10">
<% Connection con1 = databasecon.getconnection();
try
{
	String ss=null;
	Statement st1 = con1.createStatement();
	String sss1 = " select *from updatereq where email='"+session.getAttribute("user")+"' ";
	System.out.println(sss1);
	ResultSet rs=st1.executeQuery(sss1);
	if(rs.next()){%>


<div class="progressbar-heading grids-heading">
</div>				
	<div class="panel panel-widget forms-panel">
						<div class="forms">
							<div class="form-grids widget-shadow" data-example-id="basic-forms"> 
								<div class="form-title">
									<h4>Update File Request </h4>
								</div>
								<div class="form-body">
									<form name="f1"   action="editrequest.jsp"  method="post" > 
									
									
									<div class="form-group"> 
									<label for="exampleInputEmail1">File Id:</label> 
									<input type="text" name="fid" class="form-control"  readonly value="<%=rs.getString("fid")%>" id="exampleInputEmail1"  required> 
									</div> 

									<div class="form-group"> 
									<label for="exampleInputEmail1">Group:</label> 
									<input type="text" name="group" class="form-control"  value="<%=rs.getString("group_")%>" id="exampleInputEmail1"  required> 
									</div> 

									 
									
									<div class="form-group"> 
									<label for="exampleInputEmail1">Secret Key ( Sk ):</label> 
									<input type="text"  name="key" readonly value="<%=rs.getString("sk")%>"class="form-control"  id="exampleInputEmail1"  > 
									</div> 

									<div class="form-group"> 
									<label for="exampleInputEmail1">Update File:</label> 
									<textarea name="file" class="form-control" readonly><%=rs.getBytes("file_")%></textarea>
									</div> 


									
									<div class="form-group"> 
									<button type="submit"  class="btn btn-default" onclick="f1Submit()">Request to CS</button>
									</div> 
									</div>
							</div>
						</div>
					</div>
		
<%}


}catch(Exception e){}
	%>

</div>




<br><br>
<%@ include file="ufooter.jsp"%>
