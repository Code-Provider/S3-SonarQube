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
    <a class="nav-link active" href="#Evenements" data-toggle = "tab" role = "tab" aria-controls="Evenements">Evenements</a>
  </li>
  
  </ul>

<div class="tab-content">


<div class="tab-pane fade show active p-3" id="Evenements" aria-labelledby="Evenements-tab" role="tabpanel">
  
  <c:forEach var="deck" items = "${evenements}">
  
  <div class="card-deck">
  
  
  <c:forEach var = "ev" items = "${deck}">
  
  <div class="card" style="width: 12rem;">

  <img src="Im/${ev.image}" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title text-center">${ev.titre} [${ev.type}]</h5>
    
    <p class="card-text"><span style="white-space: pre-line">
    <span class = "text-center"><strong>Organisé par : ${ev.club.nom} ${ev.ecole.nom}</strong></span> <br> 
    ${ev.description}</span></p>
    <p class="card-text"><small class="text-muted">A l'${ev.ecole.nom}, du ${ev.dateDebut} au ${ev.dateFin}</small></p>
    <div class="btn-toolbar">
    <a href="OneEvenement?evenement_id=${ev.id}" class="btn btn-primary">Détails</a>
    <c:if test = "${ev.ivalue}">
    <form method = "POST" action = "Inscription?evenement_id=${ev.id}&act=remove&loc=evenements">
    <button type="submit" class="btn btn-warning" style = "margin-left:5px">Se désinscrire</button>
    </form>
    </c:if>
    <c:if test = "${!ev.ivalue}">
    <form method = "POST" action = "Inscription?evenement_id=${ev.id}&act=add&loc=evenements">
    <button type="submit" class="btn btn-success" style = "margin-left:5px">S'inscrire</button>
    </form>
    </c:if>
    <c:if test = "${ev.club.gerant.id == sessionScope.id}">
    <a href="ModEvenement?club_id=${ev.club.id}&gerant_id=${ev.club.gerant.id}&nom=${ev.club.nom}&evenement_id=${ev.id}" class="btn btn-info" style = "margin-left:5px">Modifier</a>
    <form method = "POST" action = "DeleteEvenement?club_id=${club_id}&gerant_id=${gerant.id}&nom=${club}&evenement_id=${ev.id}">
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