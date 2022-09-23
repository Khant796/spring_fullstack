package com.jdc.assignment.model.impl;


import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.jdc.assignment.domain.Course;
import com.jdc.assignment.domain.OpenClass;
import com.jdc.assignment.domain.Registration;
import com.jdc.assignment.model.RegistrationModel;

public class RegistrationModelImpl implements RegistrationModel {

	private DataSource dataSource;
	private static final String SELECT = """
			select r.id, r.student, r.phone, r.email,
			oc.id Open_Class_ID, oc.start_date, oc. teacher,
			c.id courseID, c.name, c.fees, c.duration, c.description
			from registration r join open_class oc on r.open_class_id = oc.id 
			join course c on oc.course_id = c.id
			where oc.id = ?
			""";
	private static final String REGISTER = """
			insert into registration(open_class_id, student, phone, email)
			values (?,?,?,?)
			""";
	
	public RegistrationModelImpl(DataSource dataSource) {
		super();
		this.dataSource = dataSource;
	}

	@Override
	public List<Registration> findByOpenClass(int oc) {
		var list = new ArrayList<Registration>();
		try(var con = dataSource.getConnection()){
			var stmt = con.prepareStatement(SELECT);
			stmt.setInt(1, oc);
			var rs = stmt.executeQuery();
			while(rs.next()) {
				var course = new Course();
				var open_class = new OpenClass();
				var registration = new Registration();
				course.setId(rs.getInt("courseID"));
				course.setDescription(rs.getString("description"));
				course.setDuration(rs.getInt("duration"));
				course.setFees(rs.getInt("fees"));
				course.setName(rs.getString("name"));
				open_class.setId(rs.getInt("Open_Class_ID"));
				open_class.setStart_date(rs.getDate("start_date").toLocalDate());
				open_class.setTeacher(rs.getString("teacher"));
				open_class.setCourse(course);
				registration.setId(rs.getInt("id"));
				registration.setOp(open_class);
				registration.setEmail(rs.getString("email"));
				registration.setStudent(rs.getString("student"));
				registration.setPhone(rs.getString("phone"));
				list.add(registration);
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return list;
	}

	@Override
	public void register(Registration registration) {
		try(var con = dataSource.getConnection()){
			var stmt = con.prepareStatement(REGISTER);
			stmt.setInt(1, registration.getOp().getId());
			stmt.setString(2, registration.getStudent());
			stmt.setString(3,registration.getPhone());
			stmt.setString(4, registration.getEmail());
			stmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

}
