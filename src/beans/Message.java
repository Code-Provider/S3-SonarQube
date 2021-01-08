package beans;

public class Message {
	
	private int id ; 
	private String content ; 
	private int eleve_id ; 
	private int club_id ; 
	private String eleve_nom ;
	private String date ; 
	private Club club ;
	
	
	
	
	
	
	
	public Club getClub() {
		return club;
	}
	public void setClub(Club club) {
		this.club = club;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getEleve_id() {
		return eleve_id;
	}
	public void setEleve_id(int eleve_id) {
		this.eleve_id = eleve_id;
	}
	public int getClub_id() {
		return club_id;
	}
	public void setClub_id(int club_id) {
		this.club_id = club_id;
	}
	public String getEleve_nom() {
		return eleve_nom;
	}
	public void setEleve_nom(String eleve_nom) {
		this.eleve_nom = eleve_nom;
	} 
	
	
	

}
