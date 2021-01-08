<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset = "utf-8">
<meta name = ""viewport" content = "width-device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel = "stylesheet" href = "index.css">
<title>Ajout de club</title>
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
        <a class="nav-link dropdown-toggle" href="GestionEleve" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
    <a class="nav-link active" href="#Acc" data-toggle = "tab" role = "tab" aria-controls="Acc">Ajout de club</a>
  </li>
  
  

  </ul>
  
  <div class="tab-content">
  <div class="tab-pane fade show active p-3" role="tabpanel" >
  <form action = "Clubs" method = "POST">
  <div class="form-group">
  	<div class="form-group">
    <label for="InputName">Nom du club</label>
    <input type="text" class="form-control" id="InputName" name ="nom" placeholder="Entrez le nom de votre club">
  	</div>
  <div class="form-group">
  <label for="Description">Description</label>
    <textarea type="text" class="form-control" id="InputDes" name = "description" placeholder="Entrez une description de votre club"></textarea>
  </div>
  	
  	<div class="form-group">
    <label for="exampleFormControlFile1">Logo</label>
    <input type="file" class="form-control-file" id="exampleFormControlFile1" name = "logo">
  </div>

  
  <button type="submit" class="btn btn-primary">Valider</button>
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
  
  
  
  