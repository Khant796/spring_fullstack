package com.jdc.assignment.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.BeanFactory;

import com.jdc.assignment.domain.Course;
import com.jdc.assignment.listener.SpringContainerManager;
import com.jdc.assignment.model.CourseModel;

@WebServlet(urlPatterns = {
		"/",
		"/courses",
		"/course-edit"
})
public class CourseServlet extends AbstractBeanFactory {
	private static final long serialVersionUID = 1L;
   
	private CourseModel model;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		var key = req.getServletPath();
		var page = switch (key) {
		case "/course-edit" -> "/course-edit.jsp";
		default -> {
			var courseModel = getBean("courseModel", CourseModel.class);
			req.setAttribute("courses", courseModel.getAll());
			yield "/index.jsp";
		}
		};
		getServletContext().getRequestDispatcher(page).forward(req, resp);
		
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		var name = req.getParameter("name");
		var duration = req.getParameter("duration");
		var fees = req.getParameter("fees");
		var desc = req.getParameter("desc");
		
		var course = new Course();
		course.setName(name);
		course.setDuration(Integer.parseInt(duration));
		course.setFees(Integer.parseInt(fees));
		course.setDescription(desc);
		getBean("courseModel", CourseModel.class).save(course);
		resp.sendRedirect("/");
		
}
}
