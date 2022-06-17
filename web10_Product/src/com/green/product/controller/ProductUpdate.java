package com.green.product.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.green.product.dao.Product_DAO;
import com.green.product.vo.Product_Vo;
import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/PU")
public class ProductUpdate extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Product_Vo pVo = new Product_Vo();
		
		int code = Integer.parseInt(request.getParameter("code"));
		
		Product_DAO dao = Product_DAO.getInstance();
		pVo = dao.productUpdate(code);
		
		request.setAttribute("pVo", pVo);
		request.getRequestDispatcher("Product/ProductUpdate.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Product_Vo pVo = new Product_Vo();
		
		try {
			MultipartRequest multi = new MultipartRequest(request, "C:\\Users\\GREEN\\Documents\\JSP_Servlet_Study\\web10_Product\\WebContent\\Upload", 100*1024*1024, "UTF-8", new DefaultFileRenamePolicy());
			
			String pictureurl = multi.getParameter("pictureurl");
			if (pictureurl == null) {
				pictureurl = multi.getParameter("originPictureurl");
			}
			
			pVo.setCode(Integer.parseInt(multi.getParameter("code")));
			pVo.setName(multi.getParameter("name"));
			pVo.setPrice(Integer.parseInt(multi.getParameter("price")));
			pVo.setPictureurl(pictureurl);
			pVo.setDescription(multi.getParameter("description"));
			
			Product_DAO dao = Product_DAO.getInstance();
			dao.updateProduct(pVo);
		} catch(Exception e) {
			e.printStackTrace();
		}
		response.sendRedirect("PL");
	}
}