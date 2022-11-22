<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Manager Dashboard</title>


<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi"
	crossorigin="anonymous">

<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3"
	crossorigin="anonymous">
</script>
</head>
<body>
	

	<div class="card">
		<div class="card-body">
			<div class="container col-xxl-8 px-4 py-5">
				<div class="row flex-lg-row-reverse align-items-center g-5 py-5">
					<div class="col-10 col-sm-8 col-lg-6">
						<img src="images/4951570_19963.jpg"
							class="d-block mx-lg-auto img-fluid" alt="Bootstrap Themes"
							width="700" height="500" loading="lazy">
					</div>
					<div class="col-lg-6">
						<h1 class="display-5 fw-bold lh-1 mb-3">Explore Your Projects</h1>
						<p class="lead">Quickly</p>
						<div class="d-grid gap-2 d-md-flex justify-content-md-start">
							<form action="view" method = "POST">
							
							<div class="mb-3">
								<label class="form-label">Manager ID</label>
								<input <%-- value='<%=resultSet.getString("staffID")%>'> --%> class = "form-control" type = "text" name = "mID" placeholder = "Input Manger ID">
							</div>
							
							
							<input class="btn btn-primary" type = "submit" name = "submit" value = "My Projects">
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>