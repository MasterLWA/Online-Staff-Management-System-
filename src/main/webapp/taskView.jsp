<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
					<li><a href="#" class="nav-link px-2 text-secondary"> / Projects</a></li>
					<li><a href="#" class="nav-link px-2 text-prymary"> /  Project Details ( <%=pname %> )</a></li>
					
				</ul>
			</div>
		</div>
	</header>

<div class="px-4 py-5  text-center">
		<img class="d-block mx-auto mb-4" src="images/icons8-tasklist-96.png"
			alt="">
		<h1 class="display-5 fw-bold">PROJECT DETAILS</h1>
		<div class="col-lg-6 mx-auto">
			<p class="lead mb-4">Here You can edit the project details, add tasks to the project and you can edit or remove tasks.</p>
		</div>
</div>
    

	<div id="mmenu_screen" class="container-fluid main_container d-flex">
		<div class="row flex-fill">
			<div class="col-sm-3 h-100">
				<div class="card">
					<div class="card-body">

						<table  class="table">
							<tr>
								<td>Project ID</td>
								<td><%=id%></td>
							</tr>
							<tr>
								<td>Project Name</td>
								<td><%=pname%></td>
							</tr>
							<tr>
								<td>Start Date</td>
								<td><%=date1%></td>
							</tr>
							<tr>
								<td>Due Date</td>
								<td><%=date2%></td>
							</tr>
							<tr>
								<td>Project Description</td>
								<td><%=pDescription%></td>
							</tr>
							<tr>
								<td>project Manager ID</td>
								<td><%=pManager%></td>
							</tr>
						</table>
						
						<c:url value="projectUpdate.jsp" var="proupdate">
									<c:param name="pid" value="<%=id%>"></c:param>
									<c:param name="pname" value="<%=pname%>"></c:param>
									<c:param name="startDate" value="<%=startDate%>"></c:param>
									<c:param name="dueDate" value="<%=dueDate%>"></c:param>
									<c:param name="pDescription" value="<%=pDescription%>"></c:param>
									<c:param name="hid" value="<%=pManager%>"></c:param>
								</c:url>

						<a href="${proupdate}">
						 	<input class=" w-100 btn btn-primary"  type="button" name="update" value="Update Project">
						</a>
					</div>
				</div>
			</div>
			<div class="col-sm-4 h-100">
				<div class="card">
					<div class="card-body">
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



						<form action="tinsert" method="POST">
						
							<label class="form-label"><b>ADD NEW TASK</b></label>

							<div class="mb-3" Style = "Display:none;">
								<label class="form-label" >Project ID</label> 
								<input class = "form-control"  type="text" name="task_projectID" value="<%=id%>" readonly> 
							</div>
							
							<div class="mb-3" Style = "Display:none;">
								<label class="form-label">Project Manager</label> 
								<input class = "form-control"  type="text" name="mID" value="<%=pManager%>" readonly>
							</div>
							
							<div class="mb-3">
								<label class="form-label">Task Title</label> 
								<input class = "form-control"  type="text" name="task_title" placeholder="Give a name to your task">
							</div>
							
							<div class="mb-3">
								<label class="form-label">Status</label> <br>
								
								<input type="radio" class="btn-check" name="status" id="option1" autocomplete="off" value="TO-DO">
								<label class="btn btn-danger" for="option1" value="TO-DO">TO-DO</label>
								
								<input type="radio" class="btn-check" name="status" id="option2" autocomplete="off" value="IN-PROGRESS">
								<label class="btn btn-warning" for="option2" value="IN-PROGRESS">IN-PROGRESS</label>
								
								<input type="radio" class="btn-check" name="status" id="option3" autocomplete="off"  value="DONE" >
								<label class="btn btn-success" for="option3" value="DONE">DONE</label>
								
							</div>
							
							<div class="mb-3">
								<label class="form-label">Assign staff member</label> 
								
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
								
								<div id="emailHelp" class="form-text">Select staff member from the list below.</div>
							</div>
							
							<input class="w-100 btn btn-primary" type="submit" name="submit" value="ADD TASK">

						</form>

					</div>
				</div>
			</div>
			<div class="col-sm-5 mmenu_screen--direktaction flex-fill">
				<div class="card">
					<div class="card-body">
						<label class="form-label text-center"><b>PROJECT TASKS</b></label>

						<table class="table">
							<tr>
								<th>Task ID</th>
								<th>Title</th>
								<th>Status</th>
								<th Style = "Display:none;">ProjectID</th>
								<td Style = "Display:none;">staff id</td>
								<th> </th>
								<th> </th>
							</tr>

							<%
							try {
								connection = DriverManager.getConnection(url, user, pass);
								statement = connection.createStatement();
								String sql2 = "SELECT * from task where task_projectID = '" + id + "'";
								resultSet2 = statement.executeQuery(sql2);
								while (resultSet2.next()) {
							%>

							<tr>
								<td class="align-middle"><%=resultSet2.getString("task_id")%></td>
								<td class="align-middle"><%=resultSet2.getString("task_title")%></td>
								<td class="align-middle"><%=resultSet2.getString("task_status")%></td>
								<td Style = "Display:none;"><%=resultSet2.getString("task_projectID")%></td>
								<td Style = "Display:none;"><%=resultSet2.getString("task_staff_id")%></td>
								<td class="align-middle"><c:url value="updatetask.jsp" var="uptask">
										<c:param name="tid"
											value='<%=resultSet2.getString("task_id")%>'></c:param>
										<c:param name="title"
											value='<%=resultSet2.getString("task_title")%>'></c:param>
										<c:param name="status"
											value='<%=resultSet2.getString("task_status")%>'></c:param>
										<c:param name="pid"
											value='<%=resultSet2.getString("task_projectID")%>'></c:param>
										<c:param name="sid"
											value='<%=resultSet2.getString("task_staff_id")%>'></c:param>
										<c:param name="mid" value='<%=pManager%>'></c:param>
									</c:url> <a href="${uptask}"> <input class="btn btn-primary" type="button" name="update"
										value="Update Task">
								</a>
								<td>
								<td><c:url value="deletetask.jsp" var="detask">
										<c:param name="tid"
											value='<%=resultSet2.getString("task_id")%>'></c:param>
										<c:param name="title"
											value='<%=resultSet2.getString("task_title")%>'></c:param>
										<c:param name="status"
											value='<%=resultSet2.getString("task_status")%>'></c:param>
										<c:param name="pid"
											value='<%=resultSet2.getString("task_projectID")%>'></c:param>
										<c:param name="sid"
											value='<%=resultSet2.getString("task_staff_id")%>'></c:param>
										<c:param name="mid" value='<%=pManager %>'></c:param>
									</c:url> <a href="${detask}"> <input class="btn btn-outline-danger" type="button"
										value="Remove Task">
								</a></td>
							</tr>
							<%
							}

							} catch (Exception e) {
							e.printStackTrace();
							}
							%>

						</table>
					</div>
				</div>
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