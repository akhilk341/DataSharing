<%@ page import="java.sql.*,databaseconnection.*, CT.*"%>
<%@ include file="uheader.jsp"%>
		  <head>
		  		  <script>  
function f1Submit() {  


alert('Request sent to CS');  
alert('Wait until get the results');  
document.f1.action="request.jsp";  
document.f1.submit(); 

}
</script>

</head>



<div class="progressbar-heading grids-heading">
</div>				
	<div class="panel panel-widget forms-panel">
						<div class="forms">
							<div class="form-grids widget-shadow" data-example-id="basic-forms"> 
								<div class="form-title">
									<h4>Download Request </h4>
								</div>
								<div class="form-body">
									<form name="f1"  method="post" > 
									
									
									<div class="form-group"> 
									<label for="exampleInputEmail1">File Id:</label> 
									<input type="text" name="fid" class="form-control"  value="<%=request.getParameter("id")%>" id="exampleInputEmail1"  required> 
									</div> 

									<div class="form-group"> 
									<label for="exampleInputEmail1">Group:</label> 
									<input type="text" name="fid" class="form-control"  value="<%=session.getAttribute("group")%>" id="exampleInputEmail1"  required> 
									</div> 

									
									<div class="form-group"> 
									<label for="exampleInputEmail1">Secure Key:</label> 
									<input type="text" name="key" class="form-control" id="exampleInputEmail1"  required> 
									</div> 


									
									<div class="form-group"> 
									<button type="submit"  class="btn btn-default" onclick="f1Submit()">Request to CS</button>
									</div> 
									</div>
							</div>
						</div>
					</div>


<br><br><br><br><br>
<%@ include file="ufooter.jsp"%>
