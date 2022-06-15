package com.green.file;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/US")
public class UploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		//파일을 전송받을 준비 : COS는 MultipartRequest 객체를 지원
		
		//1. 파일을 저장할 장소
		String savePath = "/upload"; //크롬 크로스도메인 이슈 CORS 참고
		
		//2. 파일 크기(Byte단위, 2MB = 2*1024Kb = 2*1024*1024Byte)
		int uploadFileSize = 2*1024*1024;
		
		//3. 파일 이름 인코딩 방식
		String encType = "UTF-8";
		
		//ServletContext context = getServletContext(); 실제 파일 경로로 만들기
		//String uploadFilePath = context.getRealPath(savePath);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		try {
			//인스턴스가 생성됨과 동시에 업로드가 완료
			MultipartRequest multi = new MultipartRequest(request, savePath, uploadFileSize, encType, new DefaultFileRenamePolicy()); //폼으로 부터 받아온 객체, 저장 경로, 파일 크기, 인코딩 방식, 중복 처리 정책
			String fileName = multi.getFilesystemName("fileUpload");
			
			out.println("글쓴이 : " + multi.getParameter("name") + "<br>");
			out.println("제　목 : " + multi.getParameter("title") + "<br>");
			out.println("파　일 : " + fileName + "<br>");
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}