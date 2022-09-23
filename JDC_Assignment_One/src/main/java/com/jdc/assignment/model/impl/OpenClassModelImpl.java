package com.jdc.assignment.model.impl;

import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import com.jdc.assignment.domain.Course;
import com.jdc.assignment.domain.OpenClass;
import com.jdc.assignment.model.OpenClassModel;

public class OpenClassModelImpl implements OpenClassModel {

	private DataSource dataSource;
	
	private static final String SELECT_SQL = """
			select oc.id,oc.start_date,oc.teacher,
			c.id courseId, c.name, c.duration, c.fees, c.description 
			from open_class oc join course c on oc.course_id = c.id 
			where c.id = ?
			""";
	private static final String INSERT = """
			insert into open_class (course_id,start_date,teacher)
			values (?,?,?)
			""";
	private static final String FIND = """
			select oc.id,oc.start_date,oc.teacher,
			c.id courseId, c.name, c.duration, c.fees, c.description 
			from open_class oc join course c on oc.course_id = c.id 
			where oc.id = ?
			""";
	
	public OpenClassModelImpl(DataSource dataSource) {
		super();
		this.dataSource = dataSource;
	}

	@Override
	public List<OpenClass> findByCourse(int courseId) {
		var list = new ArrayList<OpenClass>();
	try(var con = dataSource.getConnection()){
		var stmt = con.prepareStatement(SELECT_SQL);
		stmt.setInt(1, courseId);
		var rs = stmt.executeQuery();
		while(rs.next()) {
			var c = new Course();
			var oc = new OpenClass();
			c.setId(rs.getInt("courseId"));
			c.setDescription(rs.getString("description"));
			c.setName(rs.getString("name"));
			c.setFees(rs.getInt("fees"));
			c.setDuration(rs.getInt("duration"));
			oc.setCourse(c);
			oc.setId(rs.getInt("id"));
			oc.setStart_date(rs.getDate("start_date").toLocalDate());
			oc.setTeacher(rs.getString("teacher"));
			list.add(oc);
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return list;
	}

	@Override
	public void create(OpenClass openClass) {
		try(var con = dataSource.getConnection()){
			var stmt = con.prepareStatement(INSERT);
			stmt.setInt(1, openClass.getCourse().getId());
			stmt.setDate(2, Date.valueOf(openClass.getStart_date()));
			stmt.setString(3, openClass.getTeacher());
			stmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}

	@Override
	public OpenClass findbyId(int id) {
		try(var con = dataSource.getConnection()){
			var stmt = con.prepareStatement(FIND);
			stmt.setInt(1, id);
			var rs = stmt.executeQuery();
			while(rs.next()) {
				var c = new Course();
				var oc = new OpenClass();
				c.setId(rs.getInt("courseId"));
				c.setDescription(rs.getString("description"));
				c.setName(rs.getString("name"));
				c.setFees(rs.getInt("fees"));
				c.setDuration(rs.getInt("duration"));
				oc.setCourse(c);
				oc.setId(rs.getInt("id"));
				oc.setStart_date(rs.getDate("start_date").toLocalDate());
				oc.setTeacher(rs.getString("teacher"));
				return oc;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
