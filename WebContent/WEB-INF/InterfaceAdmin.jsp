<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset = "utf-8">
<meta name = ""viewport" content = "width-device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel = "stylesheet" href = "index.css">
<title>Interface Admin</title>


</head>

<body>
<div class = "container p-5">
<ul class="nav nav-tabs" role = "tablist">
  <li class="nav-item">
    <a class="nav-link" href="#" data-toggle = "tab" role = "tab" aria-controls="Evénements">Evénements</a>
  </li>
  <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" data-toggle="dropdown" href="#" role="button" aria-haspopup="true" aria-expanded="false">Clubs</a>
    <div class="dropdown-menu">
    <a class="dropdown-item" href="Clubs">Rejoindre des clubs de L'${sessionScope.ecole}</a>
    <a class="dropdown-item" href="AjoutClub.jsp">Créer un club</a>
    <a class="dropdown-item" href="MyClubs">Mes clubs</a>
    <a class="dropdown-item" href="Demandes">Demandes d'ajout de clubs</a>
    </div>
  </li>
  <li class="nav-item dropdown">
    <a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" role = "button" aria-haspopup="true" aria-expanded="false">Ecoles</a>
      <div class="dropdown-menu">
      <!--<a class="dropdown-item" href="Ecoles">Ajouter une école</a> -->
      <a class="dropdown-item" href="Ecoles">Gestion des écoles</a>
    </div>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#" data-toggle = "tab" role = "tab">Utilisateurs</a>
  </li>
  
  
  <li class ="nav item ml-auto">
  <form method = "POST" action = "Signout">
  <button class="btn btn-primary" onclick="window.location='Login.jsp'">Deconnexion</button>
  </form>
  </li>
  
  </ul>
  
  <div class="tab-content">
  <c:if test = "${!empty sessionScope.nom}">
  <div class="tab-pane fade show active p-3" role="tabpanel" >
  <br/>
  <br/>
  <center>
  <img src = "https://upload.wikimedia.org/wikipedia/commons/1/13/Ensias2.jpg">
  </center>
  <br/>
  <h5 class = "text-center">Bienvenue ${sessionScope.nom} !  
   </h5>
   </div>
   </c:if>
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