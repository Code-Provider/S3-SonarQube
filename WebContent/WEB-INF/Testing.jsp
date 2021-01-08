<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Heyyy</title>
</head>
<body>

<c:forEach var="ecole"  items="${ ecoles }" >
          <ul>
          <li>
          <c:out value = "${ecole.nom}"/>
          </li>
          <li>
          <c:out value = "${ecole.description}"/>
          </li>
          <li>
          <c:out value = "${ecole.image}"/>
          </li>
          
          </ul>
</c:forEach>

</body>
</html>