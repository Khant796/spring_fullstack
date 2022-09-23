<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/css/bootstrap.min.css"
	integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@3.3.7/dist/js/bootstrap.min.js"
	integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa"
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="container mt-4">
		<h2>${openClass.course.name}</h2>
		<h3>Class Details</h3>
		
			<div class="row">
				<div class="col-xs-6">
					<ul class="list-group" style="width: 400px">
						<li class="list-group-item"><b>Class ID:</b> ${openClass.id}</li>
						<li class="list-group-item"><b>Course Name:</b>
							${openClass.course.name}</li>
						<li class="list-group-item"><b>Teacher:</b> ${openClass.teacher}</li>
						<li class="list-group-item"><b>Duration:</b>
							${openClass.course.duration} Months</li>
						
					</ul>
				</div>
				<div class="col-xs-6">
					<ul class="list-group" style="width: 600px">
						<li class="list-group-item"><b>Fees:</b> ${openClass.course.fees}</li>
						<li class="list-group-item"><b>Description:</b>
							${openClass.course.description}</li>
							<li class="list-group-item"><b>Start_date:</b> ${openClass.start_date}</li>
					</ul>
				</div>
			</div>
		

		<div>
			<c:url var="newRegister" value="/registration">
				<c:param name="openClassID" value="${openClass.id}"></c:param>
			</c:url>
			<a href="${newRegister}" class="btn btn-primary"> Register new
				student </a>
		</div>
		
		<div class="container">
			<div class="row">
				<div class="col-4">
					<h3>Students</h3>
				</div>
				<div class="col-4">
					<c:choose>
						<c:when test="${empty regi}">
							<div class="alert alert-warning">There are no students in
								${openClass.course.name} Batch: ${openClass.id}. Please register
								new students.</div>
						</c:when>
						<c:otherwise>
							<table class="table table-striped" style="width:1000px">
								<thead>
									<tr>
										<th>ID</th>
										<th>Name</th>
										<th>Phone</th>
										<th>Email</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach var="regi" items="${regi}">
										<tr>
											<td>${regi.id}</td>
											<td>${regi.student}</td>
											<td>${regi.phone }</td>
											<td>${regi.email}</td>
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