<%@ include file="header.jsp"%>
	<!-- start content -->
<div class="registration">
		
		                  <%
                                                       String m=request.getParameter("msg2");                                                      
                                                       if(m!=null )
                                                       {
                                                               out.println("<font  color='red'><blink><h3>&nbsp;&nbsp;&nbsp;Login Fail   !!! </blink></font></h3>");
                                                       }

													   String m2=request.getParameter("msg");                                                      
                                                       if(m2!=null )
                                                       {
                                                            out.println("<script>alert('Registered Successfully, Login here...')</script>");
															
															}
                                               %>


	<div class="registration_left">
		<h2>Data User Login</h2>
		<marquee> Hello User </marquee>
				 <div class="registration_form">
		 <!-- Form -->
			<form method="post" action="usrloginchk.jsp">

				<div>
					<label>
						<input placeholder="Email Id" type="text" name="uid" tabindex="3" required="">
					</label>
				</div>
				<div>
					<label>
						<input placeholder="Password" name="pwd" type="password" tabindex="4" required="">

					</label>
				</div>						
				<div>
					<input type="submit" value="Login">
				</div>
				<br>				<br>				<br>				<br>
			</form>
			<!-- /Form -->
			</div>
	</div>
	<div class="clearfix"></div>
	</div>
		<%@ include file="footer.jsp"%>