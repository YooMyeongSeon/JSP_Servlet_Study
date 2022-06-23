package com.server.controller;

import com.server.Lecturer.controller.action.LecturerAddAction;
import com.server.Lecturer.controller.action.LecturerAddFormAction;
import com.server.Lecturer.controller.action.LecturerDeleteAction;
import com.server.Lecturer.controller.action.LecturerListAction;
import com.server.Lecturer.controller.action.LecturerUpdateAction;
import com.server.Lecturer.controller.action.LecturerUpdateFormAction;
import com.server.course.controller.action.Action;
import com.server.course.controller.action.CourseAddAction;
import com.server.course.controller.action.CourseAddFormAction;
import com.server.course.controller.action.CourseDeleteAction;
import com.server.course.controller.action.CourseListAction;
import com.server.course.controller.action.CourseUpdateAction;
import com.server.course.controller.action.CourseUpdateFormAction;
import com.server.course.controller.action.CourseViewAction;

public class ActionFactory {
	private ActionFactory() {}
	
	private static ActionFactory af = new ActionFactory();
	
	public static ActionFactory getInstance() {
		return af;
	}
	
	public Action getAction(String command) {
		Action action = null;
		
		if (command.equals("courseListAction")) {
			action = new CourseListAction();
		} else if (command.equals("courseAddFormAction")) {
			action = new CourseAddFormAction();
		} else if (command.equals("courseAddAction")) {
			action = new CourseAddAction();
		} else if (command.equals("courseViewAction")) {
			action = new CourseViewAction();
		} else if (command.equals("courseUpdateFormAction")) {
			action = new CourseUpdateFormAction();
		} else if (command.equals("courseUpdateAction")) {
			action = new CourseUpdateAction();
		} else if (command.equals("courseDeleteAction")) {
			action = new CourseDeleteAction();
		} else if (command.equals("lecturerListAction")) {
			action = new LecturerListAction();
		} else if (command.equals("lecturerAddFormAction")) {
			action = new LecturerAddFormAction();
		} else if (command.equals("lecturerAddAction")) {
			action = new LecturerAddAction();
		} else if (command.equals("lecturerUpdateFormAction")) {
			action = new LecturerUpdateFormAction();
		} else if (command.equals("lecturerUpdateAction")) {
			action = new LecturerUpdateAction();
		} else if (command.equals("lecturerDeleteAction")) {
			action = new LecturerDeleteAction();
		}
		
		return action;
	}
}