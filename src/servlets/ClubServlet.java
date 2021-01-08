package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bdd.Ecoles;
import bdd.Everything;
import beans.Club;
import beans.Ecole;

/**
 * Servlet implementation class ClubServlet
 */
@WebServlet("/ClubServlet")
public class ClubServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ClubServlet() {
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
		List<Club> clubs = sheep.getClubsEcole((String)session.getAttribute("ecole"), (int)session.getAttribute("id"));
		List<Club> clubs_geres = sheep.getClubsgere((int)session.getAttribute("id"));
		List<Club> clubs_refuse = sheep.getClubsRefuse((int)session.getAttribute("id")) ; 
		List<Club> clubs_attente = sheep.getClubsAttente((int)session.getAttribute("id")) ; 
		List<Club> clubs_accepte = sheep.getClubsmembre((int)session.getAttribute("id")) ;
		request.setAttribute("clubs", clubs);
		request.setAttribute("clubs_geres", clubs_geres);
		request.setAttribute("clubs_refuse", clubs_refuse);
		request.setAttribute("clubs_accepte", clubs_accepte);
		request.setAttribute("clubs_attente", clubs_attente);
		this.getServletContext().getRequestDispatcher("/WEB-INF/Clubs.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession() ; 
		Club club = new Club(); 
		club.setNom(request.getParameter("nom")) ; 
		club.setDescription(request.getParameter("description"));
		club.setLogo(request.getParameter("logo"));
		System.out.println(request.getParameter("logo")) ; 
		club.setEcole((String)session.getAttribute("ecole"));
		club.setValidite("False");
		Everything sheep = new Everything() ; 
		sheep.addClub(club, (int)session.getAttribute("id"), (String)session.getAttribute("ecole")) ;
		response.sendRedirect("/ProjetS3/Homepage");

	}

}
