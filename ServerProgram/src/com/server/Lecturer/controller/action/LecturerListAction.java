package com.server.Lecturer.controller.action;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.server.course.controller.action.Action;
import com.server.vo.LecturerVo;
import com.serverdao.CourseDao;

public class LecturerListAction implements Action {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String url = "/Lecturer/LecturerList.jsp";
		
		CourseDao dao = CourseDao.getInstance();
		List<LecturerVo> lecturerList = dao.selectAllLecturer();

		request.setAttribute("lecturerList", lecturerList);
		request.getRequestDispatcher(url).forward(request, response);
	}
}