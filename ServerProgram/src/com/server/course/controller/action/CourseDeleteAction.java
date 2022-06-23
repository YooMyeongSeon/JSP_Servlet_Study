package com.server.course.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.serverdao.CourseDao;


public class CourseDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String id = request.getParameter("id");
		
		CourseDao dao = CourseDao.getInstance();
		dao.courseDelete(id);
		
		response.sendRedirect("CS?command=courseListAction");
	}
}