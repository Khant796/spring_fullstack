package com.jdc.assignment.model;

import java.util.List;

import com.jdc.assignment.domain.OpenClass;
import com.jdc.assignment.domain.Registration;

public interface RegistrationModel {

	List<Registration> findByOpenClass(int oc);
	void register(Registration registration);
}
