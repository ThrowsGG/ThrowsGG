<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="vo.*"%>
<%@page import="gg.*"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../Nav.jsp"></jsp:include>

<!DOCTYPE html>
<html lang="ko">

<head>
<meta charset="utf-8">
<title>MultiShop - Online Shop Website Template</title>
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<meta content="Free HTML Templates" name="keywords">
<meta content="Free HTML Templates" name="description">

<!-- Favicon -->
<link href="img/favicon.ico" rel="icon">

<!-- Google Web Fonts -->
<link rel="preconnect" href="https://fonts.gstatic.com">
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">

<!-- Font Awesome -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">

<!-- Libraries Stylesheet -->
<link href="lib/animate/animate.min.css" rel="stylesheet">
<link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">

<!-- Customized Bootstrap Stylesheet -->
<link href="store/css/style_store.css" rel="stylesheet">
</head>
<style type="text/css">
.btn.btn-primary {
	color: #212529;
	background-color: #ffcb0d !important;
	border-color: #ffc800 !important;
}

.input-group>.form-control:not(:first-child), .input-group>.custom-select:not(:first-child)
	{
	position: relative !important;
	flex: 1 1 auto !important;
	width: 1% !important;
	min-width: 0 !important;
	margin-bottom: 0 !important;
}

.input-group>.form-control, .input-group>.form-control-plaintext,
	.input-group>.custom-select, .input-group>.custom-file {
	position: relative;
	flex: 1 1 auto;
	width: 1%;
	min-width: 0;
	margin-bottom: 0;
}

.mr-3, .mx-3 {
	margin-right: 1rem !important;
}
</style>
<body>

	<!-- Breadcrumb Start -->
	<div class="container-fluid">
		<div class="row px-xl-5">
			<div class="col-12">
				<nav class="breadcrumb bg-light mb-30">
					<a class="breadcrumb-item text-dark" href="#">Home</a> <a class="breadcrumb-item text-dark" href="#">Shop</a> <span class="breadcrumb-item active">Shopping Cart</span>
				</nav>
			</div>
		</div>
	</div>
	<!-- Breadcrumb End -->


	<!-- Cart Start -->
	<div class="container-fluid">
		<div class="row px-xl-5">
			<div class="col-lg-8 table-responsive mb-5">
				<table class="table table-light table-borderless table-hover text-center mb-0">
					<thead class="thead-dark">
						<tr>
							<th>Products</th>
							<th>Price</th>
							<th>Quantity</th>
							<th>Total</th>
							<th>Remove</th>
						</tr>
					</thead>
					<tbody class="align-middle">
						<c:forEach var="carVo" items="${carVoList}" varStatus="voIndex">
							<tr>
								<td class="align-middle" style="text-align: left;"><img src="${carVo.getFirstImg()}" alt="" style="width: 50px;">${carVo.getPname() }</td>
								<td class="align-middle">${carVo.getPrice()}</td>
								<td class="align-middle">
									<div class="input-group quantity mx-auto" style="width: 100px;">
										<div class="input-group-btn">
											<button class="btn btn-sm btn-primary btn-minus" onclick="MnOneCart(${carVo.getcART_ID()},${voIndex.index},${carVo.getPrice()})">
												<i class="fa fa-minus"></i>
											</button>
										</div>
										<input type="text" class="form-control form-control-sm bg-secondary border-0 text-center" value="${carVo.getAmount()}" style="
    height: auto !important;"> 
										<div class="input-group-btn">
											<button class="btn btn-sm btn-primary btn-plus" onclick="PsOneCart(${carVo.getcART_ID()},${voIndex.index},${carVo.getPrice()})">
												<i class="fa fa-plus"></i>
											</button>
										</div>
									</div>
								</td>
								<td class="align-middle" id="totalPrice${voIndex.index}">${carVo.getTotalPrice()}</td>
								<td class="align-middle"><button class="btn btn-sm btn-danger" id="delBtn${carVo.getcART_ID()}" onclick="delProductToCart(${carVo.getcART_ID()})">
										<i class="fa fa-times"></i>
									</button></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
			<div class="col-lg-4">
<!-- 								<form class="mb-30" action=""> -->
<!-- 									<div class="input-group"> -->
<!-- 										<input type="text" class="form-control border-0 p-4" placeholder="Coupon Code"> -->
<!-- 										<div class="input-group-append"> -->
<!-- 											<button class="btn btn-primary">Apply Coupon</button> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</form> -->
				<h5 class="section-title position-relative text-uppercase mb-3">
					<span class="bg-secondary pr-3">Cart Summary</span>
				</h5>
				<div class="bg-light p-30 mb-5">
					<div class="border-bottom pb-2">
						<div class="d-flex justify-content-between mb-3">
							<h6>Subtotal</h6>
							<h6 id="Subtotal">${totalMoney}원</h6>
						</div>
						<div class="d-flex justify-content-between">
							<h6 class="font-weight-medium">Shipping</h6>
							<h6 class="font-weight-medium">2500원</h6>
						</div>
					</div>
					<div class="pt-2">
						<div class="d-flex justify-content-between mt-2">
							<h5>Total</h5>
							<h5 id="total">${totalMoney + 2500}원</h5>
						</div>
						<button class="btn btn-block btn-primary font-weight-bold my-3 py-3" onclick=goCheckout()>Proceed To Checkout</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Cart End -->


	<jsp:include page="../lower.jsp"></jsp:include>


	<!-- Back to Top -->
	<a href="#" class="btn btn-primary back-to-top"><i class="fa fa-angle-double-up"></i></a>


	<!-- JavaScript Libraries -->
	<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.bundle.min.js"></script>
	<script src="lib/easing/easing.min.js"></script>
	<script src="lib/owlcarousel/owl.carousel.min.js"></script>

	<!-- Contact Javascript File -->
	<script src="mail/jqBootstrapValidation.min.js"></script>
	<script src="mail/contact.js"></script>

	<!-- Template Javascript -->
	<script src="js/main_store.js"></script>
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script type="text/javascript">
	function PsOneCart(card_id,index,price) {
		console.log('PsOneCart 실행')
		console.log('card_id : '+card_id)
		console.log('index : '+index)
		$.ajax({
			type : "POST",
			url : "PsOneCart.str",
			data : {
				card_id : card_id

			}
		}).done(function() {
			var Subtotal = (document.getElementById("Subtotal").innerText).split('원',1);
		 document.getElementById("totalPrice"+index).innerText = Number(document.getElementById("totalPrice"+index).innerText)+price;
			 document.getElementById("Subtotal").innerText = Number(Subtotal)+price;
			 document.getElementById("total").innerText = Number(Subtotal)+price+2500+"원";
			
	}).fail(function() {
		console.log('에러')
	});

	}
	function MnOneCart(card_id,index,price) {
		console.log('MnOneCart 실행')
		$.ajax({
			type : "POST",
			url : "MnOneCart.str",
			data : {
				card_id : card_id
			}
		}).done(function() {
			var Subtotal = (document.getElementById("Subtotal").innerText).split('원',1);
			 document.getElementById("totalPrice"+index).innerText = Number(document.getElementById("totalPrice"+index).innerText)-price;
			 document.getElementById("Subtotal").innerText = Number(Subtotal)-price;
			 document.getElementById("total").innerText =  Number(Subtotal)-price+2500+"원";
		}).fail(function() {
			console.log('에러')
		});
	}
	function selectCartDetail() {
		console.log('selectCartDetail 실행')
		$.ajax({
			type : "POST",
			url : "selectCartDetail.str",
			data : {
				userid : '${sessionScope.id}',
			}
		}).done(function(data) {
			 document.getElementById("cartIcon").innerHTML = data;
		}).fail(function(Response) {
			console.log('에러')
		});
	}
	function delProductToCart(cart_ID) {
		console.log('delProductToCart 실행')
		$.ajax({
			type : "POST",
			url : "delProductToCart.str",
			data : {
				cart_ID : cart_ID
			}
		}).done(function(data) {
			location.reload();
		}).fail(function(Response) {
			console.log('에러')
		});
	}
	function goCheckout(){
		location.href = "Tocheckout.str";
	}
	</script>
</body>

</html>