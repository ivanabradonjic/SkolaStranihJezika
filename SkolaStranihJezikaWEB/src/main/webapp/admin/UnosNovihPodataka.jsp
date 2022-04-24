<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Unos novih podataka</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles/style.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles/unos.css">
	
<style>
.unos-box{
margin-top:250px;
}

.unos-box2{
padding:15px;
}


</style>	

</head>
<body>

<div class="header">
		<div class="logo">
			<img src="${pageContext.request.contextPath}/images/logo1.png">
			
		</div>
	<div id="mySidenav" class="sidenav">
		<ul>
		<li><a href="/Kursevi/index.jsp">Pocetna</a></li>
			<li><a href="/Kursevi/index.jsp#onama">O nama</a></li>
			<li><a href="/Kursevi/Kontakt.jsp">Kontakt</a></li>
			<li><a href="/Kursevi/auth/loginUser">Prijava</a></li>

			<security:authorize access="hasRole('ADMIN')">
				<li><a href="/Kursevi/admin/UnosNovihPodataka.jsp">Unos
						novih podataka</a></li>
				<li><a href="/Kursevi/adminKontroler/unosProfesora">Novi zaposleni</a></li>
				<li><a href="/Kursevi/adminKontroler/SviProfesori.pdf">Svi zaposleni</a></li>
				<li><a href="/Kursevi/adminKontroler/sviJezici">Azuriranje kurseva</a></li>
				<li><a href="/Kursevi/adminKontroler/prikaziPonudu">Aktuelni kursevi</a></li>
			</security:authorize>

			<security:authorize access="hasRole('PROFESOR')">
				<li><a href="/Kursevi/profesorKontroler/kurseviProfesora">Moji
						kursevi</a></li>
			</security:authorize>

			<security:authorize access="hasRole('CLAN')">
				<li><a href="/Kursevi/clanKontroler/sviJezici">Cenovnik</a></li>
				<li><a href="/Kursevi/clanKontroler/prikaziAktuelneKurseve">Aktuelni kursevi</a></li>
			</security:authorize>
			<li><a href="/Kursevi/auth/logout">Odjava</a></li>
		</ul>
	</div>
</div>



<div class="container">
	<div class="unos-box">
	<form id="reg-form" action="/Kursevi/adminKontroler/saveJezik" method="post">
		Novi jezik: <input type="text" name="naziv"> <br>
		<button type="submit" class="unosbtn">Sacuvaj</button>
	</form>
	</div>
	<br>

	
	<div class="unos-box2">
	<form id="reg-form2" action="/Kursevi/adminKontroler/saveVrstaKursa" method="post">
		Nova vrsta kursa: <input type="text" name="naziv"> <br>
		<button type="submit" class="unosbtn2">Sacuvaj</button>
	</form>
	</div>
	<br>
</div>

<c:if test="${!empty jezikSaved}">
		<script>
			function myFunction() {
				alert("Uspesno ste se dodali novi jezik);
			}
		</script>
	</c:if>

	<script type="text/javascript">
		window.onload = myFunction;
	</script>

</body>
</html>