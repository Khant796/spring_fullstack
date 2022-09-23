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
	<h3>Add new class for ${course.name}</h3>
	<div class="container">
		<div class="row">
			<div class="col-4">
				<c:url var="create" value="/classes">
					<c:param name="courseId" value="${course.id}"></c:param>
				</c:url>
				<form action="${create}" method="post">
					<div class="mb-3" style="width:500px">
						<label class="form-label">Start Date</label>
						<input type="date" name="start_date" class="form-control" required="required"/>
					</div>
					<div class="mb-3" style="width:500px">
						<label class="form-label">Teacher</label>
						<input type="text" name="teacher" placeholder="Enter teacher's name" class="form-control" required="required"/>
					</div>
					<br />
					<input type="submit" value="Create class" class="btn btn-primary"/>
				</form>
			</div>
		</div>
	</div>
</div>

</body>
</html>