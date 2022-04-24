<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Aktuelni kursevi</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/styles/style.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

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
#aktuelni th {background-color:#827d51;}


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
.btn {
margin-left:30%;
margin-top:30px;
width:300px;
display:inline-block;
height:40px;
}

#azurirajbtn {
  background-color:#656036;
  float:right;
  color: white;
  padding: 8px 14px;
  text-align:center;
  font-size:14px;
  border:none;
  border-radius:5px;
  cursor: pointer;
  width: 40%;
  display:inline-block;
}

#dodajbtn {
background-color:#656036;
  float:left; 
  color: white;
  padding: 8px 14px;
  text-align:center;
  font-size:14px;
  border:none;
  border-radius:5px;
  cursor: pointer;
  width: 50%;
  display:inline-block;
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
				<li><a href="/Kursevi/clanKontroler/prikaziAktuelneKurseve">Aktuelni kursevi</a></li>
			</security:authorize>
			<li><a href="/Kursevi/auth/logout">Odjava</a></li>
		</ul>
	</div>
</div>





<div class="aktuelniKursevi" style="overflow-x:auto;">
<c:if test="${!empty ponude}">
					 <table id="aktuelni">
						 <tr>
							   <th>Kurs</th>
							   <th>Datum pocetka</th>
							   <th>Datum kraja</th>
							   <th>Max osoba</th>
							   <th>Rok za prijavu</th>
						 </tr>
						 <tr>
						   <c:forEach var="p" items="${ponude}">
							 <tr>
							 	<td>${p.kurs.vrstaKursa.naziv} kurs ${p.kurs.jezik.naziv} jezik</td>
							 	<td>${p.pocetakDatum}</td>
							 	<td>${p.krajDatum}</td>
							 	<td>${p.maxOsoba}</td>
							 	<td>${p.rok }</td>
							 </tr>
						  </c:forEach>
						 
					</table>
	</c:if>
<div class="btn">	
	<form action="/Kursevi/adminKontroler/azuriraj" method="get">
		<button type="submit" id="azurirajbtn">Azuriraj</button>
	</form>
	<form action="/Kursevi/adminKontroler/dodajUPonudu" method="get">
		<button type="submit" id="dodajbtn">Dodaj u ponudu</button>	 
	</form>
</div>	


</div>

<!-- Scripts -->
			<c:if test="${!empty kursSaved}">
			<script>
				function myFunction(){
 				 alert("Uspesno ste se uneli novi kurs");
				}
			</script>
		</c:if> 

<script type="text/javascript">window.onload=myFunction;</script>
	
</body>
</html>