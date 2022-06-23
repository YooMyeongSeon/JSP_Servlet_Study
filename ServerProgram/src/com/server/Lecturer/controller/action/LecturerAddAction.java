package com.server.Lecturer.controller.action;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.server.course.controller.action.Action;
import com.server.vo.LecturerVo;
import com.serverdao.CourseDao;

public class LecturerAddAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		LecturerVo lVo = new LecturerVo();
		
		lVo.setName(request.getParameter("name"));
		lVo.setMajor(request.getParameter("major"));
		lVo.setField(request.getParameter("field"));
		
		CourseDao dao = CourseDao.getInstance();
		dao.addLecturer(lVo);
		
		response.sendRedirect("CS?command=lecturerListAction");
	}
}