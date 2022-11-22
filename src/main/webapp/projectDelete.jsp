<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Delete Project</title>

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
  	<%
	String id = request.getParameter("pid");
	String pname = request.getParameter("pname");
	String startDate = request.getParameter("startDate");
	String dueDate = request.getParameter("dueDate");
	String pDescription = request.getParameter("pDescription");
	String pManager = request.getParameter("hid");
	%>
	
	<header class="p-3 ">
		<div class="container">
			<div
				class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
				
				<ul
					class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
					<li><a href="#" class="nav-link px-2 text-secondary">Manager Dashboard</a></li>
					<li><a href="#" class="nav-link px-2 text-secondary"> / Projects </a></li>
					<li><a href="#" class="nav-link px-2 text-secondary">/  Project Details ( <%=pname %> )</a></li>
					<li><a href="#" class="nav-link px-2 text-prymary"> /  Delete Project</a></li>
				</ul>
			</div>
		</div>
	</header>
	
	<div class="px-4 py-5  text-center">
		<img class="d-block mx-auto mb-4" src="images/icons8-delete-96.png"
			alt="">
		<h1 class="display-5 fw-bold">DELETE PROJECT?</h1>
		<div class="col-lg-6 mx-auto">
			<p class="lead mb-4">This item will be deleted immediately. You can't undo this action. </p>
		</div>
	</div>
	
	<%-- <form action="delete" method = "POST">
		Project ID <br>
		<input type = "text" name = "pID"  value = "<%=id%>" readonly> <br>
		Project Name <br>
		<input type = "text" name = "pname" value = "<%=pname%>" readonly> <br>
		Project Description  <br>
		<input type = "text" name = "pDescription" value = "<%=pDescription%>" readonly><br>
		<br>
		Project Manager ID <br>
		<input type = "text" name = "mID"  value = "<%=pManager%>" readonly> <br>
		
		<input type = "submit" name = "submit" value = "Delete">
	</form> --%>
		<div id="mmenu_screen" class="container-fluid main_container d-flex justify-content-center" >
		<div class="row flex-fill">
		
		<div class="col-sm-4 mmenu_screen--direktaction flex-fill">
				
			</div>
			
			<div class="col-sm-4 h-100">
				<div class="card">
					<div class="card-body">
					
					<form action="delete" method = "POST">
							<div class="mb-3" Style = "Display:none;">
								<label class="form-label" >Project ID</label> 
								<input class = "form-control" type = "text" name = "pID"  value = "<%=id%>" readonly> 
							</div>
							
							<div class="mb-3">
								<label class="form-label">Project Name</label> 
								<input class = "form-control"  type = "text" name = "pname" value = "<%=pname%>" readonly> 
							</div>
							
							<div class="mb-3">
								<label class="form-label">Project Description</label> 
								<input class = "form-control"  type = "text" name = "pDescription" value = "<%=pDescription%>" readonly>
							</div>
							
							<div class="mb-3" Style = "Display:none;">
								<label class="form-label" >Project Manager ID</label> 
								<input class = "form-control" type = "text" name = "mID"  value = "<%=pManager%>" readonly>
							</div>
							
							<input class="w-100 btn btn-danger" type = "submit" name = "submit" value = "Yes, Delete">
							</form>
					
					</div>
				</div>
			</div>
			
			<div class="col-sm-4 mmenu_screen--direktaction flex-fill">
				
			</div>
		</div>
	</div>
	
	<footer class="text-muted text-center py-5">
		<div class="container">
			<p class="mb-1">This is an Online Staff Management System created
				by SLIIT students.</p>
			<p class="mb-0">Owner : IT21251900</p>
		</div>
	</footer>
</body>
</html>