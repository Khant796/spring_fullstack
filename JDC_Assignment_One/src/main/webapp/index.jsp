<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Test</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
</head>
<body>

<div class="container mt-4">
	<h2>Courses</h2>
	<div>
		<a class="btn btn-primary" href="course-edit">Add courses</a>
	</div>
	<div class="mt-4">
	<c:choose>
		<c:when test="${empty courses}">
			<div class="alert alert-warning">There is no course</div>
		</c:when>
		<c:otherwise>
			<table class="table table-striped">
			<thead>
			<tr>
				<th>ID</th>
				<th>Name</th>
				<th>Duration</th>
				<th>Fees</th>
				<th>Description</th>
			</tr>
			</thead>
			<tbody>
				<c:forEach var="c" items="${courses}">
					<tr>
						<td>${c.id }</td>
						<td>${c.name}</td>
						<td>${c.duration} Months</td>
						<td>${c.fees}</td>
						<td>${c.description}</td>
						<td>
							<c:url var="classes" value="/classes">
								<c:param name="courseId" value="${c.id}"></c:param>
							</c:url>
							<a href="${classes}">Open Classes</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
			</table>
		</c:otherwise>
	</c:choose>
</div>
</div>

</body>
</html>