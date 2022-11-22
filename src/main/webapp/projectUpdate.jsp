<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Project</title>


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
<body >

	<%
	String id = request.getParameter("pid");
	String pname = request.getParameter("pname");
	String startDate = request.getParameter("startDate");
	String dueDate = request.getParameter("dueDate");
	String pDescription = request.getParameter("pDescription");
	String pManager = request.getParameter("hid");
	String date1= startDate.substring(0, 10);
	String date2= dueDate.substring(0, 10);
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
					<li><a href="#" class="nav-link px-2 text-prymary"> /  Update Project</a></li>
				</ul>
			</div>
		</div>
	</header>
	
	<div class="px-4 py-5 text-center">
		<img class="d-block mx-auto mb-4" src="images/icons8-renew-96.png"
			alt="">
		<h1 class="display-5 fw-bold">UPDATE PROJECT</h1>
		<div class="col-lg-6 mx-auto">
			<p class="lead mb-4">Here You can update your project details.</p>
		</div>
	</div>
	
	<div id="mmenu_screen" class="container-fluid main_container d-flex justify-content-center" >
		<div class="row flex-fill">
		
		<div class="col-sm-4 mmenu_screen--direktaction flex-fill">
				
			</div>
			
			<div class="col-sm-4 h-100">
				<div class="card">
					<div class="card-body">

					<form action="update" method = "POST">
					
						<div class="mb-3" Style = "Display:none;">
							<label for="exampleInputEmail1" class="form-label">Project ID </label><br>
							<input class = "form-control" type = "text" name = "pID"  value = "<%=id%>" readonly>
						</div>
						
						<label class="form-label">Project Name</label>
						<input class = "form-control" type = "text" name = "pname" value = "<%=pname%>">
						 
						<label class="form-label">Project Start Date</label>
						<input class = "form-control"type = "text" value = "<%=date1%>" readonly>
						
						<label class="form-label">Project Due Date</label>
						<input class = "form-control" type = "text" value = "<%=date2%>" readonly>
						
						<label class="form-label">Project Description</label> 
						<input class = "form-control" type = "text" name = "pDescription" value = "<%=pDescription%>">
						
						<div class="mb-3" Style = "Display:none;">
							<label for="exampleInputEmail1" class="form-label">Project manager </label><br>
							<input class = "form-control" type = "text" name = "mID" value = "<%=pManager%>" readonly>
						</div>
						<br>

						<input  class="w-100 btn btn-primary"  type = "submit" name = "submit" value = "Update Project">
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
    <p class="mb-1">This is an Online Staff Management System created by SLIIT students.</p>
    <p class="mb-0">Owner : IT21251900 </p>
  </div>
</footer>
</body>
</html>