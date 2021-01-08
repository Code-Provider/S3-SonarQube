<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset = "utf-8">
<meta name = ""viewport" content = "width-device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel = "stylesheet" href = "index.css">
<title>Evenement</title>
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
  <li class="nav-item" role = "tab">
    <a class="nav-link active" href="#Acc" data-toggle = "tab" role = "tab" aria-controls="Acc">Modification d'événement</a>
  </li>
  
  

  </ul>
  
  <div class="tab-content">
  <div class="tab-pane fade show active p-3" role="tabpanel" >
  <form action = "AddEvenement?club_id=${club_id}&gerant_id=${gerant_id}&nom=${nom}&act=mod&evenement_id=${evenement_id}" method = "POST">

  	<div class="form-group">
    <label for="InputName">Titre de l'événement</label>
    <input type="text" value = "${evenement.titre}" class="form-control" id="InputTitre" name ="titre" placeholder="Entrez le titre de votre évenement">
  	</div>
  <div class="form-group">
  <label for="Description">Description</label>
    <textarea class="form-control" id="description" name = "description" placeholder="Petite description">${evenement.description}</textarea>
    
  </div>
  <div class="form-group">
  <label for="Activites">Activités</label>
    <textarea class="form-control" id="activites" name = "activites"  placeholder="Veuiller détailler les différentes activités de l'événement">${evenement.activites}</textarea>
    
  </div>
  <div class="form-group row">
  <label for="example-datetime-local-input" class="col-2 col-form-label">Date début</label>
  <div class="col-10">
    <input class="form-control" type="datetime-local" value="${evenement.dateDebut1}" id="example-datetime-local-input" name = "datedebut">
  </div>
</div>
<div class="form-group row">
  <label for="example-datetime-local-input" class="col-2 col-form-label">Date fin</label>
  <div class="col-10">
    <input class="form-control" type="datetime-local" value="${evenement.dateFin1}" id="example-datetime-local-input" name = "datefin">
  </div>
</div>
<div class="form-group">
    <label for="InputSelect">Type de l'évenement</label>
    <select class="form-control" id="type" name = "type">
    <c:choose>
    <c:when test = "${evenement.type  == 'Public'}">
    <option>Public</option>
    <option>Privé</option>
    </c:when>
    <c:otherwise>
    <option>Privé</option>
    <option>Public</option>
    </c:otherwise>
    </c:choose>
    </select>
</div>
  <div class="form-group">
    <label for="exampleFormControlFile1">Image</label>
    <input type="file" class="form-control-file" id="exampleFormControlFile1" name = "image">
  </div>

  

  <button type="submit" class="btn btn-primary" style = "margin-top : 13px">Valider</button>
  </form>
  </div>
  </div>
  <div>
	<small> < <a href = "Homepage"> Revenir à l'acceuil</a> </small>
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