
<%@ page import="java.sql.*,databaseconnection.*, CT.*,java.util.*"%>
<%@ include file="csheader.jsp"%>
		  <head>
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
<h1>Update Request</h1>
<table>
<%!String K2,K3;%>
<%
String sno=request.getParameter("sno");
String email=request.getParameter("email");
String fid=request.getParameter("fid");



Connection con1 = databasecon.getconnection();


try
{
	
	Statement st1 = con1.createStatement();

Statement st2 = con1.createStatement();
Statement st3 = con1.createStatement();
Statement st11 = con1.createStatement();

ResultSet rst=st2.executeQuery("select fkey from acl where fid='"+fid+"' and uemail='"+email+"'");
if(rst.next()){
K2=rst.getString(1);
}
System.out.println("k2="+K2);

	ResultSet rst1=st3.executeQuery("select sk from updatereq where fid='"+fid+"' and email='"+email+"'");
if(rst1.next()){
K3=rst1.getString(1);
}
//System.out.println("k3="+K3);
int K=Integer.parseInt(K2) ^ Integer.parseInt(K3);

String sk=SHA_256.hashCode(new Integer(K).toString());
	
	Connection con2 = databasecon.getconnection();
	String sss1 = " select AES_Decrypt(file_,'"+sk+"') from files where fid='"+fid+"' ";
	System.out.println(sss1);
	Statement st5 = con2.createStatement();
	ResultSet rss=st5.executeQuery(sss1);
	if(rss.next()){
		if(rss.getString(1)!=null){
		Statement stt = con1.createStatement();
			
			ResultSet rstt=stt.executeQuery("select *from updatereq where fid='"+fid+"' ");
			if(rstt.next()){
PreparedStatement pst=con2.prepareStatement("update files set file_=AES_ENCRYPT(?,'"+sk+"'),filename=? where fid=? ");
	pst.setBytes(1,rstt.getBytes("file_"));
	pst.setString(2,rstt.getString("fnm"));
	pst.setString(3,fid);
	pst.executeUpdate();
			}
	st1.executeUpdate("update updatereq set status='valid' where sno='"+sno+"' ");	

Random randomGenerator = new Random();
		int hmackey=randomGenerator.nextInt(100000000);
Statement s22 = con2.createStatement();
ResultSet rs2=s22.executeQuery("select file_ from files where fid='"+fid+"'");
if(rs2.next()){

String encdata=new String(rs2.getBytes(1));


String HmacSig=HMAC.calculateHMAC(encdata, new Integer(hmackey).toString());

st11.executeUpdate("update dataintgrty set hmac='"+HmacSig+"',hkey='"+hmackey+"' where fid='"+fid+"'");
			
			response.sendRedirect("editreq1.jsp?id=succ");
		}
		}
		else{
	
		 Statement st52 = con1.createStatement();
	st52.executeUpdate("update updatereq set  status='notvalid' where sno='"+sno+"' " );
	//st2.executeUpdate("delete from updatereq where sno='"+sno+"'");
		response.sendRedirect("editreq1.jsp?id=fail");
		 }

	

}
}
catch(Exception e){System.out.println(e);
e.printStackTrace();
}

%>


</table>


<br><br><br><br><br>
<%@ include file="footer.jsp"%>
