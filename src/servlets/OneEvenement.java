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
import beans.Eleve;
import beans.Evenement;

/**
 * Servlet implementation class OneEvenement
 */
@WebServlet("/OneEvenement")
public class OneEvenement extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public OneEvenement() {
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
		List<Eleve> inscrits = ev.getElevesInscris(evenement.getId()) ; 
		request.setAttribute("evenement", evenement);
		request.setAttribute("eleves", inscrits) ; 
		this.getServletContext().getRequestDispatcher("/WEB-INF/Evenement.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
