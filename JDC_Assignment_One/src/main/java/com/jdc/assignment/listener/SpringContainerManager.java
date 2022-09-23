package com.jdc.assignment.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;
import javax.servlet.annotation.WebListener;

import org.springframework.context.support.GenericApplicationContext;
import org.springframework.context.support.GenericXmlApplicationContext;

@WebListener
public class SpringContainerManager implements ServletContextListener {

	public static final String SPRING_CONTEXT = "spring.context";
	private GenericXmlApplicationContext context;
	
	@Override
	public void contextInitialized(ServletContextEvent sce) {
		System.out.println("Initialized IoC container");
		context = new GenericXmlApplicationContext("classpath:application.xml");
		sce.getServletContext().setAttribute(SPRING_CONTEXT, context);
	}
	
	@Override
	public void contextDestroyed(ServletContextEvent sce) {
		System.out.println("Destroyed IoC container");
		if(null != context) {
			context.close();
		}
	}
}
