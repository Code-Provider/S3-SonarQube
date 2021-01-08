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
 * Servlet implementation class AddMessage
 */
@WebServlet("/AddMessage")
public class AddMessage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddMessage() {
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
		String message = request.getParameter("message") ;
		Everything ev = new Everything() ; 
		HttpSession session = request.getSession() ;
		int id = (int)session.getAttribute("id") ; 
		String eleve_nom = (String)session.getAttribute("nom") ;
		int club_id = Integer.parseInt(request.getParameter("club_id")) ; 
		ev.addMessage(club_id, message, id, eleve_nom) ; 
		int gerant_id = Integer.parseInt(request.getParameter("gerant_id")) ;
		String nom = (String)request.getParameter("nom"); 
		
		response.sendRedirect("/ProjetS3/GestionClub?club_id=" + club_id + "&gerant_id=" + gerant_id + "&nom="+ nom);
		
	}

}
