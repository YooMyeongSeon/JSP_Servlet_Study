package Set;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/UM")
public class UpdateMovie extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Movie movie = new Movie();
		
		String mname = request.getParameter("mname");
		
		Movie_DAO dao = Movie_DAO.getInstance();
		movie = dao.getInMovie(mname);

		request.setAttribute("movie", movie);
		request.getRequestDispatcher("UpdateMovie.jsp").forward(request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		Movie movie = new Movie();
		movie.setCode(Integer.parseInt(request.getParameter("code")));
		movie.setMname(request.getParameter("mname"));
		movie.setDirector(request.getParameter("director"));
		movie.setMain(request.getParameter("main"));
		movie.setPrice(Integer.parseInt(request.getParameter("price")));
		
		Movie_DAO dao = Movie_DAO.getInstance();
		dao.UpdateMovie(movie);
		
		response.sendRedirect("index.jsp");
	}
}