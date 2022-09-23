<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
         <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>
<body>
<div class="container mt-4">
	<h3>Register New Student for ${openClass.course.name} Batch: ${openClass.id}</h3>
	<div class="container">
		<div class="row">
			<div class="col-4">
				<c:url var="save" value="/class-detail">
					<c:param name="openClassID" value="${openClass.id}"></c:param>
				</c:url>
				<form action="${save}" method="post">
				<div class="mb-3" style="width:500px">
					<label class="form-label">Student's Name</label>
					<input name="student" type="text" class="form-control" required="required" placeholder="Enter Student's name" />
				</div>
				<div class="mb-3" style="width:500px">
					<label class="form-label">Phone Number</label>
					<input name="phone" type="text" class="form-control" required="required" placeholder="Enter Phone number" />
				</div>
				<div class="mb-3" style="width:500px">
					<label class="form-label">Email address</label>
					<input name="email" type="text" class="form-control" required="required" placeholder="Enter Email address" />
				</div>
				<br />
				<input type="submit" value="Register" class="btn btn-primary" />
				</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>