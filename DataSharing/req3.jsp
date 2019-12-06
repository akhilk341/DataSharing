

<%@ page import="java.sql.*,databaseconnection.*, CT.*"%>
<%@ include file="csheader.jsp"%>

<%
String sno=request.getParameter("sno");
String email=request.getParameter("email");
String fid=request.getParameter("fid");
String sk=request.getParameter("key");



Connection con1 = databasecon.getconnection();



try
{
	
	Statement st1 = con1.createStatement();
	Statement st2 = con1.createStatement();
	String sss1 = " select * from files where fid='"+fid+"' ";
	System.out.println(sss1);
	ResultSet rs=st2.executeQuery(sss1);
	if(rs.next()){
	%>
		
	


<div class="progressbar-heading grids-heading">
</div>				
	<div class="panel panel-widget forms-panel">
						<div class="forms">
							<div class="form-grids widget-shadow" data-example-id="basic-forms"> 
								<div class="form-title">
									<h4>File Get From Cloud</h4>
								</div>
								<div class="form-body">
									<form name="f1"  action="req4.jsp?sno=<%=sno%>&&email=<%=email%>" method="post" > 
									
									
									<div class="form-group"> 
									<label for="exampleInputEmail1">File Id:</label> 
									<input type="text" name="fid" class="form-control"  value="<%=rs.getString(1)%>" id="exampleInputEmail1"  required> 
									</div> 

									<div class="form-group"> 
									<label for="exampleInputEmail1">File Name:</label> 
									<input type="text" name="fid" class="form-control"  value="<%=rs.getString(2)%>" id="exampleInputEmail1"  required> 
									</div> 

									<div class="form-group"> 
									<label for="exampleInputEmail1">File Data ( F ):</label> 
									<textarea name="" rows="5" class="form-control" cols="150" ><%=rs.getBytes("file_")%></textarea> 
									</div> 
									
									<div class="form-group"> 
									<label for="exampleInputEmail1">Secret Key ( Sk ):</label> 
									<input type="text" value="<%=sk%>" name="key" readonly class="form-control"  id="exampleInputEmail1"  required> 
									</div> 


									
									<div class="form-group"> 
									<button type="submit"  class="btn btn-default">Decrypt</button>
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
<br><br><br>
<%@ include file="csfooter.jsp"%>
