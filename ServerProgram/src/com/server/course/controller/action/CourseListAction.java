package com.server.course.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.server.course.dao.CourseDao;
import com.server.course.vo.CourseVo;

public class CourseListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/Course/CourseList.jsp";
		
		CourseDao dao = CourseDao.getInstance();
		List<CourseVo> courseList = dao.selectAllCourse();

		request.setAttribute("courseList", courseList);
		request.getRequestDispatcher(url).forward(request, response);
	}
}