<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="com.connection.*"%>
<%@ page import="java.sql.*"%>
<!doctype html>
<html class="no-js" lang="">
<head>

<title>Admin Profile</title>


<link rel="apple-touch-icon" href="https://i.imgur.com/QRAUqs9.png">
<link rel="shortcut icon" href="https://i.imgur.com/QRAUqs9.png">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/normalize.css@8.0.0/normalize.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/font-awesome@4.7.0/css/font-awesome.min.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/gh/lykmapipo/themify-icons@0.1.2/css/themify-icons.css">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/pixeden-stroke-7-icon@1.2.3/pe-icon-7-stroke/dist/pe-icon-7-stroke.min.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/flag-icon-css/3.2.0/css/flag-icon.min.css">
<link rel="stylesheet" href="assets/css/cs-skin-elastic.css">
<link rel="stylesheet" href="assets/css/style.css">

<link
	href='https://fonts.googleapis.com/css?family=Open+Sans:400,600,700,800'
	rel='stylesheet' type='text/css'>

<!-- <script type="text/javascript" src="https://cdn.jsdelivr.net/html5shiv/3.7.3/html5shiv.min.js"></script> -->

</head>
<body>

	<jsp:include page="includes/sidebar.jsp"></jsp:include>

	<jsp:include page="includes/header.jsp"></jsp:include>
	<div class="breadcrumbs">
		<div class="breadcrumbs-inner">
			<div class="row m-0">
				<div class="col-sm-4">
					<div class="page-header float-left">
						<div class="page-title">
							<h1>Dashboard</h1>
						</div>
					</div>
				</div>
				<div class="col-sm-8">
					<div class="page-header float-right">
						<div class="page-title">
							<ol class="breadcrumb text-right">
								<li><a href="dashboard.jsp">Dashboard</a></li>
								<li><a href="admin-profile.jsp">Profile</a></li>
								<li class="active">Admin Profile</li>
							</ol>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="content">
		<div class="animated fadeIn">


			<div class="row">
				<div class="col-lg-6">
					<div class="card"></div>
					<!-- .card -->

				</div>
				<!--/.col-->



				<div class="col-lg-12">
					<div class="card">
						<div class="card-header">
							<strong>Admin </strong> Profile
						</div>
						<p>
							<%
								String message = (String) session.getAttribute("message");
								if (message != null) {
									session.removeAttribute("message");
							%>
						
						<h6>
							<span>Profile updated sucessfully.</span>
						</h6>
						<%
							}
						%>
						</p>
						<div class="card-body card-block">
							<form action="AdminUpdateDetails" method="post">
								<p style="font-size: 16px; color: red" align="center">
									<%
										if (session.getAttribute("uname") != null && session.getAttribute("uname") != "") {
									%>
								</p>
								<%
									int count_total_vehentries = 0;
										Connection con = DBconnection.getConnection();
										Statement st = con.createStatement();
										ResultSet rs = st
												.executeQuery("select * from tbladmin where username='" + session.getAttribute("uname") + "'");
										while (rs.next()) {
								%>


								<div class="row form-group">
									<div class="col col-md-3">
										<label for="text-input" class=" form-control-label">Admin
											Name</label>
									</div>
									<div class="col-12 col-md-9">
										<input class=" form-control" id="adminname" name="adminname"
											type="text" value="<%=rs.getString(2)%>">
									</div>
								</div>
								<div class="row form-group">
									<div class="col col-md-3">
										<label for="email-input" class=" form-control-label">User
											Name</label>
									</div>
									<div class="col-12 col-md-9">
										<input class=" form-control" id="username" name="username"
											type="text" value="<%=rs.getString(3)%>" readonly>
									</div>
								</div>
								<div class="row form-group">
									<div class="col col-md-3">
										<label for="password-input" class=" form-control-label">Contact
											Number</label>
									</div>
									<div class="col-12 col-md-9">
										<input class="form-control " id="contactnumber"
											name="contactnumber" type="text" value="<%=rs.getString(4)%>"
											required="true">
									</div>
								</div>
								<div class="row form-group">
									<div class="col col-md-3">
										<label for="disabled-input" class=" form-control-label">Email</label>
									</div>
									<div class="col-12 col-md-9">
										<input class="form-control " id="email" name="email"
											type="email" value="<%=rs.getString(5)%>" required="true">
									</div>
								</div>


								<%
									}
								%>
								<p style="text-align: center;">
									<button type="submit" class="btn btn-primary btn-sm"
										name="submit">Update</button>
								</p>
							</form>
						</div>

					</div>

				</div>

				<div class="col-lg-6"></div>



			</div>


		</div>
		<!-- .animated -->
	</div>
	<!-- .content -->

	<div class="clearfix"></div>

	<jsp:include page="includes/footer.jsp"></jsp:include>

	</div>
	<!-- /#right-panel -->

	<!-- Right Panel -->

	<!-- Scripts -->
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@2.2.4/dist/jquery.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.14.4/dist/umd/popper.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery-match-height@0.7.2/dist/jquery.matchHeight.min.js"></script>
	<script src="assets/js/main.js"></script>

	<%
		} else {
			response.sendRedirect("admin-login.jsp");
		}
	%>
</body>
</html>
