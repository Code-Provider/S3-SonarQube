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
    <a class="nav-link" href="#login" data-toggle = "tab" role = "tab" aria-controls="login">Se connecter</a>
  </li>
  <li class="nav-item">
    <a class="nav-link" href="#signup" data-toggle = "tab" role = "tab" aria-controls="signup">S'enregister</a>
  </li>
  </ul>

<div class="tab-content">
  <div class="tab-pane fade show active p-3" role="tabpanel" >
  <h5 class = "text-center">Veuiller vous connecter ou vous enregistrer !</h5>
  </div>
  <div class="tab-pane fade p-3" id="login" aria-labelledby="login-tab" role="tabpanel">
  <form>
  <div class="form-group">
    <label for="InputEmail">Adresse Email</label>
    <input type="email" class="form-control" id="InputEmail" aria-describedby="emailHelp" placeholder="Entrez votre email">
    <!--<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>-->
  </div>
  <div class="form-group">
    <label for="InputPassword">Mot de passe</label>
    <input type="password" class="form-control" id="InputPassword" placeholder="Entrez votre mot de passe">
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
  <form>
  <div class="form-group">
  	<div class="form-group">
    <label for="InputName">Nom & Prénom</label>
    <input type="text" class="form-control" id="InputName" placeholder="Entrez votre Nom & Prénom">
  	</div>
  	<div class="form-group">
    <label for="InputSelect">Ecole</label>
    <select class="form-control" id="InputSelect">
      <option>ENSIAS</option>
      <option>INPT</option>
      <option>EMI</option>
      <option>ESI</option>
      <option>ENSET</option>
      <option>ENIM</option>
      <option>ENSEM</option>
    </select>
  </div>
  <div class="form-group">
  <label for="Telephone">Télephone</label>
    <input type="text" class="form-control" id="InputTel" placeholder="Entrez votre n° de télephone">
  	</div>
    <label for="InputEmail">Adresse Email</label>
    <input type="email" class="form-control" id="InputEmail" aria-describedby="emailHelp" placeholder="Entrez votre email">
    <!--<small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>-->
  </div>
  <div class="form-group">
    <label for="InputPassword">Mot de passe</label>
    <input type="password" class="form-control" id="InputPassword" placeholder="Entrez votre mot de passe">
  </div>
  
  <button type="submit" class="btn btn-primary">Valider</button>
  </form>
  </div>
</div>

<div>
<small> < <a href = "Acceuil.jsp"> Revenir à l'acceuil</a> </small>
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