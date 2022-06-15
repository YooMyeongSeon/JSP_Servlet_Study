package Oder;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Oder")
public class Oder extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		ArrayList<Coffee> coffeeList = (ArrayList<Coffee>)session.getAttribute("coffeeList");
		
		int cno = Integer.parseInt(request.getParameter("coffee"));
		String size = request.getParameter("size");
		int ea = Integer.parseInt(request.getParameter("ea"));
		
		DAO dao = DAO.getInstance();
		Coffee coffee = dao.getCoffee(cno, size, ea);
		
		if (coffeeList != null) {
			coffeeList.add(coffee);
		} else {
			coffeeList = new ArrayList<Coffee>();
			coffeeList.add(coffee);
		}
		
		session.setAttribute("coffeeList", coffeeList);
		request.getRequestDispatcher("Cafe.jsp").forward(request, response);
	}
}
