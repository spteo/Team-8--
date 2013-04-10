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
	<div class="container">
		<h1 align="center">Welcome, Admin!</h1>
		<!-- Main hero unit for a primary marketing message or call to action -->
		<div class="hero-unit">
			<div class="row">
				<div class="span6">
					<%
						if (failedMsg != null) {
					%>
					<div class="alert" align="center">
						<button type="button" class="close" data-dismiss="alert">x</button>
						<strong>Warning!</strong>&nbsp;<%=failedMsg%>
					</div>
					<%
						session.removeAttribute("failMsg");
						}
						if (successMsg != null) {
					%>
					<div class="alert alert-success" align="center">
						<button type="button" class="close" data-dismiss="alert">x</button>
						<strong>Success!</strong>&nbsp;<%=successMsg%>
					</div>
					<%
						session.removeAttribute("successMsg");
						}
					%>
				</div>
				<div class="span6">
					<ul class="nav nav-tabs">
						<li class="active"><a href="#ingredient" data-toggle="tab">Manage Ingredients</a></li>
						<li><a href="#user" data-toggle="tab">Manage Users</a></li>
						<li><a href="#bootstrap" data-toggle="tab">Bootstrap</a></li>
						<title>Whack-A-Junk :: Administrator Page</title>
					</ul>
					<div class="tab-content">
						<div class="tab-pane fade in active" id="ingredient">
							<a data-toggle="modal" href="#addIngredient"
									class="btn btn-primary medium">Add New Ingredient</a>
								<div id="addIngredient" class="modal hide fade in" style="display: none;">
									<div class="modal-header">
										<a class="close" data-dismiss="modal">X</a>
										<h3 align="center">Add New Ingredient</h3>
									</div>
									<div class="modal-body">
										<form action="/admin/addIngredient" method="post" enctype="multipart/form-data">
											Ingredient Name : <br>
											<input type="text" name="newIngredientName"><br>
											Nutritional Information : <br>
											<textarea rows="3" name="nutritionalInformation"></textarea> <br>
											Upload a photo: <input type="file" name="image" /> <br>
											<br>
											<button type="submit" class="btn btn-warning">Save</button>
											<a href="#" class="btn" data-dismiss="modal">Cancel</a>
										</form>
									</div>
								</div>
								
								<br>
								
								
						</div>

						<div class="tab-pane fade" id="user">
							<div>
								<a data-toggle="modal" href="#add"
									class="btn btn-primary medium">Add New User</a>
								<div id="add" class="modal hide fade in" style="display: none;">
									<div class="modal-header">
										<a class="close" data-dismiss="modal">X</a>
										<h3 align="center">Add New User</h3>
									</div>
									<div class="modal-body">
										<form action="/admin/add" method="POST">
											Username : <input type="text" name="newUsername"><br>
											Status : <input type="text" name="newStatus"> <br>
									</div>
									<div class="modal-footer">
										<button type="submit" class="btn btn-warning">Save</button>
										<a href="#" class="btn" data-dismiss="modal">Cancel</a>
										</form>
									</div>
								</div>
							</div>
							<br>

							<table class="table table-striped">
								<tr>
									<th>Username</th>
									<th>Status</th>
									<th>HighScore</th>
									<th colspan="2"><div align="center">Options</div></th>
								</tr>
								<%
									List<Member> allMembers = MemberDAO.retrieveAllMembers();
									Collections.sort(allMembers);
									for (int i = 0; i < allMembers.size(); i++) {
										Member m = allMembers.get(i);
										String mUsername = m.getUsername();
										String mStatus = m.getStatus();
										int mHighScore = m.getHighScore();
								%>
								<tr>
									<td><%=mUsername%></td>

									<td><%=mStatus%></td>
									<td><%=mHighScore%></td>
									<td width="60px"><div align="center">
											<a href="./EditMemberAdmin.jsp?oldUsername=<%=mUsername%>" class="btn btn-primary medium">Edit</a>

										</div></td>


									<td width="60px"><div align="center">
											<a href="./CnfDelete.jsp?username=<%=mUsername%>" class="btn btn-primary medium">Delete</a>
										</div></td>

									</div>
								<tr>
									<%
										}
									%>
								
							</table>
						</div>

						<div class="tab-pane fade" id="bootstrap">
							<form action="../admin/bootstrap" method="post"
								enctype="multipart/form-data">
								Filename: <input type="file" name="data" /> <br>
								<div id="bootstrapping" class="modal hide fade in"
									style="display: none;">
									<div class="modal-header">
										<a class="close" data-dismiss="modal">X</a>
										<h3 align="center">WAIT!</h3>
									</div>
									<div class="modal-body">
										<h4>Sure to proceed with bootstrap?</h4>
										<font color="red">*Boostrap will replace all data in
											the datastore!</font>
									</div>
									<div class="modal-footer">
										<button type="submit" class="btn btn-warning">Yes</button>
										<a href="#" class="btn" data-dismiss="modal">No</a>
									</div>
								</div>
								<a data-toggle="modal" href="#bootstrapping"
									class="btn btn-warning">Bootstrap</a>
								<div align="left">
									<br> <font color="red">*Boostrap will replace all
										data in the datastore!</font>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>

		<!-- Example row of columns -->
		<hr>
		<form action="/logout" method="post">
			<button type="submit" class="btn btn-primary medium">Logout</button>
		</form>
		<footer>
		<p>&copy; G1-T8 2013 Team Kola Veri Di</p>
		</p>
		</footer>
	</div>
	<!-- /container -->

	<!-- Le javascript
    ================================================== -->
	<!-- Placed at the end of the document so the pages load faster -->
	<script src="../js/jquery.js"></script>
	<script src="../js/bootstrap-transition.js"></script>
	<script src="../js/bootstrap-alert.js"></script>
	<script src="../js/bootstrap-modal.js"></script>
	<script src="../js/bootstrap-dropdown.js"></script>
	<script src="../js/bootstrap-scrollspy.js"></script>
	<script src="../js/bootstrap-tab.js"></script>
	<script src="../js/bootstrap-tooltip.js"></script>
	<script src="../js/bootstrap-popover.js"></script>
	<script src="../js/bootstrap-button.js"></script>
	<script src="../js/bootstrap-collapse.js"></script>
	<script src="../js/bootstrap-carousel.js"></script>
	<script src="../js/bootstrap-typeahead.js"></script>
	<script src="../js/jquery.pnotify.js"></script>
	<script src="../js/jquery.pnotify.min.js"></script>
</body>
</html>