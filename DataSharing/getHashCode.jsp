<%@ page import="java.sql.*,databaseconnection.*, CT.*,java.util.*"%>
<%@ include file="csheader.jsp"%>




<%
Connection con1 = databasecon.getconnection();

String rno=request.getParameter("rno");

String hashcode=SHA_256.hashCode(rno);


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
									<form name="f1"  action="execute2.jsp?id=<%=rs.getString(1)%>" method="post" > 
									
									
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
									<label for="exampleInputEmail1">Symmetric Key ( K ):</label> 
									<input type="text"  class="form-control" name="sk" value="<%=hashcode%>"  id="exampleInputEmail1"  required> <input type="hidden" name="key" value="<%=rno%>" >
									</div> 


									
									<div class="form-group"> 
									<button type="submit"  class="btn btn-default">Encrypt SKA(F, K)</button>
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



<%@ include file="footer.jsp"%>
