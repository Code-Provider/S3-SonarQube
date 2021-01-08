package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bdd.Everything;
import beans.Club;

/**
 * Servlet implementation class MyClubs
 */
@WebServlet("/MyClubs")
public class MyClubs extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MyClubs() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession() ; 
	    Everything sheep = new Everything() ; 
		List<Club> clubs_gere = sheep.getClubsgere((int)session.getAttribute("id"));
		List<Club> clubs_membre = sheep.getClubsmembre((int)session.getAttribute("id")) ;
		request.setAttribute("clubs_geres", clubs_gere);
		request.setAttribute("clubs_membre", clubs_membre) ;
		
		this.getServletContext().getRequestDispatcher("/WEB-INF/MyClubs.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
