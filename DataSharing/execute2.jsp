<%@ page import="java.sql.*,databaseconnection.*, CT.*" import ="java.util.Random"%>
<%@ include file="csheader.jsp"%>
		 


<%!
double seconds1; long duration2;long duration3;double seconds2;

%>


<%
String fid=request.getParameter("id");
String file=request.getParameter("file");
String sk=request.getParameter("sk");
String key=request.getParameter("key");

Connection con1 = databasecon.getconnection();

try
{
	Statement st11 = con1.createStatement();
	Statement st2 = con1.createStatement();
	Statement st4 = con1.createStatement();
	ResultSet rst4=st4.executeQuery("select *from temp");
	if(rst4.next()){
		
		PreparedStatement pst=con1.prepareStatement("insert into files(fid,filename,file_,group_,user,status) values(?,?,AES_ENCRYPT(?,'"+sk+"'),?,?,?)");
		pst.setString(1,rst4.getString(1));
		pst.setString(2,rst4.getString(2));
		pst.setBytes(3,rst4.getBytes(3));
		pst.setString(4,rst4.getString(4));
		pst.setString(5,rst4.getString(5));
		pst.setString(6,"done");
		pst.executeUpdate();
	//String sss1 = " ";
System.out.println("-------- ");
//	pst.executeUpdate(sss1);

	}
	
	



	
Random randomGenerator = new Random();
		int hmackey=randomGenerator.nextInt(100000000);

ResultSet rs2=st2.executeQuery("select file_ from temp where fid='"+request.getParameter("id")+"'");
if(rs2.next()){

String encdata=new String(rs2.getBytes(1));


String HmacSig=HMAC.calculateHMAC(encdata, new Integer(hmackey).toString());

st11.executeUpdate("insert into dataintgrty values('"+fid+"','"+HmacSig+"','"+hmackey+"')");

}
	
}
catch(Exception e){System.out.println(e);
e.printStackTrace();}


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
									<form name="f1"  action="share.jsp?id=<%=rs.getString(1)%>" method="post" > 
									
									
									<div class="form-group"> 
									<label for="exampleInputEmail1">File Id:</label> 
									<input type="text" name="fid" class="form-control"  value="<%=rs.getString(1)%>" id="exampleInputEmail1"  required> <input type="hidden" name="key" value="<%=key%>" >
									</div> 

									<div class="form-group"> 
									<label for="exampleInputEmail1">File Name:</label> 
									<input type="text" name="fid" class="form-control"  value="<%=rs.getString(2)%>" id="exampleInputEmail1"  required> 
									</div> 

									<div class="form-group"> 
									<label for="exampleInputEmail1">Encrypted Data ( C ):</label> 
									<textarea name="" rows="5" class="form-control" cols="150" ><%=rs.getBytes("file_")%></textarea> 
									</div> 
									
									 


									
									<div class="form-group"> 
									<button type="submit"  class="btn btn-default">Share to Users</button>
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

<%@ include file="footer.jsp"%>
