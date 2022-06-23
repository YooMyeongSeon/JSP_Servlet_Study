package com.server.Lecturer.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.server.course.controller.action.Action;
import com.serverdao.CourseDao;

public class LecturerAddFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/Lecturer/LecturerAddForm.jsp";
		
		CourseDao dao = CourseDao.getInstance();
		int seq = dao.selectSeq();

		request.setAttribute("seq", seq);
		request.getRequestDispatcher(url).forward(request, response);
	}
}