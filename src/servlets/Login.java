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
import bdd.Ecoles;
import beans.Ecole;
import beans.Eleve;


/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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
			response.sendRedirect("/ProjetS3/Acc");
		}
		else {
			Ecoles ecoles = new Ecoles() ; 
			List<Ecole> BigList = ecoles.getEcoles();
			request.setAttribute("ecoles", BigList) ; 
			this.getServletContext().getRequestDispatcher("/WEB-INF/Login.jsp").forward(request, response);
		}

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Eleve eleve = new Eleve() ;
		Ecoles ec = new Ecoles() ; 
		Everything ev = new Everything() ; 
		eleve.setLogin(request.getParameter("login")) ;
		eleve.setPassword(request.getParameter("password")) ;
		
		eleve = ev.checklog(eleve) ;  
		if (eleve != null){
			//System.out.println("hey" + eleve.getLogin());
			HttpSession session = request.getSession() ; 
			session.setAttribute("nom", eleve.getNom()) ; 
			session.setAttribute("login", eleve.getLogin()) ; 
			session.setAttribute("id", eleve.getId()) ;
			session.setAttribute("ecole", eleve.getEcole()) ;
			session.setAttribute("ecole_id", ec.getEcole(eleve.getEcole()).getId()) ; 

			response.sendRedirect("/ProjetS3/Interface");
		} 
		else{
			request.setAttribute("Error", "Identifiants érronés ou votre compte a été banni.") ;
			this.getServletContext().getRequestDispatcher("/WEB-INF/Login.jsp").forward(request, response);
		}
	}

}
