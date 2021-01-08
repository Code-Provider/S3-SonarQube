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
<div class = "container p-5">
<ul class="nav nav-tabs" role = "tablist">
  <li class="nav-item" data-toggle = "tab" role = "tab">
    <a class="nav-link active" href="#Gestion" data-toggle = "tab" role = "tab" data-toggle = "tab" aria-controls="Gestion">Je suis gérant</a>
  </li>
  <li class="nav-item" role = "tab">
    <a class="nav-link" href="#Ajout" data-toggle = "tab" role = "tab" aria-controls="Ajout">Je suis membre</a>
  </li>
  <li class ="nav item ml-auto" role = "presentation">
  <form method = "POST" action = "Signout">
  <button class="btn btn-danger">Deconnexion</button>
  </form>
  </li>
  

  </ul>
  
  <div class="tab-content">
  <div class="tab-pane fade show active p-3" role="tabpanel" id ="Gestion">
  <c:forEach var = "club" items = "${clubs_geres}">

	<div class="card">
  <div class="card-header">
    Gére par : ${clubs_geres.gerant.nom}
  </div>
  <div class="card-body">
    <h5 class="card-title">${clubs_geres.nom}</h5>
    <p class="card-text">${clubs_gérés.description}</p>
    <!-- <form method = "POST" action = "Demandes?club_id=${club.id}">
    
    <a href="Demandes?club_id=${club.id}" class="btn btn-primary">Valider</a>-->
    <form method = "POST" action = "xxx?club_id=${clubs_geres.id}">
    <button type="submit" class="btn btn-success">Accéder</button>
    </form>

  </div>
</div>

</c:forEach>

<br/>
  </div>
  
  <div class="tab-pane fade p-3" role="tabpanel" id="Ajout">
  
  <c:forEach var = "club" items = "${clubs_membre}">

	<div class="card">
  <div class="card-header">
    Gére par : ${clubs_membre.gerant.nom}
  </div>
  <div class="card-body">
    <h5 class="card-title">${clubs_membre.nom}</h5>
    <p class="card-text">${clubs_membre.description}</p>
    <!-- <form method = "POST" action = "Demandes?club_id=${club.id}">
    
    <a href="Demandes?club_id=${club.id}" class="btn btn-primary">Valider</a>-->
    <form method = "POST" action = "xxx?club_id=${clubs_membre.id}">
    <button type="submit" class="btn btn-success">Accéder</button>
    </form>

  </div>
</div>

</c:forEach>

<br/>
  
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