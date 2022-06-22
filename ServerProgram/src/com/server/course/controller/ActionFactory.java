package com.server.course.controller;

import com.server.course.controller.action.Action;
import com.server.course.controller.action.CourseAddAction;
import com.server.course.controller.action.CourseAddFormAction;
import com.server.course.controller.action.CourseListAction;
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
		}
		
		return action;
	}
}