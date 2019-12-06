<%@ page  import="java.sql.*" import="CT.*" %>


  

<%@ include file="oheader.jsp"%>
 <%String message=request.getParameter("id");
    if(message!=null && message.equalsIgnoreCase("succ")){
    out.println("<script type=text/javascript>alert('File Data Sent to CS Successfully!!')</script>");
	}


String pf=request.getParameter("pf");
    if(pf!=null && pf.equalsIgnoreCase("Valid")){
    out.println("<font color=green><b>File Uploaded Successfully.</b></font>");
	}
	if(pf!=null && pf.equalsIgnoreCase("NotValid")){
	 out.println("<font color=red><b>Faild to Send to CS, Reupload.</b></font>");
	}
	%>
<center><br>
<font size="" color=""><h2>Data Upload: </h2></font>



<form  action="UploadAnyFiles" ENCTYPE="multipart/form-data" method="post" >   

<div class="modal-body modal-body-sub_agile">
						
							<div class="styled-input agile-styled-input-top">
							<br>
<br>
	<input type="file" name="file" required >
	<br>
	<input class="submit" type="submit" value="Upload">
</form>
</div>
<br><br><br><br><br>	<br><br>
<%@ include file="ofooter.jsp"%>