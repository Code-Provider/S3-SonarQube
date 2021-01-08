<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset = "utf-8">
<meta name = ""viewport" content = "width-device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel = "stylesheet" href = "index.css">
<title>Ecoles</title>

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
  <li class="nav-item" data-toggle = "tab" role = "tab">
    <a class="nav-link active" href="#Gestion" data-toggle = "tab" role = "tab" data-toggle = "tab" aria-controls="Gestion">Gestion Ecoles</a>
  </li>
  <li class="nav-item" role = "tab">
    <a class="nav-link" href="#Ajout" data-toggle = "tab" role = "tab" aria-controls="Ajout">Ajout Ecole</a>
  </li>
  <li class ="nav item ml-auto" role = "presentation">
  <form method = "POST" action = "Signout">

  </form>
  </li>
  

  </ul>
  
  <div class="tab-content">
  <div class="tab-pane fade show active p-3" role="tabpanel" id ="Gestion">
  
  
  <c:forEach var="deck" items = "${ecoles}">
  
  <div class="card-deck">
  
  
  <c:forEach var = "ecole" items = "${deck}">
  <div class="card" style="width: 12rem;">
  <img src="Im/${ecole.image}" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">${ecole.nom}</h5>
    <p class="card-text">${ecole.description}
    <form method = "POST" action = "DeleteEcole?ecole_id=${ecole.id}">
    
    <!--<a href="Demandes?club_id=${club.id}" class="btn btn-primary">Valider</a>-->
    <button type="submit" class="btn btn-danger">Supprimer</button>
    </form>
    </p>
    
  </div>
  </div> 
  </c:forEach>
 
  </div>
  <br/>
  </c:forEach>
  </div>
  
  <div class="tab-pane fade p-3" role="tabpanel" id="Ajout">
  <form method = "post" action = "Ecoles">
  <div class="form-group">
  	<div class="form-group">
    <label for="nom">Nom de l'école</label>
    <input type="text" class="form-control" id="nom" name = "nom" placeholder="Entrez le nom de la grande école">
  	</div>
  <div class="form-group">
  <label for="Description">Description</label>
    <input type="text" class="form-control" id="description" name = "description" placeholder="Entrez une description de l'école">
  </div>
  	<div class="form-group">
  <label for="Adresse">Adresse</label>
    <input type="text" class="form-control" id="adresse" name = "adresse" placeholder="Entrez l'adresse de l'école">
  </div>
  <div class="form-group">
  <label for="image">Image</label>
    <input type="file" class="form-control-file" id="image" name = "image">
  </div>
  </div>

  
  <button type="submit" class="btn btn-primary">Valider</button>
  </form>
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