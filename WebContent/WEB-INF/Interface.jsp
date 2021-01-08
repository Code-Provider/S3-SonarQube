<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset = "utf-8">
<meta name = ""viewport" content = "width-device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel = "stylesheet" href = "index.css">
<title>Interface</title>
<!-- <style>
body {
  background-image: url('https://image.freepik.com/photos-gratuite/fond-aquarelle-splash_23-2148175602.jpg');
  background-repeat: no-repeat;
  background-size: cover;
}
</style>
-->


</head>

<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">


  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link active" href="Homepage">Acceuil<span class="sr-only">(current)</span></a>
      </li>
      <li class="nav-item">
        <a class="nav-link active" href="Evenements">Evenements<span class="sr-only">(current)</span></a>
      </li>
      <c:if test="${sessionScope.id == 1}">
      <li class="nav-item">
        <a class="nav-link active" href="Ecoles">Ecoles</a>
      </li>
      </c:if>
      <li class="nav-item dropdown active">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Clubs
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
        <a class="dropdown-item" href="Clubs">Les clubs de L'${sessionScope.ecole}</a>
	    <a class="dropdown-item" href="AjoutClub.jsp">Créer un club</a>
	    <a class="dropdown-item" href="MyClubs">Mes clubs</a>
	    <c:if test="${sessionScope.id == 1}">
	    <a class="dropdown-item" href="Demandes">Demandes d'ajout de clubs</a>
	    </c:if>
        </div>
      </li>
      <c:if test="${sessionScope.id == 1}">
      <li class="nav-item active">
        <a class="nav-link" href="GestionEleve" tabindex="-1">Utilisateurs</a>
      </li>
      </c:if>
      
    </ul>
    <form class="form-inline my-2 my-lg-0" method = "POST" action = "Signout">
      <button class="btn btn-danger" onclick="window.location='Login.jsp'">Deconnexion</button>
    </form>
  </div>
</nav>

<div class="container p-4">
      <h2 class="text-center">Bienvenue ${sessionScope.nom}</h2>
      <hr />
      <div class="p-5">
        <nav>
          <div class="nav nav-tabs" role="tablist">
            <a
              class="nav-item nav-link"
              data-toggle="tab"
              href="#evenements"
              role="tab"
            >
              <span class="pb-2">
                <i class="fas fa-list mr-4"></i>
                Prochains évenements
              </span>
            </a>
            <a
              class="nav-item nav-link"
              data-toggle="tab"
              href="#messages"
              role="tab"
            >
              <span class="pb-2">
                <i class="far fa-heart mr-4"></i>
                Derniers messages dans vos clubs
              </span>
            </a>
          </div>
        </nav>
        <div class="tab-content p-5">
          <div
            class="tab-pane fade show active text-center p-5"
            role="tabpanel"
          >
            <h4 class="text-muted">
              Explore les nouveautés parascolaires !  
              <i class="fas fa-shopping-basket ml-3"></i>
            </h4>
          </div>
          <div
            class="tab-pane fade text-center p-3"
            id="evenements"
            role="tabpanel"
          >
  
  
  <c:forEach var="deck" items = "${evenements}">
  
  <div class="card-deck">
  
  
  <c:forEach var = "ev" items = "${deck}">
  
  <div class="card" style="width: 12rem;">

  <img src="Im/${ev.image}" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">${ev.titre}</h5>
    
    <p class="card-text"><span style="white-space: pre-line">
    <strong>Organisé par : ${ev.club.nom} ${ev.ecole.nom}</strong> <br> 
    ${ev.description}</span></p>
    <p class="card-text"><small class="text-muted">A l'${ev.ecole.nom}, du ${ev.dateDebut} au ${ev.dateFin}</small></p>
    <div class="btn-toolbar">
    <a href="OneEvenement?evenement_id=${ev.id}" class="btn btn-primary">Détails</a>
    <c:if test = "${ev.ivalue}">
    <form method = "POST" action = "Inscription?evenement_id=${ev.id}&act=remove&loc=interface">
    <button type="submit" class="btn btn-warning" style = "margin-left:5px">Désinscrire</button>
    </form>
    </c:if>
    <c:if test = "${!ev.ivalue}">
    <form method = "POST" action = "Inscription?evenement_id=${ev.id}&act=add&loc=interface">
    <button type="submit" class="btn btn-success" style = "margin-left:5px">S'inscrire</button>
    </form>
    </c:if>
    <c:if test = "${ev.club.gerant.id == sessionScope.id}">
    <a href="ModEvenement?club_id=${ev.club.id}&gerant_id=${ev.club.gerant.id}&nom=${ev.club.nom}&evenement_id=${ev.id}" class="btn btn-info" style = "margin-left:5px">Modifier</a>
    <form method = "POST" action = "DeleteEvenement?club_id=${ev.club.id}&gerant_id=${ev.club.gerant.id}&nom=${ev.club.nom}&evenement_id=${ev.id}">
    <button type="submit" class="btn btn-danger" style = "margin-left:5px">Supprimer</button>
    </form>
    </c:if>
    </div>
  </div>
  </div> 
  </c:forEach>
 
  </div>
  <br/>
  </c:forEach>
          </div>
          <div
            class="tab-pane fade text-center p-3"
            id="messages"
            role="tabpanel"
          >
			<c:set var="j" value="${0}" scope="page"/>
			<c:forEach var = "message" items = "${messages}">
			
			<div class="card">
				    <div class="card-body">
				        <div class="row">
			        	    <div class="col-md-2">
			        	        <img src="https://image.ibb.co/jw55Ex/def_face.jpg" class="img img-rounded img-fluid"/>
			        	        <p class="text-secondary text-center">${message.date}</p>
			        	    </div>
			        	    <div class="col-md-10">
			        	        <p>
			        	            <strong>${message.eleve_nom} [${message.club.nom }]</strong>
			        	            <span class="float-right"><i class="text-warning fa fa-star"></i></span>
			                        <span class="float-right"><i class="text-warning fa fa-star"></i></span>
			        	            <span class="float-right"><i class="text-warning fa fa-star"></i></span>
			        	            <span class="float-right"><i class="text-warning fa fa-star"></i></span>
			
			        	       </p>
			        	       <div class="clearfix"></div>
			        	        <p>${message.content}</p>
			        	        <button type="button" class="float-right btn btn-outline-primary ml-2" data-toggle="modal" data-target="#exampleModal">
			  					Répondre
								</button>
			        	        
			        	    </div>
				        </div>
				        <br/>
				        	<c:forEach var = "reponse" items = "${reponses[j]}">
				        	<div class="card card-inner">
			            	    <div class="card-body">
			            	        <div class="row">
			                    	    <div class="col-md-2">
			                    	        <img src="https://image.ibb.co/jw55Ex/def_face.jpg" class="img img-rounded img-fluid"/>
			                    	        <p class="text-secondary text-center">${reponse.date}</p>
			                    	    </div>
			                    	    <div class="col-md-10">
			                    	        <p><strong>${reponse.eleve_nom}</strong></p>
			                    	        <p>${reponse.content}</p>
			                    	            <!--<a class="float-right btn btn-outline-primary ml-2">  <i class="fa fa-reply"></i> Reply</a>  -->
			                    	       </p>
			                    	    </div>
			            	        </div>
			            	    </div>
				            </div>
				            </c:forEach>
				            <c:set var="j" value="${j+1}" scope="page"/>
				            
				    </div>
				</div>
				<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
			  <div class="modal-dialog" role="document">
			    <div class="modal-content">
			      <div class="modal-header">
			        <h5 class="modal-title" id="exampleModalLabel">Envoyer une réponse</h5>
			        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			          <span aria-hidden="true">&times;</span>
			        </button>
			      </div>
			      <div class="modal-body">
			        <form method = "POST" action = "AddReponse?message_id=${message.id}&club_id=${club_id}&gerant_id=${gerant.id}&nom=${club}">
			          <div class="form-group">
			            <label for="message-text" class="col-form-label">Réponse:</label>
			            <textarea class="form-control" id="reponse" name = "reponse"></textarea>
			            <div class="modal-footer">
			        	<button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
			        	<button type="submit" class="btn btn-primary">Envoyer réponse</button>
			      		</div>
			          </div>
			        </form>
			      </div>
			      <!--  <div class="modal-footer">
			        <button type="button" class="btn btn-secondary" data-dismiss="modal">Fermer</button>
			        <button type="button" class="btn btn-primary">Envoyer réponse</button>
			      </div>-->
			    </div>
			  </div>
			</div>
			<br>
				</c:forEach>
            </div>
          </div>
        </div>
      </div>
  
  

<br/>
  <br/>
  <center>
  <!-- <img src = "https://upload.wikimedia.org/wikipedia/commons/1/13/Ensias2.jpg"> -->
  </center>
  <br/>
  

  <div class="fixed-bottom footer-copyright text-right py-3 copyright">© 
     ENSIAS
  </div>
  
</div>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>