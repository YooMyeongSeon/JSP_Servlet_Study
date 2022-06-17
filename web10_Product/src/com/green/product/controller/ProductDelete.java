package com.green.product.controller;

import java.io.File;
import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.green.product.dao.Product_DAO;

@WebServlet("/PD")
public class ProductDelete extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int code = Integer.parseInt(request.getParameter("code"));
		
		Product_DAO dao = Product_DAO.getInstance();
		dao.deleteProduct(code);
		
		String url = "C:\\Users\\GREEN\\Documents\\JSP_Servlet_Study\\web10_Product\\WebContent\\Upload\\" + request.getParameter("pic");
		File file = new File(url);
		
		if (file.exists()) {
			file.delete();
		}
		
		response.sendRedirect("PL");
	}
}