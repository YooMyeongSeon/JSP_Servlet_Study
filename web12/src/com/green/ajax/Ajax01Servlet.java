package com.green.ajax;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;

@WebServlet("/Ajax01Servlet")
public class Ajax01Servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("호출 성공");
		String userId = request.getParameter("userId");
		System.out.println("입력된 아이디 : " + userId);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		out.print("홍길동");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String userInfo = request.getParameter("userInfo");

		JsonParser parser = new JsonParser();
		JsonElement data = parser.parse(userInfo);
		
		String userId = data.getAsJsonObject().get("userId").getAsString();
		String userName = data.getAsJsonObject().get("userName").getAsString();
		String userPw = data.getAsJsonObject().get("userPw").getAsString();
		
		System.out.println("아이디 : " + userId);
		System.out.println("이름 : " + userName);
		System.out.println("비밀번호 : " + userPw);
	}
}