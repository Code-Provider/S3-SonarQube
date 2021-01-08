package beans;


public class Eleve {
	private int id ; 
	private String login ; 
	private String password ; 
	private String nom ; 
	private String email ; 
	private String telephone ;
	private String ecole ; 
	private String date ; 
	private String validite ; 
	
	
	
	
	public String getValidite() {
		return validite;
	}
	public void setValidite(String validite) {
		this.validite = validite;
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
	public String getEcole() {
		return ecole;
	}
	public void setEcole(String ecole) {
		this.ecole = ecole;
	}
	public String getLogin() {
		return login;
	}
	public void setLogin(String login) {
		this.login = login;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getNom() {
		return nom;
	}
	public void setNom(String nom) {
		this.nom = nom;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	} 
	
	

}
