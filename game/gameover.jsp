<head>
<%@ page import="java.util.*,entity.*,dao.* "%>
<meta charset="utf-8">
<title>Whack-A-Junk!</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">


<!-- Le styles -->
<link href="../css/bootstrap.css" rel="stylesheet">
<link href="../css/bootstrap-modal.css" rel="stylesheet">
<style type="text/css">
.hero-unit {
	padding: 940px;
	margin-bottom: 940px;
	background-image: url(/img/gameover.jpg);
	background-repeat: no-repeat;
	-webkit-border-radius: 6px;
	-moz-border-radius: 6px;
	border-radius: 6px;
}

.modal-header .close {
	color: #ffffff;
}

.modal-header {
	background-color: #000000;
	color: #ffffff;
}

.modal-footer {
	padding: 13px 14px 14px;
	padding-top: 13px;
	padding-right: 14px;
	padding-bottom: 14px;
	padding-left: 14px;
	background-image: url(../img/walkingbackground.jpg);
	background-repeat: no-repeat;
}

#screenshot {
	position: absolute;
	border: 1px solid #ccc;
	background: #333;
	padding: 10px;
	display: none;
	color: #fff;
}
</style>
<link href="../css/bootstrap-responsive.css" rel="stylesheet">
<link rel="stylesheet" href="../css/bootstrap.min.css">
</head>


<body>

	<div class="container">
		<%
			String score = (String) session.getAttribute("gameScore");
			String addStatus = (String) session.getAttribute("added");
		%>
		<h1>
			Your Score:
			<%=score%></h1> <br>
			<% if(addStatus == null) {%>
			<form action="/game/addNewScore" method="post">
				<input type="hidden" name="score" value=<%=score%>>
				<table>
					<tr>
						<td>Add your score:</td>
						<td><input name="name" value="" type="text"
							autocomplete="on" placeholder="Enter your name..">
						</td>
						<td><button type="submit" class="btn btn-primary large">Add!</button></td>
					</tr>
				</table>
			</form>
			<%}%>
		<div class="span8 hero-unit">
			<div class="row">
				<br> <br> <br> <br> <br> <br> <br>
				<br> <br> <br> <br> <br> <br> <br>
				<br> <br> <br> <br> <br> <a
					href="<%=request.getContextPath()%>/game/quitGame" align="center"
					button type="button" class="btn btn-primary btn-large"
					data-loading-text="loading..."> Home</a> &nbsp&nbsp <a
					data-toggle="modal" href="#viewrecipes"
					class="btn btn-primary btn-large">View Ingredients</a>
				</td>
				<div id="viewrecipes" class="modal hide fade in"
					style="display: none;">
					<div class="modal-header">
						<a class="close" data-dismiss="modal">X</a>
						<h3 align="center">View Ingredients</h3>
					</div>
					<div class="modal-body">
						<h4>A list of healthy ingredients to choose from:</h4>

						<div id="myCarousel" class="carousel slide">
							<ol class="carousel-indicators">
								<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
								<li data-target="#myCarousel" data-slide-to="1"></li>
								<li data-target="#myCarousel" data-slide-to="2"></li>
								<li data-target="#myCarousel" data-slide-to="3"></li>
								<li data-target="#myCarousel" data-slide-to="4"></li>
								<li data-target="#myCarousel" data-slide-to="5"></li>
							</ol>
							<div class="carousel-inner">
								<div class="item active">
									<center>
										<a href="/nutrition/appleInfo.jsp" class="screenshot"
											rel="../img/applepopup.jpg"
											title="Click to learn more about apple!"> <img
											src="../img/apple.jpg" height="110" width="240">
										</a>
									</center>
								</div>
								<div class="item">
									<center>
										<a href="../nutrition/bananaInfo.jsp" class="screenshot"
											rel="../img/bananapopup.jpg"
											title="Click to learn more about banana!"> <img
											src="../img/Banana.jpg" height="100" width="280">
										</a>
									</center>
								</div>
								<div class="item">
									<center>
										<a href="/nutrition/broccoliInfo.jsp" class="screenshot"
											rel="../img/broccolipopup.jpg"
											title="Click to learn more about broccoli!"> <img
											src="../img/Broccoli.jpg" height="120" width="320">
										</a>
									</center>
								</div>
								<div class="item">
									<center>
										<a href="../nutrition/carrotInfo.jsp" class="screenshot"
											rel="../img/carrotpopup.jpg"
											title="Click to learn more about carrot!"> <img
											src="../img/Carrot.jpg" height="100" width="290">
										</a>
									</center>
								</div>
								<div class="item">
									<center>
										<a href="../nutrition/mushroomInfo.jsp" class="screenshot"
											rel="../img/mushroompopup.jpg"
											title="Click to learn more about mushroom!"> <img
											src="../img/Mushroom.jpg" height="80" width="390">
										</a>
									</center>
								</div>
								<div class="item">
									<center>
										<a href="../nutrition/orangeInfo.jsp" class="screenshot"
											rel="../img/orangepopup.jpg"
											title="Click to learn more about orange!"> <img
											src="../img/Orange.jpg" height="80" width="290">
										</a>
									</center>
								</div>
							</div>
							<a class="left carousel-control" href="#myCarousel"
								data-slide="prev">&lsaquo;</a> <a class="right carousel-control"
								href="#myCarousel" data-slide="next">&rsaquo;</a>
						</div>

					</div>
					<div class="modal-footer">
						<a href="#" class="btn btn-primary btn-large" data-dismiss="modal">Close</a>
					</div>
					<div id='fb-root'>
					<p>
						<a onclick='postToFeed();'>Post to Feed</a>
					</p>
					<p id='msg'></p>
					<script>
						window.fbAsyncInit = function() {
							// init the FB JS SDK
							FB
									.init({
										appId : 'YOUR_APP_ID', // App ID from the App Dashboard
										channelUrl : 'http://teamkolaverdi-whackajunk.appspot.com/game/gameover.jsp', // Channel File for x-domain communication
										status : true, // check the login status upon init?
										cookie : true, // set sessions cookies to allow your server to access the session?
										xfbml : true
									// parse XFBML tags on this page?
									});

							// Additional initialization code such as adding Event Listeners goes here

						};

						// Load the SDK's source Asynchronously
						// Note that the debug version is being actively developed and might 
						// contain some type checks that are overly strict. 
						// Please report such bugs using the bugs tool.
						(function(d, debug) {
							var js, id = 'facebook-jssdk', ref = d
									.getElementsByTagName('script')[0];
							if (d.getElementById(id)) {
								return;
							}
							js = d.createElement('script');
							js.id = id;
							js.async = true;
							js.src = "//connect.facebook.net/en_US/all"
									+ (debug ? "/debug" : "") + ".js";
							ref.parentNode.insertBefore(js, ref);
						}(document, /*debug*/false));
					</script>
					</div>
				</div>
				<!-- .hero-unit -->
				</tr>
				</table>
			</div>
		</div>
	</div>

	<!-- .container -->
	<script type="text/javascript" src="../js/jquery.js"></script>
	<script src="../js/bootstrap-transition.js"></script>
	<script src="../js/bootstrap-alert.js"></script>
	<script src="../js/bootstrap-modal.js"></script>
	<script src="../js/bootstrap-dropdown.js"></script>
	<script src="../js/bootstrap-scrollspy.js"></script>
	<script src="../js/bootstrap-tab.js"></script>
	<script src="../js/bootstrap-tooltip.js"></script>
	<script src="../js/bootstrap-popover.js"></script>
	<script src="../js/bootstrap-button.js"></script>
	<script src="../js/bootstrap-carousel.js"></script>
	<script src="../js/bootstrap-typeahead.js"></script>
	<script src="../js/jquery.js"></script>
	<script src="../js/main.js"></script>
	<script src='http://connect.facebook.net/en_US/all.js'></script>
</body>
</html>