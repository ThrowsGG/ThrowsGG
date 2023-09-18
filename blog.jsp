<%@page import="org.apache.commons.collections4.splitmap.AbstractIterableGetMapDecorator"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="vo.*"%>
<%@page import="gg.*"%>
<%@page import="gg.*"%>
<%@page import="gg.*"%>
<%@page import="java.util.*"%>
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
%>
<!DOCTYPE html>
<html lang="kr">
<head>
<title>ThrowsGG</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- <link href="https://fonts.googleapis.com/css?family=Montserrat:200,300,400,500,600,700,800&display=swap" rel="stylesheet"> -->

<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"> -->

<!-- <link rel="stylesheet" href="css/animate.css"> -->

<!-- <link rel="stylesheet" href="css/owl.carousel.min.css"> -->
<!-- <link rel="stylesheet" href="css/owl.theme.default.min.css"> -->
<!-- <link rel="stylesheet" href="css/magnific-popup.css"> -->


<!-- <link rel="stylesheet" href="css/bootstrap-datepicker.css"> -->
<!-- <link rel="stylesheet" href="css/jquery.timepicker.css"> -->

<!-- <link rel="stylesheet" href="css/flaticon.css"> -->
<!-- <link rel="stylesheet" href="css/style.css"> -->
</head>
<body>
<jsp:include page="Nav.jsp"></jsp:include>
	<!-- END nav -->
	<section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg_2.jpg');" data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div class="row no-gutters slider-text align-items-end">
				<div class="col-md-9 ftco-animate pb-5">
					<p class="breadcrumbs mb-2">
						<span class="mr-2"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>Notice<i class="ion-ios-arrow-forward"></i></span>
					</p>
					<h1 class="mb-0 bread">공고</h1>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section bg-light">
		<div class="container">
			<div class="row d-flex">

				<%
				for (int i = 0; i < list.size(); i++) {
				%>
				<div class="col-md-4 d-flex ftco-animate">
					<div class="blog-entry align-self-stretch" style="width: 350px;">
						<!-- 이미지 mkc 수정 -->
						<form id="frm<%=i%>" name="frm" method="get" action="blog-single.bgs">
							<input type="hidden" name="desertionNo" value="<%=list.get(i).getDesertionNo()%>">
							<input type="hidden" name="filename" value="<%=list.get(i).getFilename()%>">
							<input type="hidden" name="happenDt" value="<%=list.get(i).getHappenDt()%>">
							<input type="hidden" name="happenPlace" value="<%=list.get(i).getHappenPlace()%>">
							<input type="hidden" name="kindCd" value="<%=list.get(i).getKindCd()%>">
							<input type="hidden" name="colorCd" value="<%=list.get(i).getColorCd()%>">
							<input type="hidden" name="age" value="<%=list.get(i).getAge()%>">
							<input type="hidden" name="weight" value="<%=list.get(i).getWeight()%>">
							<input type="hidden" name="noticeNo" value="<%=list.get(i).getNoticeNo()%>">
							<input type="hidden" name="noticeSdt" value="<%=list.get(i).getNoticeSdt()%>">
							<input type="hidden" name="noticeEdt" value="<%=list.get(i).getNoticeEdt()%>">
							<input type="hidden" name="popfile" value="<%=list.get(i).getPopfile()%>">
							<input type="hidden" name="processState" value="<%=list.get(i).getProcessState()%>">
							<input type="hidden" name="sexCd" value="<%=list.get(i).getSexCd()%>">
							<input type="hidden" name="neuterYn" value="<%=list.get(i).getNeuterYn()%>">
							<input type="hidden" name="specialMark" value="<%=list.get(i).getSpecialMark()%>">
							<input type="hidden" name="careNm" value="<%=list.get(i).getCareNm()%>">
							<input type="hidden" name="careTel" value="<%=list.get(i).getCareTel()%>">
							<input type="hidden" name="careAddr" value="<%=list.get(i).getCareAddr()%>">
							<input type="hidden" name="orgNm" value="<%=list.get(i).getOrgNm()%>">
							<input type="hidden" name="chargeNm" value="<%=list.get(i).getChargeNm()%>">
							<input type="hidden" name="officetel" value="<%=list.get(i).getOfficetel()%>">
							<input type="hidden" name="totalCount" value="<%=list.get(i).getTotalCount()%>">
							 <a href="javascript:void(0);" onclick="goData(<%=i %>);" class="block-20 rounded" style="height: 400px; background-position: top; background-image: url('<%=list.get(i).getPopfile()%>'); "> </a>
						</form>
						<div class="text p-4">
							<div class="meta mb-2">
								<div>
									<a href="#"><%=list.get(i).getKindCd()%></a>
								</div>
							</div>
							<h4 class="heading" style="font-size: 15px;">
								<a href="#">접수일 : <%=list.get(i).getHappenDt()%><br>발견 장소 : <%=list.get(i).getHappenPlace() %><BR>보호 장소 : <%=list.get(i).getCareNm()%></a>
							</h4>
						</div>
					</div>
				</div>
				<%
				}
				%>
			</div>
		</div>
		<div class="row mt-5">
			<div class="col text-center">
				<div class="block-27">
					<ul>
						<%
						// 페이징  처리
						if (count > 0) {
							// 총 페이지의 수
							int pageCount = count / pageSize + (count % pageSize == 0 ? 0 : 1);
							// 한 페이지에 보여줄 페이지 블럭(링크) 수
							int pageBlock = 10;
							// 한 페이지에 보여줄 시작 및 끝 번호(예 : 1, 2, 3 ~ 10 / 11, 12, 13 ~ 20)
							int startPage = ((currentPage - 1) / pageBlock) * pageBlock + 1;
							int endPage = startPage + pageBlock - 1;

							// 마지막 페이지가 총 페이지 수 보다 크면 endPage를 pageCount로 할당
							if (endPage > pageCount) {
								endPage = pageCount;
							}

							if (startPage > pageBlock) { // 페이지 블록수보다 startPage가 클경우 이전 링크 생성
						%>
						<li><a href="blog.jsp?pageNum=<%=startPage - 10%>">&lt;</a></li>
						<%
						}

						for (int i = startPage; i <= endPage; i++) { // 페이지 블록 번호
						if (i == currentPage) { // 현재 페이지에는 링크를 설정하지 않음
						%>
						<li class="active"><span><%=i%></span></li>
						<%
						} else { // 현재 페이지가 아닌 경우 링크 설정
						%>
						<li><a href="blog.jsp?pageNum=<%=i%>"><%=i%> </a></li>
						<%
						}
						} // for end

						if (endPage < pageCount) { // 현재 블록의 마지막 페이지보다 페이지 전체 블록수가 클경우 다음 링크 생성
						%>
						<li><a href="blog.jsp?pageNum=<%=startPage + 10%>">&gt;</a></li>
						<%
						}
						}
						%>
					</ul>
				</div>
			</div>
		</div>
	</section>
<jsp:include page="lower.jsp"></jsp:include>




	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>


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
	<script src="js/main.js"></script>
	<!-- js 파일 임폴트 할떄 type 적어야됨 안적으면 js파일 함수 호출 불가- mkc -->
	<script type="text/javascript" src="js/mkc_javascript.js"></script>

</body>
</html>