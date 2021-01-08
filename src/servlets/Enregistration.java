package servlets;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import bdd.Everything;
import bdd.Ecoles;
import beans.Ecole;
import beans.Eleve;

/**
 * Servlet implementation class Enregistration
 */
@WebServlet("/Enregistration")
public class Enregistration extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Enregistration() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession() ;
		if(session.getAttribute("nom") != null){
			String login = (String)session.getAttribute("nom") ; 
			if (login.equals("admin")) {
				this.getServletContext().getRequestDispatcher("/WEB-INF/InterfaceAdmin.jsp").forward(request, response);
			}
			else {
				this.getServletContext().getRequestDispatcher("/WEB-INF/InterfaceEleve.jsp").forward(request, response);
			}
		}
		else {
			this.getServletContext().getRequestDispatcher("/Login").forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Ecoles ec = new Ecoles() ; 
		Eleve eleve = new Eleve() ;
		Everything ev = new Everything() ; 
		eleve.setNom(request.getParameter("nom"));
		eleve.setLogin(request.getParameter("login"));
		eleve.setPassword(request.getParameter("password"));
		eleve.setEmail(request.getParameter("email"));
		eleve.setTelephone(request.getParameter("telephone"));
		eleve.setEcole(request.getParameter("ecole"));
		ev.addEleve(eleve);
		
		this.getServletContext().getRequestDispatcher("/Login").forward(request, response);
		
		
		
		
		
	}

}
