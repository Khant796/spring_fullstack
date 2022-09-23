package com.jdc.assignment.controller;

import java.io.IOException;
import java.sql.Date;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jdc.assignment.domain.OpenClass;
import com.jdc.assignment.model.CourseModel;
import com.jdc.assignment.model.OpenClassModel;

@WebServlet({
	"/classes",
	"/class-edit"
})
public class OpenClassServlet extends AbstractBeanFactory {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		var courseId = Integer.parseInt(req.getParameter("courseId"));
		var courseModel = getBean("courseModel", CourseModel.class);
		var course = courseModel.findById(courseId);
		req.setAttribute("course", course);
		var page = switch (req.getServletPath()) {
		case "/classes" -> {
			var model = getBean("openClassModel", OpenClassModel.class);
			req.setAttribute("classes",model.findByCourse(courseId));
			yield "/classes.jsp";
		}
		default -> "/class-edit.jsp";
			
	};
	getServletContext().getRequestDispatcher(page).forward(req, resp);

	
}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		var courseId = Integer.parseInt(req.getParameter("courseId"));
		var courseModel = getBean("courseModel", CourseModel.class);
		var course = courseModel.findById(courseId);
		var openClass = new OpenClass();
		Date date = Date.valueOf(req.getParameter("start_date"));
		var ld = date.toLocalDate();
		var teacher = req.getParameter("teacher");
		openClass.setCourse(course);
		openClass.setStart_date(ld);
		openClass.setTeacher(teacher);
		var ocModel = getBean("openClassModel", OpenClassModel.class);
		ocModel.create(openClass);
		resp.sendRedirect("/classes?courseId="+courseId);
		
		
	}
}
