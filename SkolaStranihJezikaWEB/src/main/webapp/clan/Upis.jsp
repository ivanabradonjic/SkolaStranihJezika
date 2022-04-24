<%@ page import="java.util.Date"%>
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
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Upis</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles/style.css">
<style>

.msg {
margin-top:220px;
margin-left:420px;
margin-bottom:30px;
display:block;
background-color:#4a4724;
width:450px;
}

.content{
	margin:auto;
	width:400px;
	height:300px;
	padding:15px;	
	background-color:#dad390;
	display:block;
	border-radius:15px;
}

.katselect {
  display:inline-block;
  margin-top:15px;
  margin-left:5px;
  width:100%;
}

.katselect label {
 	font-weight:bold;
 	float:left;
 	color:#544f26;
 	display:block;
 	width:40%;
}
.nivoselect label {
 	font-weight:bold;
 	float:left;
 	color:#544f26;
 	display:block;
 	width:40%;
}


.katselect select {
 background-color: #a8a350;
  color: black;
  font-size: inherit;
  padding: .5em;
  padding-right: 2.5em; 
  border: 0;
  margin-top: 0;
  width:60%;
  height:35px;
  float:right;
  border-radius: 5px;
  text-indent: 0.01px;
  text-overflow: '';
  -webkit-appearance: button;

}
.katselect::before,
.katselect::after {
  content: "";
  position: absolute;
  pointer-events: none;
}

.katselect::after { /*  Custom dropdown arrow */
  content: "\25BC";
  height: 1em;
  font-size: .625em;
  line-height: 1;
  right: 1.2em;
  top: 50%;
  margin-top: -.5em;
}

.katselect::before { /*  Custom dropdown arrow cover */
  width: 2em;
  right: 0;
  top: 0;
  bottom: 0;
  border-radius: 0 3px 3px 0;
}

.nivoselect {
 display:inline-block;
  margin-top:15px;
  margin-left:5px;
  width:100%;
}

.nivoselect select {
 background-color:#a8a350;
  color: black;
  font-size: inherit;
  padding: .5em;
  padding-right: 2.5em; 
  border: 0;
  width:60%;
  float:right;
  height:35px;
  border-radius: 5px;
  text-indent: 0.01px;
  text-overflow: '';
  -webkit-appearance: button;

}
.nivoselect::before,
.nivoselect::after {
  content: "";
  position: absolute;
  pointer-events: none;
}

.nivoselect::after { /*  Custom dropdown arrow */
  content: "\25BC";
  height: 1em;
  font-size: .625em;
  line-height: 1;
  right: 1.2em;
  top: 50%;
  margin-top: -.5em;
}

.nivselect::before { /*  Custom dropdown arrow cover */
  width: 2em;
  right: 0;
  top: 0;
  bottom: 0;
  border-radius: 0 3px 3px 0;
}
.btnupis{
background-color:#2b291a;
  margin-top:10px;
  margin-left:40%;
  color: white;
  padding: 8px 14px;
  text-align:center;
  font-size:14px;
  border:none;
  border-radius:5px;
  cursor: pointer;
  width: 80px;
  height:37px;
  z-index:0;
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



<div class="msg">
<c:if test="${!empty izabraniKurs}">
				<h3 style="color:white;">${poruka1}</h3>
	</c:if>
</div>
<div class="content">
	<c:set var="today" value="<%=new Date()%>" />
	<form:form action="/Kursevi/clanKontroler/prijaviSe" method="post"
		modelAttribute="upis">
		<div class="katselect">
        <label for="kat">Izaberite kategoriju</label>
		<form:select path="kategorija" items="${kategorije}"
			itemValue="idKategorija" itemLabel="naziv" id="kat"/>
		</div>
		<div class="nivoselect">
        <label for="nivo">Izaberite nivo</label>
		<form:select path="nivo" items="${nivoi}" itemValue="idNivo"
			itemLabel="oznaka" id="nivo"/>
		</div>

		<form:textarea path="komentar" placeholder="Unesite komentar" style="width:100%; height:100px; margin-top:10px; border:none;"></form:textarea>
			
		<button type="submit" class="btnupis">Sacuvaj</button>
			
	</form:form>
	
	</div>
	
</body>
</html>