<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset = "utf-8">
<meta name = ""viewport" content = "width-device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel = "stylesheet" href = "index.css">
<title>Gestion club</title>
<style>
.messagefils{
	margin-left : 20px ; 
} 
.card-inner{
    margin-left: 4rem;
}

</style>
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
<div class = "container p-5">
<ul class="nav nav-tabs" role = "tablist">
  <li class="nav-item">
    <a class="nav-link" href="#Messages" data-toggle = "tab" role = "tab" aria-controls="Messages">Messages</a>
  </li>
  <c:if test = "${value}">
  <li class="nav-item">
    <a class="nav-link" href="#Demandes" data-toggle = "tab" role = "tab" aria-controls="Demandes">Demandes d'adhésion</a>
  </li>
  </c:if>
  <li class="nav-item">
    <a class="nav-link" href="#Evenements" data-toggle = "tab" role = "tab" aria-controls="Evenements">Evenements</a>
  </li>
  <c:if test = "${value}">
  <li class="nav-item">
    <a class="nav-link" href="#Add" data-toggle = "tab" role = "tab" aria-controls="Add">Ajouter un évenement</a>
  </li>
  </c:if>
  <li class="nav-item">
    <a class="nav-link" href="#Membres" data-toggle = "tab" role = "tab" aria-controls="Membres">Membres</a>
  </li>
  </ul>

<div class="tab-content">
  <div class="tab-pane fade show active p-3" role="tabpanel" >
  <c:choose>
  <c:when test = "${value}">
  <h5 class = "text-center">Gestion du club ${club}</h5>
  </c:when>
  <c:otherwise>
  <h5 class = "text-center">Club ${club}</h5>
  </c:otherwise>
  </c:choose>
  
  <br/>
  </div>
  <div class="tab-pane fade p-3" id="Messages" aria-labelledby="Messages-tab" role="tabpanel">
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
        	            <strong>${message.eleve_nom}</strong>
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
	
	
	<br/>
  <form method = "POST" action = "AddMessage?club_id=${club_id}&gerant_id=${gerant.id}&nom=${club}">
  <div class="form-group">
    <textarea class="form-control" id="message" placeholder = "Ajouter un message" name = "message"></textarea>
    <br/>
    <button type = "submit" class = "btn btn-primary">
    Valider
    </button>
  </div>
  
  </form>
  
  </div>
  <div class="tab-pane fade p-3" id="Demandes" aria-labelledby="Demandes-tab" role="tabpanel">
  <c:set var="count" value="1" scope="page"/>
  <c:choose>
    <c:when test="${empty demandes}">
	<center>
	<h5>Pas de nouvelles demandes.</h5>
	</center>
	</c:when>
  <c:otherwise>
  <table class="table">
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Nom</th>
      <th scope="col">Email</th>
      <th scope="col">Date</th>
      <th scope="col">Valider ou refuser</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach var = "eleve" items = "${demandes}">
    
    <tr>
      <th scope="row"><c:out value = "${count}"/></th>
      <td>${eleve.nom}</td>
      <td>${eleve.email}</td>
      <td>${eleve.date}</td>
      <td><div class="btn-toolbar">
    <form method = "POST" action = "VrDemandes?eleve_id=${eleve.id}&club_id=${club_id}&gerant_id=${gerant.id}&nom=${club}&judgment=valider">
  	<button type="submit" id="btnSubmit" class="btn btn-success btn-space btn-sm">Valider</button>
  	</form>
  	<form method = "POST" action = "VrDemandes?eleve_id=${eleve.id}&club_id=${club_id}&gerant_id=${gerant.id}&nom=${club}&judgment=refuser">
  	<button type="submit" id="btnCancel" class="btn btn-danger btn-space btn-sm">Refuser</button>
  	</form>
  	</div></td>
      <c:set var="count" value="${count + 1}" scope="page"/>
      
    </tr>
    </c:forEach>
    
  </tbody>
</table>
</c:otherwise>
</c:choose>

  </div>
  <div class="tab-pane fade p-3" id="Evenements" aria-labelledby="Evenements-tab" role="tabpanel">
  
  <c:forEach var="deck" items = "${evenements}">
  
  <div class="card-deck">
  
  
  <c:forEach var = "ev" items = "${deck}">
  <div class="card" style="width: 12rem;">
  <img src="Im/${ev.image}" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">${ev.titre} [${ev.type}]</h5>
    <p class="card-text"><span style="white-space: pre-line">${ev.description}</span></p>
    <p class="card-text"><small class="text-muted">Du ${ev.dateDebut} au ${ev.dateFin}</small></p>
    <div class="btn-toolbar">
    <a href="OneEvenement?evenement_id=${ev.id}" class="btn btn-primary">Détails</a>
    <c:if test = "${value}">
    <a href="ModEvenement?club_id=${club_id}&gerant_id=${gerant.id}&nom=${club}&evenement_id=${ev.id}" class="btn btn-success" style = "margin-left:5px">Modifier</a>
    <form method = "POST" action = "DeleteEvenement?club_id=${club_id}&gerant_id=${gerant.id}&nom=${club}&evenement_id=${ev.id}">
    <button type="submit" class="btn btn-danger" style = "margin-left:5px">Supprimer</button>
    </form>
    </c:if>
    <c:if test = "${!ev.ivalue}">
    <form method = "POST" action = "Inscription?evenement_id=${ev.id}&act=add&loc=evenement">
    <button type="submit" class="btn btn-success" style = "margin-left:5px">S'inscrire</button>
    </form>
    </c:if>
    <c:if test = "${evenement.club.gerant.id == sessionScope.id}">
    <a href="ModEvenement?club_id=${evenement.club.id}&gerant_id=${evenement.club.gerant.id}&nom=${evenement.club.nom}&evenement_id=${evenement.id}" class="btn btn-info" style = "margin-left:5px">Modifier</a>
    <form method = "POST" action = "DeleteEvenement?club_id=${club_id}&gerant_id=${evenement.club.gerant.id}&nom=${evenement.club.nom}&evenement_id=${evenement.id}">
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
  <div class="tab-pane fade p-3" id="Add" aria-labelledby="Add-tab" role="tabpanel">
  <form action = "AddEvenement?club_id=${club_id}&gerant_id=${gerant.id}&nom=${club}&act=add" method = "POST">
  	<div class="form-group">
    <label for="InputName">Titre de l'événement</label>
    <input type="text" class="form-control" id="InputTitre" name ="titre" placeholder="Entrez le titre de votre évenement">
  	</div>
  <div class="form-group">
  <label for="Description">Description</label>
    <textarea class="form-control" id="description" name = "description" placeholder="Petite description"></textarea>
    
  </div>
  <div class="form-group">
  <label for="Activites">Activités</label>
    <textarea class="form-control" id="activites" name = "activites" placeholder="Veuiller détailler les différentes activités de l'événement"></textarea>
    
  </div>
  <div class="form-group row">
  <label for="example-datetime-local-input" class="col-2 col-form-label">Date début</label>
  <div class="col-10">
    <input class="form-control" type="datetime-local" value="2020-02-07T00:00:00" id="example-datetime-local-input" name = "datedebut">
  </div>
</div>
<div class="form-group row">
  <label for="example-datetime-local-input" class="col-2 col-form-label">Date fin</label>
  <div class="col-10">
    <input class="form-control" type="datetime-local" value="2020-02-07T00:00:00" id="example-datetime-local-input" name = "datefin">
  </div>
</div>
<div class="form-group">
    <label for="InputSelect">Type de l'évenement</label>
    <select class="form-control" id="type" name = "type">
    <option>Privé</option>
    <option>Public</option>
    </select>
</div>
  <div class="form-group">
    <label for="exampleFormControlFile1">Image</label>
    <input type="file" class="form-control-file" id="exampleFormControlFile1" name = "image">
  </div>

  

  <button type="submit" class="btn btn-primary" style = "margin-top : 13px">Valider</button>
  </form>
  
  
  </div>
  
  <div class="tab-pane fade p-3" id="Membres" aria-labelledby="Membres-tab" role="tabpanel">
  	<table class="table">
    <thead>
    <c:set var="count2" value="1" scope="page"/>
    <tr>
      <th scope="col">Nom</th>
      <th scope="col">Email</th>
      <th scope="col">Role</th>
      <c:if test = "${value}">
      <th scope="col">Supprimer</th>
      </c:if>
    </tr>
    </thead>
    <tbody>
    <tr>
      <td>${gerant.nom}</td>
      <td>${gerant.email}</td>
      <td>Gérant</td>      
      <!--  <td><div class="btn-toolbar">
       <form method = "POST" action = "">
  		<button type="submit" id="btnSubmit" class="btn btn-success btn-space btn-sm">Valider</button>
  		</form>
  		</div>
  	  </td>-->
      <c:set var="count2" value="${count2 + 1}" scope="page"/>
    </tr>
    <c:forEach var = "membre" items = "${membres}">
    <tr>
      

      <td>${membre.nom}</td>
      <td>${membre.email}</td>
      <td>Membre</td>
      <c:if test = "${value}">      
      <td><div class="btn-toolbar">
    	<form method = "POST" action = "DeleteMembre?membre_id=${membre.id}&club_id=${club_id}&gerant_id=${gerant.id}&nom=${club}">
  		<button type="submit" id="btnSubmit" class="btn btn-danger btn-space btn-sm">Supprimer</button>
  		</form>
  		</div>
  	  </td>
  	  </c:if>
      <c:set var="count" value="${count2 + 1}" scope="page"/>
    </tr>
    </c:forEach>
  </tbody>
</table>
  </div>
</div>

<div>
<small> < <a href = "Acc"> Revenir à l'acceuil</a> </small>
</div>

<div class="fixed-bottom footer-copyright text-right py-3 copyright">© 
     ENSIAS
</div>


</div>


  
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>


</html>