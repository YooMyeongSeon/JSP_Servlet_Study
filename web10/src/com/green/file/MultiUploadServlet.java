package com.green.file;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Enumeration;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

@WebServlet("/MUS")
public class MultiUploadServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		serviceTest(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		serviceTest(request, response);
	}

	private void serviceTest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter out = response.getWriter();
		
		String savePath = "C:\\fileTest";
		int uploadFileSize = 10*1024*1024; //합계 파일 사이즈
		String encType = "UTF-8";
		
		try {
			//인스턴스가 생성됨과 동시에 업로드가 완료
			MultipartRequest multi = new MultipartRequest(request, savePath, uploadFileSize, encType, new DefaultFileRenamePolicy());
			
			if (multi == null) {
				out.println("<p>업로드 실패</p>");
			} else {
				out.println("<p>업로드 성공</p>");
			}
			
			Enumeration<String> fileNames = multi.getFileNames(); //파일 이름을 배열 형태로 가져온다.
			
			while (fileNames.hasMoreElements()) {
				String file = fileNames.nextElement(); //파일 이름이 아니라 전송된 객체 이름을 가져옴
				String fileName = multi.getFilesystemName(file); //실제 파일 이름을 가져온다.
				
				String originFileName = multi.getOriginalFileName(file);
				
				out.println("업로드된 파일명 : " + fileName + "<br>");
				out.println("원본 파일명 : " + originFileName + "<br>");
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
	}
}
