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
<!-- <style>
body {
  background-image: url('https://image.freepik.com/photos-gratuite/fond-aquarelle-splash_23-2148175602.jpg');
  background-repeat: no-repeat;
  background-size: cover;
}
</style>
-->


</head>

<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark">


  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item">
        <a class="nav-link active" href="#">Evenements<span class="sr-only">(current)</span></a>
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
        <a class="nav-link" href="#" tabindex="-1">Utilisateurs</a>
      </li>
      </c:if>
      
    </ul>
    <form class="form-inline my-2 my-lg-0" method = "POST" action = "Deconnexion">
      <button class="btn btn-danger" type = "submit">Deconnexion</button>
    </form>
  </div>
</nav>

<div class="container p-4">
      <h2 class="text-center">Bienvenue ${sessionScope.nom}</h2>
      <hr />
      <div class="p-5">
        <nav>
          <div class="nav nav-tabs" role="tablist">
            <a
              class="nav-item nav-link"
              data-toggle="tab"
              href="#nearby"
              role="tab"
            >
              <span class="pb-2">
                <i class="fas fa-list mr-4"></i>
                Prochains évenements
              </span>
            </a>
            <a
              class="nav-item nav-link"
              data-toggle="tab"
              href="#prefered"
              role="tab"
            >
              <span class="pb-2">
                <i class="far fa-heart mr-4"></i>
                Derniers messages dans vos clubs
              </span>
            </a>
          </div>
        </nav>
        <div class="tab-content p-5">
          <div
            class="tab-pane fade show active text-center p-5"
            role="tabpanel"
          >
            <h4 class="text-muted">
              Explore les nouveautés parascolaires !  
              <i class="fas fa-shopping-basket ml-3"></i>
            </h4>
          </div>
          <div
            class="tab-pane fade text-center p-3"
            id="nearby"
            role="tabpanel"
          >
            <div
              id="bingo-alert"
              class="alert alert-danger mb-5"
              role="alert"
            ></div>
            <div id="bingo-wait" class="alert alert-info mb-5"></div>
            <div class="row" id="nearby-cards">
              <!--Here go nearby shops' cards-->
            </div>
          </div>
          <div
            class="tab-pane fade text-center p-3"
            id="prefered"
            role="tabpanel"
          >
            <div class="row" id="prefered-cards">
              <!--Here go prefered shops' cards-->
            </div>
          </div>
        </div>
      </div>
    </div>
  
  

<br/>
  <br/>
  <center>
  <!-- <img src = "https://upload.wikimedia.org/wikipedia/commons/1/13/Ensias2.jpg"> -->
  </center>
  <br/>
  

  <div class="fixed-bottom footer-copyright text-right py-3 copyright">© 
     ENSIAS
  </div>
  
</div>


<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>

</body>
</html>