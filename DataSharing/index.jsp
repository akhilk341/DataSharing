<%@ include file="header.jsp"%>

<%
session.invalidate();%>
	                  <%
                                                       String m=request.getParameter("id");
                                                       if(m!=null && m.equalsIgnoreCase("exp"))
                                                       {
                                                                  out.println("<script type=text/javascript>alert('Sorry, your session expired, login again '); </script>");
                                                       }
                                               %>
<h1></h1><center>
<img src="images/western.jpg" width="350" height="350" >
<br><br>
										
		<%@ include file="footer.jsp"%>