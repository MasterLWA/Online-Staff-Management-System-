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
	<%@page import="java.sql.DriverManager"%>
	<%@page import="java.sql.ResultSet"%>
	<%@page import="java.sql.Statement"%>
	<%@page import="java.sql.Connection"%>
	
	<%
		String driverName = "com.mysql.jdbc.Driver";
		String url = "jdbc:mysql://localhost:3306/osms";
		String user = "root";
		String pass = "root";
		Connection con;

		try {
			Class.forName(driverName);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		ResultSet resultSet2 = null;
	%>
		
	<%
	String tid = request.getParameter("tid");
	String title = request.getParameter("title");
	String status = request.getParameter("status");
	String pid = request.getParameter("pid");
	String sid = request.getParameter("sid");
	String mid = request.getParameter("mid");
	%>
	
		
	<header class="p-3 ">
		<div class="container">
			<div
				class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start">
				
				<ul
					class="nav col-12 col-lg-auto me-lg-auto mb-2 justify-content-center mb-md-0">
					<li><a href="#" class="nav-link px-2 text-secondary">Manager Dashboard</a></li>
					<li><a href="#" class="nav-link px-2 text-secondary"> / Projects </a></li>
					<li><a href="#" class="nav-link px-2 text-secondary">/  Project Details</a></li>
					<li><a href="#" class="nav-link px-2 text-prymary"> /  Update Task ( <%= title %> )</a></li>
				</ul>
			</div>
		</div>
	</header>
	
	<div class="px-4 py-5 text-center">
		<img class="d-block mx-auto mb-4" src="images/icons8-available-updates-96.png"
			alt="">
		<h1 class="display-5 fw-bold">UPDATE TASK</h1>
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
					
					<form action="tupdate"  method="POST">
						
							<label class="form-label" Style = "Display:none;"><b>ADD NEW TASK</b></label>

							<div class="mb-3" Style = "Display:none;">
								<label class="form-label" >Project ID</label> 
								<input class = "form-control"  "text" name = "task_projectID" value="<%=pid%>" readonly>
							</div>
							
							<div class="mb-3" Style = "Display:none;">
								<label class="form-label" >Project Manager ID</label> 
								<input class = "form-control"  type = "text" name = "mID" value="<%=mid%>" readonly>
							</div>
							
							<div class="mb-3" Style = "Display:none;">
								<label class="form-label" >Task ID</label> 
								<input class = "form-control" type = "text" name = "tID" value="<%=tid%>" readonly>
							</div>
							
							<div class="mb-3">
								<label class="form-label">Task Title</label> 
								<input class = "form-control"  type = "text" name = "task_title"  value="<%=title%>">
							</div>
							
							<div class="mb-3">
								<label class="form-label">Status</label> <br>
								<div id="emailHelp" class="form-text">Current Status</div>
								<input class = "form-control"type = "text" value="<%=status%>" readonly>
								 <br>
								
								<input type="radio" class="btn-check" name="status" id="option1" autocomplete="off" value="TO-DO">
								<label class="btn btn-danger" for="option1" value="TO-DO">TO-DO</label>
								
								<input type="radio" class="btn-check" name="status" id="option2" autocomplete="off" value="IN-PROGRESS">
								<label class="btn btn-warning" for="option2" value="IN-PROGRESS">IN-PROGRESS</label>
								
								<input type="radio" class="btn-check" name="status" id="option3" autocomplete="off" value="DONE" >
								<label class="btn btn-success" for="option3" value="DONE">DONE</label>
								
							</div>
							
							<div class="mb-3">
								<label class="form-label">Assign staff member</label>
								<div id="emailHelp" class="form-text">Select staff member from the list below.</div> 
								<input Style = "Display:none;" class = "form-control" type = "text" name = "sid" value = "<%=sid%>">
								<select class = "form-control" name="select">
									<%
									try {
										connection = DriverManager.getConnection(url, user, pass);
										statement = connection.createStatement();
										String sql = "SELECT staffID, firstName from staff;";
										resultSet = statement.executeQuery(sql);
										while (resultSet.next()) {
									%>
									<option value="<%=resultSet.getString("staffID")%>"><%=resultSet.getString("firstName")%></option>
	
									<%
									}
	
									} catch (Exception e) {
									e.printStackTrace();
									}
									%>
								</select>
								
								
							</div>
							
							<input class="w-100 btn btn-primary" type = "submit" name = "submit" value = "UPDATE">

						</form>
					
						<%-- <form action="tupdate" method = "POST">
							Manager ID <br>
								<input type = "text" name = "mID" value="<%=mid%>" readonly> <br>
							<br>
							
							Project ID <br>
								<input type = "text" name = "task_projectID" value="<%=pid%>" readonly> <br>
							<br>
							
							task ID <br>
								<input type = "text" name = "tID" value="<%=tid%>" readonly> <br>
							<br>
							
							Task title <br>
							<input type = "text" name = "task_title"  value="<%=title%>"> <br>
							<br>
							
							Status <br>
							<input type = "text" value="<%=status%>" readonly> <br>
							<br>
							<input type = "radio" name = "status" value = "TO-DO">TO-DO
							<input type = "radio" name = "status" value = "IN-PROGRESS">IN-PROGRESS
							<input type = "radio" name = "status" value = "DONE">DONE<br>
							<br>
							
							Assign staff member <br>
							<input type = "text" name = "sid" value = "<%=sid%>"> <br>
							<select name = "select" >
								<%
								try{ 
									connection = DriverManager.getConnection(url, user, pass);
									statement=connection.createStatement();
									String sql ="SELECT staffID, firstName from staff;" ;
									resultSet = statement.executeQuery(sql);
									while(resultSet.next()){
								%>
								<option value = "<%=resultSet.getString("staffID") %>"><%=resultSet.getString("firstName") %></option>
								<%
								}
						
								} catch (Exception e) {
									e.printStackTrace();
								}
								%>
							</select><br>
							<br>
							
							
							<input type = "submit" name = "submit" value = "update">
						</form> --%>
					
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