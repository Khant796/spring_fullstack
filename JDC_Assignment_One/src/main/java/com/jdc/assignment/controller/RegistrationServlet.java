package com.jdc.assignment.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jdc.assignment.domain.Registration;
import com.jdc.assignment.model.OpenClassModel;
import com.jdc.assignment.model.RegistrationModel;

@WebServlet({
	"/class-detail",
	"/registration"
})
public class RegistrationServlet extends AbstractBeanFactory {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		var ocID = Integer.parseInt(req.getParameter("openClassID"));
		var openClassModel = getBean("openClassModel", OpenClassModel.class);
		var openClass = openClassModel.findbyId(ocID);
		req.setAttribute("openClass", openClass);
		var page = switch (req.getServletPath()) {
		case "/class-detail" -> {
			var registrationModel = getBean("registrationModel", RegistrationModel.class);
		
			req.setAttribute("regi", registrationModel.findByOpenClass(ocID));
			yield "/class-detail.jsp";
		}
		default -> "/registration.jsp";
		
		};
		getServletContext().getRequestDispatcher(page).forward(req, resp);
	}
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		var registration = new Registration();
		var opID = Integer.parseInt(req.getParameter("openClassID"));
		var openClassModel = getBean("openClassModel", OpenClassModel.class);
		var openClass = openClassModel.findbyId(opID);
		var registrationModel = getBean("registrationModel", RegistrationModel.class);
		var student = req.getParameter("student");
		var phone = req.getParameter("phone");
		var email = req.getParameter("email");
		registration.setStudent(student);
		registration.setEmail(email);
		registration.setPhone(phone);
		registration.setOp(openClass);
		registrationModel.register(registration);
		resp.sendRedirect("/class-detail?openClassID="+opID);
		
	}
}
