<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri='http://java.sun.com/jsp/jstl/core' prefix='c'%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Registracija</title>
<style>

body {font-family: Arial, Helvetica, sans-serif;
	background-color:#EEE8AA;}
* {box-sizing: border-box}

.container {
display:flex;
flex-direction:column;
justify-content:center;
align-itmes:center;
height:100%;
width:100%;
z-index:-1;
}

.unos-box{
display:flex;
flex-direction:column;
justify-content:center;
align-itmes:center;
margin:auto;
background-color:white;
border-radius:7px;
width:35%;
}

input[type=text], input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 15px 0;
  display: inline-block;
  border: none;
  border-radius:5px;
  background: #f5f0c2;
}

hr {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}

.unosbtn {
  background-color:#817b4b;
  color: white;
  padding: 10px 16px;
  margin: 15px 0 5px 0;
  text-align:center;
  font-size:14px;
  border:none;
  border-radius:5px;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}
.cancelbtn {
	background-color:#817b4b;
  color: white;
  padding: 10px 16px;
  margin: 10px 0 5px 0;
  text-align:center;
  font-size:14px;
  border:none;
  border-radius:5px;
  cursor: pointer;
  width: 100%;
  opacity: 0.9;
}

/* Add padding to container elements */
#reg-form {
  padding: 16px;
}

input[type="date"]::-webkit-clear-button {
    display: none;
}

/* Removes the spin button */
input[type="date"]::-webkit-inner-spin-button { 
    display: none;
}

/* Always display the drop down caret */
input[type="date"]::-webkit-calendar-picker-indicator {
    color: black;
}

/* A few custom styles for date inputs */
input[type="date"] {
    appearance: none;
    -webkit-appearance: none;
    color: black;
    font-family: "Helvetica", arial, sans-serif;
    font-size: 18px;
    border:1px solid #ecf0f1;
    background:#f5f0c2;
    padding:5px;
    display: inline-block !important;
    visibility: visible !important;
}

input[type="date"], focus {
    color: #95a5a6;
    box-shadow: none;
    -webkit-box-shadow: none;
    -moz-box-shadow: none;
}



</style>
</head>
<body>
<div class="container">
	<div class="unos-box">
	<sf:form id="reg-form"  modelAttribute="user"  action="/Kursevi/auth/saveUser"  method="post">
			
				<sf:input  placeholder="Ime" type="text" path="ime"/>
				
				<sf:input placeholder="Prezime" type="text" path="prezime"/>
				
				<sf:input placeholder="Email" path="email"/>
				
				<sf:input placeholder="Password" type="password" path="password"/>
				
		        <sf:input placeholder="JMBG" type="text" path="jmbg"/>
				
				<sf:input type="date" path="datumRodjenja"/>
				
				<sf:input placeholder="Broj telefona" type="text" path="brojTel"/>	
				
				<button  type="submit"  class="unosbtn">Registruj se</button>
				 <button type="button" class="cancelbtn" onclick="location.href = 'http://localhost:8080/Kursevi/';">Odustani</button>	
				
		</sf:form>	
	</div>
	
</div>
<!-- Scripts -->
			
			<c:if test="${!empty poruka}">
			<script>
				function myFunction(){
 				 alert("Neuspela registracija. Pokusajte ponovo");
				}
			</script>
		</c:if> 

<script type="text/javascript">window.onload=myFunction;</script>
</body>
</html>