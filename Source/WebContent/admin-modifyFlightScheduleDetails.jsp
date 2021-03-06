<!-- JSP headers -->
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="model.*" %>

<!DOCTYPE html>
<html lang="en">

	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<meta name="description" content="">

		<title>SP Airlines | Admin Dashboard | Modify Flight Schedule</title>

		<link rel="shortcut icon" type="image/x-icon" href="images/favicon.ico">
		<link href='http://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,300italic,400italic,600italic' rel='stylesheet' type='text/css'>			
		<link rel="stylesheet" href="css/bootstrap.min.css">
		<link rel="stylesheet" href="css/bootstrap-theme.css" media="screen" >
		<link rel="stylesheet" href="css/main.css">
		<link rel="stylesheet" href="css/datepicker/datepicker.css">
		
		<!-- HTML5 shim and Respond.js IE8 support of HTML5 elements and media queries -->
		<!--[if lt IE 9]>
		<script src="js/html5shiv.js"></script>
		<script src="js/respond.min.js"></script>
		<![endif]-->
	</head>

	<body>
	
		<%
			
			String firstName = "";
			String lastName = "";
				
			if (session.getAttribute("user") == null) {
				response.sendRedirect("login.html");
			} else {
				User u = (User)	session.getAttribute("user");
				firstName = u.getFirstName();
				lastName = u.getLastName();
			}
		
		%>

		<!-- Navbar -->
		<div class="navbar navbar-inverse navbar-fixed-top headroom" >
			<div class="container">
			
				<!-- Logo + Button for smaller screens -->
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span> 
					<span class="icon-bar"></span> 
					</button>
					<a class="navbar-brand" href="index.jsp"><img src="images/logo.png" alt="SP Airlines"></a>
				</div>
				
				<!-- Right links -->
				<div class="navbar-collapse collapse">
					<ul class="nav navbar-nav pull-right">
						<li><a href="index.jsp">Home</a></li>
						<li><a href="booking.jsp">Booking</a></li>
						<li><a class="btn" href="javascript:void(0)">Logged in as: <%=firstName%> <%=lastName%></a></li>
						<li><a class="btn" href="Logout">Logout</a></li>
					</ul>
				</div>

			</div>
		</div>

	<!-- Header placeholder -->
	<header id="head" class="secondary"></header>

	<!-- Container for main content -->
	<div class="container">

		<!-- Breadcrumb -->
		<ol class="breadcrumb">
			<li><a href="index.jsp">Home</a></li>
			<li><a href="admin-dashboard.jsp">Admin Dashboard</a></li>
			<li class="active">Modify Flight Schedule</li>
		</ol>

		<div class="row" id="bottom">

			<!-- Sidebar START -->
			<aside class="col-md-4 sidebar sidebar-left">

				<div class="row widget">
					<div class="col-xs-12">
						<h1 class="page-title">Quick Links</h1>
						<hr>
						
						<!-- Form START -->
						<form id="sideLinks">
							<fieldset>
								<legend>Add New</legend>
								<table class="fixed">
									<tr>
										<td><a href="admin-addNewAircraft.jsp"><img src="images/icons/aircraft.png" alt="Add New Aircraft"></a></td>
										<td><a href="admin-addNewFlightSchedule.jsp"><img src="images/icons/fs.png" alt="Add New Flight Schedule"></a></td>
									</tr>
									<tr>
										<td>Add New Aircraft</td>
										<td>Add New Flight Schedule</td>
									</tr>
								</table>
							</fieldset><br>

							<fieldset>
								<legend>Modify Existing</legend>
								<table class="fixed">
									<tr>
										<td><a href="admin-modifyAircraft.jsp"><img src="images/icons/aircraft.png" alt="Modify Aircraft"></a></td>
										<td><a href="admin-modifyFlightScheduleFilter.jsp"><img src="images/icons/fs-active.png" alt="Modify Flight Schedule"></a></td>
									</tr>
									<tr>
										<td>Modify Aircraft</td>
										<td>Modify Flight Schedule</td>
									</tr>
								</table>
							</fieldset><br>

							<fieldset>
								<legend>Delete</legend>
								<table class="fixed">
									<tr>
										<td><a href="admin-deleteAircraft.jsp"><img src="images/icons/aircraft.png" alt="Delete Aircraft"></a></td>
										<td><a href="admin-deleteFlightScheduleFilter.jsp"><img src="images/icons/fs.png" alt="Delete Flight Schedule"></a></td>
									</tr>
									<tr>
										<td>Delete Aircraft</td>
										<td>Delete Flight Schedule</td>
									</tr>
								</table>
							</fieldset><br>
							
							<fieldset>
								<legend>Reports</legend>
								<table class="fixed">
									<tr>
										<td><a href="admin-viewBookingFilter.jsp"><img src="images/icons/booking.png" alt="View Bookings"></a></td>
										<td><a href="admin-viewTopFlightRoute.jsp"><img src="images/icons/top.png" alt="View Top Flight Route"></a></td>
									</tr>
									<tr>
										<td>View Bookings</td>
										<td>View Top Flight Route</td>
									</tr>
								</table>
							</fieldset><br><br>
							
						</form>
						<!-- Form END -->
					</div>
				</div>
			</aside>
			<!-- Sidebar END -->
			
			<article class="col-md-1"></article>
			
			<!-- Main content START -->
			<article class="col-md-7 maincontent">
				<header class="page-header">
					<h1 class="page-title">Modify Flight Schedule</h1>
				</header>
				
				<%
					int fsID = Integer.parseInt(request.getParameter("fsID"));
						
					out.println("<strong>Details for Flight Schedule ID " + fsID + ":</strong><br>");
					
					FlightSchedule fs = DBSearch.singleFSSearch(fsID);
					
					out.println("<table class='searchResults'>");
					
					String depart = fs.getDepart();
					String departCode = fs.getDepartCode();
					String departCity = fs.getDepartCity();
					String departCountry = fs.getDepartCountry();
					String departDate = fs.getDepartDate();
					String departTime = fs.getDepartTime();
					String arrive = fs.getArrive();
					String arriveCode = fs.getArriveCode();
					String arriveCity = fs.getArriveCity();
					String arriveCountry = fs.getArriveCountry();
					String arriveDate = fs.getArriveDate();
					String arriveTime = fs.getArriveTime();
					String flightTime = fs.getFlightTime();
					double economyCost = fs.getEconomyCost();
					double businessCost = fs.getBusinessCost();
					double firstCost = fs.getFirstCost();
					String flightNum = fs.getFlightNum();
					int aircraftID = fs.getAircraftID();
					
					out.println("<tr class='breakRow'>");	
					out.println("<td><strong>Flight Schedule ID " + fsID + "</strong></td>");
					out.println("<td><strong>Aircraft ID " + aircraftID + " | " + flightNum + "</strong> - " + flightTime + "</td>");
					out.println("</tr>");
					
					out.println("<tr>");	
					out.println("<td><strong>" + depart + " (" + departCode + ")</strong></td>");
					out.println("<td><strong>" + arrive + " (" + arriveCode + ")</strong></td>");
					out.println("</tr>");
					
					out.println("<tr>");
					out.println("<td>" + departCity + ", " + departCountry + "</td>");
					out.println("<td>" + arriveCity + ", " + arriveCountry + "</td>");
					out.println("</tr>");
					
					out.println("<tr class='breakRow'>");
					out.println("<td>" + departDate + " | " + departTime + "</td>");
					out.println("<td>" + arriveDate + " | " + arriveTime + "</td>");
					out.println("</tr>");
					
					out.println("<tr>");
					out.println("<td>Economy: $" + String.format("%.2f", fs.getEconomyCost()) + "</td>");
					out.println("<td></td>");
					out.println("</tr>");
					
					out.println("<tr>");
					out.println("<td>Business: $" + String.format("%.2f", fs.getBusinessCost()) + "</td>");
					out.println("<td></td>");
					out.println("</tr>");
					
					if (firstCost != 0.00) {
						out.println("<tr>");
						out.println("<td>First: $" + String.format("%.2f", fs.getFirstCost()) + "</td>");
						out.println("<td></td>");
						out.println("</tr>");
					}
					
					out.println("<tr>");
					out.println("<td class='tableBreak'><br></td>");
					out.println("<td class='tableBreak'><br></td>");
					out.println("</tr>");
					
					out.println("</table>");
					
				%>
				
				<strong>Please enter the updated flight schedule details:</strong><br>
				
				<!-- Form START -->
				<form action="ModifyFlightSchedule" method="post">
					<input type="hidden" name="fsID" value="<%=fsID%>">
					<table class="adminFixed">
						<tr>
							<td>Aircraft ID:</td>
							<td><input type="text" name="aircraftID" value="<%=aircraftID%>"></td>
						</tr>
						<tr>
							<td><br></td>
						</tr>
						<tr>
							<td>Departure Airport:</td>
							<td><input type="text" name="depart" value="<%=depart%>" required></td>
						</tr>
						<tr>
							<td>Departure Airport Code:</td>
							<td><input type="text" name="departCode" value="<%=departCode%>" pattern="^[A-Z]{3}$" required></td>
						</tr>
						<tr>
							<td>Departure City:</td>
							<td><input type="text" name="departCity" value="<%=departCity%>" pattern="^[A-Za-z\s]+$" required></td>
						</tr>
						<tr>
							<td>Departure Country:</td>
							<td><input type="text" name="departCountry" value="<%=departCountry%>" pattern="^[A-Za-z\s]+$" required></td>
						</tr>
						<tr>
							<td>Departure Date:</td>
							<td><input type="text" name="departDate" id="departDate" value="<%=departDate%>" pattern="^\d{4}-\d{2}-\d{2}$" required></td>
						</tr>
						<tr>
							<td>Departure Time:</td>
							<td><input type="text" name="departTime" value="<%=departTime%>" pattern="^\d{4}\s[A-Z]{3}[-+]?(\d{1,2})?$" required></td>
						</tr>
						<tr>
							<td><br></td>
						</tr>
						<tr>
							<td>Arrival Airport:</td>
							<td><input type="text" name="arrive" value="<%=arrive%>" required></td>
						</tr>
						<tr>
							<td>Arrival Airport Code:</td>
							<td><input type="text" name="arriveCode" value="<%=arriveCode%>" pattern="^[A-Z]{3}$" required></td>
						</tr>
						<tr>
							<td>Arrival City:</td>
							<td><input type="text" name="arriveCity" value="<%=arriveCity%>" pattern="^[A-Za-z\s]+$" required></td>
						</tr>
						<tr>
							<td>Arrival Country:</td>
							<td><input type="text" name="arriveCountry" value="<%=arriveCountry%>" pattern="^[A-Za-z\s]+$" required></td>
						</tr>
						<tr>
							<td>Arrival Date:</td>
							<td><input type="text" name="arriveDate" id="arriveDate" value="<%=arriveDate%>" pattern="^\d{4}-\d{2}-\d{2}$" required></td>
						</tr>
						<tr>
							<td>Arrival Time:</td>
							<td><input type="text" name="arriveTime" value="<%=arriveTime%>" pattern="^\d{4}\s[A-Z]{3}[-+]?(\d{1,2})?$" required></td>
						</tr>
						<tr>
							<td><br></td>
						</tr>
						<tr>
							<td>Economy Cost:</td>
							<td><input type="text" name="economyCost" value="<%=String.format("%.2f", fs.getEconomyCost())%>" pattern="^[\d.]+$" required></td>
						</tr>
						<tr>
							<td>Business Cost:</td>
							<td><input type="text" name="businessCost" value="<%=String.format("%.2f", fs.getBusinessCost())%>" pattern="^[\d.]+$" required></td>
						</tr>
						<tr>
							<td>First Cost:</td>
							<td><input type="text" name="firstCost" value="<%=String.format("%.2f", fs.getFirstCost())%>" pattern="^[\d.]+$"></td>
						</tr>
						<tr>
							<td><br></td>
						</tr>
						<tr>
							<td>Flight Time:</td>
							<td><input type="text" name="flightTime" value="<%=flightTime%>" pattern="^[\w\s]+$" required></td>
						</tr>
						<tr>
							<td><br></td>
						</tr>
						<tr>
							<td></td>
							<td><input type="submit" value="Submit"></td>
						</tr>
					</table>
				</form>
				<!-- Form END -->

			</article>		
			<!-- Main content END -->	
		</div>
	</div>
	
	<!-- JS libraries -->
	<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<script src="js/headroom.min.js"></script>
	<script src="js/jQuery.headroom.min.js"></script>
	<script src="js/initFS.js"></script>
	<script src="js/datepicker.js"></script>
	
</body>
</html>