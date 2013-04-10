<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<%@ page import="java.util.*,entity.*,dao.* "%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Whack-A-Junk!</title>
<link rel="stylesheet" href="../css/bootstrap.min.css">
</script>
<meta name="description"
	content="Twitter Bootstrap Basic Tab Based Navigation Example">


<style type="text/css">

body, a, a:hover {cursor: url(/img/ham.cur), auto;
}</style></a>
</style>
</head>
<body>
	<div class="container">
		<h1 align="center">Whack-A-Junk!</h1>

		<!-- Main hero unit for a primary marketing message or call to action -->
		<div class="hero-unit">
			<div class="row">
				<%
					//get the score
					String score = (String)session.getAttribute("gameScore");
					if(score == null){
						score="0";
					}
					
					//get the number of lives
					String numOfLives = (String)session.getAttribute("numberOfLives");
					if(numOfLives == null){
						int num = 3;
						numOfLives = "3"; %>
				<b align="left">Your Score: <%=score%>
				</b>
				<%for(int i = 0; i < num; i++){
						%>
				<img src="../img/1heart.png" align="right" height="50" width="50">
				<%
						}
					} else {
						int num = Integer.parseInt(numOfLives); %>
				<b align="left">Your Score: <%=score%>
				</b>
				<% for(int i = 0; i < num; i++){
						%>
				<img src="../img/1heart.png" align="right" height="50" width="50">
				<%
						}
					}					
					FoodDataManager fdm = new FoodDataManager();
					ArrayList<Food> foodList = fdm.retrieveAllFood();
					Random r1 = new Random();
					Food f1 = foodList.get(r1.nextInt(foodList.size()));
					Food f2 = foodList.get(r1.nextInt(foodList.size()));
					Food f3 = foodList.get(r1.nextInt(foodList.size()));
					Food f4 = foodList.get(r1.nextInt(foodList.size()));
					Food f5 = foodList.get(r1.nextInt(foodList.size()));
					Food f6 = foodList.get(r1.nextInt(foodList.size()));
					Food f7 = foodList.get(r1.nextInt(foodList.size()));
					Food f8 = foodList.get(r1.nextInt(foodList.size()));
					Food f9 = foodList.get(r1.nextInt(foodList.size()));
				%>
				<br>
				<table align="center">
					<tr>
						<td><a
							href="<%=request.getContextPath()%>/game/validateMove?lives=<%=numOfLives%>&score=<%=score%>&foodType=<%=f1.getFoodStatus()%>">
								<img src="<%=f1.getImagePath()%>" height="120" width="120"></td>
						<td><a
							href="<%=request.getContextPath()%>/game/validateMove?lives=<%=numOfLives%>&score=<%=score%>&foodType=<%=f2.getFoodStatus()%>">
								<img src="<%=f2.getImagePath()%>" height="120" width="120"></td>
						<td><a
							href="<%=request.getContextPath()%>/game/validateMove?lives=<%=numOfLives%>&score=<%=score%>&foodType=<%=f3.getFoodStatus()%>">
								<img src="<%=f3.getImagePath()%>" height="120" width="120"></td>
					</tr>
					<tr>
						<td><a
							href="<%=request.getContextPath()%>/game/validateMove?lives=<%=numOfLives%>&score=<%=score%>&foodType=<%=f4.getFoodStatus()%>">
								<img src="<%=f4.getImagePath()%>" height="120" width="120"></td>
						<td><a
							href="<%=request.getContextPath()%>/game/validateMove?lives=<%=numOfLives%>&score=<%=score%>&foodType=<%=f5.getFoodStatus()%>">
								<img src="<%=f5.getImagePath()%>" height="120" width="120"></td>
						<td><a
							href="<%=request.getContextPath()%>/game/validateMove?lives=<%=numOfLives%>&score=<%=score%>&foodType=<%=f6.getFoodStatus()%>">
								<img src="<%=f6.getImagePath()%>" height="120" width="120"></td>
						</td>
					</tr>
					<tr>
						<td><a
							href="<%=request.getContextPath()%>/game/validateMove?lives=<%=numOfLives%>&score=<%=score%>&foodType=<%=f7.getFoodStatus()%>">
								<img src="<%=f7.getImagePath()%>" height="120" width="120"></td>
						<td><a
							href="<%=request.getContextPath()%>/game/validateMove?lives=<%=numOfLives%>&score=<%=score%>&foodType=<%=f8.getFoodStatus()%>">
								<img src="<%=f8.getImagePath()%>" height="120" width="120"></td>
						<td><a
							href="<%=request.getContextPath()%>/game/validateMove?lives=<%=numOfLives%>&score=<%=score%>&foodType=<%=f9.getFoodStatus()%>">
								<img src="<%=f9.getImagePath()%>" height="120" width="120"></td>
					</tr>
				</table>
				<div>
					<a href="<%=request.getContextPath()%>/game/quitGame" align="center" button type="button"
							class="btn btn-primary btn-large">
							Quit</a> 
				</div>
			</div>
		</div>

		<!-- Example row of columns -->
		<hr>
		<footer>
		<p>&copy; G1-T8 2013 Team Kola Veri Di</p>
		</footer>
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