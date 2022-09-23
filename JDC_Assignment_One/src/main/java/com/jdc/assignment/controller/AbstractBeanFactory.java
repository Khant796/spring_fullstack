package com.jdc.assignment.controller;

import javax.servlet.http.HttpServlet;

import org.springframework.beans.BeansException;
import org.springframework.beans.factory.BeanFactory;

import com.jdc.assignment.listener.SpringContainerManager;

public  abstract class AbstractBeanFactory extends HttpServlet implements BeanFactoryServlet {
	
 /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

@Override
public <T> T getBean(String name, Class<T> requiredType) throws BeansException {
	var context = getServletContext().getAttribute(SpringContainerManager.SPRING_CONTEXT);
	if(null != context && context instanceof BeanFactory factory) {
		return factory.getBean(name, requiredType);
	}
	return null;
}
}
