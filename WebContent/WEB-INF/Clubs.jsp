<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>

<meta charset = "utf-8">
<meta name = ""viewport" content = "width-device-width, initial-scale=1, shrink-to-fit=no">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<link rel = "stylesheet" href = "index.css">
<title>Clubs</title>
<!-- <style>
body {
  background-image: url('http://www.etudiant.ma/uploads/entrance_exam/cover/147/large_ENSIAS.jpg');
  background-repeat: no-repeat;
  background-size: cover;
}
</style>-->
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

<c:forEach var = "club" items = "${clubs}">

<!-- <div class="card">
  <div class="card-header">
    Géré par : ${club.gerant.nom}
  </div>
  <div class="card-body">
    <h5 class="card-title">${club.nom}</h5>
    <p class="card-text">${club.description}</p>
    <!-- <form method = "POST" action = "Demandes?club_id=${club.id}">
    
    <a href="Demandes?club_id=${club.id}" class="btn btn-primary">Valider</a>
    <form method = "POST" action = "DemandeRejoindre?club_id=${club.id}">
    <button type="submit" class="btn btn-success">Rejoindre</button>
    </form>

  </div>
</div>

<br/>  -->

<div class="card">
		<div class="card-header">
    	Géré par : ${club.gerant.nom}
  		</div>
        <div class="row no-gutters">
            <div class="col-auto">
                <img src="Im/${club.logo}" class="img-fluid" alt="">
            </div>
            <div class="col">
                <div class="card-block px-2">
                    <h4 class="card-title" style = "padding-left : 5px ; padding-top : 5px">${club.nom}</h4>
                    <p class="card-text">${club.description}</p>
                    <form method = "POST" action = "DemandeRejoindre?club_id=${club.id}">
    				<button type="submit" class="btn btn-success">Rejoindre</button>
    				</form>
                </div>
            </div>
        </div>
        
        
</div>
<br>



</c:forEach>



<c:forEach var = "club" items = "${clubs_geres}">

<!--<div class="card">
  <div class="card-header">
    Vous gérez ce club !
  </div>
  <div class="card-body">
    <h5 class="card-title">${club.nom}</h5>
    <p class="card-text">${club.description}</p>
    
    <form method = "POST" action = "GestionClub?club_id=${club.id}&gerant_id=${club.gerant.id}&nom=${club.nom}">
    <button type="submit" class="btn btn-success">Accéder</button>
    </form>
    

  </div>
</div>

<br/>
-->
<div class="card">
		<div class="card-header">
    	Vous gérez ce club !
  		</div>
        <div class="row no-gutters">
            <div class="col-auto">
                <img src="Im/${club.logo}" class="img-fluid" alt="">
            </div>
            <div class="col">
                <div class="card-block px-2">
                    <h4 class="card-title" style = "padding-left : 5px ; padding-top : 5px">${club.nom}</h4>
                    <p class="card-text">${club.description}</p>
                    <form method = "POST" action = "GestionClub?club_id=${club.id}&gerant_id=${club.gerant.id}&nom=${club.nom}">
    				<button type="submit" class="btn btn-success">Accéder</button>
    				</form>
                </div>
            </div>
        </div>
        
        
</div>
<br>

</c:forEach>





<c:forEach var = "club" items = "${clubs_accepte}">

<div class="card">
		<div class="card-header">
    	Géré par : ${club.gerant.nom}
  		</div>
        <div class="row no-gutters">
            <div class="col-auto">
                <img src="Im/${club.logo}" class="img-fluid" alt="">
            </div>
            <div class="col">
                <div class="card-block px-2">
                    <h4 class="card-title" style = "padding-left : 5px ; padding-top : 5px">${club.nom}</h4>
                    <p class="card-text">${club.description}</p>
                    <small>Vous appartenez à ce club ! </small>
                    <div style ="padding-top:5px">
                    <form method = "POST" action = "GestionClub?club_id=${club.id}&gerant_id=${club.gerant.id}&nom=${club.nom}">
    				<button type="submit" class="btn btn-success">Accéder</button>
    				</form>
    				</div>
                </div>
            </div>
        </div>
        
        
</div>
<br>


</c:forEach>



<c:forEach var = "club" items = "${clubs_attente}">

<div class="card">
		<div class="card-header">
    	Géré par : ${club.gerant.nom}
  		</div>
        <div class="row no-gutters">
            <div class="col-auto">
                <img src="Im/${club.logo}" class="img-fluid" alt="">
            </div>
            <div class="col">
                <div class="card-block px-2">
                    <h4 class="card-title" style = "padding-left : 5px ; padding-top : 5px">${club.nom}</h4>
                    <p class="card-text">${club.description}</p>
                    <small>Votre demande d'adhésion à ce club n'a pas encore été traité.</small>
                </div>
            </div>
        </div>
        
        
</div>
<br>

</c:forEach>



<c:forEach var = "club" items = "${clubs_refuse}">

<div class="card">
		<div class="card-header">
    	Géré par : ${club.gerant.nom}
  		</div>
        <div class="row no-gutters">
            <div class="col-auto">
                <img src="Im/${club.logo}" class="img-fluid" alt="">
            </div>
            <div class="col">
                <div class="card-block px-2">
                    <h4 class="card-title" style = "padding-left : 5px ; padding-top : 5px">${club.nom}</h4>
                    <p class="card-text">${club.description}</p>
                    <small>Votre demande d'adhésion à ce club a été refusé.</small>
                </div>
            </div>
        </div>
        
        
</div>
<br>

</c:forEach>







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