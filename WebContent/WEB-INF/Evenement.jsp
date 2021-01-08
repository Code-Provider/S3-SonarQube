<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>${evenement.titre}</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel = "stylesheet" href = "index.css">
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
<!-- Section: Features v.1 -->
<section class="text-center my-5">

  <!-- Section heading -->
  <h2 class="h1-responsive font-weight-bold my-5">${evenement.titre} [${evenement.type}]</h2>
  <!-- Section description -->
  <span style="white-space: pre-line"><p class="lead grey-text w-responsive mx-auto mb-5">${evenement.description}</p></span>

  <!-- Grid row -->
  <section class="text-center my-5">

    <!-- Grid column -->
    
    <c:if test = "${evenement.activites != '' }">
    
    
    <h5 class="h1-responsive font-weight-bold my-5">Les Activités :</h5>
  <!-- Section description -->

  <span style="white-space: pre-line"><p class="lead grey-text w-responsive mx-auto mb-5 ">${evenement.activites}</p></span>
  </c:if>
  <small>Organisé par le club d'${evenement.ecole.nom} ${evenement.club.nom} du ${evenement.dateDebut} au ${evenement.dateFin }</small>
  
  <div class="btn-toolbar" style = "justify-content: center; display: flex; padding-top:10px ;">
    
    <c:if test = "${evenement.ivalue}">
    <form method = "POST" action = "Inscription?evenement_id=${evenement.id}&act=remove&loc=evenement">
    <button type="submit" class="btn btn-warning" style = "margin-left:5px">Désinscrire</button>
    </form>
    </c:if>
    <c:if test = "${!evenement.ivalue}">
    <form method = "POST" action = "Inscription?evenement_id=${evenement.id}&act=add&loc=evenement">
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


</section>
</section>
<c:if test = "${evenement.value}">
<c:if test = "${not empty eleves}">
<div class = "container p-5">
<c:set var="count" value="${1}" scope="page"/>
<h5 class="h1-responsive font-weight-bold my-5">Participants : </h5>
<table class="table text-center">
  <thead>
    <tr>
      <th scope = "col">#</th>
      <th scope="col">Nom</th>
      <c:if test = "${evenement.type == 'Public'}">
      <th scope="col">Ecole</th>
      </c:if>
      <th scope="col">Email</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach var = "eleve" items = "${eleves}">
    <tr>
      <td>${count}</td>	
      <td>${eleve.nom}</td>
      <c:if test = "${evenement.type == 'Public'}">
      <td>${eleve.ecole}</td>
      </c:if>
      <td>${eleve.email}</td>
      <c:set var="count" value="${count + 1}" scope="page"/>
      
    </tr>
    </c:forEach>
    
  </tbody>
</table>

</div>
</c:if>
</c:if>




	<div style = "padding-left : 10%">
	<small> < <a href = "Homepage"> Revenir à l'acceuil</a> </small>
	</div>
	
	<div class="fixed-bottom footer-copyright text-right py-3 copyright">© 
	     ENSIAS
	</div>




<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>