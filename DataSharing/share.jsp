<%@ page import="java.sql.*,databaseconnection.*, CT.*" import ="java.util.Random"%>
<%@ include file="csheader.jsp"%>
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
<div class="description">
<h2>File Encrypt</h1><br>
<table cellspacing="10">


<%!
double seconds1; long duration2;long duration3;double seconds2;

%>

<%
String fid=request.getParameter("id");
String K=request.getParameter("key");
Random randomGenerator = new Random();

Connection con1 = databasecon.getconnection();
try
{

String sub="Issued Decryption Key";

	

	Statement st22 = con1.createStatement();
	
	ResultSet rs22=st22.executeQuery("select *from permission where fid='"+fid+"'");
long startTime2= System.nanoTime();
	while(rs22.next()){
	int K2=randomGenerator.nextInt(1000000);
	int K3=Integer.parseInt(K) ^ K2;
	}



	Statement st1 = con1.createStatement();
	Statement st2 = con1.createStatement();
	ResultSet rs=st1.executeQuery("select * from permission where fid='"+fid+"'");
	while(rs.next()){
	int K2=randomGenerator.nextInt(1000000);
	
	int K3=Integer.parseInt(K) ^ K2;
	String body="<h3><font color=#ff6633>File ID : "+fid+"</br>";
	body=body+" <h4><font color=#285099>Decryption Key: "+K3+"</br>";
	//System.out.println("k3="+K3);
	st2.executeUpdate("insert into acl values ('"+fid+"','"+rs.getString("email")+"','"+K2+"') ");
	Mail.mailsend(rs.getString("email"),sub,body);
	body="";
	}
    

st1.executeUpdate("delete from temp");
response.sendRedirect("newfiles.jsp?msg=upload");
}
catch(Exception e){System.out.println(e);
e.printStackTrace();}


%>
