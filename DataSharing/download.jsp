<%@ page import="java.sql.*, javax.sql.*, java.util.HashSet, java.util.ArrayList, java.util.Iterator, java.io.*"%>

<%@page import="java.io.*,java.net.*,databaseconnection.*"%>



<%				
String fnm=null;

Connection con1 = databasecon.getconnection();
Connection con2 = databasecon.getconnection();
Statement st=con2.createStatement();
ResultSet rs=st.executeQuery("select filename from files where fid='"+request.getParameter("fid")+"'");
	if(rs.next()){
fnm=rs.getString(1);
	}
	%>
	
	
	<%@ page import="java.sql.*"%>
<%@ page import="database.*,java.io.*,java.net.*"%>
<%!
public static String getMimeType(String fileUrl)
    throws java.io.IOException, MalformedURLException 
  {
    String type = null;
    URL u = new URL(fileUrl);
    URLConnection uc = null;
    uc = u.openConnection();
    type = uc.getContentType();
    return type;
  }

%>


<%
    
    String filename=fnm;
  
String type=getMimeType("file:"+filename);


		 response.setContentType (type);
    response.setHeader ("Content-Disposition", "attachment;     filename=\""+filename+"\"");
		 Connection con=databasecon.getconnection();
		 PreparedStatement ps =con.prepareStatement(" select file_ from request where email='"+session.getAttribute("user")+"'");
		 ResultSet rs2 = ps.executeQuery();
		 while(rs2.next())
		 {
		 		byte[] ba = rs2.getBytes(1);

   
        ServletOutputStream outs = response.getOutputStream();

     
            try {
                   
                        outs.write(ba);
                  
                        } catch (IOException ioe) {
                        ioe.printStackTrace(System.out);
                    }
                        outs.flush();
                    outs.close();
                   // in.close(); 

		 }
%>
	
	
	
	
	
				
					
					
%>