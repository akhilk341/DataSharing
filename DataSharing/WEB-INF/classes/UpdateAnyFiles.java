package Fileupload;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.*;
import java.util.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.*;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import java.security.*;
import java.security.spec.*;
import java.nio.file.Path;
import java.nio.file.Paths;
import databaseconnection.*;
@WebServlet("/UpdateAnyFiles")
@MultipartConfig(maxFileSize = 16177215)	// upload file's size up to 16MB
public class UpdateAnyFiles extends HttpServlet {
	
	
	Connection conn = null;	
	byte[] priv=null;
byte[] pub=null;
byte[] realSig; String srealSig;

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		// gets values of text fields
		HttpSession session=request.getSession();
		String user=(String)session.getAttribute("user");
		String fid=request.getParameter("fid");
		String group=request.getParameter("group");
		String key=request.getParameter("key");
		//out.println(user);
		try{

			conn =databasecon.getconnection();
			Statement st2 = conn.createStatement();
			st2.executeUpdate("delete from updatereq where email='"+session.getAttribute("user")+"' ");
		
		InputStream inputStream = null;	// input stream of the upload file
		// obtains the upload file part in this multipart request
		Part filePart = request.getPart("file");
		
		String fileName = getFileName(filePart);
		
        //Get all the parts from request and write it to the file on server
        


		if (filePart != null) {
		
			// prints out some information for debugging
			
			System.out.println(filePart.getName());
			System.out.println(filePart.getSize());
			System.out.println(filePart.getContentType());
			System.out.println("fileName"+fileName);
			// obtains input stream of the upload file
			System.out.println("1");
			inputStream = filePart.getInputStream();
			System.out.println("2");
		}
		
		
			// connects to the database
			

			// constructs SQL statement
			
				Statement st1=conn.createStatement();
			String sql = "insert into updatereq(email,fid,fnm,group_,file_,sk,status) values(?,?,?,?,?,?,?)";
			PreparedStatement statement = conn.prepareStatement(sql);
			statement.setString(1,(String)session.getAttribute("user"));	
			statement.setString(2, fid);
			statement.setString(3, fileName);			
			statement.setString(4,group);			
			if (inputStream != null) {
				// fetches input stream of the upload file for the blob column
				statement.setBinaryStream(5, inputStream,(int) filePart.getSize());
			}
			statement.setString(6,key);
			statement.setString(7,"new");

			// sends the statement to the database server
			int row = statement.executeUpdate();
			System.out.println("r="+row);
			if (row > 0) {
				
				getServletContext().getRequestDispatcher("/edit1.jsp").forward(request, response);
			}

			}catch(Exception e1){e1.printStackTrace();}
		 finally {
			if (conn != null) {
				// closes the database connection
				try {
					conn.close();
				} catch (SQLException ex) {
					ex.printStackTrace();
				}
			}
			// sets the message in request scope
		//	request.setAttribute("Message", message);
			
			// forwards to the message page
			
		}
	}
	
	
	  private String getFileName(final Part part) {

    final String partHeader = part.getHeader("content-disposition");

    String[] sections = partHeader.split(";");

    for (String content : sections) {

      if (content.trim().startsWith("filename")) {

        return content.substring(content.indexOf('=') + 1).trim()

            .replace("\"", "");

      }

    }

    return null;

  }
	
}