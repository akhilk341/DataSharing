
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">

  <link rel="stylesheet" href="css/style.css">
  <!--[if lt IE 9]><script src="//html5shim.googlecode.com/svn/trunk/html5.js"></script><![endif]-->

</head>
<%@ page   import="databaseconnection.*" %>
<%@ page import="java.io.*,java.sql.*,java.util.*"%>
<%!String filename=null,unm=null,fid=null,fnm=null;
int i=0;
byte[] data=null;
%>
<%
		Random randomGenerator = new Random();  
		int randomInt=0;
		randomInt = randomGenerator.nextInt(10000000);
	
String user=(String)session.getAttribute("user");
out.println(user);
	
try{
Connection con = databasecon.getconnection();
Statement st1=con.createStatement();
ResultSet r1=st1.executeQuery("select *from temp");

if(r1.next()){
fnm=r1.getString(1);
}
PreparedStatement pst=con.prepareStatement("insert into files(fid,filename,group_,user,status) values(?,?,?,?,?)");
pst.setInt(1,randomInt);
pst.setString(2,fnm);
pst.setString(3,(String)session.getAttribute("group"));
pst.setString(4,user);
pst.setString(5,"new");

int i=pst.executeUpdate();
if(i==1)
	{
 //out.println("update");
response.sendRedirect("access.jsp?id="+randomInt);

	}

}catch(Exception e){
	e.printStackTrace();
System.out.println(e);
}
		 

%>
