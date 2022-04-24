<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
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

.login-box{
display:flex;
flex-direction:column;
justify-content:center;
align-itmes:center;
margin:auto;
background-color:white;
border-radius:8px;
width:30%;

}
 

/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 5px 0 15px 0;
  display: inline-block;
  border: none;
  border-radius:5px;
  background: #f5f0c2;
}

<%--input[type=text]:focus, input[type=password]:focus {
  background-color: #f5f0c2;
  outline: none;
}
--%>

hr {
  border: 1px solid #fbf7d6;
  margin-bottom: 25px;
}

/* Set a style for all buttons */
.signupbtn {
  background-color:#BDB76B;
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
margin:1px 0 5px 0;
padding: 10px 16px;
background-color:#BDB76B ;
color:white;
border:none;
border-radius:5px;
font-size:14px;
text-align:center;
width:100%;
cursor: pointer;
opacity: 0.9;
}

button:hover {
  opacity:1;
}

/* Add padding to container elements */
.login-form {
  padding: 16px;
}


}
</style>
</head>
<body>
<div class="container">
	<div class="login-box">

			<c:url var="loginUrl" value="/login" />
			<c:if test="${not empty param.error}">
				<div class="alert alert-danger">
					<p>Pogresni podaci.</p>
				</div>
			</c:if>
			
			<form action="${loginUrl}" method="post">
				<div class="login-form">
						<input type="text" name="email" 
							placeholder="Unesite email" required>
					
						 <input type="password" name="password" id="prvi"
							placeholder="Unesite password" required>
			
						<label><input type="checkbox" name="remember-me" /> Zapamti me</label>
						
						<input type="hidden" name="${_csrf.parameterName}"
							value="${_csrf.token}" />
							
     					 <button type="submit" class="signupbtn">Prijavi se</button>	
     					  <button type="button" class="cancelbtn" onclick="location.href = 'http://localhost:8080/Kursevi/';">Odustani</button>	
 
					<p style="text-align:center margin-top:0;"> Nemate nalog? <a href="/Kursevi/auth/registerUser">Registrujte se</a></p>
					</div>
			 </form>
		</div>
		
	</div>

</body>
</html>