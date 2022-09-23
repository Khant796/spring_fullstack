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
	<h3>Classes for ${course.name}</h3>
	<div>
		<c:url var="addNew" value="/class-edit">
			<c:param name="courseId" value="${course.id}"></c:param>
		</c:url>
			<a class="btn btn-primary" href="${addNew}">Add New Class</a>
	</div>

	<div class="container">
		<div class="row">
			<div class="col-4">
				<c:choose>
					<c:when test="${empty classes}">
						<div class="alert alert-warning">
							There is no class for ${course.name}. Please create a new class.
						</div>
					</c:when>
					<c:otherwise>
			<table class="table table-striped">
			<thead>
			<tr>
				<th>ID</th>
				<th>Course</th>
				<th>Teacher</th>
				<th>Start Date</th>
				<th>Duration</th>
				<th>Fees</th>
				<th>Description</th>
			</tr>
			</thead>
			<tbody>
				<c:forEach var="c" items="${classes}">
					<tr>
						<td>${c.id }</td>
						<td>${c.course.name}</td>
						<td>${c.teacher}</td>
						<td>${c.start_date}</td>
						<td>${c.course.duration} Months</td>
						<td>${c.course.fees}</td>
						<td>${c.course.description}</td>
						<td>
							<c:url var="register" value="/class-detail">
								<c:param name="openClassID" value="${c.id}"></c:param>
							</c:url>
							<a href="${register}">Class detail</a>
						</td>
					</tr>
				</c:forEach>
			</tbody>
			</table>
		</c:otherwise>
				</c:choose>
			</div>
		</div>
	</div>
</div>

</body>
</html>