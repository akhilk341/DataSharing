<%@ page  import="java.sql.*" import="databaseconnection.*" %>

<%@ include file="csheader.jsp"%>
		
<%
String per="";
try{
Connection con = databasecon.getconnection();
Statement st=con.createStatement();
Statement st2=con.createStatement();
String sql="select * from users where group_='"+session.getAttribute("group")+"'  and email!='"+session.getAttribute("user")+"' ";
System.out.println(sql);
ResultSet rs=st.executeQuery(sql);

%>

<%
while(rs.next()){


			try{
				
				per=request.getParameter(rs.getString("email")+"up");
				st2.executeUpdate("insert into permission values ('"+request.getParameter("fid")+"','"+rs.getString("email")+"' , '"+per+"') ");
				
				}catch(Exception w){}

}
}
catch(Exception e){
	System.out.println(e);
}
response.sendRedirect("upload.jsp?id=succ");

%>
