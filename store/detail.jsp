<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="vo.*"%>
<%@page import="gg.*"%>
<%@page import="requestinfo.*"%>
<%@page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:include page="../Nav.jsp"></jsp:include>
<%
String idnum = request.getParameter("productID");
System.out.println(idnum);
// int pageNum=1;
RequestInfo ri = new RequestInfo();
Connection con;
Class.forName("com.mysql.cj.jdbc.Driver");
System.out.println("DRIVER LOADING.....");
con = DriverManager.getConnection("jdbc:mysql://localhost:3306/throwsgg?user=root&password=1234");
System.out.println("Connection success!");
PreparedStatement pstmt = null;
ResultSet rs = null;

List<reviewVO> list = new ArrayList<reviewVO>();
String SQL = "SELECT userid, nickname, score, comment, wdate, item, profile, num FROM review AS r, member AS m WHERE r.userid = m.id and r.item = '"
		+ idnum + "' order by r.wdate desc;";
System.out.println(SQL);
pstmt = con.prepareStatement(SQL);
rs = pstmt.executeQuery();
int count = 0;
int index[] = new int[3];
String phoneindex[] = new String[3];
float total_score = 0;
while (rs.next()) { //데이터 객체 리스트에 넣기
	reviewVO data = new reviewVO();
	data.setId(rs.getString(1));
	data.setNickname(rs.getString(2));
	data.setScore(rs.getFloat(3));
	data.setComment(rs.getString(4));
	data.setDate(rs.getDate(5));
	data.setProfile(rs.getString(7));
	data.setNum(rs.getInt(8));
	list.add(data);
	count++;
	total_score += rs.getFloat(3);
}
String pageStrNum = request.getParameter("pageNum");
if (pageStrNum == null) { // 클릭한게 없으면 1번 페이지
	pageStrNum = "1";
}
int pageNum = Integer.parseInt(pageStrNum); //현재 페이지 번호
int pageSize = 5; // 5 페이지씩 선택할수 있음
int pageItem = 3; // 1페이지당 3개씩 보여주기
System.out.println("star : " + total_score / count);
//                         }
%>
<c:set var="vo" value="${productVO}" />
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
/* 별점 나오게 하기  */
.blind {
	position: absolute;
	overflow: hidden;
	margin: -1px;
	padding: 0;
	width: 1px;
	height: 1px;
	border: none;
	clip: rect(0, 0, 0, 0);
}

.startRadio {
	display: inline-block;
	overflow: hidden;
	height: 20px;
}

.startRadio:after {
	content: "";
	display: block;
	position: relative;
	z-index: 10;
	height: 20px;
	background:
		url("data:image/png;base64,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")
		repeat-x 0 0;
	background-size: contain;
	pointer-events: none;
}

.startRadio__box {
	position: relative;
	z-index: 1;
	float: left;
	width: 10px;
	height: 20px;
	cursor: pointer;
}

.startRadio__box input {
	opacity: 0 !important;
	height: 0 !important;
	width: 0 !important;
	position: absolute !important;
}

.startRadio__box input:checked+.startRadio__img {
	background-color: #0084ff;
}

.startRadio__img {
	display: block;
	position: absolute;
	right: 0;
	width: 500px;
	height: 40px;
	pointer-events: none;
}
</style>
<body>
	<!-- Breadcrumb Start -->
	<div class="container-fluid">
		<div class="row px-xl-5">
			<div class="col-12">
				<nav class="breadcrumb bg-light mb-30">
					<a class="breadcrumb-item text-dark" href="#">Home</a> <a class="breadcrumb-item text-dark" href="#">Shop</a> <span class="breadcrumb-item active">Shop Detail</span>
					<div class="navbar-nav ml-auto py-0 d-none d-lg-block">
						<a href="" class="btn px-0"> <i class="fas fa-heart text-primary"> </i> <span class="badge text-secondary border border-secondary rounded-circle" style="padding-bottom: 2px; color: #ffc107 !important;">0</span>
						</a> <a href="DetailViewCart.str?userid=${sessionScope.id}" class="btn px-0 ml-3"> <i class="fas fa-shopping-cart text-primary"></i> <span class="badge text-secondary border border-secondary rounded-circle" style="padding-bottom: 2px; color: #ffc107 !important;" id="cartIcon">0</span>
						</a>
					</div>
				</nav>
			</div>
		</div>
	</div>
	<!-- Breadcrumb End -->


	<!-- Shop Detail Start -->
	<div class="container-fluid pb-5">
		<div class="row px-xl-5">
			<div class="col-lg-5 mb-30">
				<div id="product-carousel" class="carousel slide" data-ride="carousel">
					<div class="carousel-inner bg-light">
						<div class="carousel-item active">
							<img class="w-100 h-100" src="${vo.getFirstImg()}" alt="Image">
						</div>
						<div class="carousel-item">
							<img class="w-100 h-100" src="${vo.getSeconImg()}" alt="Image">
						</div>
						<div class="carousel-item">
							<img class="w-100 h-100" src="${vo.getThirldImg()}" alt="Image">
						</div>
						<!-- 						<div class="carousel-item"> -->
						<!-- 							<img class="w-100 h-100" src="img/product-4.jpg" alt="Image"> -->
						<!-- 						</div> -->
					</div>
					<a class="carousel-control-prev" href="#product-carousel" data-slide="prev"> <i class="fa fa-2x fa-angle-left text-dark"></i>
					</a> <a class="carousel-control-next" href="#product-carousel" data-slide="next"> <i class="fa fa-2x fa-angle-right text-dark"></i>
					</a>
				</div>
			</div>

			<div class="col-lg-7 h-auto mb-30">
				<div class="h-100 bg-light p-30">
					<h3>
						<c:out value="${vo.getPname()}"></c:out>
					</h3>
					<div class="d-flex mb-3">
						<div class="text-primary mr-2">
							<%
							if (count == 0) {
							%>
							<i class="far fa-star"></i> <i class="far fa-star"></i> <i class="far fa-star"></i> <i class="far fa-star"></i> <i class="far fa-star"></i>
							<%
							} else if (total_score / count <= 1.0) {
							%>
							<i class="fas fa-star-half-alt"></i> <i class="far fa-star"></i> <i class="far fa-star"></i> <i class="far fa-star"></i> <i class="far fa-star"></i>
							<%
							} else if (total_score / count < 1.5) {
							%>
							<i class="fas fa-star"></i> <i class="far fa-star"></i> <i class="far fa-star"></i> <i class="far fa-star"></i> <i class="far fa-star"></i>
							<%
							} else if (total_score / count < 2.0) {
							%>
							<i class="fas fa-star"></i> <i class="fas fa-star-half-alt"></i> <i class="far fa-star"></i> <i class="far fa-star"></i> <i class="far fa-star"></i>
							<%
							} else if (total_score / count < 2.5) {
							%>
							<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i class="far fa-star"></i> <i class="far fa-star"></i> <i class="far fa-star"></i>
							<%
							} else if (total_score / count < 3.0) {
							%>
							<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i class="fas fa-star-half-alt"></i> <i class="far fa-star"></i> <i class="far fa-star"></i>
							<%
							} else if (total_score / count < 3.5) {
							%>
							<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i class="fas fa-star"></i> <i class="far fa-star"></i> <i class="far fa-star"></i>
							<%
							} else if (total_score / count < 4.0) {
							%>
							<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i class="fas fa-star"></i> <i class="fas fa-star-half-alt"></i> <i class="far fa-star"></i>
							<%
							} else if (total_score / count < 4.5) {
							%>
							<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i class="fas fa-star"></i> <i class="fas fa-star"></i> <i class="far fa-star"></i>
							<%
							} else if (total_score / count < 5.0) {
							%>
							<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i class="fas fa-star"></i> <i class="fas fa-star"></i> <i class="fas fa-star-half-alt"></i>
							<%
							} else if (total_score / count == 5.0) {
							%>
							<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i class="fas fa-star"></i> <i class="fas fa-star"></i> <i class="fas fa-star"></i>
							<%
							}
							%>
						</div>
						<small class="pt-1">(<%=count%> Reviews)
						</small>
					</div>
					<h3 class="font-weight-semi-bold mb-4">
						<c:out value="${vo.getPrice()}"></c:out>
						원
					</h3>
					<div>
						<h4>설명</h4>
						<p>${vo.getDescription() }</p>
						<strong style="line-height: 20.79px;">권장급여방법</strong>

						<p>
							몸무게 5kg미만 : 하루에 2개 ~ 4개 급여<br> 몸무게 ~11kg : 하루에 4개 ~ 8개 급여<br> 몸무게 ~23kg : 하루에 8개 ~ 12개 급여<br> 몸무게 ~40kg이상 : 12개 ~ 20개 급여<br> - 급여량은 반려견 종, 연령, 생활환경에 따라 차이가 날 수 있습니다.
						</p>
					</div>
					<div class="d-flex align-items-center mb-4 pt-2">
						<div class="input-group quantity mr-3" style="width: 130px;">
							<div class="input-group-btn">
								<button class="btn btn-primary btn-minus">
									<i class="fa fa-minus"></i>
								</button>
							</div>
							<input type="text" class="form-control bg-secondary border-0 text-center" id="amount" value="1" style="height: auto !important;">
							<div class="input-group-btn">
								<button class="btn btn-primary btn-plus">
									<i class="fa fa-plus"></i>
								</button>
							</div>
						</div>
						<c:choose>
							<c:when test="${sessionScope.id != null}">
								<c:choose>
									<c:when test="${checkCart}">
										<button class="btn btn-primary px-3" id="CartBtn" onclick="DropCart()" style="border-color: #6c757d !important; background-color: #6c757d !important;">
											<i class="fa fa-shopping-cart mr-1"></i> Drop To Cart
										</button>
									</c:when>
									<c:otherwise>
										<button class="btn btn-primary px-3" id="CartBtn" onclick="AddCart()">
											<i class="fa fa-shopping-cart mr-1"></i> Add To Cart
										</button>
									</c:otherwise>
								</c:choose>
							</c:when>
							<c:otherwise>
								<button class="btn btn-primary px-3" id="CartBtn" onclick="nonUserid()" style="border-color: #dc3545 !important; background-color: #dc3545 !important;">
									<i class="fa fa-shopping-cart mr-1"></i> Sign in
								</button>
							</c:otherwise>
						</c:choose>

					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row px-xl-5">
		<div class="col">
			<div class="bg-light p-30">
				<div class="nav nav-tabs mb-4">
					<a class="nav-item nav-link text-dark active" data-toggle="tab" href="#tab-pane-1">Description</a> <a class="nav-item nav-link text-dark" data-toggle="tab" href="#tab-pane-2">Information</a> <a class="nav-item nav-link text-dark" data-toggle="tab" href="#tab-pane-3">Reviews (<%=count %>)</a>
				</div>
				<div class="tab-content">
					<div class="tab-pane fade show active" id="tab-pane-1">
						<!-- 						<div> -->
						<!-- 							<h4>설명</h4> -->
						<%-- 							<p>${vo.getDescription() }</p> --%>
						<!-- 							<strong style="line-height: 20.79px;">권장급여방법</strong> -->

						<!-- 							<p> -->
						<!-- 								몸무게 5kg미만 : 하루에 2개 ~ 4개 급여<br> 몸무게 ~11kg : 하루에 4개 ~ 8개 급여<br> 몸무게 ~23kg : 하루에 8개 ~ 12개 급여<br> 몸무게 ~40kg이상 : 12개 ~ 20개 급여<br> - 급여량은 반려견 종, 연령, 생활환경에 따라 차이가 날 수 있습니다. -->
						<!-- 							</p> -->
						<!-- 						</div> -->
						<div style="user-select: auto; text-align: center;">
							<!-- 							<picture style="user-select: auto;"> -->
							<!-- 							<source media="(max-width: 1199px)" srcset="https://img.dogpre.com/mobile/dogpre/product/89/88471_desc_285669.jpg" style="user-select: auto;"> -->
							<!-- 							<source media="(min-width: 1200px)" srcset="https://img.dogpre.com/web/dogpre/product/89/88471_desc_285669.jpg" style="user-select: auto;"> -->
							<img src="${vo.getDetailImg()}" alt="네츄럴코어 칠면조 아킬레스 S 25g" sizes="auto" style="user-select: auto;">
							<!-- 							</picture> -->
						</div>
					</div>
					<div class="tab-pane fade" id="tab-pane-2">
						<div class="jss232">
							<div>
								<h4>특징</h4>
								<div>
									<ul>
										<li>100% 칠면조 힘줄을 사용하여 만든 간식</li>
										<li>스트레스 해소에 도움을 주는 트립토판 함유</li>
										<li>체중조절 및 심혈관 건강과 당뇨병 예방에 도움</li>
									</ul>
								</div>
							</div>
							<div>
								<!-- 								<h4>상품 요약</h4> -->
								<div>
									<div>
										<h5>원산지</h5>
										<p>${vo.getCountryOforigin()}</p>
									</div>
									<div>
										<h5>제조사/수입사</h5>
										<p>${vo.getProductcol()}</p>
									</div>
									<div>
										<h5>유통기한</h5>
										<p>${vo.getExpirationDate()}</p>
									</div>
									<div>
										<h5>권장연령</h5>
										<p>${vo.getUsage()}</p>
									</div>
									<div>
										<h5>용량/중량</h5>
										<p>${vo.getCapacity()}</p>
									</div>
									<div>
										<h5>성분구성</h5>
										<p>${vo.getIngredient()}</p>
									</div>
								</div>
							</div>
							<div>
								<h5>소비자상담전화번호</h5>
								<p>ThrowsGG 010-5492-2921</p>
							</div>
						</div>
					</div>
					<!--                리뷰 -->

					<div class="tab-pane fade" id="tab-pane-3">

						<div class="row">

							<div class="col-md-6" id="review_contant" style="display: inline-block;">
								<h4 class="mb-4">
									<%
									out.print(count);
									%>
									review
								</h4>
								<%
								for (int j = (3 * pageNum) - 3; j < pageNum * pageItem; j++) {
									if (j >= list.size()) {
										break;
									}
								%>
								<div class="media mb-4">

									<img src="<%out.print(list.get(j).getProfile());%>" alt="" class="img-fluid mr-3 mt-1" style="width: 45px; height: 45px;">
									<div class="media-body">
										<h6>
											<%
											out.print(list.get(j).getNickname());
											%><small> - <i> <%
 out.print(list.get(j).getDate());
 %>
											</i></small>
										</h6>
										<div class="text-primary mb-2">
											<%
											if (list.get(j).getScore() == 0.5) {
											%>
											<i class="fas fa-star-half-alt"></i> <i class="far fa-star"></i> <i class="far fa-star"></i> <i class="far fa-star"></i> <i class="far fa-star"></i>
											<%
											} else if (list.get(j).getScore() == 1.0) {
											%>
											<i class="fas fa-star"></i> <i class="far fa-star"></i> <i class="far fa-star"></i> <i class="far fa-star"></i> <i class="far fa-star"></i>
											<%
											} else if (list.get(j).getScore() == 1.5) {
											%>
											<i class="fas fa-star"></i> <i class="fas fa-star-half-alt"></i> <i class="far fa-star"></i> <i class="far fa-star"></i> <i class="far fa-star"></i>
											<%
											} else if (list.get(j).getScore() == 2.0) {
											%>
											<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i class="far fa-star"></i> <i class="far fa-star"></i> <i class="far fa-star"></i>
											<%
											} else if (list.get(j).getScore() == 2.5) {
											%>
											<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i class="fas fa-star-half-alt"></i> <i class="far fa-star"></i> <i class="far fa-star"></i>
											<%
											} else if (list.get(j).getScore() == 3.0) {
											%>
											<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i class="fas fa-star"></i> <i class="far fa-star"></i> <i class="far fa-star"></i>
											<%
											} else if (list.get(j).getScore() == 3.5) {
											%>
											<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i class="fas fa-star"></i> <i class="fas fa-star-half-alt"></i> <i class="far fa-star"></i>
											<%
											} else if (list.get(j).getScore() == 4.0) {
											%>
											<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i class="fas fa-star"></i> <i class="fas fa-star"></i> <i class="far fa-star"></i>
											<%
											} else if (list.get(j).getScore() == 4.5) {
											%>
											<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i class="fas fa-star"></i> <i class="fas fa-star"></i> <i class="fas fa-star-half-alt"></i>
											<%
											} else if (list.get(j).getScore() == 5.0) {
											%>
											<i class="fas fa-star"></i> <i class="fas fa-star"></i> <i class="fas fa-star"></i> <i class="fas fa-star"></i> <i class="fas fa-star"></i>
											<%
											}
											%>
										</div>
										<p>
											<%
											out.print(list.get(j).getComment());
											%>
										</p>
										<%
										if (((String) (session.getAttribute("id"))).equals(list.get(j).getId())) {
										%>
										<a href="#" class="btn-gray" onclick=delreview(<%=list.get(j).getNum()%>)><i class="far fa-times-circle"></i>리뷰 삭제</a>
										<%
										}
										%>
									</div>
								</div>
								<%
								}
								%>
								<div class="pt-3">

									<%
									if (count != 0) {
										int pageCount = count / pageItem + (count % pageItem == 0 ? 0 : 1); // 전체 페이지수 계산
										int startPage = ((pageNum - 1) / pageItem) * pageItem + 1;
										int endPage = startPage + pageItem - 1;
										if (endPage > pageCount) {
											endPage = pageCount;
										}
									%>
									<ul class="pagination justify-content-end mb-0">
										<%
										if (startPage > pageItem) { //이전 이 뜰 필요있는지 확인
										%>
										<li class="page-item "><a class="page-link" href="shopDetail.str?productID=${vo.getProductID()}&pageNum=<%=startPage-pageSize%>">Previous</a></li>
										<%
										}
										for (int i = startPage; i <= endPage; i++) {
										if (i == pageNum) {//out.print("start : " +startPage +"end : " + endPage + "i : "+ i);
										%>
										<li class="page-item active"><a class="page-link"><%=i%></a></li>
										<%
										} else {
										%>
										<li class="page-item"><a class="page-link" href="shopDetail.str?productID=${vo.getProductID()}&pageNum=<%=i%>"><%=i%></a></li>
										<%
										}
										}
										if (endPage < pageCount) {
										%>

										<li class="page-item"><a class="page-link" href="shopDetail.str?productID=${vo.getProductID()}&pageNum=<%=startPage+pageSize%>">Next</a></li>
										<%
										}
										}
										%>


									</ul>
								</div>
							</div>

							<!--                         번호 선택칸 부분  -->



							<c:choose>
								<c:when test="${sessionScope.id != null}">
									<div class="col-md-6">
										<h4 class="mb-4">Leave a review</h4>
										<div class="d-flex my-3">
											<p class="mb-0 mr-2">Your Rating * :</p>
											<!--                            <div class="text-primary"> -->
											<!--                               <i class="far fa-star"></i> <i class="far fa-star"></i> <i class="far fa-star"></i> <i class="far fa-star"></i> <i class="far fa-star"></i> -->
											<!--                            </div> -->

											<div class="startRadio">
												<label class="startRadio__box"> <input type="radio" name="star" id="" value="0.5"> <span class="startRadio__img"><span class="blind">별 1개</span></span>
												</label> <label class="startRadio__box"> <input type="radio" name="star" id="" value="1.0"> <span class="startRadio__img"><span class="blind">별 1.5개</span></span>
												</label> <label class="startRadio__box"> <input type="radio" name="star" id="" value="1.5"> <span class="startRadio__img"><span class="blind">별 2개</span></span>
												</label> <label class="startRadio__box"> <input type="radio" name="star" id="" value="2.0"> <span class="startRadio__img"><span class="blind">별 2.5개</span></span>
												</label> <label class="startRadio__box"> <input type="radio" name="star" id="" value="2.5"> <span class="startRadio__img"><span class="blind">별 3개</span></span>
												</label> <label class="startRadio__box"> <input type="radio" name="star" id="" value="3.0"> <span class="startRadio__img"><span class="blind">별 3.5개</span></span>
												</label> <label class="startRadio__box"> <input type="radio" name="star" id="" value="3.5"> <span class="startRadio__img"><span class="blind">별 4개</span></span>
												</label> <label class="startRadio__box"> <input type="radio" name="star" id="" value="4.0"> <span class="startRadio__img"><span class="blind">별 4.5개</span></span>
												</label> <label class="startRadio__box"> <input type="radio" name="star" id="" value="4.5"> <span class="startRadio__img"><span class="blind">별 5개</span></span>
												</label> <label class="startRadio__box"> <input type="radio" name="star" id="" value="5.0"> <span class="startRadio__img"><span class="blind">별 5.5개</span></span>
												</label>
											</div>


										</div>
										<div class="form-group">
											<label for="message">Your Review *</label>

											<textarea id="message" cols="30" rows="5" maxlength="300" class="form-control"></textarea>
										</div>
										<div class="textLengthWrap" style="display: flex;">
											<p class="textCount">0자</p>
											<p class="textTotal">/300자</p>
										</div>
										<div class="form-group mb-0">
											<button onclick=review() class="btn btn-primary px-3">Leave Your Review</button>
										</div>

									</div>
								</c:when>
							</c:choose>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	</div>
	<!-- Shop Detail End -->


	<!-- Products Start -->
	<div class="container-fluid py-5">
		<h2 class="section-title position-relative text-uppercase mx-xl-5 mb-4">
			<span class="bg-secondary pr-3">You May Also Like</span>
		</h2>
		<div class="row px-xl-5">
			<div class="col">
				<div class="owl-carousel related-carousel">
					<div class="product-item bg-light">
						<div class="product-img position-relative overflow-hidden">
							<img class="img-fluid w-100" src="img/product-1.jpg" alt="">
							<div class="product-action">
								<a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-shopping-cart"></i></a> <a class="btn btn-outline-dark btn-square" href=""><i class="far fa-heart"></i></a> <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-sync-alt"></i></a> <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-search"></i></a>
							</div>
						</div>
						<div class="text-center py-4">
							<a class="h6 text-decoration-none text-truncate" href=""><</a>
							<div class="d-flex align-items-center justify-content-center mt-2">
								<h5>$123.00</h5>
								<h6 class="text-muted ml-2">
									<del>$123.00</del>
								</h6>
							</div>
							<div class="d-flex align-items-center justify-content-center mb-1">
								<small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small>(99)</small>
							</div>
						</div>
					</div>
					<div class="product-item bg-light">
						<div class="product-img position-relative overflow-hidden">
							<img class="img-fluid w-100" src="img/product-2.jpg" alt="">
							<div class="product-action">
								<a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-shopping-cart"></i></a> <a class="btn btn-outline-dark btn-square" href=""><i class="far fa-heart"></i></a> <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-sync-alt"></i></a> <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-search"></i></a>
							</div>
						</div>
						<div class="text-center py-4">
							<a class="h6 text-decoration-none text-truncate" href=""><</a>
							<div class="d-flex align-items-center justify-content-center mt-2">
								<h5>$123.00</h5>
								<h6 class="text-muted ml-2">
									<del>$123.00</del>
								</h6>
							</div>
							<div class="d-flex align-items-center justify-content-center mb-1">
								<small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small>(99)</small>
							</div>
						</div>
					</div>
					<div class="product-item bg-light">
						<div class="product-img position-relative overflow-hidden">
							<img class="img-fluid w-100" src="img/product-3.jpg" alt="">
							<div class="product-action">
								<a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-shopping-cart"></i></a> <a class="btn btn-outline-dark btn-square" href=""><i class="far fa-heart"></i></a> <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-sync-alt"></i></a> <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-search"></i></a>
							</div>
						</div>
						<div class="text-center py-4">
							<a class="h6 text-decoration-none text-truncate" href=""><</a>
							<div class="d-flex align-items-center justify-content-center mt-2">
								<h5>$123.00</h5>
								<h6 class="text-muted ml-2">
									<del>$123.00</del>
								</h6>
							</div>
							<div class="d-flex align-items-center justify-content-center mb-1">
								<small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small>(99)</small>
							</div>
						</div>
					</div>
					<div class="product-item bg-light">
						<div class="product-img position-relative overflow-hidden">
							<img class="img-fluid w-100" src="img/product-4.jpg" alt="">
							<div class="product-action">
								<a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-shopping-cart"></i></a> <a class="btn btn-outline-dark btn-square" href=""><i class="far fa-heart"></i></a> <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-sync-alt"></i></a> <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-search"></i></a>
							</div>
						</div>
						<div class="text-center py-4">
							<a class="h6 text-decoration-none text-truncate" href=""><</a>
							<div class="d-flex align-items-center justify-content-center mt-2">
								<h5>$123.00</h5>
								<h6 class="text-muted ml-2">
									<del>$123.00</del>
								</h6>
							</div>
							<div class="d-flex align-items-center justify-content-center mb-1">
								<small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small>(99)</small>
							</div>
						</div>
					</div>
					<div class="product-item bg-light">
						<div class="product-img position-relative overflow-hidden">
							<img class="img-fluid w-100" src="img/product-5.jpg" alt="">
							<div class="product-action">
								<a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-shopping-cart"></i></a> <a class="btn btn-outline-dark btn-square" href=""><i class="far fa-heart"></i></a> <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-sync-alt"></i></a> <a class="btn btn-outline-dark btn-square" href=""><i class="fa fa-search"></i></a>
							</div>
						</div>
						<div class="text-center py-4">
							<a class="h6 text-decoration-none text-truncate" href=""><</a>
							<div class="d-flex align-items-center justify-content-center mt-2">
								<h5>$123.00</h5>
								<h6 class="text-muted ml-2">
									<del>$123.00</del>
								</h6>
							</div>
							<div class="d-flex align-items-center justify-content-center mb-1">
								<small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small class="fa fa-star text-primary mr-1"></small> <small>(99)</small>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Products End -->

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
	//radio 버튼 클릭 이벤트
	var score;
	$("input:radio[name=star]").click(function(){
	   score = document.querySelector('input[name="star"]:checked').value; 
	console.log('star click : '+ score);

	});
	let content;
	$('#message').keyup(function (e) {
	   content = $(this).val();
	    // 글자수 세기
	    if (content.length == 0 || content == '') {
	       $('.textCount').text('0자');
	    } else {
	       $('.textCount').text(content.length + '자');
	    }
	    
	    // 글자수 제한
	    if (content.length > 300) {
	       // 200자 부터는 타이핑 되지 않도록
	        $(this).val($(this).val().substring(0, 300));
	        // 200자 넘으면 알림창 뜨도록
	        alert('글자수는 300자까지 입력 가능합니다.');
	        $('.textCount').text('300자');
	    };
	});

	function review(){
	   if(score === undefined){
	      alert("별점을 입력해 주세요!")
	   }else{
	      $.ajax({
	         type: "post",
	         url: "review.str",
	         dataType: "text",
	         data: {
	            item: '${vo.getProductID()}',
	            score: score,
	            comment: content,
	         }
	      }).done(function(data) {
	         if (data != "null") {
	            window.location.reload()
	         } else {
	            alert("fail!")
	         }
	      }).error(function(data) {
	         alert("error")
	      })
	   }
	}

	function delreview(num){
	   $.ajax({
	      type: "post",
	      url: "delreview.str",
	      dataType: "text",
	      data: {
	         num: num,
	      }
	   }).done(function(data) {
	      if (data != "null") {
	         window.location.reload()
	      } else {
	         alert("fail!")
	      }
	   }).error(function(data) {
	      alert("error")
	   })
	   
	}
		$(document).ready(function() {
			totalCountCart();
		});
		function AddCart() {
			console.log('AddCart 실행')
			var amount = $('input#amount').val();
			$
					.ajax({
						type : "POST",
						url : "addCart.str",
						data : {
							userid : '${sessionScope.id}',
							product_id : '${vo.getProductID()}',
							amount : amount

						}
					})
					.done(
							function() {
								totalCountCart()
								$("#CartBtn").removeAttr("onclick"); // 온클릭 속성을 삭제
								$('#CartBtn').attr('onclick', 'DropCart();')
								$('#CartBtn')
										.attr('style',
												"border-color: #6c757d !important; background-color: #6c757d !important;")
								$('#CartBtn')
										.html(
												'<i class="fa fa-shopping-cart mr-1"></i> Drop To Cart ')
							}).fail(function() {
						console.log('에러')
					});

		}
		function DropCart() {
			console.log('DropCart 실행')
			$
					.ajax({
						type : "POST",
						url : "dropCart.str",
						data : {
							userid : '${sessionScope.id}',
							product_id : '${vo.getProductID()}'
						}
					})
					.done(
							function() {
								totalCountCart()
								$("#CartBtn").removeAttr("style"); // 온클릭 속성을 삭제
								$("#CartBtn").removeAttr("onclick"); // 온클릭 속성을 삭제
								$('#CartBtn').attr('onclick', 'AddCart();')
								$('#CartBtn')
										.html(
												'<i class="fa fa-shopping-cart mr-1"></i> Add To Cart ')
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