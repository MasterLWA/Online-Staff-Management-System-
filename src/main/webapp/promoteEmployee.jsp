<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Promote Employee</title>
<style><%@include file="WEB-INF/style.css"%></style>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
</head>
<body>

    <div class="container-fluid">
        <div class="text-center admindb-header" >
            Promote Employee
        </div>
    </div> 
	
    <div class="container align-items-center justify-content-center form-box">
	<form action="promote" method="post" class="container form align-items-center justify-content-center">
	 
	 <input class="inputs" placeholder="Enter ID"  name="Id" type="text"><br>

     <input class="inputs" placeholder="Enter Salary"  name="salary" type="text"><br>

    <input class="inputs" placeholder="Enter OT rate"  name="ot" type="text"><br>

    <input class="inputs" placeholder="Enter Job Role" name="Jobrole" type="text"><br>
    
    <!-- Submit button -->
	<input class="submit-button" type="submit" name="submit" value="Promote">
 
	</form>
    </div>
	
	<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
</body>
</html>