<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>ThrowsGG</title>
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="css/animate.css">
<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">
<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<link rel="stylesheet" href="css/jquery.timepicker.css">
<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/style.css">
</head>
<body>
	<%
	String name = (String) session.getAttribute("name");
	%>
	<div class="wrap">
		<div class="container">
			<div class="row">
				<div class="col-md-6 d-flex align-items-center">
					<p class="mb-0 phone pl-md-2">
						<a href="#" class="mr-2"><span class="fa fa-phone mr-1"></span>010-5492-2921</a> <a href="#"><span class="fa fa-paper-plane mr-1"></span> hyunatmp@gmail.com</a>
					</p>
				</div>
				<%
				if (name == null) {
				%>
				<div class="col-md-6 d-flex justify-content-md-end">
					<div class="social-media">
						<p class="mb-0 d-flex">
							<a href="join.jsp" class="nav-link" style="color: white; width: auto ;" onclick="NavIndexRefresh()">로그인</a>

						</p>
					</div>
				</div>
				<%
				} else {
				%>
				<div class="col-md-6 d-flex justify-content-md-end">

					<a class="nav-link" style="color: white;">
						<%
						out.println(name);
						%>님
					</a> <a href="userinfo.jsp" class="nav-link" style="color: white;">마이페이지</a> <a href="logout.jsp" class="nav-link" style="color: white;">Log Out</a>
				</div>
				<%
				}
				%>
			</div>
		</div>
	</div>

	<nav class="navbar navbar-expand-lg navbar-dark ftco_navbar bg-dark ftco-navbar-light" id="ftco-navbar" style="margin-bottom: 0px;">
		<div class="container">
			<a class="navbar-brand" href="index.jsp" onclick="NavIndex(1)"><span class="flaticon-pawprint-1 mr-2"></span>ThrowsGG</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#ftco-nav" aria-controls="ftco-nav" aria-expanded="false" aria-label="Toggle navigation">
				<span class="fa fa-bars"></span> Menu
			</button>
			<div class="collapse navbar-collapse" id="ftco-nav">
				<ul class="navbar-nav ml-auto" style="margin: auto;">
					<li class="nav-item" id="navCategoli01"><a href="index.jsp" class="nav-link" onclick="NavIndex(1);">Home</a></li>
					<li class="nav-item" id="navCategoli02"><a href="mYTest.jsp" class="nav-link" onclick="NavIndex(2);">Information</a></li>
					<li class="nav-item" id="navCategoli03"><a href="servicePage.jsp" class="nav-link" onclick="NavIndex(3);">Services</a></li>
					<li class="nav-item" id="navCategoli04"><a href="blog.jsp?num=1" class="nav-link" onclick="NavIndex(4);">Notice</a></li>
					<li class="nav-item" id="navCategoli05"><a href="BoardListAction.do?pageNum=1" class="nav-link" onclick="NavIndex(5);">lost & find</a></li>
					<li class="nav-item" id="navCategoli06"><a href="shop.str" class="nav-link" onclick="NavIndex(6);">store</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<script type="text/javascript">
	function NavIndex(NaIndex) {
		sessionStorage.setItem("NaIndex", NaIndex );
	}
	function NavIndexRefresh(){//NAV 인덱스 초기화
		sessionStorage.setItem("NaIndex", 0 );
	}
	window.onload = function() {//창이 열릴떄마다 세션에서 현재 navindex값을 가져옴
		document.getElementById('navCategoli0' + sessionStorage.getItem("NaIndex")).className = 'nav-item active';
		console.log('Navindex'+sessionStorage.getItem("NaIndex"))
	}

	</script>
</body>
</html>