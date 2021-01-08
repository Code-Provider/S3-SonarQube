<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset = "utf-8">
<meta name = ""viewport" content = "width-device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel = "stylesheet" href = "index.css">
<title>Connexion & Enregistration</title>
</head>
<body>
<div class = "container p-5">
<ul class="nav nav-tabs" role = "tablist">
  <li class="nav-item">
    <a class="nav-link active" href="#login" data-toggle = "tab" role = "tab" aria-controls="login">Se connecter</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#signup" data-toggle = "tab" role = "tab" aria-controls="signup">S'enregister</a>
  </li>
  </ul>

<div class="tab-content">

  <div class="tab-pane fade p-3 show active" id="login" aria-labelledby="login-tab" role="tabpanel">
  <c:if test = "${not empty Error}">
  <div class="alert alert-danger" role="alert">
  ${Error}
  </div>
  </c:if>
  <form method = "POST" action = "Login">
  <div class="form-group">
    <label for="login">Login</label>
    <input type="text" class="form-control" name = "login" id="login" aria-describedby="emailHelp" placeholder="Entrez votre nom de compte">
    <!--<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>-->
  </div>
  <div class="form-group">
    <label for="password">Mot de passe</label>
    <input type="password" class="form-control" name = "password" id="password" placeholder="Entrez votre mot de passe">
  </div>
  <!--  <div class="form-group form-check">
    <input type="checkbox" class="form-check-input" id="exampleCheck1">
    <label class="form-check-label" for="exampleCheck1">Check me out</label>
  </div>
  -->
  <button type="submit" class="btn btn-primary">Valider</button>
</form>
  </div>
  <div class="tab-pane fade p-3" id="signup" aria-labelledby="signup-tab" role="tabpanel">
  <form method = "POST" action = "Enregistration">
  <div class="form-group">
  	<div class="form-group">
    <label for="nom">Nom & Prénom</label>
    <input type="text" class="form-control" id="nom" name = "nom" placeholder="Entrez votre Nom & Prénom">
  	</div>
  	<div class="form-group">
    <label for="login">Login</label>
    <input type="text" class="form-control" name = "login" id="login" placeholder="Entrez votre nom de compte">
    </div>
  	<div class="form-group">
    <label for="password">Mot de passe</label>
    <input type="password" class="form-control" name = "password" id="password" placeholder="Entrez votre mot de passe">
    </div>
  	<div class="form-group">
    <label for="InputSelect">Ecole</label>
    <select class="form-control" id="ecole" name = "ecole">
      <c:forEach var="ecole" items = "${ecoles}">
      <option>${ecole.nom}</option>
      </c:forEach>
    </select>
  </div>
  <div class="form-group">
  <label for="telephone">Télephone</label>
    <input type="text" class="form-control" name = "telephone" id="telephone" placeholder="Entrez votre n° de télephone">
  	</div>
    <label for="email">Adresse Email</label>
    <input type="email" class="form-control" name = "email" id="email" aria-describedby="emailHelp" placeholder="Entrez votre email">
    <!--<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>-->
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