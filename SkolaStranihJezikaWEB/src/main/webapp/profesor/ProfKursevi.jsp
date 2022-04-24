<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kursevi profesora</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles/style.css">
</head>
<style>

.profesor{
margin-top:240px;
margin-left:20%;
margin-right:20%;
display:block;
z-index:0;

} 
#kurseviprofesora {
  border-collapse:separate;
  border-spacing:0px;
  width: 100%;
}

#kurseviprofesora th, td {
  padding: 8px;
  text-align: center;
  border-bottom: 1px solid rgb(77,80,73);
}
#kurseviprofesora th {
background-color: #a8a350;
}
#kurseviprofesora tr {
background-color:#e6de99 ;
}


#kurseviprofesora a:link {
	color:#f58637;
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



<div class="profesor" style="overflow-x:auto;">
	<c:if test="${!empty kursevi}">
					 <table id="kurseviprofesora">
						 <tr>
						 	   <th>Jezik</th>
							   <th>Vrsta kursa</th>
							   <th>Grupa</th>
							   <th>Trajanje</th>
							   <th>Fond</th>
							   <th>Clanovi kursa</th>
						 </tr>
						 <tr>
						   <c:forEach var="k" items="${kursevi}">
							 <tr>
							 	<td>${k.jezik.naziv }</td>
							 	<td>${k.vrstaKursa.naziv}</td>
							 	<td>${k.grupa.tip}</td>
							 	<td>${k.trajanje }</td>
							 	<td>${k.opis}</td>

							 	<td><a href="/Kursevi/profesorKontroler/clanoviKursa?idKurs=${k.idKurs}">Preuzmi</a></td>
							 </tr>
						  </c:forEach>
					</table>
			</c:if>
	</div>
</body>
</html>