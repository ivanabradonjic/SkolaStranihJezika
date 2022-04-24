<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Unos novog zaposlenog</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles/unos.css">
</head>
<body>
<div class="container">
	<div class="unos-box">
	<h3 style="text-align:center;">Unesite podatke o novom zaposlenom: </h3>
	<form id="reg-form" action="/Kursevi/adminKontroler/saveProfesor" method="post">	
				
				<input type="text" placeholder="Unesite ime" name="ime">
		
				<input type="text" placeholder="Unesite prezime" name="prezime">
			
				<input type="text" placeholder="Unesite email" name="email"/>
			
				<input type="password" placeholder="Unesite password" name="password"/>
			
				<input type="text" placeholder="JMBG" name="jmbg">
		
				<input type="date" name="datumRodjenja">
		
				<input type="text" placeholder="Unesite adresu" name="adresa">
			
				<input type="text" placeholder="Unesite broj telefona" name="telefon">
			
			
				<input type="text" placeholder="Unesite platu" name="plata">
			
		
				<button type="submit" class="unosbtn">Dodaj</button>
				<button type="button" class="cancelbtn" onclick="location.href = 'http://localhost:8080/Kursevi/';">Odustani</button>	
	</form>
</div>
</div>
	<br><br>
	<c:if test="${!empty poruka}">
		<script>
			function myFunction() {
				alert("${poruka}");
			}
		</script>
	</c:if>

	<script type="text/javascript">
		window.onload = myFunction;
	</script>
</body>
</html>