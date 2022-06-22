package com.server.course.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.server.vo.CourseVo;
import com.serverdao.CourseDao;

public class CourseViewAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/Course/CourseView.jsp";
		String id = request.getParameter("id");
		
		CourseDao dao = CourseDao.getInstance();
		CourseVo cVo = dao.selectCourseByNum(id);
		
		request.setAttribute("cVo", cVo);
		request.getRequestDispatcher(url).forward(request, response);
	}
}