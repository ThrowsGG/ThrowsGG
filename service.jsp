<%@page import="mvc.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@page import="vo.*"%>
<%@page import="gg.*"%>
<%@page import="java.util.*"%>
<%@page import="mvc.model.BoardDTO"%>
<%@page import="dao.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
String pageNum = request.getParameter("pageNum");
if (pageNum == null) { // 클릭한게 없으면 1번 페이지
	pageNum = "1";
}
ArrayList<DateAbandon> list = ApiManagement.getDataList(pageNum).getList();
int pageSize = list.size(); // 한 페이지에 출력할 레코드 수
// 페이지 링크를 클릭한 번호 / 현재 페이지

// 연산을 하기 위한 pageNum 형변환 / 현재 페이지
int currentPage = Integer.parseInt(pageNum);
int count = 0;
count = Integer.parseInt(list.get(0).getTotalCount());//api의 전체 데이터 개수

BoardDAO bd = BoardDAO.getInstance();
int comuCount = bd.getListCount(null, null);
CopyMemberDAO CM = new CopyMemberDAO();
int mCount = CM.countCheck();
Copy cp = new Copy();
int rCount = cp.countCheck();
%>
<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta charset="EUC-KR">
<title>Insert title here</title>

</head>
<body>
	<!-- 	<section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg_2.jpg');" data-stellar-background-ratio="0.5"> -->
	<!-- 		<div class="overlay"></div> -->
	<!-- 		<div class="container"> -->
	<!-- 			<div class="row no-gutters slider-text align-items-end"> -->
	<!-- 				<div class="col-md-9 ftco-animate pb-5"> -->
	<!-- 					<p class="breadcrumbs mb-2"> -->
	<!-- 						<span class="mr-2"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> <span class="mr-2"><a href="blog.html">Blog <i class="ion-ios-arrow-forward"></i></a></span> <span>Blog Single <i class="ion-ios-arrow-forward"></i> -->
	<!-- 						</span> -->
	<!-- 					</p> -->
	<!-- 					<h1 class="mb-0 bread">Blog</h1> -->
	<!-- 				</div> -->
	<!-- 			</div> -->
	<!-- 		</div> -->
	<!-- 	</section> -->
	<section class="ftco-section bg-light ftco-no-pt ftco-intro" style="margin-top: 50px;">
		<div class="container">
			<div class="row">
				<div class="col-md-4 d-flex align-self-stretch px-4 ftco-animate">
					<div class="d-block services text-center">
						<div class="icon d-flex align-items-center justify-content-center">
							<span class="flaticon-blind"></span>
						</div>
						<div class="media-body">
							<h3 class="heading">강아지 산책</h3>
							<p>강아지 산책시 유의사항 6가지!</p>
							<a href="https://www.youtube.com/embed/0C4IWEycU8Q" target='_blank' class="btn-custom d-flex align-items-center justify-content-center"><span class="fa fa-chevron-right"></span><i class="sr-only">Read more</i></a>
						</div>
					</div>
				</div>
				<div class="col-md-4 d-flex align-self-stretch px-4 ftco-animate">
					<div class="d-block services text-center">
						<div class="icon d-flex align-items-center justify-content-center">
							<span class="flaticon-dog-eating"></span>
						</div>
						<div class="media-body">
							<h3 class="heading">강아지 훈련</h3>
							<p>새로 데려온 강아지를 쉽게 훈련하는 10가지 방법</p>
							<a href="https://www.youtube.com/embed/s3z6DFSyxXY" target='_blank' class="btn-custom d-flex align-items-center justify-content-center"><span class="fa fa-chevron-right"></span><i class="sr-only">Read more</i></a>
						</div>
					</div>
				</div>

				<div class="col-md-4 d-flex align-self-stretch px-4 ftco-animate">
					<div class="d-block services text-center">
						<div class="icon d-flex align-items-center justify-content-center">
							<span class="flaticon-grooming"></span>
						</div>
						<div class="media-body">
							<h3 class="heading">강아지 미용</h3>
							<p>간단하게 집에서하는 셀프 미용!</p>
							<a href="https://www.youtube.com/embed/4ihYo7XZ25I" target='_blank' class="btn-custom d-flex align-items-center justify-content-center"><span class="fa fa-chevron-right"></span><i class="sr-only">Read more</i></a>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section ftco-no-pt ftco-no-pb">
		<div class="container">
			<div class="row d-flex no-gutters">
				<div class="col-md-5 d-flex">
					<div class="img img-video d-flex align-self-stretch align-items-center justify-content-center justify-content-md-center mb-4 mb-sm-0" style="background-image: url(images/about-1.jpg);"></div>
				</div>
				<div class="col-md-7 pl-md-5 py-md-5">
					<div class="heading-section pt-md-5">
						<h2 class="mb-4">유기동물을 입양하는 이유?</h2>
					</div>
					<div class="row">
						<div class="col-md-6 services-2 w-100 d-flex">

							<div class="text pl-3">
								<h4>믹스견은 유전질환이 적다.</h4>
								<p>믹스견이 순종보다 유전질환이 더 적다는 사실을 알고 계십니까? 일부 순종은 특정 질병에 매우 취약한 경우가 있습니다.</p>
							</div>
						</div>
						<div class="col-md-6 services-2 w-100 d-flex">
							<div class="text pl-3">
								<h4>강아지 공장을 지원하지 않는다.</h4>
								<p>열악한 환경에서 키우는 강아지 공장에서 펫스토어에 동물을 공급합니다. 펫스토어에서 입양하는것보다 유기동물을 입양하는게 좋습니다.</p>
							</div>
						</div>
						<div class="col-md-6 services-2 w-100 d-flex">
							<div class="text pl-3">
								<h4>생명을 구하는 일입니다.</h4>
								<p>강아지를 입양하는 것은 강아지의 생명을 구하는 일입니다. 많은 강아지를 입양한 보호자들은 구조된 강아지가 오히려 자신의 삶을 구원한다고 말하고 있습니다.</p>
							</div>
						</div>
						<div class="col-md-6 services-2 w-100 d-flex">
							<div class="text pl-3">
								<h4>의료에 관한 문제가 해결됩니다.</h4>
								<p>보호소에서 강아지를 입양할 때 일반적인 의료에 관한 문제를 지원받는 것을 의무화합니다. 중성화,예방접종,건강 검사와 마이크로칩의 설치를 모함합니다.</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="ftco-counter" id="section-counter">
		<div class="container">
			<div class="row">
				<div class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
					<div class="block-18 text-center">
						<div class="text">
							<strong class="number" data-number="<%=count%>">0</strong>
						</div>
						<div class="text">
							<span>유기동물 등록수</span>
						</div>
					</div>
				</div>


				<div class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
					<div class="block-18 text-center">
						<div class="text">
							<strong class="number" data-number="<%=comuCount%>"></strong>
						</div>
						<div class="text">
							<span>게시글 등록 수</span>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
					<div class="block-18 text-center">
						<div class="text">
							<strong class="number" data-number="<%=mCount%>">0</strong>
						</div>
						<div class="text">
							<span>누적 방문신청</span>
						</div>
					</div>
				</div>
				<div class="col-md-6 col-lg-3 d-flex justify-content-center counter-wrap ftco-animate">
					<div class="block-18 text-center">
						<div class="text">
							<strong class="number" data-number="<%=rCount%>">0</strong>
						</div>
						<div class="text">
							<span>회원 수</span>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="ftco-section bg-light">
		<div class="container">
			<div class="row justify-content-center pb-5 mb-3">
				<div class="col-md-7 heading-section text-center ftco-animate">
					<h2>공고</h2>
				</div>
			</div>
			<div class="row d-flex">
				<%
				for (int i = 0; i < 3; i++) {
				%>
				<div class="col-md-4 d-flex ftco-animate">
					<div class="blog-entry align-self-stretch" style="width: 350px;">
						<!-- 이미지 mkc 수정 -->
						<form id="frm" name="frm" method="get" action="blog-single.bgs">
							<input type="hidden" id="DesertionNo" name="DesertionNo" value=""> <a href="javascript:void(0);" onclick="goData(<%=list.get(i).getDesertionNo()%>);" class="block-20 rounded" style="height: 400px; background-position: top; background-image: url('<%=list.get(i).getPopfile()%>'); "> </a>
						</form>
						<div class="text p-4">
							<div class="meta mb-2">
								<div>
									<a href="#"><%=list.get(i).getKindCd()%></a>
								</div>
							</div>
							<h4 class="heading" style="font-size: 15px;">
								<a href="#">접수일 : <%=list.get(i).getHappenDt()%><br>발견 장소 : <%=list.get(i).getHappenPlace()%><BR>보호 장소 : <%=list.get(i).getCareNm()%></a>
							</h4>
						</div>
					</div>
				</div>
				<%
				}
				%>
			</div>
		</div>


	</section>


	<section class="ftco-section bg-light">
		<%
		news news_obj = new news();
		List<NewsVO> newslist = news_obj.getNews();
		%>
		<div class="container">
			<div class="row justify-content-center pb-5 mb-3">
				<div class="col-md-7 heading-section text-center ftco-animate">
					<h2>최신 뉴스</h2>
				</div>
			</div>
			<div class="row d-flex">
				<%
				for (int i = 0; i < 6; i++) {
				%>
				<div class="col-md-4 d-flex ftco-animate">
					<div class="blog-entry align-self-stretch" style="width: auto;">
						<!-- 						이미지 mkc 수정 -->
						<form id="frm" name="frm" method="get" action="blog-single.bgs">
							<input type="hidden" id="DesertionNo" name="DesertionNo" value=""> <a href=<%=newslist.get(i).getUrl()%> onclick=<%=newslist.get(i).getUrl()%> class="block-20 rounded" style="height: 200px; background-position: top; background-image: url('<%=newslist.get(i).getImg()%>'); "> </a>
						</form>
						<div class="text p-4">
							<div class="meta mb-2"></div>
							<h4 class="heading" style="font-size: 15px;">
								<a href=<%=newslist.get(i).getUrl()%>><%=newslist.get(i).getTitle()%></a>
							</h4>
						</div>
					</div>
				</div>
				<%
				}
				%>
			</div>
		</div>
	</section>
	<script src="js/jquery.min.js"></script>
	<script src="js/jquery-migrate-3.0.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/jquery.stellar.min.js"></script>
	<script src="js/jquery.animateNumber.min.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/jquery.timepicker.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/scrollax.min.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="js/google-map.js"></script>
	<script src="js/main.js"></script>
	<!-- 따로임포트 -->
	<script type="text/javascript" src="js/mkc_javascript.js"></script>
</body>
</html>