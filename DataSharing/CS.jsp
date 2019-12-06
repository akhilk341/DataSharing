<%@ include file="header.jsp"%>
	<!-- start content -->
<div class="registration">
		
		                  <%
                                                       String m=request.getParameter("msg2");                                                      
                                                       if(m!=null )
                                                       {
                                                               out.println("<font  color='red'><blink><h3>&nbsp;&nbsp;&nbsp;Login Fail   !!! </blink></font></h3>");
                                                       }

													  
                                               %>


	<div class="registration_left">
		<h2>Cryptographic Server Login</h2>
		 <div class="registration_form">
		 <!-- Form -->
			<form method="post" action="csloginchk.jsp">

				<div>
					<label>
						<input placeholder="User Name" type="text" name="unm" tabindex="3" required="">
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