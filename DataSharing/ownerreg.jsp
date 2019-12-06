<%@ include file="header.jsp"%>
<%@ page  import="java.text.SimpleDateFormat,java.util.*" import="java.text.DateFormat" %>
<div class="registration">
		
		                  <%
                                                      
													   String m2=request.getParameter("m2");                                                      
                                                       if(m2!=null)
                                                       {
                                                               out.println("<script>alert('Email Id already available')</script>");
                                                       }
                                               %>
											   

<div class="progressbar-heading grids-heading">
					</div>
					
	<div class="panel panel-widget forms-panel">
						<div class="forms">
							<div class="form-grids widget-shadow" data-example-id="basic-forms"> 
								<div class="form-title">
									<h4>Owner Registration</h4>
								</div>
								<div class="form-body">
									<form action="ownerreg2.jsp" method="post" onsubmit="return check(this);"> 
									<div class="form-group"> 
									<label for="exampleInputEmail1">Name</label> 
									<input type="text" class="form-control" name="name" id="exampleInputEmail1" pattern="[A-Za-z]+" required> 
									</div> 
									
									<div class="form-group"> 
									<label for="exampleInputEmail1">Email</label> 
									<input type="email" name="email" class="form-control"  id="exampleInputEmail1"  required> 
									</div> 
									<div class="form-group"> 
									<label for="exampleInputPassword1">Password</label> 
									<input type="password" class="form-control" name="pwd" id="exampleInputPassword1"  minlength="6" required> 
									</div> 

										
										<div class="form-group"> 
									<label for="exampleInputEmail1">Select Group</label> 
									<select name="group"  class="form-control">
									<option value="Group1">Group1
									<option value="Group2">Group2
									<option value="Group3">Group3
									<option value="Group4">Group4
									<option value="Group5">Group5
								</select>
									</div>

									<div class="form-group"> 
									<label for="exampleInputPassword1">Mobile Number</label> 
									<input type="text" class="form-control" name="mno" id="exampleInputPassword1" pattern="[0-9]{10,10}" required> 
									</div> 


									
									<div class="form-group"> 
									<button type="submit" class="btn btn-default">Submit</button>
									</div> 
									</div>
							</div>
						</div>
					</div>





					
		<%@ include file="footer.jsp"%>