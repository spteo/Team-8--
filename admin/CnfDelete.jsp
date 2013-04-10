<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String admin = (String) session.getAttribute("admin");
	if (admin == null || !admin.equals("admin")) {
		response.sendRedirect("/admin/adminLogin.jsp");
	}
	String failedMsg = (String) session.getAttribute("failMsg");
	String successMsg = (String) session
			.getAttribute("successMsg");
%>
<%@ page import="java.util.*,entity.*,dao.* "%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Whack-A-Junk :: Administrator Page</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
<link href="../css/bootstrap-responsive.css" rel="stylesheet">
<meta name="description"
	content="Twitter Bootstrap Basic Tab Based Navigation Example">
</head>
<body>
	<center>
		<div class="container">

			<h1 align="center">Delete User</h1>
			<!-- Main hero unit for a primary marketing message or call to action -->

			<div class="hero-unit">


				<% String myName = request.getParameter("username");
				%>
				<center>
					<form action="/admin/delete" method="POST">

						<input type="hidden" name=deleteUsername value="<%=myName%>">
						Are you sure you want to delete?<br> <font color="red">*Once
							done cannot be undone</font> <br> <br> 

						<button type="submit" class="btn btn-warning">Yes</button>
						<a href="./adminHomepage.jsp" class="btn">No</a>



					</form>


				</center>

			</div>





		</div>
	</center>
</body>
</html>
