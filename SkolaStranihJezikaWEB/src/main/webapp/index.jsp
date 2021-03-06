<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Home page</title>
<link rel="stylesheet" type="text/css"
	href="${pageContext.request.contextPath}/styles/style.css">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<style>
.main {
	background-color: #EEE8AA;
	margin-top: 220px;
	padding-left: 2em;
	padding-right: 2em;
	display:block;
}

.aboutSfera {
	margin-top: 20px;
	font-family: Arial;
	font-size: 14px;
	font-style: normal;
	font-weight: normal;
	padding-top: 2em;
	padding-bottom: 2em;
	padding-left: 4em;
	padding-right: 4em;
	text-decoration: none;
	text-transform: none;
	color: black;
	border-radius: 20px;
	background-color: #BDB76B;
	text-decoration: none;
}

.aboutSfera h1 {
	color: black;
	text-align: center;
}

.btnUpisi {
	background-color: #605c30; /* Green */
	border: none;
	color: white;
	padding: 15px 32px;
	text-align: center;
	text-decoration: none;
	display:block;
	font-size: 16px;
	border-radius: 7px;
	width:100%;
	
}

.btnUpisi:hover {
opacity:0.5;
}

.ponuda1-sadrzaj {
	background-color: #d0be72;
	padding: 5px;
	height: 300px;
	position: relative;
	margin-top: 0;
	display:block;
}

.ponuda1 {
	float: left;
	width: 24%;
	display: inline-block;
	border-radius: 7px;
	
}

.button {
	
	display:block;
}

#kontakt {
margin-left:20px;
margin-right:20px;
background-color:#d0be72;
padding:20px;
font-size:17px;
border-radius:10px;
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
				<li><a href="#onama">O nama</a></li>
				<li><a href="#kontakt">Kontakt</a></li>
				<li><a href="/Kursevi/auth/loginUser">Prijava</a></li>

				<security:authorize access="hasRole('ADMIN')">
					<li><a href="/Kursevi/admin/UnosNovihPodataka.jsp">Unos
							novih podataka</a></li>
					<li><a href="/Kursevi/adminKontroler/unosProfesora">Novi
							zaposleni</a></li>
					<li><a href="/Kursevi/adminKontroler/SviProfesori.pdf">Svi
							zaposleni</a></li>
					<li><a href="/Kursevi/adminKontroler/sviJezici">Azuriranje
							kurseva</a></li>
					<li><a href="/Kursevi/adminKontroler/prikaziPonudu">Aktuelni
							kursevi</a></li>
				</security:authorize>

				<security:authorize access="hasRole('PROFESOR')">
					<li><a href="/Kursevi/profesorKontroler/kurseviProfesora">Moji
							kursevi</a></li>
				</security:authorize>

				<security:authorize access="hasRole('CLAN')">
					<li><a href="/Kursevi/clanKontroler/sviJezici">Cenovnik</a></li>
					<li><a href="/Kursevi/clanKontroler/prikaziAktuelneKurseve">Aktuelni
							kursevi</a></li>
				</security:authorize>
				<li><a href="/Kursevi/auth/logout">Odjava</a></li>
			</ul>
		</div>
	</div>
	<div class="main">
		<div class="slideshow">
			<div class="w3-content w3-display-container">
				<img class="mySlides"
					src="${pageContext.request.contextPath}/images/slika6.jpg "
					style="width: 100%"> <img class="mySlides"
					src="${pageContext.request.contextPath}/images/slika7.jpg "
					style="width: 100%"> <img class="mySlides"
					src="${pageContext.request.contextPath}/images/slika8.jpg "
					style="width: 100%">

				<button class="w3-button w3-black w3-display-left"
					onclick="plusDivs(-1)">&#10094;</button>
				<button class="w3-button w3-black w3-display-right"
					onclick="plusDivs(1)">&#10095;</button>
			</div>

			<script>
				var slideIndex = 1;
				showDivs(slideIndex);

				function plusDivs(n) {
					showDivs(slideIndex += n);
				}

				function showDivs(n) {
					var i;
					var x = document.getElementsByClassName("mySlides");
					if (n > x.length) {
						slideIndex = 1
					}
					if (n < 1) {
						slideIndex = x.length
					}
					for (i = 0; i < x.length; i++) {
						x[i].style.display = "none";
					}
					x[slideIndex - 1].style.display = "block";
				}
			</script>

		</div>
		<div  class="aboutSfera">
			<h1 id="onama">??kola stranih jezika Sfera</h1>
			<p  style="text-align: center">
				??kolu stranih jezika Sfera Centar osnovala je grupa stru??njaka i
				zaljubljenika u jezik sa vi??egodi??njim iskustvom u nastavi. Na?? tim
				??ine vrhunski predava??i, diplomirani profesori jezika koji vam uz
				poznavanje savremenih metoda u??enja pru??aju visokokvalitetnu nastavu
				stranog jezika.Profesor koji vodi va??u grupu ili individualnu
				nastavu uvek ??e biti na raspolaganju za sva va??a pitanja i uz
				njegovu pomo?? celokupan proces u??enja stranog jezika bi??e znatno
				olak??an.Moderne metode u??enja i jedinstvena atmosfera u svakoj grupi
				gde se posebno brinemo za svakog na??eg polaznika, samo su neki od
				razloga da se odlu??ite za ??kolu jezika Sfera Centar.Na?? zadatak je
				da Vam pru??imo vrhunsku nastavu,uz bogat nastavni program, koriste??i
				savremena izdanja stranih izdava??a uz propratni audio i vizuelni
				material,bazirajuci sve metode ucenja na komunikativnom pristupu. <br>
				<br>Nakon svakog odslusanog nivoa,polaznici polazu test,na
				osnovu kojeg sticu pravo na dobijanje sertifikata! <br> Na??
				uspeh je da ostvarimo dugoro??no poverenje i da sklopimo
				prijateljstva koja ??e trajati i kada ostvarite zeljene rezultate.
			</p>
		</div>

<div class="ponuda" style="margin-top:30px; display:block; padding-bottom:20px;">
		<div class="ponuda1" style="margin-right: 12px;">
				<div class="ponuda1-naslov"
					style="background-color: #605c30; height: 20%;">
					<h4 style="color: white; text-align: center;">Standardni(opsti)
						kursevi</h4>
					<div class="ponuda1-sadrzaj">
					<p style="text-align: center;">Konverzacijski kurs ima za cilj
						da polaznicima omogu??i da razvoj i pobolj??anje postoje??e ve??tine
						govora engleskog jezika i komunikativnih sposobnosti. Interaktivni
						pristup u??enja jezika podrazumeva aktivno u??e????e svakog polaznika
						kursa. Sadr??aji su zanimljivi i visoko primenjivi u svakodnevnoj
						komunikaciji. Cilj konverzacijskih kurseva engleskog jezika je
						aktiviranje prethodno ste??enog znanja.</p>
				</div>
				<div class="button">
					<a href="/Kursevi/auth/loginUser"><button type="submit"
							class="btnUpisi">Upisi kurs</button></a>
				</div>
			</div>

			</div>


			<div class="ponuda1" style="margin-right: 12px;">
				<div class="ponuda1-naslov"
					style="background-color: #605c30; height: 20%;">
					<h4 style="color: white; text-align: center;">Standardni(opsti)
						kursevi</h4>
					<div class="ponuda1-sadrzaj">
						<p style="text-align: center;">Ovaj kurs vam pruza mogu??nost
							da jezik savladate polako, temeljno uz redovno poha??anje i
							savremeni profesionalni pristup predavanjima. Specifi??nost
							standardnog kursa engleskog jezika je u samom sistemu rada,
							adekvatnoj literaturi, dobro pripremljenom sadr??aju nastave i
							prvenstveno profesionalno pripremljenim predavanjima</p>
					</div>
					<div class="button">
						<a href="/Kursevi/auth/loginUser"><button type="submit"
								class="btnUpisi">Upisi kurs</button></a>
					</div>

				</div>
			</div>

			<div class="ponuda1" style="margin-right: 12px;">
				<div class="ponuda1-naslov"
					style="background-color: #605c30; height: 20%;">
					<h4 style="color: white; text-align: center;">Poslovni kursevi</h4>
					<div class="ponuda1-sadrzaj">
						<p style="text-align: center;">Poslovni kurs unapre??uje Va??e
							ve??tine i oboga??uje razumevanje drugih kultura koje je danas
							neophodno za uspeh u poslovnom svetu. Pored toga, pisanje
							formalnih mejlova, poslovnih ponuda, telefoniranje,
							argumentativno izno??enje stavova, vo??enje sastanaka i izrada i
							dr??anje prezentacija su samo neke od ve??tina kojima ??ete u
							potpunosti ovladati poha??anjem kursa.</p>
						</div>
						<div class="button">
							<a href="/Kursevi/auth/loginUser"><button type="submit"
									class="btnUpisi">Upisi kurs</button></a>
						</div>

					
				</div>
			</div>

			<div class="ponuda1">
				<div class="ponuda1-naslov"
					style="background-color: #605c30; height: 25%;">
					<h4 style="color: white; text-align: center;">Intezivni
						kursevi</h4>
					<div class="ponuda1-sadrzaj">
						<p style="text-align: center;">Intenzivni kursevi su ubrzani
							mese??ni kursevi koji su namenjeni onima koji ??ele ??to br??e i
							efikasnije da savladaju jezik. Za kratko vreme ??ete ste??i ve??tine
							sporazumevanja, usvojiti gramati??ka pravila i pro??iriti fond re??i
							zahvaljuju??i najsavremenijim nastavnim metodama i specijalnom
							nastavnom planu i programu. </p>
						</div>
						<div class="button">
							<a href="/Kursevi/auth/loginUser"><button type="submit"
									class="btnUpisi">Upisi kurs</button></a>
						</div>

				</div>
			</div>


		</div>
		
	</div>
<div style="height:430px;"> </div>

<div id="kontakt">
<h3>Kontakt</h3>
	<p>Ako zelite da nas kontaktirate, imate dodatnih pitanja ili jednostavno imate potrebu da nam posaljete poruku, na pravom ste mestu.
	   Odgovaramo u najkracem roku.
	   <br>
	   <br>
	   Adresa: Gagarinova 20 Novi Sad
	   <br><br>
	   Tel: 0654432347
	   <br><br>
	   Email: sfera@gmail.com
	</p>
	

</div>

<div class="footer" style="background-color: #38444d; margin-bottom:0;">
	<p style="color:white;text-align:center; ">2022. godina, Srbija, Novi Sad</p>
</div>



	<!-- Scripts -->
	<c:if test="${!empty savedUpis}">
		<script>
			function myFunction() {
				alert("Uspesno ste se upisali na kurs");
			}
		</script>
	</c:if>
	
	<c:if test="${!empty profesorSaved}">
		<script>
			function myFunction2() {
				alert("Uspesno ste dodali zaposlenog");
			}
		</script>
	</c:if>
	

	<script type="text/javascript">
		window.onload = myFunction;
	</script>

		<script type="text/javascript">
		window.onload = myFunction2;
	</script>
	


</body>
</html>