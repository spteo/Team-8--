<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%
	String errorMsg = (String)request.getAttribute("errorMsg");
%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Whack-A-Junk :: Administrator Page</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
</script>
<meta name="description"
	content="Twitter Bootstrap Basic Tab Based Navigation Example">
</head>
<body>
	<div class="container">
		<h1 align="center">Whack-A-Junk Admin Page</h1>
		<!-- Main hero unit for a primary marketing message or call to action -->
		<div class="hero-unit">
			<div>
				<%
					if(errorMsg != null){
				%>
						<font color="red"><b><%=errorMsg%><b></font>
				<%
					}
				%>
			</div>
			<form class="signin" action="/authenticateServlet" method="post">
				<table>
					<tr>
						<td>Username: &nbsp </td>
						<td><input id="email" name="email" value="" type="text"
							autocomplete="on" placeholder="Enter your username...">
						</td>
					</tr>
					<tr>
						<td>Password: &nbsp </td>
						<td>
						<input id="password" name="password" value="" type="password"
							placeholder="Enter your password...">
						</td>
					</tr>
				</table>
				<br>
				<button type="submit" class="btn btn-primary large">Login</button>
				<button class="btn btn-warning large" type="reset">Reset</button>
			</form>

		</div>

		<!-- Example row of columns -->
		<hr>
		<footer>
		<p>&copy; G1-T8 2013 Team Kola Veri Di </p>
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
</body>
</html>