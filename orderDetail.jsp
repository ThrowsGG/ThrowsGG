<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="vo.*"%>
<%@page import="gg.*"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="Nav.jsp"></jsp:include>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<style>
body {
	background: #eee;
}

.card {
	box-shadow: 0 20px 27px 0 rgb(0 0 0/ 5%);
}

.card {
	position: relative;
	display: flex;
	flex-direction: column;
	min-width: 0;
	word-wrap: break-word;
	background-color: #fff;
	background-clip: border-box;
	border: 0 solid rgba(0, 0, 0, .125);
	border-radius: 1rem;
}

.text-reset { -
	-bs-text-opacity: 1;
	color: inherit !important;
}

a {
	color: #5465ff;
	text-decoration: none;
}
</style>
<body>

	<div class="container-fluid">

		<div class="container">
			<!-- Title -->
			<div class="d-flex justify-content-between align-items-center py-3">
				<h2 class="h5 mb-0">
					<a href="#" class="text-muted"></a>ORDER # ${salevo.getSaleID()}
				</h2>
			</div>

			<!-- Main content -->
			<div class="row">
				<div class="col-lg-8">
					<!-- Details -->
					<div class="card mb-4">
						<div class="card-body">
							<div class="mb-3 d-flex justify-content-between">
								<div>
									<span class="me-3">주문 날짜 : ${salevo.getOrderdate()}</span>
								</div>
								<div class="d-flex">
									<div class="dropdown">
										<button class="btn btn-link p-0 text-muted" type="button" data-bs-toggle="dropdown">
											<i class="bi bi-three-dots-vertical"></i>
										</button>
										<ul class="dropdown-menu dropdown-menu-end">
											<li><a class="dropdown-item" href="#"><i class="bi bi-pencil"></i> Edit</a></li>
											<li><a class="dropdown-item" href="#"><i class="bi bi-printer"></i> Print</a></li>
										</ul>
									</div>
								</div>
							</div>
							<table class="table table-borderless">
								<tbody>
									<c:forEach var="ItemVo" items="${ItemVOList}">
										<tr>
											<td>
												<div class="d-flex mb-2">
													<div class="flex-shrink-0">
														<img src="https://via.placeholder.com/280x280/87CEFA/000000" alt="" width="35" class="img-fluid">
													</div>
													<div class="flex-lg-grow-1 ms-3">
														<h6 class="small mb-0">
															<a href="#" class="text-reset">${ItemVo.getPname() }</a>
														</h6>
														<!-- 														<span class="small">Color: Black</span> -->
													</div>
												</div>
											</td>
											<td style="text-align: end;">수량 : ${ItemVo.getQuantity() }개</td>
											<td class="text-end" style="text-align: end;">${ItemVo.getPrice() }원</td>
										</tr>
									</c:forEach>
								</tbody>
								<tfoot>
									<tr>
										<td colspan="2">Subtotal</td>
										<td class="text-end" style="text-align: end;">${totalMoney }원</td>
									</tr>
									<tr>
										<td colspan="2">Shipping</td>
										<td class="text-end" style="text-align: end;">2500원</td>
									</tr>
									<tr class="fw-bold">
										<td colspan="2">TOTAL</td>
										<td class="text-end" style="text-align: end;">${totalMoney+2500 }원<td>
									</tr>
								</tfoot>
							</table>
						</div>
					</div>
					<!-- Payment -->
<!-- 					<div class="card mb-4"> -->
<!-- 						<div class="card-body"> -->
<!-- 							<div class="row"> -->
<!-- 								<div class="col-lg-6"> -->
<!-- 									<h3 class="h6">Payment Method</h3> -->
<!-- 									<p> -->
<!-- 										Visa -1234 <br> Total: $169,98 <span class="badge bg-success rounded-pill">PAID</span> -->
<!-- 									</p> -->
<!-- 								</div> -->
<!-- 								<div class="col-lg-6"> -->
<!-- 									<h3 class="h6">Billing address</h3> -->
<!-- 									<address> -->
<!-- 										<strong>John Doe</strong><br> 1355 Market St, Suite 900<br> San Francisco, CA 94103<br> <abbr title="Phone">P:</abbr> (123) 456-7890 -->
<!-- 									</address> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
				</div>
				<div class="col-lg-4">
					<!-- Customer Notes -->
					<div class="card mb-4">
						<!-- Shipping information -->
						<div class="card-body">
							<h3 class="h6">Shipping Information</h3>
							<hr>
							<h3 class="h6">Address</h3>
							<address>
								<strong>${salevo.getRecipient()}</strong><br>${salevo.getAddr()}<br><abbr title="Phone"></abbr>${salevo.getTel()}
							</address>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<jsp:include page="lower.jsp"></jsp:include>
</body>
</html>
