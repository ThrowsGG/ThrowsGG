<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="vo.*"%>
<%@page import="gg.*"%>
<%@page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../Nav.jsp"></jsp:include>
<%
ArrayList productList = (ArrayList) request.getAttribute("productList");
int total_record = ((Integer) request.getAttribute("total_record")).intValue();
int pageNum = ((Integer) request.getAttribute("pageNum")).intValue();
int total_page = ((Integer) request.getAttribute("total_page")).intValue();

String[] check=(String[]) request.getAttribute("checkArray");

int productCnt1= ((Integer) request.getAttribute("productCnt1")).intValue();
int productCnt2= ((Integer) request.getAttribute("productCnt2")).intValue();
int productCnt3= ((Integer) request.getAttribute("productCnt3")).intValue();
int productCnt4= ((Integer) request.getAttribute("productCnt4")).intValue();

int pageSize = 6; // 한 페이지에 출력할 레코드 수
int pageBlock = 2; // 한 페이지에 보여줄 시작 및 끝 번호(예 : 1, 2, 3 ~ 10 / 11, 12, 13 ~ 20)
int pageCount = 0;
int startPage = 0;
int endPage = 0;

if (total_record > 0) {
	pageCount = total_record / pageSize + (total_record % pageSize == 0 ? 0 : 1);
	// 한 페이지에 보여줄 페이지 블럭(링크) 수
	startPage = ((pageNum - 1) / pageBlock) * pageBlock + 1;
	endPage = startPage + pageBlock - 1;
	if (endPage > pageCount) {
		endPage = pageCount;
	}
}
// System.out.println("startPage : " + startPage);
// System.out.println("endPage : " + endPage);
// System.out.println("pageCount : " + pageCount);
%>
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
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<style type="text/css">
#addCart {
	color: white;
	background: #ff8d00;
}
</style>
</head>
<script type="text/javascript">


function priceFilter(){
	var checkboxValues = [];	
		document.getElementById('filtering').submit();		
	}
function cateFilter(){
	var checkboxValues = [];	
		document.getElementById('cateFiltering').submit();		
	}

</script>
<body>
	<!-- Breadcrumb Start -->
	<div class="container-fluid">
		<div class="row px-xl-5">
			<div class="col-12">
				<nav class="breadcrumb bg-light mb-30">
<!-- 					<a class="breadcrumb-item text-dark" href="#">Home</a> <a class="breadcrumb-item text-dark" href="#">Shop</a> <span class="breadcrumb-item active">Shop List</span> -->
					<div class="col-lg-4 col-6 text-left">
						<form action="searchProduct.str" method="post">
							<div class="input-group">
								<input type="text" name="text" class="form-control" placeholder="Search for products">
								<div class="input-group-append">
									<span class="input-group-text bg-transparent text-primary"><button type="submit" style="background-color:white;border:none;"><i style="color:gold" class="fa fa-search"></i></button>
									</span>
								</div>
							</div>
						</form>
					</div>
					<div class="navbar-nav ml-auto py-0 d-none d-lg-block">
						<a href="" class="btn px-0"> <i class="fas fa-heart text-primary"></i> <span class="badge text-secondary border border-secondary rounded-circle" style="padding-bottom: 2px; color: #ffc107 !important;">0</span>
						</a> <a href="DetailViewCart.str?userid=${sessionScope.id}" class="btn px-0 ml-3"> <i class="fas fa-shopping-cart text-primary"></i> <span class="badge text-secondary border border-secondary rounded-circle" style="padding-bottom: 2px; color: #ffc107 !important;" id="cartIcon">0</span>
						</a>
					</div>
				</nav>
			</div>
		</div>
	</div>
	<!-- Breadcrumb End -->
	<!-- Shop Start -->
	<div class="container-fluid">
		<div class="row px-xl-5">
			<!-- Shop Sidebar Start -->
			<div class="col-lg-3 col-md-4">
				<!-- Price Start -->
				<h5 class="section-title position-relative text-uppercase mb-3">
					<span class="bg-secondary pr-3">Price</span>
				</h5>
				<div class="bg-light p-4 mb-30">
					<form id="filtering" action="priceFiltering.str">
<!-- 						<div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3"> -->
<!-- 							<input type="checkbox" class="custom-control-input" name="price" value="all" checked id="price-all"  onclick="priceFilter()"> <label class="custom-control-label" for="price-all">All Price</label> <span class="badge border font-weight-normal">1000</span> -->
<!-- 						</div> -->
						<div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
							<input type="checkbox" class="custom-control-input" name="price"  id="price-1" value="5000" onclick="priceFilter()" > <label class="custom-control-label" for="price-1">0₩ - 5000₩</label> <span class="badge border font-weight-normal"><%=productCnt1%></span>
						</div>
						<div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
							<input type="checkbox" class="custom-control-input" name="price" id="price-2" value="10000" onclick="priceFilter()"> <label class="custom-control-label" for="price-2">5000₩ - 10000₩</label> <span class="badge border font-weight-normal"><%=productCnt2%></span>
						</div>
						<div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
							<input type="checkbox" class="custom-control-input" name="price" id="price-3" value="50000" onclick="priceFilter()"> <label class="custom-control-label" for="price-3">10000₩ - 50000₩</label> <span class="badge border font-weight-normal"><%=productCnt3%></span>
						</div>
						<div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
							<input type="checkbox" class="custom-control-input" name="price" id="price-4" value="noLimit" onclick="priceFilter()"> <label class="custom-control-label" for="price-4">50000₩ - 제한없음</label> <span class="badge border font-weight-normal"><%=productCnt4%></span>
						</div>						
					</form>
				</div>
				<!-- Price End -->

				<!-- Size Start -->
				<h5 class="section-title position-relative text-uppercase mb-3">
					<span class="bg-secondary pr-3">Category</span>
				</h5>
				<div class="bg-light p-4 mb-30">
					<form id="cateFiltering" action="categoryFiltering.str">
						<div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
							<input type="checkbox" class="custom-control-input" name="cate" id="cate-1" value="food" onclick="cateFilter()" > <label class="custom-control-label" for="cate-1">사료/간식</label>
						</div>
						<div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
							<input type="checkbox" class="custom-control-input" name="cate" id="cate-2" value="health" onclick="cateFilter()" > <label class="custom-control-label" for="cate-2">건강</label>
						</div>
						<div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
							<input type="checkbox" class="custom-control-input" name="cate" id="cate-3" value="hygiene" onclick="cateFilter()" > <label class="custom-control-label" for="cate-3">위생</label>
						</div>
						<div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
							<input type="checkbox" class="custom-control-input" name="cate" id="cate-4"  value="salon" onclick="cateFilter()" > <label class="custom-control-label" for="cate-4">미용</label>
						</div>
					</form>
				</div>
				<!-- Size End -->
			</div>
			<!-- Shop Sidebar End -->


			<!-- Shop Product Start -->
			<div id="testing" class="col-lg-9 col-md-8">
				<div class="row pb-3" id="">
					<div class="col-12 pb-1">

					</div>
					
					<c:forEach var="plist" items="${productList}" varStatus="status">
					
						<div class="col-lg-4 col-md-6 col-sm-6 pb-1">
							<div class="product-item bg-light mb-4">
								<div class="product-img position-relative overflow-hidden">
									<img class="img-fluid w-100" src="${plist.getFirstImg()}" alt="">
									<div class="product-action">
										<c:choose>
											<c:when test="${checkCartList ne null and checkCartList.get(status.index)}">
												<a class="btn btn-outline-dark btn-square" onclick="DropCart('${plist.getProductID()}')" style="color: white; background: #ff8d00;" id="cartNum${plist.getProductID()}"> <i class="fa fa-shopping-cart"></i></a>
											</c:when>
											<c:otherwise>
												<a class="btn btn-outline-dark btn-square" onclick="AddCart('${plist.getProductID()}')" id="cartNum${plist.getProductID()}"> <i class="fa fa-shopping-cart"></i></a>
											</c:otherwise>
										</c:choose>

										<a class="btn btn-outline-dark btn-square" href=""> <i class="fa fa-sync-alt"></i></a> <a class="btn btn-outline-dark btn-square" href="shopDetail.str?productID=${plist.getProductID()}"> <i class="fa fa-search"></i></a>
									</div>
								</div>
								<div class="text-center py-4">
									<a class="h6 text-decoration-none text-truncate" href="shopDetail.str?productID=${plist.getProductID()}">${plist.getPname() }</a>
									<div class="d-flex align-items-center justify-content-center mt-2">
										<h5>${plist.getPrice()}원</h5>
										<!-- 										<h6 class="text-muted ml-2"> -->
										<!-- 											<del>$123.00</del> -->
										<!-- 										</h6> -->
									</div>
									<!-- 									<div class="d-flex align-items-center justify-content-center mb-1"> -->
									<!-- 										<small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small>(99)</small> -->
									<!-- 									</div> -->
								</div>
							</div>
						</div>
					</c:forEach>
					<div class="col-12">
						<nav>
							<ul class="pagination justify-content-center">
								<c:set var="startPage" value="<%=startPage%>" />
								<c:set var="endPage" value="<%=endPage%>" />
								<c:set var="pageCount" value="<%=pageCount%>" />
								<c:set var="pageBlock" value="<%=pageBlock%>" />
								<c:if test="${startPage > pageBlock }">
									<li class="page-item "><a class="page-link" href="shop.str?pageNum=${startPage - pageBlock}">Previous</a></li>
								</c:if>
								<c:forEach var="i" begin="${startPage }" end="${endPage }">
									<c:choose>
										<c:when test="${i == pageNum }">
											<li class="page-item active"><a class="page-link" href="#">${i}</a></li>
										</c:when>
										<c:otherwise>
											<li class="page-item "><a class="page-link" href="shop.str?pageNum=${i}">${i}</a></li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:if test="${endPage < pageCount }">
									<li class="page-item"><a class="page-link" href="shop.str?pageNum=${startPage + pageBlock}">Next</a></li>
								</c:if>

							</ul>
						</nav>
					</div>
					
					</div>
					
				</div>
			</div>
			<!-- Shop Product End -->
		</div>
	<jsp:include page="../lower.jsp"></jsp:include>
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
		$(document).ready(function() {
			totalCountCart(); 
			<%for(int i=0;i <check.length ;i++){%>
			$("input[name=price][value='<%=check[i]%>']").attr("checked", true);
			
		<%}%>
		
		<%for(int i=0;i <check.length ;i++){%>
		$("input[name=cate][value='<%=check[i]%>']").attr("checked", true);
		
	<%}%>			
		});
		function AddCart(productid) {
			console.log('AddCart 실행')
			var amount = '1';
			$.ajax({
				type : "POST",
				url : "addCart.str",
				data : {
					userid : '${sessionScope.id}',
					product_id : productid,
					amount : amount

				}
			}).done(
					function() {
						totalCountCart()
						$('#cartNum' + productid).removeAttr("onclick"); // 온클릭 속성을 삭제
						$('#cartNum' + productid).attr('onclick',
								"DropCart('" + productid + "')")
						$('#cartNum' + productid).attr('style',
								" color: white;background: #ff8d00;")
					}).fail(function() {
				console.log('에러')
			});

		}
		function DropCart(productid) {
			console.log('DropCart 실행')
			$.ajax({
				type : "POST",
				url : "dropCart.str",
				data : {
					userid : '${sessionScope.id}',
					product_id : productid,
				}
			}).done(
					function() {
						totalCountCart()
						$('#cartNum' + productid).removeAttr("style"); // 온클릭 속성을 삭제
						$('#cartNum' + productid).removeAttr("onclick"); // 온클릭 속성을 삭제
						$('#cartNum' + productid).attr('onclick',
								"AddCart('" + productid + "')")
					}).fail(function() {
				console.log('에러')
			});
		}

		function totalCountCart() {
			console.log('totalCountCart 실행')
			$.ajax({
				type : "POST",
				url : "totalCountCart.str",
				data : {
					userid : '${sessionScope.id}',
				}
			}).done(function(data) {
				document.getElementById("cartIcon").innerHTML = data;
			}).fail(function(Response) {
				console.log('에러')
			});
		}
		function nonUserid() {
			alert('로그인이 필요한 서비스입니다');
			location.href = 'join.jsp'
		}
	</script>
</body>

</html>