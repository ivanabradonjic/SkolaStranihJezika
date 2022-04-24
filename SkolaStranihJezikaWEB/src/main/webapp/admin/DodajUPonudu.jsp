<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Dodavanj kursa u ponudu</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles/style.css">
	
<style>
.mainDodajUPonudu {
margin-top:240px;
margin-left:220px;
background-color:white;
width:40%;
border-radius:10px;
padding-left:10px;


}
#tabeladodaj {
margin-top: 20px;
border-collapse:separate;
 border-spacing:15px;
 width:100%;
}

#tabeladodaj label{
text-align:center;
width:50%;
font-size: 18px;
font-family: "Helvetica", arial, sans-serif;
color:#59552d;
}
#tabeladodaj input[type="date"] {
    appearance: none;
    -webkit-appearance: none;
    color: #95a5a6;
    font-family: "Helvetica", arial, sans-serif;
    font-size: 15px;
    border:1px solid #ecf0f1;
    background:#f5f0c2;
    padding:5px;
    width:50%;
    display: inline-block !important;
    visibility: visible !important;
}

#tabeladodaj input[type="date"], focus {
    color: #95a5a6;
    box-shadow: none;
    -webkit-box-shadow: none;
    -moz-box-shadow: none;
}

#tabeladodaj input[type=text]{
width:60%;
background-color:#f5f0c2;
border-color:#ecf0f1;
 border-radius:5px;
  padding: 10px;
}

.btndodaj{
margin-top: 20px;
background-color:#9f9857;
 position:absolute;
 margin-left:50px;
  color: white;
  padding: 8px 14px;
  text-align:center;
  font-size:14px;
  border:none;
  border-radius:5px;
  cursor: pointer;
  width: 110px;
  padding:15px 25px;
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


<div class="mainDodajUPonudu">

<form action="/Kursevi/adminKontroler/savePonuda" method="post">
		<table id="tabeladodaj">
			<tr>
				<td><label>Datum pocetka kursa:</label></td>
				<td><input type="date" name="pocetakDatum"></td>
			</tr>
			<tr>
				<td><label>Datum kraja kursa:</label></td>
				<td><input type="date" name="krajDatum"></td>
			</tr>
			<tr>
				<td><label>Max broj osoba:</label></td>
				<td><input type="text" name="maxOsoba"/></td>
			</tr>
			<tr>
				<td><label>Rok za prijavu:</label></td>
				<td><input type="date" name="rok"/></td>
			</tr>
			<tr>
				<td><button type="submit" class="btndodaj">Dodaj</button></td>
			</tr>
		</table>
	</form>
</div>
</body>
</html>