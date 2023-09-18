<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/style.css">
</head>
<style>
body {
	margin-top: 20px;
}

.form-control:not(textarea) {
	height: 44px;
}

.form-control {
	padding: 0 18px 3px;
	border: 1px solid #dbe2e8;
	border-radius: 22px;
	background-color: #fff;
	color: #606975;
	font-family: "Maven Pro", Helvetica, Arial, sans-serif;
	font-size: 14px;
	-webkit-appearance: none;
	-moz-appearance: none;
	appearance: none;
}

.form-group label {
	margin-bottom: 8px;
	padding-left: 18px;
	font-size: 13px;
	font-weight: 500;
	cursor: pointer;
}

.form-text {
	padding-left: 18px;
}

.text-muted {
	color: #9da9b9 !important;
}


</style>
<script>
document.getElementById('alert-danger').style.display = 'none';
</script>
<!--    <script type="text/javascript" -->
<!--       src="https://mdbgo.io/mikolaj-smolenski/mdb5-demo-pro/dev/js/new-prism.js"></script> -->
<!--    <script type="text/javascript" -->
<!--       src="https://mdbgo.io/mikolaj-smolenski/mdb5-demo-pro/dev/js/dist/mdbsnippet.min.js"></script> -->
   <!-- MDB -->
<!--    <script type="text/javascript" src="js/mdb.min.js"></script> -->
<!--    <!-- Custom scripts --> -->
<!--    <script type="text/javascript"></script> -->

   <script src="http://code.jquery.com/jquery-latest.js"></script>
   <script src="js/jquery.min.js"></script>
   <script src="js/jquery-migrate-3.0.1.min.js"></script>
<!--    <script src="js/popper.min.js"></script> -->
<!--    <script src="js/bootstrap.min.js"></script> -->
   <script src="js/jquery.easing.1.3.js"></script>
   <script src="js/jquery.waypoints.min.js"></script>
   <script src="js/jquery.stellar.min.js"></script>
   <script src="js/jquery.animateNumber.min.js"></script>
<!--    <script src="js/bootstrap-datepicker.js"></script> -->
   <script src="js/jquery.timepicker.min.js"></script>
<!--    <script src="js/owl.carousel.min.js"></script> -->
   <script src="js/jquery.magnific-popup.min.js"></script>
<!--    <script src="js/scrollax.min.js"></script> -->
<!--    <script -->
<!--       src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script> -->
<!--    <script src="js/google-map.js"></script> -->
<!--    <script src="js/main.js"></script> -->
<script>
	function sendMail() {
		var loginid = document.getElementById('loginid');
		var loginEmail = document.getElementById('emailpass');
		$.ajax({
			type : "post",
			url : "checkMail.lg",
			dataType : "text",
			data : {
				id : loginid.value,
				email : loginEmail.value,
			}
		}).done(function(data) {
			if (data == "true") {
// 				window.location.href = "./sendMail.lg";
		var loginid = document.getElementById('loginid');
		var loginEmail = document.getElementById('emailpass');
			$.ajax({
					type : "post",
					url : "sendMail.lg",
					dataType : "text",
					data : {
						id : loginid.value,
						email : loginEmail.value,
					}
				}).done(function(){
				window.location.href = "./afterSendPw.jsp?";
				})
		
			} else {
				document.getElementById('alert-danger').style.display = '';
			}
		}).error(function(data) {
			alert("mail error");
		})
	}
</script>



<body>
<jsp:include page="Nav.jsp"></jsp:include>

	<div class="container padding-bottom-3x mb-2">
		<div class="row justify-content-center">
			<div class="col-lg-8 col-md-10">
				<h2>Forgot your password?</h2>
				<p>Change your password in three easy steps. This helps to keep your new password secure.</p>
				<ol class="list-unstyled">
					<li><span class="text-primary text-medium">1. </span>Fill in your email address below.</li>
					<li><span class="text-primary text-medium">2. </span>We'll email you a temporary code.</li>
					<li><span class="text-primary text-medium">3. </span>Use the code to change your password on our secure website.</li>
				</ol>
<!-- 				<form class="card mt-4"  > -->
				<div class="card mt-4">
					<div class="card-body">
						<div class="form-group">
							<label for="email-for-pass">Enter your email address</label> <input class="form-control" type="text" name="emailpass" id="emailpass" required=""><small class="form-text text-muted">Type in the email address you used when you registered. Then we'll email a code to this address.</small>
							<label for="loginid">Enter your ID</label> <input class="form-control" type="text" name="loginid" id="loginid" required="">
						</div>
						<div class="alert alert-danger" id="alert-danger" style="display:none">이메일 또는 ID가 존재하지 않습니다</div>
					</div>
					<div class="card-footer">
						<button class="btn btn-primary"  onclick="sendMail();">Get New Password</button></div>
				</div>
<!-- 				</form> -->
			</div>
		</div>
	</div>
</body>
</html>
