<%@ page import="java.sql.*,databaseconnection.*, CT.*"%>
<%@ include file="uheader.jsp"%>
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
 <% String message=request.getParameter("id");
 
 if(message!=null && message.equalsIgnoreCase("fail"))
                                                       {
                out.println("<script type=text/javascript>alert('Key was incorrect!! '); </script>");
                                                       }
                                               %>

<div class="progressbar-heading grids-heading">
</div>				
	<div class="panel panel-widget forms-panel">
						<div class="forms">
							<div class="form-grids widget-shadow" data-example-id="basic-forms"> 
								<div class="form-title">
									<h4>Update File Request </h4>
								</div>
								<div class="form-body">
									<form name="f1"   method="post" action="UpdateAnyFiles" ENCTYPE="multipart/form-data" > 
									
									
									<div class="form-group"> 
									<label for="exampleInputEmail1">File Id:</label> 
									<input type="text" name="fid" class="form-control"  value="<%=request.getParameter("id")%>" id="exampleInputEmail1"  required> 
									</div> 

									<div class="form-group"> 
									<label for="exampleInputEmail1">Group:</label> 
									<input type="text" name="group" class="form-control"  value="<%=session.getAttribute("group")%>" id="exampleInputEmail1"  required> 
									</div> 

									 
									
									<div class="form-group"> 
									<label for="exampleInputEmail1">Secret Key ( Sk ):</label> 
									<input type="text"  name="key" required class="form-control"  id="exampleInputEmail1"  > 
									</div> 

									<div class="form-group"> 
									<label for="exampleInputEmail1">Update File:</label> 
									<input   type="file" name="file" class="form-control"  id="exampleInputEmail1"  required> 
									</div> 


									
									<div class="form-group"> 
									<button type="submit"  class="btn btn-default">Load Data</button>
									</div> 
									</div>
							</div>
						</div>
					</div>
<br><br><br><br><br>
<%@ include file="ufooter.jsp"%>
