package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bdd.Everything;
import beans.Evenement;

/**
 * Servlet implementation class ModEvenement
 */
@WebServlet("/ModEvenement")
public class ModEvenement extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ModEvenement() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Everything ev = new Everything() ; 
		HttpSession session = request.getSession() ; 
		int id = (int)session.getAttribute("id") ; 
		Evenement evenement = ev.getEvenement(Integer.parseInt(request.getParameter("evenement_id")), id) ;
		evenement.setDateDebut1(evenement.getDateDebut1().replace(" ", "T"));
		evenement.setDateFin1(evenement.getDateFin1().replace(" ", "T"));
		request.setAttribute("evenement", evenement);
		request.setAttribute("evenement_id", evenement.getId());
		request.setAttribute("club_id", Integer.parseInt(request.getParameter("club_id")));
		request.setAttribute("gerant_id", Integer.parseInt(request.getParameter("gerant_id")));
		request.setAttribute("nom", request.getParameter("nom"));
		this.getServletContext().getRequestDispatcher("/WEB-INF/ModEvenement.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
