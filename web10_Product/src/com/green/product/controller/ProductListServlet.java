package com.green.product.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.green.product.dao.Product_DAO;
import com.green.product.vo.Product_Vo;

@WebServlet("/PL")
public class ProductListServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Product_DAO dao = Product_DAO.getInstance();
		
		List<Product_Vo> list = dao.selectAllProduct();
		
		request.setAttribute("list", list);
		request.getRequestDispatcher("Product/ProductList.jsp").forward(request, response);
	}
}