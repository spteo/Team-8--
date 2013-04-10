<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%
	String admin = (String) session.getAttribute("admin");
	if (admin == null || !admin.equals("admin")) {
		response.sendRedirect("/admin/adminLogin.jsp");
	}
	String failedMsg = (String) session.getAttribute("failMsg");
	String successMsg = (String) session.getAttribute("successMsg");
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
	<div class="container">

		<h1 align="center">Edit User</h1>
		<div class="hero-unit">

			<!-- Main hero unit for a primary marketing message or call to action -->
			<div class="hero-unit">


				<%
					String myName = request.getParameter("oldUsername");
					Member m = MemberDAO.retrieve(myName);
				%>

				<center>
					<form action="/admin/edit" method="POST">

						<fieldset>

							<table>
								<input type="hidden" name=oldUsername value="<%=myName%>">
								<tr>
									<td><label for="newUsername"><b>Username</b></td>
									<td><input type="text" name="newUsername"
										value=<%=myName%> size="30"></label></td>
								</tr>

								<tr>
									<td><label for="newStatus"><b>Status</b></td>
									<td><input type="text" name="newStatus"
										value=<%=m.getStatus()%> size="30"></label></td>
								</tr>
								<tr>
									<td><label for="newHighScore"><b>Score</b></td>
									<td><input type="text" name="newHighScore"
										value=<%=m.getHighScore()%> size="30"></label></td>
								</tr>
							</table>
						</fieldset>

						<br> <br>


						<button type="submit" class="btn btn-warning">Save</button>
						<a href="./adminHomepage.jsp" class="btn">Cancel</a>
					</form>

				</center>
			</div>

		</div>


	</div>
</html>