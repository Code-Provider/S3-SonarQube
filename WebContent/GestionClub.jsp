<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset = "utf-8">
<meta name = ""viewport" content = "width-device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel = "stylesheet" href = "index.css">
<title>Clubs gérés</title>
</head>
<body>
<div class = "container p-5">
<ul class="nav nav-tabs" role = "tablist">
  <li class="nav-item">
    <a class="nav-link" href="#Messages" data-toggle = "tab" role = "tab" aria-controls="Messages">Messages</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#Demandes" data-toggle = "tab" role = "tab" aria-controls="Demandes">Demandes d'adhésion</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#Add" data-toggle = "tab" role = "tab" aria-controls="Add">Ajouter un évenement</a>
  </li>
  </ul>

<div class="tab-content">
  <div class="tab-pane fade show active p-3" role="tabpanel" >
  <h5 class = "text-center">Gestion du club ${club}</h5>
  <br/>
  </div>
  <div class="tab-pane fade p-3" id="Demandes" aria-labelledby="Demandes-tab" role="tabpanel">
  
  </div>
  <div class="tab-pane fade p-3" id="Add" aria-labelledby="Add-tab" role="tabpanel">
  
  
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