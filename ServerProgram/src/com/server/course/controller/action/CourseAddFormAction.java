package com.server.course.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.server.course.dao.CourseDao;
import com.server.course.vo.LecturerVo;

public class CourseAddFormAction implements Action {

	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/Course/CourseAddForm.jsp";
		
		CourseDao dao = CourseDao.getInstance();
		List<LecturerVo> lecturerList = dao.selectAllLecturer();

		request.setAttribute("lecturerList", lecturerList);
		request.getRequestDispatcher(url).forward(request, response);
	}
}