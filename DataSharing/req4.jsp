

<%@ page import="java.sql.*,databaseconnection.*, CT.*"%>
<%@ include file="csheader.jsp"%>
		 
</head>

<table>
<%!
double seconds1; long duration2;long duration3;double seconds2;

%>
<%
String sno=request.getParameter("sno");
String email=request.getParameter("email");
String fid=request.getParameter("fid");
String sk=request.getParameter("key");



Connection con1 = databasecon.getconnection();
Connection con2 = databasecon.getconnection();

try
{
	
	Statement st1 = con2.createStatement();
	session.setAttribute("sk",sk);
	String sss1 = " select AES_Decrypt(file_,'"+sk+"') from files where fid='"+fid+"' ";
	System.out.println(sss1);
		long startTime2= System.nanoTime();
	ResultSet rs=st1.executeQuery(sss1);
	if(rs.next()){
		if(rs.getString(1)!=null){
	%>
		
	<div class="panel panel-widget forms-panel">
						<div class="forms">
							<div class="form-grids widget-shadow" data-example-id="basic-forms"> 
								<div class="form-title">
									<h4>File Decryption</h4>
								</div>
								<div class="form-body">
									<form name="f1"  action="req5.jsp?sno=<%=sno%>" method="post" > 
									
									
									<div class="form-group"> 
									<label for="exampleInputEmail1">File Id:</label> 
									<input type="text" name="fid" class="form-control"  value="<%=fid%>" id="exampleInputEmail1"  required> 
									</div> 

									

									<div class="form-group"> 
									<label for="exampleInputEmail1">File Data ( F ):</label> 
									<textarea name="" rows="5" class="form-control" cols="150" ><%=rs.getBytes(1)%></textarea> 
									</div> 
									
									<div class="form-group"> 
									<label for="exampleInputEmail1">User:</label> 
									<input type="text"  value="<%=email%>" name="sk" readonly  class="form-control"  id="exampleInputEmail1"  required> 
									</div> 


									
									<div class="form-group"> 
									<button type="submit"  class="btn btn-default">Forward</button>
									</div> 
									</div>
							</div>
						</div>
					</div>


	<%

	
	
	}else{
	
		 Statement st2 = con1.createStatement();
	st2.executeUpdate("update request set  status='notvalid', file_='notvalid' where sno='"+sno+"' " );
		response.sendRedirect("req1.jsp?id=fail");
		 }
	}
}
catch(Exception e){
	

	System.out.println(e);
e.printStackTrace();
}

%>


</table>


<br><br><br><br><br>
<%@ include file="csfooter.jsp"%>
