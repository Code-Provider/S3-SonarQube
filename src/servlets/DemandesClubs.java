package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import bdd.Everything;
import beans.Club;

/**
 * Servlet implementation class DemandesClubs
 */
@WebServlet("/DemandesClubs")
public class DemandesClubs extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DemandesClubs() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Everything ev = new Everything() ; 
		List<Club> clubs = ev.getClubsNonValide() ; 
		request.setAttribute("clubs", clubs);
		this.getServletContext().getRequestDispatcher("/WEB-INF/DemandesClub.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Everything ev = new Everything() ; 
		String club_id1 = request.getParameter("club_id") ; 
		String bool = request.getParameter("bool") ; 
		//System.out.println(bool) ; 
		int club_id = Integer.parseInt(club_id1) ;
		//System.out.println(club_id) ; 
		ev.setState(club_id, bool);
		response.sendRedirect("/ProjetS3/Demandes");
	}

}
