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
<h3>Add New Course</h3>
<div class="container">
	<div class="row">
	<div class="col-4">
		<c:url var="save" value="/courses"></c:url>
		<form action="${save}" method="post">
			<div style="width:500px" class="mb-3">
				<label class="form-label">Name</label>
				<input name="name" type="text" placeholder="Enter Course Name" class="form-control" required="required"  />
			</div>
			<div style="width:500px" class="mb-3">
				<label class="form-label">Duration</label>
				<input name="duration" type="number" placeholder="Enter Course Duration" class="form-control" required="required"  />
			</div>
			<div style="width:500px" class="mb-3">
				<label class="form-label">Fees</label>
				<input name="fees" type="number" placeholder="Enter Course Fees" class="form-control" required="required"  />
			</div>
			<div style="width:500px" class="mb-3">
				<label class="form-label">Description</label>
				<textarea name="desc" rows="4" cols="40" class="form-control"></textarea>
			</div>
			<br />
			<input type="submit" value="Submit" class="btn btn-primary">
		</form>
	</div>
</div>
</div>

</div>
</body>
</html>