<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset = "utf-8">
<meta name = ""viewport" content = "width-device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel = "stylesheet" href = "index.css">
<style>
body {
  background-image: url('https://cdn.wallpapersafari.com/0/77/0oUaHO.jpg');
  background-repeat: no-repeat;
  background-size: cover;
}
</style>
<title>Interface Admin</title>


</head>

<body>
<div class = "container p-5">
<ul class="nav nav-tabs" role = "tablist">
  <li class="nav-item">
    <a class="nav-link" href="#" data-toggle = "tab" role = "tab" aria-controls="Evénements">Evénements</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#" data-toggle = "tab" role = "tab" aria-controls="Clubs">Clubs</a>
  </li>
  <li class="nav-item">
    <a class="nav-link dropdown" href="/" data-toggle="dropdown" role = "button" aria-haspopup="true" aria-expanded="false">Ecoles</a>
      <div class="dropdown-menu">
      <a class="dropdown-item" href="/Ecoles">Ajouter une école</a>
      <a class="dropdown-item" href="#">Gestion des écoles</a>
    </div>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#" data-toggle = "tab" role = "tab">Utilisateurs</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#" data-toggle = "tab" role = "tab">Mon compte</a>
  </li>
  
  
  <li class ="nav item ml-auto">
  <button class="btn btn-primary" onclick="window.location='Login.jsp'">Deconnexion</button>
  </li>
  
  </ul>
  <div class="fixed-bottom footer-copyright text-right py-3 copyright">© 
     ENSIAS
  </div>
  
</div>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>