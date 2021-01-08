<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Gestion Eleve</title>
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

<div class = "container p-5">
<table class="table">
  <thead>
    <tr>
      <th scope="col">Nom</th>
      <th scope="col">Ecole</th>
      <th scope="col">Email</th>
      <th scope ="col">Télephone</th>
      <th scope = "col">Etat</th>
      <th scope="col">Bannir</th>
    </tr>
  </thead>
  <tbody>
    <c:forEach var = "eleve" items = "${eleves}">
    <tr>
      <td>${eleve.nom}</td>
      <td>${eleve.ecole}</td>
      <td>${eleve.email}</td>
      <td>${eleve.telephone}</td>
      <td>
      <c:if test = "${eleve.validite == 'unban'}">
      Actif
      </c:if>
      <c:if test = "${eleve.validite == 'ban'}">
      Banni
      </c:if>
      </td>
      <td>
      <c:if test = "${eleve.validite == 'unban'}">
    <form method = "POST" action = "GestionEleve?eleve_id=${eleve.id}&act=ban">
  	<button type="submit" class="btn btn-success btn-danger btn-sm">Bannir</button>
  	</form>
  	</c:if>
  	<c:if test = "${eleve.validite == 'ban'}">
  	<form method = "POST" action = "GestionEleve?eleve_id=${eleve.id}&act=deban">
  	<button type="submit" class="btn btn-success btn-success btn-sm">Débannir</button>
  	</form>
  	</c:if>
	</td>
      <c:set var="count" value="${count + 1}" scope="page"/>
      
    </tr>
    </c:forEach>
    
  </tbody>
</table>
</div>
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