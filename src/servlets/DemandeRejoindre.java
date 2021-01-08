package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bdd.Everything;

/**
 * Servlet implementation class DemandeRejoindre
 */
@WebServlet("/DemandeRejoindre")
public class DemandeRejoindre extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DemandeRejoindre() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession() ;
		int my_id = (int)session.getAttribute("id") ;
		String club_id1 = request.getParameter("club_id") ;
		int club_id = Integer.parseInt(club_id1) ;
		Everything ev = new Everything() ; 
		ev.addEleveClub(my_id, club_id);
		response.sendRedirect("/ProjetS3/Clubs");
		
		
		
		}

}
