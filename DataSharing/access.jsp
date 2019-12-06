<%@ page  import="java.sql.*" import="databaseconnection.*" %>

<%@ include file="oheader.jsp"%>
		  <head>
		  		  <script>  
function f1Submit() {  

document.f1.action="access2.jsp";  
document.f1.submit(); 

}
</script>
<style>
table, th, td {
  border: 1px solid black;
}
th, td {
    padding: 15px;
    text-align: left;
}
</style>
</head>

					<div class="description">


<%
byte[] data=null;
try{
Connection con = databasecon.getconnection();
Statement st=con.createStatement();
Statement st1=con.createStatement();
ResultSet rs1=st1.executeQuery("select file_ from temp");
if(rs1.next()){
	data=rs1.getBytes(1);
	
}
String sql="select * from users where group_='"+session.getAttribute("group")+"'  and email!='"+session.getAttribute("user")+"' and ustatus='Active' ";
System.out.println(sql);
ResultSet rs=st.executeQuery(sql);


%>
<div class="progressbar-heading grids-heading">
</div>				
	<div class="panel panel-widget forms-panel">
						<div class="forms">
							<div class="form-grids widget-shadow" data-example-id="basic-forms"> 
								<div class="form-title">
									<h4>Data Sharing</h4>
								</div>
								<div class="form-body">
									<form name="f1" method="post" > 
									<div class="form-group"> 
									<label for="exampleInputEmail1">File Data:</label> 
									<textarea name="" rows="5" class="form-control" cols="150" ><%=data%></textarea> 
									</div> 
									
									<div class="form-group"> 
									<label for="exampleInputEmail1">File id:</label> 
									<input type="text" name="fid" class="form-control"  value="<%=request.getParameter("id")%>" id="exampleInputEmail1"  required> 
									</div> 
									
									<div class="form-group"> 
									
									<table  cellspacing="20">
<tr><td>Share Permission  <Td> Accessing Permission 
<%
while(rs.next()){

%>
<tr><td  align="" >&nbsp;<%=rs.getString("email")%><td> <select name="<%=rs.getString("email")%>up">
																								<option value="READ" selected>READ
																								<option value="WRITE">WRITE
																							</select>

																	
<%
}
}
catch(Exception e){
}
%>

</table>

</form>
									</div> 


									
									<div class="form-group"> 
									<button type="submit"  onclick="f1Submit()" class="btn btn-default">Submit</button>
									</div> 
									</div>
							</div>
						</div>
					</div>

	
	
	<br><br><br><br><br>	
<%@ include file="ofooter.jsp"%>