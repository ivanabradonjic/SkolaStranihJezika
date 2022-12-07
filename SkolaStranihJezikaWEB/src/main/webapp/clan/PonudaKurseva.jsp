<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Aktuelna ponuda</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/style.css">
<style>


.aktuelniKursevi{
margin-top:250px;
margin-left:8%;
display:block;

}

#aktuelni {
  border-collapse:separate;
  border-spacing:0px;
   border: 1px solid rgb(77,80,73);
   width: 90%;
}

#aktuelni th, #aktuelni td {
  padding: 6px;
  text-align: center;
  border-bottom: 1px solid;
  border-color:rgb(77,80,73);
}

#aktuelni tr {background-color:#ddd590;}
#aktuelni th {background-color:#aba46b;}


#aktuelni a:link{
text-decoration:none;

}
#aktuelni a:hover{
color:white;

}
#aktuelni tr:hover {
background-color:#aba46b;
color:white;
}
#aktuelni tr:first-child:hover {
	color:black;
}


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
				<li><a href="/Kursevi/clanKontroler/prikaziAktuelneKurseve">Aktuelna ponuda</a></li>
			</security:authorize>
			<li><a href="/Kursevi/auth/logout">Odjava</a></li>
		</ul>
	</div>
</div>




<div class="aktuelniKursevi" style="overflow-x:auto;">
	<c:if test="${!empty aktuelniKursevi}">
		<table  id="aktuelni" >
			<tr>
				<th>Vrsta kursa</th>
				<th>Grupa</th>
				<th>Pocetak kursa</th>
				<th>Kraj kursa</th>
				<th>Max osoba</th>
				<th>Rok za prijavu</th>
				<th>Cena(EUR)</th>
				<th>Upis na kurs</th>
			</tr>
			<tr>
				<c:forEach var="ak" items="${aktuelniKursevi}">
					<tr>
						<td>${ak.kurs.vrstaKursa.naziv} kurs ${ak.kurs.jezik.naziv}
							jezik</td>
						<td>${ak.kurs.grupa.tip}</td>
						<td>${ak.pocetakDatum}</td>
						<td>${ak.krajDatum}</td>
						<td>${ak.maxOsoba}</td>
						<td>${ak.rok }</td>
						<td>${ak.kurs.cena}</td>
						<td><a
							href="/Kursevi/clanKontroler/prijavaNaKurs?idPonuda=${ak.idPonuda }">Prijavi
								se</a></td>
					</tr>
				</c:forEach>
		</table>
	</c:if>
	
	<c:if test="${!empty poruka2}">
		<h4>${poruka2 }</h4>
	</c:if>
	<c:if test="${!empty poruka3}">
		<script>
				function myFunction1(){
 				 alert("Zao nam je, prijava je istekla.");
				}
			</script>
	</c:if>
	
</div>

<!-- Scripts -->
		<c:if test="${!empty poruka4}">
			<script>
				function myFunction2(){
 				 alert("Vec ste se prijavili na kurs");
				}
			</script>
		</c:if> 

<script type="text/javascript">window.onload=myFunction1;</script>
<script type="text/javascript">window.onload=myFunction2;</script>

</body>
</html>