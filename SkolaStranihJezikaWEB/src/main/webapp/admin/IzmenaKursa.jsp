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
<title>Izmena kursa</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles/style.css">
	
<style>
.mainizmenakursa {
margin-top:240px;
margin-left: 220px;

}

.mainizmenakursa h3 {
margin-top:5px;
color:#8b8445;
}

#tabelaizmena {
margin-top: 20px;
border-collapse:separate;
 border-spacing:10px;
}

#tabelaizmena select{
width:200px;
}
#tabelaizmena input[type=text]{
width:200px;
}

.btnpromeni{
margin-top: 20px;
background-color:#9f9857;
 position:absolute;
 margin-left:5%;
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
;
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

<div class="mainizmenakursa">
 
	<h3>Unesite nove podatke o kursu: </h3>
	
	<form action="/Kursevi/adminKontroler/promeni" method="post">
	 <table id="tabelaizmena">
	 <tr>
		<td>Novi profesor:</td>
		<td><select name="idProfesor">
				<c:forEach var="p" items="${profesori}">
					<option value="${p.idProfesor}">"${p.ime} ${p.prezime}"</option>
				</c:forEach>
		</select></td>
		</tr>
		<tr>
		<td>Nova cena:</td>
		<td><input type="text" name="novaCena"></td>
		</tr>
	 </table>
	 <button type="submit" class="btnpromeni">Promeni</button>
	</form>
	
	<c:if test="${!empty izmenjenKurs}">
				${poruka}
	</c:if>		 
	
</div>
</body>
</html>