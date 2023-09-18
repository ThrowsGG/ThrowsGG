<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
<title>Insert title here</title>
 <link rel="stylesheet" href="css/style.css">
</head>
<style>
body{margin-top:20px;}
.mail-seccess {
    text-align: center;
	background: #fff;
	border-top: 1px solid #eee;
}
.mail-seccess .success-inner {
	display: inline-block;
}
.mail-seccess .success-inner h1 {
	font-size: 100px;
	text-shadow: 3px 5px 2px #3333;
	color: #006DFE;
	font-weight: 700;
}
.mail-seccess .success-inner h1 span {
	display: block;
	font-size: 25px;
	color: #333;
	font-weight: 600;
	text-shadow: none;
	margin-top: 20px;
}
.mail-seccess .success-inner p {
	padding: 20px 15px;
}
.mail-seccess .success-inner .btn{
	color:#fff;
}
</style>
<body>
<jsp:include page="Nav.jsp"></jsp:include>

<section class="mail-seccess section">
	<div class="container">
		<div class="row">
			<div class="col-lg-6 offset-lg-3 col-12">
				<!-- Error Inner -->
				<div class="success-inner">
					<h1><i class="fa fa-envelope"></i><span>We Sent Your temporary password Successfully!</span></h1>
					<p> 귀하의 이메일로 임시비밀번호를 전송 완료하였습니다.</p>
					<a href="join.jsp" class="btn btn-primary btn-lg">로그인하러 가기</a>
				</div>
				<!--/ End Error Inner -->
			</div>
		</div>
	</div>
</section>
</body>
</html>
