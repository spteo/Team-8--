<head>
<%@ page import="java.util.*,entity.*,dao.* "%>
<meta charset="utf-8">
<title>Whack-A-Junk!</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">
<script language="javascript" type="text/javascript" src="http://lablogic.net/scripts/soundplayer/audio_o.js"></script>
<body onload='play("../sound/homepage.mp3")'>
					SOUND:
<a href="#" onclick='play("../sound/homepage.mp3")'>PLAY</a>/
<a href="#" onclick='stop("../sound/homepage.mp3")'>STOP</a>
<!-- Le styles -->
<link href="/css/bootstrap.css" rel="stylesheet">
<link href="css/bootstrap-modal.css" rel="stylesheet">
<style type="text/css">
.hero-unit {
	padding: 940px;
	margin-bottom: 940px;
	background-image: url(img/animated.gif);
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
    background-image: url(img/walkingbackground.jpg);
    background-repeat: no-repeat;
}
#screenshot{
	position:absolute;
	border:1px solid #ccc;
	background:#333;
	padding:10px;
	display:none;
	color:#fff;
}
</style>
<link href="/css/bootstrap-responsive.css" rel="stylesheet">
<link rel="stylesheet" href="css/bootstrap.min.css">
</head>


<body>

	<div class="container">

		<div class="span8 hero-unit">

			<table class="span8">
			
				<tr>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br>
					<br><p>
					<td><a href="/game/whackajunk.jsp" button type="button" class="btn btn-primary btn-large"
						data-loading-text="loading...">Play</a></td>


					<td><div id="instruction" class="modal hide fade in"
							style="display: none;">
							<div class="modal-header">
								<a class="close" data-dismiss="modal">X</a>
								<h3 align="center">How to play?</h3>
							</div>
							<div class="modal-body">
								<ul class="nav nav-tabs">
									<li class="active"><a href="#tab1" data-toggle="tab"><h4>1</h4></a></li>
									<li><a href="#tab2" data-toggle="tab"><h4>2</h4></a></li>
									<li><a href="#tab3" data-toggle="tab"><h4>3</h4></a></li>
									<li><a href="#tab4" data-toggle="tab"><h4>4</h4></a></li>
								</ul>
								<div class="tab-content">
									<div class="tab-pane active" id="tab1">

										<h4>Each gameplay gives you 3 lives</h4><br> <br> <img
											src="img/hearts.jpg" height="60" width="160">

									</div>
									<div class="tab-pane" id="tab2">
										<h4>Hit the junk food to earn 10 points</h4><br> <br> <img
											src="img/junkfood.jpg" height="80" width="500">

									</div>
									<div class="tab-pane" id="tab3">

										<h4>Hit the healthy food you will lose your life.</h4><br> <br>
										<img src="img/healthyfood.jpg" height="80" width="500">
									</div>
									<div class="tab-pane" id="tab4">

										<h4>When you reach 0 life, game is over.</h4><br> <br> <img
											src="img/zerolife.jpg" height="60" width="160">

									</div>
								</div>

							</div>
							<div class="modal-footer">
								<a href="#" class="btn btn-primary btn-large"
									data-dismiss="modal">Close</a>
							</div>
						</div> <a data-toggle="modal" href="#instruction"
						class="btn btn-primary btn-large">Instructions</a></td>


					<td><div id="scoreboard" class="modal hide fade in"
							style="display: none;">
							<div class="modal-header">
								<a class="close" data-dismiss="modal">X</a>
								<h3 align="center">High Score</h3>
							</div>
							<div class="modal-body">
								<%
									List<Member> memberList = MemberDAO.retrieveAllMembers();
									Collections.sort(memberList);
									if (memberList.size() == 0) {
								%>
								<b>There are no new members in the database yet!</b>
								<%
									} else {
								%>
								<table class="table table-striped">
									<thead>
										<tr>
											<th>Ranking</th>
											<th>Name</th>
											<th>Points</th>
										</tr>
									</thead>
									<%
										for (int i = 0; i < memberList.size(); i++) {
												Member temp = memberList.get(i);
												String tempUsername = temp.getUsername();
												int tempHighscore = temp.getHighScore();
												int rank = i + 1;
												if (tempHighscore > 0) {
									%>

									<tbody>
										<tr>
											<th><%=rank%></th>
											<th><%=tempUsername%></th>
											<th><%=tempHighscore%></th>
										</tr>
									</tbody>

									<%
										}
											}
									%>
								</table>
								<%
									}
								%>

							</div>
							<div class="modal-footer">
								<a href="#" class="btn btn-primary btn-large"
									data-dismiss="modal">Close</a>
							</div>
						</div> <a data-toggle="modal" href="#scoreboard"
						class="btn btn-primary btn-large">Scoreboard</a></td>

					<td><div id="viewrecipes" class="modal hide fade in"
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
									<a href="/nutrition/appleInfo.jsp" class="screenshot" rel="img/applepopup.jpg" title="Click to learn more about apple!">
												<img src="img/apple.jpg" height="110" width="240">
											</a>
											</center>
										</div>
										<div class="item">
											<center>
											<a href="/nutrition/bananaInfo.jsp" class="screenshot" rel="img/bananapopup.jpg" title="Click to learn more about banana!">
												<img src="img/banana.jpg" height="100" width="280">
											</a>	
											</center>
										</div>
										<div class="item">
											<center>
											<a href="/nutrition/broccoliInfo.jsp" class="screenshot" rel="img/broccolipopup.jpg" title="Click to learn more about broccoli!">
												<img src="img/Broccoli.jpg" height="120" width="320">
											</a>
											</center>
										</div>
										<div class="item">
											<center>
											<a href="/nutrition/carrotInfoList.jsp" class="screenshot" rel="img/carrotpopup.jpg" title="Click to learn more about carrot!">
												<img src="img/carrot.jpg" height="100" width="290">
											</a>
											</center>
										</div>
										<div class="item">
											<center>
											<a href="/nutrition/mushroomInfo.jsp" class="screenshot" rel="img/mushroompopup.jpg" title="Click to learn more about mushroom!">
												<img src="img/mushroom.jpg" height="80" width="390">
											</a>	
											</center>
										</div>
										<div class="item">
											<center>
											<a href="/nutrition/orangeInfo.jsp" class="screenshot" rel="img/orangepopup.jpg" title="Click to learn more about orange!">
												<img src="img/orange.jpg" height="80" width="290">
											</a>	
											</center>
										</div>
									</div>
									<a class="left carousel-control" href="#myCarousel"
										data-slide="prev">&lsaquo;</a> <a
										class="right carousel-control" href="#myCarousel"
										data-slide="next">&rsaquo;</a>
								</div>

							</div>
							<div class="modal-footer">
								<a href="#" class="btn btn-primary btn-large" data-dismiss="modal">Close</a>
							</div>
						</div> <a data-toggle="modal" href="#viewrecipes"
						class="btn btn-primary btn-large">View Ingredients</a></td>

					</div>

					<!-- .hero-unit -->
				</tr>
			</table>

		</div>
		<!-- .container -->
		<script type="text/javascript" src="js/jquery.js"></script>
		<script src="js/bootstrap-transition.js"></script>
		<script src="js/bootstrap-alert.js"></script>
		<script src="js/bootstrap-modal.js"></script>
		<script src="js/bootstrap-dropdown.js"></script>
		<script src="js/bootstrap-scrollspy.js"></script>
		<script src="js/bootstrap-tab.js"></script>
		<script src="js/bootstrap-tooltip.js"></script>
		<script src="js/bootstrap-popover.js"></script>
		<script src="js/bootstrap-button.js"></script>
		<script src="js/bootstrap-carousel.js"></script>
		<script src="js/bootstrap-typeahead.js"></script>
		<script src="js/jquery.js"></script>
		<script src="js/main.js"></script>
</body>
</html>