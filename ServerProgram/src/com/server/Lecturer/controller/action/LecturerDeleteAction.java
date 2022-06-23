package com.server.Lecturer.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.server.course.controller.action.Action;
import com.serverdao.CourseDao;

public class LecturerDeleteAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		CourseDao dao = CourseDao.getInstance();
		dao.lecturerDelete(idx);
		
		response.sendRedirect("CS?command=lecturerListAction");
	}
}