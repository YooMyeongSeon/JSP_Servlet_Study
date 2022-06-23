package com.server.Lecturer.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.server.course.controller.action.Action;
import com.server.vo.LecturerVo;
import com.serverdao.CourseDao;

public class LecturerUpdateFormAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/Lecturer/LecturerUpdateForm.jsp";
		int idx = Integer.parseInt(request.getParameter("idx"));
		
		CourseDao dao = CourseDao.getInstance();
		LecturerVo lVo = dao.selectLecturerByNum(idx);
		
		request.setAttribute("lVo", lVo);
		request.getRequestDispatcher(url).forward(request, response);
	}
}