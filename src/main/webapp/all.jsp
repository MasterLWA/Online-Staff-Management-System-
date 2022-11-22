<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>


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

<header class="p-3 ">
		<div class="container">
			<div
				class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
				
				<ul
					class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
					<li><a href="#" class="nav-link px-2 text-secondary">Manager Dashboard</a></li>
					<li><a href="#" class="nav-link px-2 text-prymary"> /  Projects</a></li>
				</ul>
			</div>
		</div>
	</header>

<div id="mmenu_screen" class="container-fluid main_container d-flex">
		<div class="row flex-fill">
			<div class="col-sm-4 h-100">
				<div class="card">
					<div class="card-body">
					text 3
					</div>
				</div>
			</div>
			<div class="col-sm-4 h-100">
				<div class="card">
					<div class="card-body">
					 text 1
					</div>
				</div>
			</div>
			<div class="col-sm-4 mmenu_screen--direktaction flex-fill bg-warning">
				<div class="card">
					<div class="card-body">
					 text 2
					</div>
				</div>
			</div>
		</div>
	</div>



	<div class="card">
		<div class="card-body">text 1</div>
	</div>
	

	<div class="px-4 py-5  text-center">
		<img class="d-block mx-auto mb-4" src="images/icons8-tasklist-96.png"
			alt="">
		<h1 class="display-5 fw-bold">PROJECT DETAILS</h1>
		<div class="col-lg-6 mx-auto">
			<p class="lead mb-4">Here You can edit the project details, add
				tasks to the project and you can edit or remove tasks.</p>
		</div>
	</div>

	<footer class="text-muted text-center py-5">
  <div class="container">
    <p class="mb-1">This is an Online Staff Management System created by SLIIT students.</p>
    <p class="mb-0">Owner : IT21251900 </p>
  </div>
</footer>

<%-- <c:url value="projectDelete.jsp" var="prodelete">
		<c:param name="pid" value='<%=resultSet.getString("project_id")%>'></c:param>
		<c:param name="pname" value='<%=resultSet.getString("project_name")%>'></c:param>
</c:url> --%>

</body>
</html>