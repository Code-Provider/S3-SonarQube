<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset = "utf-8">
<meta name = ""viewport" content = "width-device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel = "stylesheet" href = "index.css">
<title>Acceuil</title>


</head>

<body>
<div class = "container p-5">
<ul class="nav nav-tabs" role = "tablist">
  <li class="nav-item" role = "tab">
    <a class="nav-link active" href="#Acc" data-toggle = "tab" role = "tab" aria-controls="Acc">Acceuil</a>
  </li>
  <li class = "nav-item" role = "tab">
  <a class = "nav-link" href = "#Ecoles" data-toggle = "tab" role = "tab" aria-controls="Ecoles">A propos</a>
  <li class ="nav item ml-auto" role = "presentation">
  <form method="get" action="Connexion">
  <button class="btn btn-primary" type="submit">Connexion & Enregistration</button>
  </form>
  </li>
  

  </ul>
  
  <div class="tab-content">
  <div class="tab-pane fade show active p-3" role="tabpanel" id ="Acc" >
  <div class="full-width-image">
  <img class = "img-fluid w-100" src = "acc.png">
  </div>
  </div>
  <div class="tab-pane fade p-3" role="tabpanel" id ="Ecoles" >
  <h5 class = "text-center">Bienvenue dans notre application de gestion de parascolaire des grandes écoles d'ingénieurs. 
  Si vous souhaitez être actif et à jour avec le parascolaire des écoles figurantes ci-dessous, vous étes dans le bon endroit ! </h5>
  <!-- <br/>
  <small>Voici la liste des écoles d'ingénieurs concernés : </small>
  -->
  <br/>
  
  <c:forEach var="deck" items = "${ecoles}">
  
  <div class="card-deck">
  
  
  <c:forEach var = "ecole" items = "${deck}">
  <div class="card" style="width: 12rem;">
  <img src="${ecole.image}" class="card-img-top" alt="...">
  <div class="card-body">
    <h5 class="card-title">${ecole.nom}</h5>
    <p class="card-text">${ecole.description}</p>
    <a href="#" class="btn btn-primary">Détails</a>
  </div>
  </div> 
  </c:forEach>
 
  </div>
  <br/>
  </c:forEach>
  
 
  
  <div class="fixed-bottom footer-copyright text-right py-3 copyright">© 
     ENSIAS
  </div>
  
  
  </div>

  
</div>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>