

<%@ page  import="java.sql.*" import="databaseconnection.*"%>



<%! String name, lname, addr, city, state, zip, tele, email, un, pwd,section;
	int i=0;
%>
<%
try{

Connection con = databasecon.getconnection();

Statement st=con.createStatement();
ResultSet rs=st.executeQuery("select max(id) from users");
if(rs.next())
{
	i=rs.getInt(1);
	++i;
}
}
catch(Exception e){
System.out.println("Exception Occured");}

name=request.getParameter("name");
tele=request.getParameter("mno");
 email=request.getParameter("email");
pwd=request.getParameter("pwd");
section=request.getParameter("group");
System.out.println(pwd);
%>
<%
try{

Connection con = databasecon.getconnection();
Statement st=con.createStatement();
Statement st1=con.createStatement();

String sql="insert into users values('"+i+"','"+name+"','"+tele+"','"+email+"',  '"+pwd+"','"+section+"','Owner','Active')";
System.out.println(sql);


ResultSet rst=st1.executeQuery("select *from users where email='"+email+"' ");

if(!rst.next()){
	
	int q= st.executeUpdate(sql);
	
if(q>0)
{
	response.sendRedirect("owner.jsp?msg=succ");
}


}
else{

response.sendRedirect("ownerreg.jsp?m2=duplicate");
}
}
catch(Exception e)
{
e.printStackTrace();
	}
%>
