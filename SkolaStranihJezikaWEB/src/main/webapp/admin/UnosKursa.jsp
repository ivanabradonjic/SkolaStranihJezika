<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Unos novog kursa</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles/unos.css">
		
<style>

#reg-form label{
width:50%;
font-size:20px;
float:left;
margin-bottom:15px;
}

.unosbtn{
background-color:#98945d;
}
.cancelbtn {
background-color:#98945d;
}

#reg-form select {
  background-color: #98945d;
  color: #fff;
  font-size: inherit;
  padding: .5em;
  padding-right: 2.5em; 
  border: 0;
  margin-bottom: 5px;
  width:50%;
  float:right;
  border-radius: 5px;
  text-indent: 0.01px;
  text-overflow: '';
  opacity:0.9;
  -webkit-appearance: button; /* hide default arrow in chrome OSX */
}

#reg-form::before,
#reg-form::after {
  content: "";
  position: absolute;
  pointer-events: none;
}

#reg-form::after { /*  Custom dropdown arrow */
  content: "\25BC";
  height: 1em;
  font-size: .625em;
  line-height: 1;
  right: 1.2em;
  top: 50%;
  margin-top: -.5em;
}

#reg-form::before { /*  Custom dropdown arrow cover */
  width: 2em;
  right: 0;
  top: 0;
  bottom: 0;
  border-radius: 0 3px 3px 0;
}


.unosselect itemLabel:hover{
background-color:#f5f0c2;
}
 .unosselect itemLabel:focus{
background-color:#f5f0c2;
}


</style>
</head>

<body>
<div class="container">
	<div class="unos-box">
	<h3 style="text-align:center;">Unesite podatke o novom kursu: </h3>
	
	<form:form id="reg-form" action="/Kursevi/adminKontroler/saveKurs" method="post"
		modelAttribute="kurs">
			<div class="unosselect">
				<label>Jezik:</label>
				<form:select  path="jezik" items="${jezici}"
						itemValue="idJezik" itemLabel="naziv" />
			
				<label>Vrsta kursa:</label>
				<form:select  path="vrstaKursa" items="${vrsteKurseva}"
						itemValue="idVrstaKursa" itemLabel="naziv" />
		
				<label>Grupa:</label>
				<form:select  path="grupa" items="${grupe}"
						itemValue="idGrupa" itemLabel="tip" />

				<label>Nivo:</label>
				<form:select path="nivo" items="${nivoi}"
						itemValue="idNivo" itemLabel="oznaka" />
					
				<form:input type="text" placeholder="Trajanje" path="trajanje" />			
				
				<form:input type="text" placeholder="Opis" path="opis" />
						
				<form:input type="text" placeholder="Cena" path="cena" />
			
			
				<label>Profesor:</label>
				<form:select  path="profesor">
						<c:forEach var="p" items="${profesori}">
							<form:option value="${p.idProfesor}">
								<c:out value="${p.ime} ${p.prezime}" />
							</form:option>
						</c:forEach>
					</form:select>
		   </div>
				<button type="submit" class="unosbtn" >Sacuvaj</button>
				 <button type="button" class="cancelbtn" onclick="location.href = 'http://localhost:8080/Kursevi/';">Odustani</button>	
 
			
	</form:form>
</div>
</div>


</body>
</html>