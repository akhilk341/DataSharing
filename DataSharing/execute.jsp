<%@ page import="java.sql.*,databaseconnection.*, CT.*"%>
<%@ include file="csheader.jsp"%>
		  <head>

</head>
<div class="description">
<h2></h1><br>
<table cellspacing="10">

<%


Connection con1 = databasecon.getconnection();
try
{
	String ss=null;
	Statement st1 = con1.createStatement();
	String sss1 = " select * from temp where fid='"+request.getParameter("id")+"' ";
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
									<h4>File Encryption</h4>
								</div>
								<div class="form-body">
									<form name="f1"  action="getSK.jsp?id=<%=rs.getString(1)%>" method="post" > 
									
									
									<div class="form-group"> 
									<label for="exampleInputEmail1">File Id:</label> 
									<input type="text" name="fid" class="form-control"  value="<%=rs.getString(1)%>" id="exampleInputEmail1"  required> 
									</div> 

									<div class="form-group"> 
									<label for="exampleInputEmail1">File Name:</label> 
									<input type="text" name="fid" class="form-control"  value="<%=rs.getString(2)%>" id="exampleInputEmail1"  required> 
									</div> 

									<div class="form-group"> 
									<label for="exampleInputEmail1">File Data:</label> 
									<textarea name="" rows="5" class="form-control" cols="150" ><%=rs.getBytes("file_")%></textarea> 
									</div> 
									
									


									
									<div class="form-group"> 
									<button type="submit"  class="btn btn-default">Get Random Number</button>
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



<%@ include file="csfooter.jsp"%>
