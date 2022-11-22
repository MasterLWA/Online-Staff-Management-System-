<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Projects</title>

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

	<div class="px-4 py-5  text-center">
		<img class="d-block mx-auto mb-4" src="images/icons8-project-96.png"
			alt="">
		<h1 class="display-5 fw-bold">PROJECTS</h1>
		<div class="col-lg-6 mx-auto">
			<p class="lead mb-4">Here You can view all the projects that you
				have created.</p>
		</div>
	</div>


	<%@page import="java.sql.DriverManager"%>
	<%@page import="java.sql.ResultSet"%>
	<%@page import="java.sql.Statement"%>
	<%@page import="java.sql.Connection"%>

	<%
	String hID = request.getParameter("mID");
	String driverName = "com.mysql.jdbc.Driver";

	String url = "jdbc:mysql://localhost:3306/osms";
	String user = "root";
	String pass = "root";
	Connection con;
	String mid = hID;
	//String mid = ;

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

	<div id="mmenu_screen" class="container-fluid main_container d-flex">
		<div class="row flex-fill">
			<div class="col-sm-2 h-100">
				<div class="row h-50 ">
					<div class="col-sm-12" id="mmenu_screen--book">
						<div class="card">
							<div class="card-body">
								<form action="pinsert" method="POST">
									
									<label class="form-label"><b>ADD PROJECT</b></label>

									<div class="mb-3" Style = "Display:none;">
										<label for="exampleInputEmail1" class="form-label">Manager ID</label><br>
										<input class = "form-control" type="text" value='<%=hID%>' name="mID" readonly>
										<div id="emailHelp" class="form-text">We'll never share your email with anyone else.</div>
									</div>
									
									<div class="mb-3">
										<label class="form-label">Project Name</label>
										<input class = "form-control" type="text" name="pname" Style = "width=100%;" placeholder="Project Name here" >
									</div>
									
									<div class="mb-3">
										<label class="form-label">Project Start Date</label>
										<input class = "form-control" type="date" name="startDate">
									</div>
									
									<div class="mb-3">
										<label class="form-label">Project Due Date</label>
										<input class = "form-control" type="date" name="dueDate">
									</div>
									
									<div class="mb-3">
										<label class="form-label">Project Description (Optional)</label>
										<input class = "form-control" type="text" name="pDescription" placeholder="Project Name here">
									</div>
									
									<input class="w-100 btn btn-primary" type="submit" name="submit" value="Create New Project">
								</form>
							</div>
						</div>
					</div>
				</div>
				
				</div>
				<div class="col-sm-10 mmenu_screen--direktaction flex-fill">
					<div class="card">
							<div class="card-body">
								<table class="table">
									<tr>
										<th scope="col">Project ID</th>
										<th scope="col">Project Name</th>
										<th scope="col">Start Date</th>
										<th scope="col">Due Date</th>
										<th scope="col">Description</th>
										<th scope="col"  Style = "Display:none;" >HandlerID</th>
										<th scope="col"></th>
										<th scope="col"></th>
									</tr>
									<%
						try {
							connection = DriverManager.getConnection(url, user, pass);
							statement = connection.createStatement();
							String sql = "select * from project p,manager m where m.mID = p.handlerID and m.mID = '" + mid + "'";
							String sql2 = "select firstName from staff where staffID = '" + mid + "'";
							resultSet = statement.executeQuery(sql);
							while (resultSet.next()) {
						%>

									<tr>
										<td class="align-middle"><%=resultSet.getString("project_id")%></td>
										<td class="align-middle"><%=resultSet.getString("project_name")%></td>
										<td class="align-middle"><%String date = resultSet.getString("project_start"); String date1= date.substring(0, 10);%><%=date1%></td>
										<td class="align-middle"><%String date3 = resultSet.getString("project_due"); String date4= date.substring(0, 10);%><%=date1%></td>
										<td class="align-middle"><%=resultSet.getString("project_description")%></td>
										<td Style = "Display:none;"><%=resultSet.getString("handlerID")%></td>
										<td class="align-middle"><c:url value="taskView.jsp" var="view">
												<c:param name="pid"
													value='<%=resultSet.getString("project_id")%>'></c:param>
												<c:param name="pname"
													value='<%=resultSet.getString("project_name")%>'></c:param>
												<c:param name="startDate"
													value='<%=resultSet.getString("project_start")%>'></c:param>
												<c:param name="dueDate"
													value='<%=resultSet.getString("project_due")%>'></c:param>
												<c:param name="pDescription"
													value='<%=resultSet.getString("project_description")%>'></c:param>
												<c:param name="hid"
													value='<%=resultSet.getString("handlerID")%>'></c:param>
											</c:url> <a href="${view}"> <input class="btn btn-primary" type="button" name="update" value="View Project">
										</a></td>
										<td><c:url value="projectDelete.jsp" var="prodelete">
												<c:param name="pid"
													value='<%=resultSet.getString("project_id")%>'></c:param>
												<c:param name="pname"
													value='<%=resultSet.getString("project_name")%>'></c:param>
												<c:param name="startDate"
													value='<%=resultSet.getString("project_start")%>'></c:param>
												<c:param name="dueDate"
													value='<%=resultSet.getString("project_due")%>'></c:param>
												<c:param name="pDescription"
													value='<%=resultSet.getString("project_description")%>'></c:param>
												<c:param name="hid"
													value='<%=resultSet.getString("handlerID")%>'></c:param>
											</c:url> <a href="${prodelete}"> <input class="btn btn-outline-danger"
												type="button" name="delete" value="Remove Project">
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