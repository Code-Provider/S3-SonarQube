package bdd;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import beans.Club;
import beans.Eleve;
import beans.Evenement;
import beans.Inscription;
import beans.Message;

public class Everything {
	
	private Connection connexion ;

	public void loadDatabase() {
	
		try {
			Class.forName("com.mysql.cj.jdbc.Driver") ; 
		}
		catch (ClassNotFoundException e) {
			
		}
		
		try {
			connexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/projets3?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC", "root", "root") ;
		}
		catch(SQLException e) {
			System.out.println(e) ; 
		}
	
	}

	public void addEleve(Eleve eleve) {
		
		loadDatabase() ; 
		Ecoles sheep = new Ecoles(); 
		int ec_id = sheep.getEcole(eleve.getEcole()).getId() ; 
		
		
		try {
			PreparedStatement preparedStatement = connexion.prepareStatement("INSERT INTO ELEVE (nom, login, password, email, telephone, ecole, ecole_id) VALUES (?,?,?,?,?,?,?) ;");
			preparedStatement.setString(1, eleve.getNom());
			preparedStatement.setString(2, eleve.getLogin());
			preparedStatement.setString(3, eleve.getPassword());
			preparedStatement.setString(4, eleve.getEmail());
			preparedStatement.setString(5, eleve.getTelephone()); 
			preparedStatement.setString(6, eleve.getEcole()); 
			preparedStatement.setInt(7, ec_id); 
			
			preparedStatement.executeUpdate() ; 
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e) ;
		}finally {
			
			try {
				connexion.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace(); //
			} 
			
		}
		
	}


	public Eleve checklog(Eleve eleve){
		loadDatabase() ; 

		Statement statement = null ;
		ResultSet result = null ; 
		
		
		try {
			
			statement = connexion.createStatement() ; 
			result = statement.executeQuery("SELECT id, nom, ecole FROM ELEVE WHERE login = '" + eleve.getLogin()
			+ "' and password = '" + eleve.getPassword() + "' and validite = 'unban' ;"  );

			
			if(result.next()){
				eleve.setId(result.getInt("id"));
				eleve.setNom(result.getString("nom")) ; 
				eleve.setEcole(result.getString("ecole")) ; 
				return eleve;

			}
			else {
				return null ; 
			}

		}catch(SQLException e){
			System.out.println(e) ;
			return null ;  
		}
	
	}
	
	public void addClub(Club club, int id, String ec) {
		loadDatabase() ; 
		Ecoles sheep = new Ecoles(); 
		int ec_id = sheep.getEcole(ec).getId() ; 
		
		
		
		try {
			PreparedStatement preparedStatement = connexion.prepareStatement("INSERT INTO CLUB (nom, description, logo, validite, gerant_id, ecole, ecole_id) VALUES (?,?,?,?,?,?,?) ;");
			preparedStatement.setString(1, club.getNom());
			preparedStatement.setString(2, club.getDescription());
			preparedStatement.setString(3, club.getLogo());
			preparedStatement.setString(4, club.getValidite());
			preparedStatement.setInt(5, id);
			preparedStatement.setString(6, club.getEcole());
			preparedStatement.setInt(7, ec_id) ; 
			preparedStatement.executeUpdate() ; 

	}catch (SQLException e) {
		// TODO Auto-generated catch block
		System.out.println(e) ;
	}finally {
		
		try {
			connexion.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace(); //
		} 
		
		}
	}
	
public List<Club> getClubs(){
		
		List<Club> clubs = new ArrayList<Club>() ; 
		
		loadDatabase() ; 

		Statement statement = null ;
		ResultSet result = null ; 
		
		try {
			
			statement = connexion.createStatement() ; 
			result = statement.executeQuery("SELECT id, nom, description, logo, validite FROM club");
			
			while(result.next()) {
				int id = result.getInt("id"); 
				String nom = result.getString("nom") ; 
				String description = result.getString("description") ; 
				String logo = result.getString("logo") ; 
				
				Club club = new Club() ;
				
				club.setId(id);
				club.setNom(nom) ; 
				club.setDescription(description);
				club.setLogo(logo);
				
				clubs.add(club) ; 
				
			}
		}catch(SQLException e) {
			
		}finally {
			try {
			if (result != null) {
				result.close() ; 
			}
			if (statement != null) {
				statement.close(); 
			}
			if(connexion != null) {
				connexion.close(); 
			}
			}
			catch(SQLException ignore) {
				
			}
		
		} 
		return clubs ;
	}

	public Club getClub(int club_id){
	
	Club club = new Club() ; 
	
	loadDatabase() ; 

	Statement statement = null ;
	ResultSet result = null ; 
	
	try {
		
		statement = connexion.createStatement() ; 
		result = statement.executeQuery("SELECT * FROM club where id = " + club_id + "; ");
		
		while(result.next()) {
			int id = result.getInt("id");
			String nom = result.getString("nom") ; 
			String description = result.getString("description") ; 
			String logo = result.getString("logo") ; 
			Eleve gerant = getEleveById(result.getInt("gerant_id")) ; 
			
			club.setId(id);
			club.setNom(nom) ; 
			club.setDescription(description);
			club.setLogo(logo);
			club.setGerant(gerant); 
			
		}
	}catch(SQLException e) {
		
	}finally {
		try {
		if (result != null) {
			result.close() ; 
		}
		if (statement != null) {
			statement.close(); 
		}
		if(connexion != null) {
			connexion.close(); 
		}
		}
		catch(SQLException ignore) {
			
		}
	
	} 
	return club ;
}

	public Eleve getEleveById(int id) {
		Eleve eleve = new Eleve(); 
		loadDatabase() ; 

		Statement statement = null ;
		ResultSet result = null ; 
		
		try {
			
			statement = connexion.createStatement() ; 
			result = statement.executeQuery("SELECT * FROM eleve WHERE id = " + id + " ; ");
			while(result.next()) {
				eleve.setId(result.getInt("id"));
				eleve.setNom(result.getString("nom")) ; 
				eleve.setEcole(result.getString("ecole")) ; 
				eleve.setEmail(result.getString("email"));
				eleve.setTelephone(result.getString("telephone"));
				eleve.setValidite(result.getString("validite"));
			}
		}catch(SQLException e) {
				System.out.println(e) ; 
			}
		
		return eleve ;
	}
	
	public List<Club> getClubsNonValide(){
		
		List<Club> clubs = new ArrayList<Club>() ;  
		Eleve eleve = new Eleve() ; 
		loadDatabase() ; 

		Statement statement = null ;
		ResultSet result = null ; 
		
		try {
			
			statement = connexion.createStatement() ; 
			result = statement.executeQuery("SELECT * FROM club WHERE validite = " + "false" + " ;");
			while(result.next()) {
				if (result.getString("validite").equals("False")) {
					Club club = new Club(); 
					club.setId(result.getInt("id"));
					club.setNom(result.getString("nom"));
					club.setDescription(result.getString("description"));
					club.setLogo(result.getString("logo"));
					club.setValidite(result.getString("validite"));
					club.setEcole(result.getString("ecole"));
					eleve = getEleveById(result.getInt("gerant_id")) ; 
					club.setGerant(eleve);
					
					clubs.add(club) ;
				}
				
				
				
			}
		}catch(SQLException e) {
				System.out.println(e) ; 
			}
		
		return clubs ;
	}
	
	public void setState(int id, String state) {
		
		loadDatabase() ; 
		
		
		try {
			if (state.equals("true")) {
				PreparedStatement preparedStatement = connexion.prepareStatement("UPDATE CLUB SET VALIDITE = 'True' WHERE id = " +  id + " ; ");
				preparedStatement.executeUpdate() ; 
			}
			else {
				PreparedStatement preparedStatement = connexion.prepareStatement("UPDATE CLUB SET VALIDITE = 'Dead' WHERE id = " +  id + " ; ");
				preparedStatement.executeUpdate() ; 
			}
			

		}catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e) ;
		}finally {
			
			try {
				connexion.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace(); //
			} 
			
			}
	}
	
	public List<Club> getClubsEcole(String ecole, int id){
		
		List<Club> clubs = new ArrayList<Club>() ;  
		Eleve eleve = new Eleve() ; 
		loadDatabase() ; 


		Statement statement = null ;
		ResultSet result = null ; 

		
		try {
			
			statement = connexion.createStatement() ; 
			result = statement.executeQuery("SELECT * FROM club WHERE ecole = '" + ecole + "' and gerant_id !=" + id + " and id not in (select club_id from eleve_club where eleve_id = " + id + " );");
			while(result.next()) {
				if (result.getString("validite").equals("True")) {
					Club club = new Club(); 
					club.setId(result.getInt("id"));
					club.setNom(result.getString("nom"));
					club.setDescription(result.getString("description"));
					club.setLogo(result.getString("logo"));
					club.setValidite(result.getString("validite"));
					club.setEcole(result.getString("ecole"));
					eleve = getEleveById(result.getInt("gerant_id")) ; 
					club.setGerant(eleve);
					
					clubs.add(club) ;
				}
				
				
				
			}
		}catch(SQLException e) {
				System.out.println(e) ; 
			}
		
		return clubs ;
	}
	
	public void addEleveClub(int id_eleve, int id_club) {
		
		loadDatabase() ;   
		
		
		try {
			java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
			
			PreparedStatement preparedStatement = connexion.prepareStatement("INSERT INTO ELEVE_CLUB (eleve_id, club_id, date) VALUES (?,?,?) ;");
			preparedStatement.setInt(1, id_eleve);
			preparedStatement.setInt(2, id_club);
			preparedStatement.setTimestamp(3, date);
			
			
			preparedStatement.executeUpdate() ; 
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e) ;
		}finally {
			
			try {
				connexion.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace(); //
			} 
			
		}
	
	}
	
	
	/*public List<Integer> getclubids(int id) {

		loadDatabase() ; 


		Statement statement = null ;
		ResultSet result = null ; 
		List<Integer> clubs_ids = new ArrayList<Integer>()  ; 
		
		
		try {
			
			statement = connexion.createStatement() ; 
			result = statement.executeQuery("SELECT club_id FROM eleve_club WHERE eleve_id = '" + id + "' ;");
			while(result.next()) {
				clubs_ids.add(result.getInt("club_id")) ;
	        }

		}catch(SQLException e) {
			System.out.println(e) ; 
		}
	
	return clubs_ids ;
}*/
	
	public List<Club> getClubsgere(int id){
		
		loadDatabase() ; 
		List<Club> clubs = new ArrayList<Club>() ; 

		Statement statement = null ;
		ResultSet result = null ; 
		
		try {
			
			statement = connexion.createStatement() ; 
			result = statement.executeQuery("SELECT * from club where validite = 'True' and gerant_id = " + id + ";");
			
			while(result.next()) {
				int theid = result.getInt("id") ;
				String nom = result.getString("nom") ; 
				String description = result.getString("description") ; 
				String logo = result.getString("logo") ; 
				String ecole = result.getString("ecole") ; 
				Eleve eleve = getEleveById(result.getInt("gerant_id")) ; 
				
				
				Club club = new Club() ;
				
				club.setId(theid);
				club.setNom(nom) ; 
				club.setDescription(description);
				club.setLogo(logo);
				club.setEcole(ecole);
				club.setGerant(eleve);
				
				clubs.add(club) ; 
				
			}
		}catch(SQLException e) {
			
		}finally {
			try {
			if (result != null) {
				result.close() ; 
			}
			if (statement != null) {
				statement.close(); 
			}
			if(connexion != null) {
				connexion.close(); 
			}
			}
			catch(SQLException ignore) {
				
			}
		
		} 
		return clubs ;
	}
	
	public List<Club> getClubsmembre(int id){
		
		loadDatabase() ; 
		List<Club> clubs = new ArrayList<Club>() ; 

		Statement statement = null ;
		ResultSet result = null ; 
		
		try {
			
			statement = connexion.createStatement() ; 
			result = statement.executeQuery("SELECT * from club where validite = 'true' and gerant_id != " + id + " and id in (select club_id from eleve_club where validite = 'true' and eleve_id = " + id + ");");
			
			while(result.next()) {
				int theid = result.getInt("id") ;
				String nom = result.getString("nom") ; 
				String description = result.getString("description") ; 
				String logo = result.getString("logo") ; 
				String ecole = result.getString("ecole") ;
				Eleve eleve = getEleveById(result.getInt("gerant_id")) ; 
				
				
				Club club = new Club() ;
				
				club.setId(theid);
				club.setNom(nom) ; 
				club.setDescription(description);
				club.setLogo(logo);
				club.setEcole(ecole);
				club.setGerant(eleve);
				
				clubs.add(club) ; 
				
			}
		}catch(SQLException e) {
			
		}finally {
			try {
			if (result != null) {
				result.close() ; 
			}
			if (statement != null) {
				statement.close(); 
			}
			if(connexion != null) {
				connexion.close(); 
			}
			}
			catch(SQLException ignore) {
				
			}
		
		} 
		return clubs ;
	}
	
	public List<Eleve> getDemandesEleve(int club_id){
		
		loadDatabase() ; 
		List<Eleve> eleves = new ArrayList<Eleve>() ; 

		Statement statement = null ;
		ResultSet result = null ; 
		
		try {
			statement = connexion.createStatement() ; 
			result = statement.executeQuery("SELECT eleve_id, date from eleve_club where validite = 'false' and club_id = "+ club_id + " order by date desc;");
			while(result.next()) {
				Eleve eleve = new Eleve() ; 
				eleve = getEleveById(result.getInt("eleve_id")) ; 
				String abc = new SimpleDateFormat("dd/MM/yyyy").format(result.getTimestamp("date")) ; 
				eleve.setDate(abc);
				eleves.add(eleve) ; 
			}
		}catch(SQLException e) {
				System.out.println(e) ; 
			}
		
		return eleves ; 
	}
	
	public List<Eleve> getMembres(int club_id){
		
		loadDatabase() ; 
		List<Eleve> eleves = new ArrayList<Eleve>() ; 

		Statement statement = null ;
		ResultSet result = null ; 
		
		try {
			statement = connexion.createStatement() ; 
			result = statement.executeQuery("SELECT eleve_id from eleve_club where validite = 'true' and club_id = "+ club_id + " order by date desc;");
			while(result.next()) {
				Eleve eleve = new Eleve() ; 
				eleve = getEleveById(result.getInt("eleve_id")) ; 
				//String abc = new SimpleDateFormat("yyyy/MM/dd").format(result.getTimestamp("date")) ; 
				//eleve.setDate(abc);
				eleves.add(eleve) ; 
			}
		}catch(SQLException e) {
				System.out.println(e) ; 
			}
		
		return eleves ; 
	}
	
	
	public void DeleteMembre(int membre_id, int club_id) {
		loadDatabase() ; 
		
		
		try {
			PreparedStatement preparedStatement = connexion.prepareStatement("delete from eleve_club where eleve_id = " + membre_id + " and club_id = " + club_id + "; "); 
			preparedStatement.executeUpdate() ; 

	}catch (SQLException e) {
		// TODO Auto-generated catch block
		System.out.println(e) ;
	}finally {
		
		try {
			connexion.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace(); //
		} 
		
		}
	}
	
	public void VrDemande(int eleve_id, int club_id, String value) {
		loadDatabase() ; 
		
		
		try {
			if (value.equals("valider")){
				PreparedStatement preparedStatement = connexion.prepareStatement("update eleve_club set validite = 'true' where eleve_id = " + eleve_id + " and club_id = " + club_id + "; "); 
				preparedStatement.executeUpdate() ;
			}
			else {
				PreparedStatement preparedStatement = connexion.prepareStatement("update eleve_club set validite = 'deny' where eleve_id = " + eleve_id + " and club_id = " + club_id + "; "); 
				preparedStatement.executeUpdate() ;
			}

	}catch (SQLException e) {
		// TODO Auto-generated catch block
		System.out.println(e) ;
	}finally {
		
		try {
			connexion.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace(); //
		} 
		
		}
	}
	
	public void addMessage(int club_id, String Message, int eleve_id, String eleve_nom) {
		
		loadDatabase() ;   
		
		try {
			java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
			
			PreparedStatement preparedStatement = connexion.prepareStatement("INSERT INTO MESSAGE (content, club_id, date, eleve_id, eleve_nom) VALUES (?,?,?,?,?) ;");
			preparedStatement.setString(1, Message);
			preparedStatement.setInt(2, club_id);
			preparedStatement.setTimestamp(3, date);
			preparedStatement.setInt(4, eleve_id);
			preparedStatement.setString(5, eleve_nom);
			
			
			preparedStatement.executeUpdate() ; 
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e) ;
		}finally {
			
			try {
				connexion.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace(); //
			} 
			
		}
	
	}
	
	public List<Message> getMessages(int club_id){
		
		loadDatabase() ; 
		List<Message> messages = new ArrayList<Message>() ; 

		Statement statement = null ;
		ResultSet result = null ; 
		
		try {
			statement = connexion.createStatement() ; 
			result = statement.executeQuery("SELECT id, content, eleve_id, eleve_nom, date from message where club_id = " + club_id +   " order by date desc;");
			while(result.next()) {
				Message message = new Message() ; 
				String abc = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss").format(result.getTimestamp("date")) ; 
				message.setDate(abc);
				message.setId(result.getInt("id"));
				message.setContent(result.getString("content"));
				message.setEleve_nom(result.getString("eleve_nom"));
				message.setEleve_id(result.getInt("eleve_id"));
				messages.add(message) ; 
			}
		}catch(SQLException e) {
				System.out.println(e) ; 
			}
		
		return messages ; 
	}
	
	public void addReponse(String reponse, int message_id, int eleve_id, String eleve_nom) {
		
		loadDatabase() ;   
		
		try {
			java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
			
			PreparedStatement preparedStatement = connexion.prepareStatement("INSERT INTO REPONSE (content, date, eleve_id, eleve_nom, message_id) VALUES (?,?,?,?,?) ;");
			preparedStatement.setString(1, reponse) ; 
			preparedStatement.setTimestamp(2, date);
			preparedStatement.setInt(3, eleve_id);
			preparedStatement.setString(4, eleve_nom);
			preparedStatement.setInt(5, message_id) ; 
			
			preparedStatement.executeUpdate() ; 
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e) ;
		}finally {
			
			try {
				connexion.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace(); //
			} 
			
		}
	}
	
	public List<ArrayList<Message>> getReponses(List<Message> messages){
		List<ArrayList<Message>> ListOList = new ArrayList<ArrayList<Message>>();
		loadDatabase() ; 
		//List<Message> messages = new ArrayList<Message>() ; 

		Statement statement = null ;
		ResultSet result = null ; 
		for (Message message : messages) {
			ArrayList<Message> reponses = new ArrayList<Message>() ; 
			try {
				statement = connexion.createStatement() ; 
				result = statement.executeQuery("SELECT content, eleve_id, eleve_nom, date from reponse where message_id = " + message.getId() +   ";");
				while(result.next()) {
					Message reponse = new Message() ; 
					String abc = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss").format(result.getTimestamp("date")) ; 
					reponse.setDate(abc);
					reponse.setContent(result.getString("content"));
					reponse.setEleve_nom(result.getString("eleve_nom"));
					reponse.setEleve_id(result.getInt("eleve_id"));
					reponses.add(reponse) ; 
				}
				ListOList.add(reponses) ; 
			}catch(SQLException e) {
					System.out.println(e) ; 
				}
		}
		
		
		return ListOList ; 
	}
	public List<Club> getClubsAttente(int id){
		List<Club> clubs = new ArrayList<Club>() ;  
		Eleve eleve = new Eleve() ; 
		loadDatabase() ; 


		Statement statement = null ;
		ResultSet result = null ; 

		
		try {
			
			statement = connexion.createStatement() ; 
			result = statement.executeQuery("SELECT * FROM club WHERE validite = 'true' and gerant_id !=" + id + " and id in (select club_id from eleve_club where eleve_id = " + id + " and validite = 'false' );");
			while(result.next()) {
				if (result.getString("validite").equals("True")) {
					Club club = new Club(); 
					club.setId(result.getInt("id"));
					club.setNom(result.getString("nom"));
					club.setDescription(result.getString("description"));
					club.setLogo(result.getString("logo"));
					club.setValidite(result.getString("validite"));
					club.setEcole(result.getString("ecole"));
					eleve = getEleveById(result.getInt("gerant_id")) ; 
					club.setGerant(eleve);
					
					clubs.add(club) ;
				}
				
				
				
			}
		}catch(SQLException e) {
				System.out.println(e) ; 
			}
		
		return clubs ;
	}
	
	public List<Club> getClubsRefuse(int id){
		List<Club> clubs = new ArrayList<Club>() ;  
		Eleve eleve = new Eleve() ; 
		loadDatabase() ; 


		Statement statement = null ;
		ResultSet result = null ; 

		
		try {
			
			statement = connexion.createStatement() ; 
			result = statement.executeQuery("SELECT * FROM club WHERE validite = 'true' and gerant_id !=" + id + " and id in (select club_id from eleve_club where eleve_id = " + id + " and validite = 'deny' );");
			while(result.next()) {
				if (result.getString("validite").equals("True")) {
					Club club = new Club(); 
					club.setId(result.getInt("id"));
					club.setNom(result.getString("nom"));
					club.setDescription(result.getString("description"));
					club.setLogo(result.getString("logo"));
					club.setValidite(result.getString("validite"));
					club.setEcole(result.getString("ecole"));
					eleve = getEleveById(result.getInt("gerant_id")) ; 
					club.setGerant(eleve);
					
					clubs.add(club) ;
				}
				
				
				
			}
		}catch(SQLException e) {
				System.out.println(e) ; 
			}
		
		return clubs ;
	}
	
	
	public void addEvenement(Evenement evenement, int club_id, String ecole_nom, int ecole_id) {
		
		loadDatabase() ;   
		
		try {
			
			PreparedStatement preparedStatement = connexion.prepareStatement("INSERT INTO EVENEMENT(titre, description, activite, club_id, ecole_nom, image, type, ecole_id, datedebut, datefin) VALUES (?,?,?,?,?,?,?,?,'" + evenement.getDateDebut() +"','"+ evenement.getDateFin()+"');");
			preparedStatement.setString(1, evenement.getTitre()) ; 
			preparedStatement.setString(2, evenement.getDescription());
			preparedStatement.setString(3, evenement.getActivites());
			preparedStatement.setInt(4, club_id);
			preparedStatement.setString(5, ecole_nom) ;
			preparedStatement.setString(6, evenement.getImage()) ;
			preparedStatement.setString(7, evenement.getType());
			preparedStatement.setInt(8, ecole_id);
			//preparedStatement.setString(6, evenement.getDateDebut()); 
			//preparedStatement.setString(7, evenement.getDateFin()); 
			
			preparedStatement.executeUpdate() ; 
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e) ;
		}finally {
			
			try {
				connexion.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace(); 
			} 
			
		}
		
	}
	
	public List<Evenement> getEvenements(int club_id){
		List<Evenement> evenements = new ArrayList<Evenement>() ;  
		loadDatabase() ; 
		Ecoles ec = new Ecoles(); 


		Statement statement = null ;
		ResultSet result = null ; 

		
		try {
			
			statement = connexion.createStatement() ;
			java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
			//System.out.println(date); 
			result = statement.executeQuery("SELECT * FROM evenement WHERE club_id =" + club_id + " and datefin > '" + date + "' order by datedebut asc ;");
			while(result.next()) {
					Evenement evenement = new Evenement(); 
					evenement.setId(result.getInt("id"));
					evenement.setTitre(result.getString("titre"));
					evenement.setDescription(result.getString("description"));
					evenement.setImage(result.getString("image"));
					String abcd = new SimpleDateFormat("dd-MM-yyyy HH:mm").format(result.getTimestamp("datedebut")) ;
					String abcd2 = new SimpleDateFormat("dd-MM-yyyy HH:mm").format(result.getTimestamp("datefin")) ;
					evenement.setDateDebut(abcd);
					evenement.setDateFin(abcd2);
					evenement.setType(result.getString("type"));
					evenement.setEcole(ec.getEcole(result.getInt("ecole_id"))) ; 
					evenement.setClub(getClub(result.getInt("club_id")));
					
					evenements.add(evenement) ;
				
				
				
			}
		}catch(SQLException e) {
				System.out.println(e) ; 
			}
		
		return evenements ;
	}
	
	public void modEvenement(Evenement evenement, int club_id, String ecole_nom, int ecole_id, int evenement_id) {
		
		loadDatabase() ;   
		
		try {
			
			PreparedStatement preparedStatement = connexion.prepareStatement("UPDATE EVENEMENT SET titre = ?, description = ?, activite = ?, club_id = ?,ecole_nom = ?, image = ?, type = ?, ecole_id = ?, datedebut = '" + evenement.getDateDebut() + "', datefin = '" + evenement.getDateFin() + "' where id = "+ evenement_id +";") ; 
			preparedStatement.setString(1, evenement.getTitre());
			preparedStatement.setString(2, evenement.getDescription());
			preparedStatement.setString(3, evenement.getActivites());
			preparedStatement.setInt(4, club_id);
			preparedStatement.setString(5, ecole_nom);
			preparedStatement.setString(6, evenement.getImage());
			preparedStatement.setString(7, evenement.getType());
			preparedStatement.setInt(8, ecole_id);
			preparedStatement.executeUpdate() ; 
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e) ;
		}finally {
			
			try {
				connexion.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace(); 
			} 
			
		}
		
	}
	
	public Evenement getEvenement(int evenement_id, int eleve_id) {
		loadDatabase() ; 
		Ecoles ec = new Ecoles(); 


		Statement statement = null ;
		ResultSet result = null ; 
		Evenement evenement = new Evenement(); 

		
		try {
			
			statement = connexion.createStatement() ;
			//System.out.println(date); 
			result = statement.executeQuery("SELECT * FROM evenement WHERE id =" + evenement_id + ";" );
			while(result.next()) {
					evenement.setId(result.getInt("id"));
					evenement.setTitre(result.getString("titre"));
					evenement.setDescription(result.getString("description"));
					evenement.setImage(result.getString("image"));
					evenement.setActivites(result.getString("activite"));
					String abc = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(result.getTimestamp("datedebut")) ; 
					String abc2 = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(result.getTimestamp("datefin")) ; 
					String abcd = new SimpleDateFormat("dd-MM-yyyy HH:mm").format(result.getTimestamp("datedebut")) ;
					String abcd2 = new SimpleDateFormat("dd-MM-yyyy HH:mm").format(result.getTimestamp("datefin")) ;
					evenement.setDateDebut1(abc);
					evenement.setDateFin1(abc2);
					evenement.setDateDebut(abcd);
					evenement.setDateFin(abcd2);
					evenement.setType(result.getString("type"));
					evenement.setEcole(ec.getEcole(result.getInt("ecole_id"))) ; 
					evenement.setClub(getClub(result.getInt("club_id")));
					evenement.setValue(false);
					IsInscris(eleve_id, evenement) ;
					
					List<Eleve> membres = getMembres(result.getInt("club_id")) ;
					
					if (eleve_id == evenement.getClub().getGerant().getId()) {
						evenement.setValue(true);
					}
					for(Eleve e : membres) {
						if(eleve_id == e.getId()) {
							evenement.setValue(true);
						}
					}
				
			}
		}catch(SQLException e) {
				System.out.println(e) ; 
			}
		
		return evenement ;
	}
	
	public void deleteEvenement(int evenement_id) {
		
		loadDatabase() ; 
		
		
		try {
			PreparedStatement preparedStatement = connexion.prepareStatement("delete from evenement where id = " + evenement_id + ";"); 
			preparedStatement.executeUpdate() ; 

	}catch (SQLException e) {
		// TODO Auto-generated catch block
		System.out.println(e) ;
	}finally {
		
		try {
			connexion.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace(); //
		} 
		
		}
	}
	
	public List<Evenement> getEvenements(int ecole_id, int eleve_id){
		List<Evenement> evenements = new ArrayList<Evenement>() ;  
		loadDatabase() ; 
		Ecoles ec = new Ecoles(); 


		Statement statement = null ;
		ResultSet result = null ; 


		
		try {
			
			statement = connexion.createStatement() ;
			java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
			//System.out.println(date); 
			result = statement.executeQuery("SELECT * FROM evenement where (type = 'Public' or ecole_id = "+ ecole_id + ") and datefin > '" + date + "' order by datedebut asc ;");
			while(result.next()) {
					Evenement evenement = new Evenement();
					evenement.setValue(false);
					Club club =  getClub(result.getInt("club_id")) ;
					Eleve gerant = club.getGerant() ; 
					List<Eleve> membres = getMembres(result.getInt("club_id")) ;
					if (eleve_id == gerant.getId()) {
						evenement.setValue(true);
					}
					for(Eleve e : membres) {
						if(eleve_id == e.getId()) {
							evenement.setValue(true);
						}
					}
					
					String abc = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(result.getTimestamp("datedebut")) ; 
					String abc2 = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(result.getTimestamp("datefin")) ; 
					String abcd = new SimpleDateFormat("dd-MM-yyyy HH:mm").format(result.getTimestamp("datedebut")) ;
					String abcd2 = new SimpleDateFormat("dd-MM-yyyy HH:mm").format(result.getTimestamp("datefin")) ;
					evenement.setId(result.getInt("id"));
					evenement.setTitre(result.getString("titre"));
					evenement.setDescription(result.getString("description"));
					evenement.setImage(result.getString("image"));
					evenement.setDateDebut(abcd);
					evenement.setDateFin(abcd2);
					evenement.setDateDebut1(abc);
					evenement.setDateFin1(abc2);
					evenement.setType(result.getString("type"));
					evenement.setEcole(ec.getEcole(result.getInt("ecole_id"))) ; 
					evenement.setClub(getClub(result.getInt("club_id")));
					IsInscris(eleve_id, evenement) ; 
					
					/*if (result2.next()) {
						evenement.setIvalue(true);
					}
					else {
						evenement.setIvalue(false);
					}*/
					evenements.add(evenement) ;
				
				
				
			}
		}catch(SQLException e) {
				System.out.println(e) ; 
			}
		
		return evenements ;
	}
	
	
	public void addIncription(int eleve_id, int evenement_id) {
		loadDatabase() ; 
		java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
		
		
		
		try {
			PreparedStatement preparedStatement = connexion.prepareStatement("INSERT INTO INSCRIPTION (eleve_id, evenement_id, date) VALUES (?,?,?) ;");
			preparedStatement.setInt(1, eleve_id);
			preparedStatement.setInt(2, evenement_id);
			preparedStatement.setTimestamp(3, date);
			preparedStatement.executeUpdate() ; 

	}catch (SQLException e) {
		// TODO Auto-generated catch block
		System.out.println(e) ;
	}finally {
		
		try {
			connexion.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace(); //
		} 
		
		}
	}
	
	public void RemoveInscription(int eleve_id, int evenement_id) {
		loadDatabase() ;
		
		try {
			PreparedStatement preparedStatement = connexion.prepareStatement("DELETE FROM INSCRIPTION WHERE eleve_id = "+ eleve_id + " and evenement_id = " + evenement_id + " ;");
			preparedStatement.executeUpdate() ; 

	}catch (SQLException e) {
		// TODO Auto-generated catch block
		System.out.println(e) ;
	}finally {
		
		try {
			connexion.close();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace(); //
		} 
		
		}
		
		
	}
	
	public void IsInscris(int eleve_id, Evenement evenement){
		loadDatabase() ;  

		Statement statement = null ;
		ResultSet result = null ; 
		
		
		
		try {
			
			statement = connexion.createStatement() ; 
			result = statement.executeQuery("SELECT id, eleve_id, evenement_id FROM inscription where evenement_id = "+ evenement.getId() + " and eleve_id = "+ eleve_id + " ; ");
			
			if(result.next()) {
				evenement.setIvalue(true);
			}
			else {
				evenement.setIvalue(false);
			}
		}catch(SQLException e) {
			
		}finally {
			try {
			if (result != null) {
				result.close() ; 
			}
			if (statement != null) {
				statement.close(); 
			}
			if(connexion != null) {
				connexion.close(); 
			}
			}
			catch(SQLException ignore) {
				
			}
		
		} 


	}
	
	public List<Message> getLatestMessages(int eleve_id){
		
		List<Club> clubsgere = getClubsgere(eleve_id) ;
		List<Club> clubsmembre = getClubsmembre(eleve_id) ; 
		
		loadDatabase() ; 
		List<Message> messages = new ArrayList<Message>() ;
		java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());

		Statement statement = null ;
		ResultSet result = null ;
		
		
		for (Club club : clubsgere) {
			try {
				
				statement = connexion.createStatement() ; 
				result = statement.executeQuery("SELECT id, content, eleve_id, eleve_nom, date from message where club_id = " + club.getId() +   " and datediff('"+ date + "',date) < 30 order by date desc;");
				while(result.next()) {
					Message message = new Message() ; 
					String abc = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss").format(result.getTimestamp("date")) ; 
					message.setDate(abc);
					message.setId(result.getInt("id"));
					message.setContent(result.getString("content"));
					message.setEleve_nom(result.getString("eleve_nom"));
					message.setEleve_id(result.getInt("eleve_id"));
					message.setClub(club) ; 
					messages.add(message) ;
				}
				
			}catch(SQLException e) {
					System.out.println(e) ; 
				}
		}
		
		for (Club club : clubsmembre) {
			try {
				
				statement = connexion.createStatement() ; 
				result = statement.executeQuery("SELECT id, content, eleve_id, eleve_nom, date from message where club_id = " + club.getId() +   " and datediff('"+ date + "',date) < 30 order by date desc;");
				while(result.next()) {
					Message message = new Message() ; 
					String abc = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss").format(result.getTimestamp("date")) ; 
					message.setDate(abc);
					message.setId(result.getInt("id"));
					message.setContent(result.getString("content"));
					message.setEleve_nom(result.getString("eleve_nom"));
					message.setEleve_id(result.getInt("eleve_id"));
					message.setClub(club) ; 
					messages.add(message) ;
				}
				
			}catch(SQLException e) {
					System.out.println(e) ; 
				}
		}
		
		return messages ; 
	}
	
	
	public List<Evenement> getLatestEvenements(int ecole_id, int eleve_id){
		List<Evenement> evenements = new ArrayList<Evenement>() ;  
		loadDatabase() ; 
		Ecoles ec = new Ecoles(); 


		Statement statement = null ;
		ResultSet result = null ; 


		
		try {
			
			statement = connexion.createStatement() ;
			java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());
			//System.out.println(date); 
			result = statement.executeQuery("SELECT * FROM evenement where (type = 'Public' or ecole_id = "+ ecole_id + ") and datefin > '" + date + "' and datediff(datedebut, '"+ date + "') < 14  order by datedebut asc ;");
			while(result.next()) {
					Evenement evenement = new Evenement();
					evenement.setValue(true);
					Club club =  getClub(result.getInt("club_id")) ;
					Eleve gerant = club.getGerant() ; 
					List<Eleve> membres = getMembres(result.getInt("club_id")) ;
					if (eleve_id == gerant.getId()) {
						evenement.setValue(false);
					}
					for(Eleve e : membres) {
						if(eleve_id == e.getId()) {
							evenement.setValue(false);
						}
					}
					
					String abc = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(result.getTimestamp("datedebut")) ; 
					String abc2 = new SimpleDateFormat("yyyy-MM-dd HH:mm").format(result.getTimestamp("datefin")) ; 
					String abcd = new SimpleDateFormat("dd-MM-yyyy HH:mm").format(result.getTimestamp("datedebut")) ;
					String abcd2 = new SimpleDateFormat("dd-MM-yyyy HH:mm").format(result.getTimestamp("datefin")) ;
					evenement.setId(result.getInt("id"));
					evenement.setTitre(result.getString("titre"));
					evenement.setDescription(result.getString("description"));
					evenement.setImage(result.getString("image"));
					evenement.setDateDebut(abcd);
					evenement.setDateFin(abcd2);
					evenement.setDateDebut1(abc);
					evenement.setDateFin1(abc2);
					evenement.setType(result.getString("type"));
					evenement.setEcole(ec.getEcole(result.getInt("ecole_id"))) ; 
					evenement.setClub(getClub(result.getInt("club_id")));
					IsInscris(eleve_id, evenement) ; 
					
					/*if (result2.next()) {
						evenement.setIvalue(true);
					}
					else {
						evenement.setIvalue(false);
					}*/
					evenements.add(evenement) ;
				
				
				
			}
		}catch(SQLException e) {
				System.out.println(e) ; 
			}
		
		return evenements ;
	}
	
	
	public List<Eleve> getAllEleves(){
		
		loadDatabase() ; 
		List<Eleve> eleves = new ArrayList<Eleve>() ; 

		Statement statement = null ;
		ResultSet result = null ; 
		
		try {
			statement = connexion.createStatement() ; 
			result = statement.executeQuery("SELECT * from eleve where id != 1 ; ");
			while(result.next()) {
				Eleve eleve = new Eleve() ; 
				eleve = getEleveById(result.getInt("id")) ; 
				eleves.add(eleve) ; 
			}
		}catch(SQLException e) {
				System.out.println(e) ; 
			}
		
		return eleves ; 
		
	}
	
	
	public void ban(int id) {
		loadDatabase() ;   
		
		try {
			
			PreparedStatement preparedStatement = connexion.prepareStatement("UPDATE eleve set validite = ? where id = " + id + " ;") ; 
			preparedStatement.setString(1, "ban");
			preparedStatement.executeUpdate() ; 
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e) ;
		}finally {
			
			try {
				connexion.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace(); 
			} 
			
		}
	}
	
	public void unban(int id) {
		loadDatabase() ;   
		
		try {
			
			PreparedStatement preparedStatement = connexion.prepareStatement("UPDATE eleve set validite = ? where id = " + id + " ;") ; 
			preparedStatement.setString(1, "unban");
			preparedStatement.executeUpdate() ; 
			
			
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			System.out.println(e) ;
		}finally {
			
			try {
				connexion.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace(); 
			} 
			
		}
	}
	
	
public List<Eleve> getElevesInscris(int evenement_id){
		
		loadDatabase() ; 
		List<Eleve> eleves = new ArrayList<Eleve>() ; 

		Statement statement = null ;
		ResultSet result = null ; 
		
		try {
			statement = connexion.createStatement() ; 
			result = statement.executeQuery("SELECT * from eleve where id in (select eleve_id from inscription where evenement_id = "+ evenement_id + ") ; ");
			while(result.next()) {
				Eleve eleve = new Eleve() ; 
				eleve = getEleveById(result.getInt("id")) ; 
				eleves.add(eleve) ; 
			}
		}catch(SQLException e) {
				System.out.println(e) ; 
			}
		
		return eleves ;
}
	
	
	


}

	

	
	 
	
	
	