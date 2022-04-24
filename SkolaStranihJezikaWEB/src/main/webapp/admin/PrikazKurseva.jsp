<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kursevi</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles/style.css">
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles/tabelakursevistyle.css">
</head>
<style>

.jezik {
margin-top:80px;
}

.btnnovikurs{
background-color:#656036;
  margin-left: 35%;
  margin-top: 210px;
  color: white;
  padding: 8px 14px;
  text-align:center;
  font-size:14px;
  border:none;
  border-radius:5px;
  cursor: pointer;
  width: 30%;
 
}




</style>
<body>

<div class="header">
		<div class="logo">
			<img src="${pageContext.request.contextPath}/images/logo1.png">
			
		</div>
	<div id="mySidenav" class="sidenav">
		<ul>
			<li><a href="/Kursevi/index.jsp">Pocetna</a></li>
			<li><a href="/Kursevi/index.jsp#onama">O nama</a></li>
			<li><a href="/Kursevi/index.jsp#kontakt">Kontakt</a></li>
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



<form action="/Kursevi/adminKontroler/unosKursa" method="get">
	<button type="submit" class="btnnovikurs">Dodaj novi kurs</button>
</form>

<div class="jezik">
	
	<form action="/Kursevi/adminKontroler/prikazKursevaZaJezik" method="get">
		<div class="selectjezik">
			<select name="idJezik">
  				<c:forEach var="j" items="${sviJezici}" >
  					<option value="${j.idJezik}">${j.naziv}</option>
  				</c:forEach>
			</select> 
		</div>
		<button type="submit" class="btnjezik" >Izaberi</button>
	</form>
</div>
<div class="tabelakursevi" style="overflow-x:auto;">
	 <c:if test="${!empty kursevi}">
					 <table border="1"  id="kursevi">
						 <tr>
							   <th>Vrsta kursa</th>
							   <th>Grupa</th>
							   <th>Cena</th>
							   <th>Profesor</th>
							   <th>Izmeni kurs</th>
							   <th>Dodaj u ponudu</th>
						 </tr>
						 <tr>
						   <c:forEach var="k" items="${kursevi}">
							 <tr>
							 	<td>${k.vrstaKursa.naziv}</td>
							 	<td>${k.grupa.tip}</td>
							 	<td>${k.cena}</td>
							 	<td>${k.profesor.ime } ${k.profesor.prezime}</td>
							 	<td><a href="/Kursevi/adminKontroler/izmenaKursa?idKurs=${k.idKurs}">Izmeni</a></td>
							 	<td><a href="/Kursevi/adminKontroler/aktiviraj?idKurs=${k.idKurs}">Dodaj</a>
							 </tr>
						  </c:forEach>
					</table>
	</c:if>
</div>

</body>
</html>