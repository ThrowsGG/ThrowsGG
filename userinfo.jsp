<%@page import="vo.SaleorderVO"%>
<%@page import="org.apache.commons.collections4.bag.SynchronizedSortedBag"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<%@ page import="requestinfo.RequestInfo"%>
<%@ page import="vo.*"%>
<%@ page import="mvc.model.BoardDTO"%>
<html>

<head>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<title>ThrowsGG</title>
<!-- modal -->
<link rel="stylesheet"
	href="//netdna.bootstrapcdn.com/bootstrap/3.0.0/css/bootstrap-glyphicons.css">
<!-- CSS only -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx"
	crossorigin="anonymous">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css"
	rel="stylesheet">
<!-- MDB icon -->
<link rel="icon" href="img/mdb-favicon.ico" type="image/x-icon" />
<!-- Font Awesome -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
<!-- Google Fonts Roboto -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap" />
<!-- MDB -->
<link rel="stylesheet" href="css/mdb.min.css" />

<!-- Prism -->
<link rel="stylesheet"
	href="https://mdbgo.io/mikolaj-smolenski/mdb5-demo-pro/dev/css/new-prism.css" />
<!-- Custom styles -->
<style>
main {
	padding-left: 240px;
}

body {
	background: #f5f5f5;
	margin-top: 20px;
	position: relative;
	padding-top: 0;
}

.ui-w-80 {
	width: 80px !important;
	height: auto;
}

.btn-default {
	border-color: rgba(24, 28, 33, 0.1);
	background: rgba(0, 0, 0, 0);
	color: #4E5155;
}

label.btn {
	margin-bottom: 0;
}

.btn-outline-primary {
	border-color: #26B4FF;
	background: transparent;
	color: #26B4FF;
}

.btn {
	cursor: pointer;
}

.text-light {
	color: #6c757c !important;
}

.btn-facebook {
	border-color: rgba(0, 0, 0, 0);
	background: #3B5998;
	color: #fff;
}

.btn-instagram {
	border-color: rgba(0, 0, 0, 0);
	background: #000;
	color: #fff;
}

.card {
	background-clip: padding-box;
	box-shadow: 0 1px 4px rgba(24, 28, 33, 0.012);
}

.row-bordered {
	overflow: hidden;
}

.account-settings-fileinput {
	position: absolute;
	visibility: hidden;
	width: 1px;
	height: 1px;
	opacity: 0;
}

.account-settings-links .list-group-item.active {
	font-weight: bold !important;
}

html:not(.dark-style) .account-settings-links .list-group-item.active {
	background: rgb(0 0 0/ 10%) !important;
}

.account-settings-multiselect ~ .select2-container {
	width: 100% !important;
}

.light-style .account-settings-links .list-group-item {
	padding: 0.85rem 1.5rem;
	border-color: rgba(24, 28, 33, 0.03) !important;
}

.light-style .account-settings-links .list-group-item.active {
	color: #4e5155 !important;
}

.material-style .account-settings-links .list-group-item {
	padding: 0.85rem 1.5rem;
	border-color: rgba(24, 28, 33, 0.03) !important;
}

.material-style .account-settings-links .list-group-item.active {
	color: #4e5155 !important;
}

.dark-style .account-settings-links .list-group-item {
	padding: 0.85rem 1.5rem;
	border-color: rgba(255, 255, 255, 0.03) !important;
}

.dark-style .account-settings-links .list-group-item.active {
	color: #fff !important;
}

.light-style .account-settings-links .list-group-item.active {
	color: #4E5155 !important;
}

.light-style .account-settings-links .list-group-item {
	padding: 0.85rem 1.5rem;
	border-color: rgba(24, 28, 33, 0.03) !important;
}





.modal-content {
	-webkit-border-radius: 0;
	-webkit-background-clip: padding-box;
	-moz-border-radius: 0;
	-moz-background-clip: padding;
	border-radius: 6px;
	background-clip: padding-box;
	-webkit-box-shadow: 0 0 40px rgba(0, 0, 0, .5);
	-moz-box-shadow: 0 0 40px rgba(0, 0, 0, .5);
	box-shadow: 0 0 40px rgba(0, 0, 0, .5);
	color: #000;
	background-color: #fff;
	border: rgba(0, 0, 0, 0);
}

.modal-message .modal-dialog {
	width: 300px;
}

.modal-message .modal-body, .modal-message .modal-footer, .modal-message .modal-header,
	.modal-message .modal-title {
	background: 0 0;
	border: none;
	margin: 0;
	padding: 0 20px;
	text-align: center !important;
}

.modal-message .modal-title {
	font-size: 17px;
	color: #737373;
	margin-bottom: 3px;
}

.modal-message .modal-body {
	color: #737373;
}

.modal-message .modal-header {
	color: #fff;
	margin-bottom: 10px;
	padding: 15px 0 8px;
}

.modal-message .modal-header .fa, .modal-message .modal-header 
.glyphicon, .modal-message 
.modal-header .typcn, .modal-message .modal-header .wi {
	font-size: 30px;
}

.modal-message .modal-footer {
	margin: 25px 0 20px;
	padding-bottom: 10px;
}

.modal-backdrop.in {
	zoom: 1;
	filter: alpha(opacity = 75);
	-webkit-opacity: .75;
	-moz-opacity: .75;
	opacity: .75;
}

.modal-backdrop {
	background-color: #fff;
}

.modal-message.modal-success .modal-header {
	color: #53a93f;
	border-bottom: 3px solid #a0d468;
}

.modal-message.modal-info .modal-header {
	color: #57b5e3;
	border-bottom: 3px solid #57b5e3;
}

.modal-message.modal-danger .modal-header {
	color: #d73d32;
	border-bottom: 3px solid #e46f61;
}

.modal-message.modal-warning .modal-header {
	color: #f4b400;
	border-bottom: 3px solid #ffce55;
}

/* 부트스트랩 신청현황 */
body {
	background: #f6f9fc;
	margin-top: 20px;
}
/* booking */
.bg-light-blue {
	background-color: #e9f7fe !important;
	color: #3184ae;
	padding: 7px 18px;
	border-radius: 4px;
}

.bg-light-green {
	background-color: rgba(40, 167, 69, 0.2) !important;
	padding: 7px 18px;
	border-radius: 4px;
	color: #28a745 !important;
}

.bg-light-gray {
	color: #666;
	background-color: #eee;
	padding: 7px 18px;
	border-radius: 4px;
}

.buttons-to-right {
	position: absolute;
	right: 0;
	top: 80%;
}

.btn-gray {

	right: 0;
	top: 30%;
	color: #666;
	background-color: #eee;
	padding: 7px 18px;
	border-radius: 4px;
}

.booking:hover .buttons-to-right .btn-gray {
	opacity: 1;
	transition: .3s;
}

.buttons-to-right .btn-gray {
	opacity: 0;
	transition: .3s;
}

.btn-gray:hover {
	background-color: #36a3f5;
	color: #fff;
}

.booking {
	margin-bottom: 30px;
	border-bottom: 1px solid #eee;
	padding-bottom: 30px;
}

.booking:last-child {
	margin-bottom: 0px;
	border-bottom: none;
	padding-bottom: 0px;
}

@media screen and (max-width: 575px) {
	.buttons-to-right {
		top: 10%;
	}
	.buttons-to-right a {
		display: block;
		margin-bottom: 20px;
	}
	.buttons-to-right a:last-child {
		margin-bottom: 0px;
	}
	.bg-light-blue, .bg-light-green, .btn-gray {
		padding: 7px;
	}
}

.card {
	margin-bottom: 20px;
	background-color: #fff;
	border-radius: 4px;
	-webkit-box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05);
	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.05);
	border-radius: 4px;
	box-shadow: none;
	border: none;
	padding: 25px;
}

.mb-5, .my-5 {
	margin-bottom: 3rem !important;
}

.msg-img {
	margin-right: 20px;
}

.msg-img img {
	width: 60px;
	border-radius: 50%;
}

img {
	max-width: 100%;
	height: auto;
}
</style>


<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link
	href="https://fonts.googleapis.com/css?family=Montserrat:200,300,400,500,600,700,800&display=swap"
	rel="stylesheet">

<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="css/animate.css">

<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">


<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<link rel="stylesheet" href="css/jquery.timepicker.css">

<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/style.css">
</head>

<body data-mdb-spy="scroll" data-mdb-target="#scrollspy1"
	data-mdb-offset="1" class="scrollspy-example">
	<!-- YOUR WORK HERE -->
<jsp:include page="Nav.jsp"></jsp:include>

	<div class="container light-style flex-grow-1 container-p-y">

		<h4 class="font-weight-bold py-3 mb-4">Account settings</h4>

		<div class="card overflow-hidden">
			<div class="row no-gutters row-bordered row-border-light">
				<div class="col-md-3 pt-0">
					<div class="list-group list-group-flush account-settings-links" id="myTab">
						<a class="list-group-item list-group-item-action active"
							data-toggle="tab" href="#account-general">정보</a><a
							class="list-group-item list-group-item-action" data-toggle="tab"
							href="#account-change-password">비밀번호 변경</a><a
							class="list-group-item list-group-item-action" data-toggle="tab"
							href="#account-info" >신청현황</a><a
							class="list-group-item list-group-item-action" data-toggle="tab"
							href="#account-board" >내가 쓴 글</a><a
							class="list-group-item list-group-item-action" data-toggle="tab"
							href="#account-orderList" >주문목록</a>
					</div>
				</div>
				<div class="col-md-9">
					<div class="tab-content">
						<div class="tab-pane fade active show" id="account-general">
							
							<div class="card-body media align-items-center">
								<div id="editor" class="d-block ui-w-80" contenteditable="true"><img id='output' alt="" class="d-block ui-w-80"
								src="<%out.println((String) session.getAttribute("profile"));%>">
								</div>
								
								<!-- 								<div alt="" class="d-block ui-w-80"> -->
								<!-- 									<img src="https://bootdey.com/img/Content/avatar/avatar1.png" -->
								<!-- 										alt="" class="d-block ui-w-80"> -->
								<!-- 								</div> -->
								<div class="media-body ml-4">
									<label class="btn btn-outline-primary"> Upload new
										photo<input id="img-selector"
										class="account-settings-fileinput" type="file"
										accept="image/*" onchange='openFile(event)'>
									</label> &nbsp;
									<button type="button" class="btn btn-default md-btn-flat"
										onclick=resetimg()>Reset</button>
										<form novalidate name="formdel"  encType="UTF-8">
									<button type="submit" class="btn btn-primary"
											 style="float: right;" onclick=delMember()>회원 탈퇴</button>
											</form>
									<div class="text-light1 small mt-1" style="color: #6c757d">Allowed
										JPG, GIF or PNG. Max size of 800K</div>
								</div>
							</div>
							<hr class="border-light m-0">

							<div class="card-body" id="card1">
								<!-- 							<form name="userinfo" method="post" action="infochange.lg" method ="post" target="blankifr"> -->
								<div class="form-group">
									<label class="form-label">Nickname</label> <input type="text"
										class="form-control" id="nickname" name="nickname"
										value=<%out.println((String) session.getAttribute("nickname"));%>
										required minlength="2" maxlength="10" placeholder="2자 이상">
								</div>
								<div class="form-group">
									<label class="form-label">Name</label> <input type="text"
										class="form-control" id="name" name="name"
										value=<%out.println((String) session.getAttribute("name"));%>
										required minlength="2" maxlength="10" placeholder="2자 이상">
								</div>
								<div class="form-group">
									<label class="form-label">E-mail</label> <input type="email"
										id="email" name="email" required
										pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$"
										maxlength="30" placeholder="ex)abc123@gmail.com"
										class="form-control mb-1"
										value=<%out.println((String) session.getAttribute("email"));%>>
								</div>
								<div class="form-group">
									<label class="form-label">phone</label> <input type="text"
										class="form-control"
										value=<%out.println((String) session.getAttribute("phone"));%>
										id="phone" name="phone" required
										pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" maxlength="13"
										placeholder=" - 자동">
								</div>

								<div class="form-group">
									<div class="alert alert-danger" id="type-danger">형식에 맞게
										입력해 주세요.</div>
									<!-- 								</form> -->
									<div class="text-right mt-3">
										<button type="button" class="btn btn-primary"
											onclick=changeinfo()>정보 저장</button>

										&nbsp;
										<button type="button" class="btn btn-primary"
											onclick=cancleinfo()>취소</button>
										
									</div>
								</div>
							</div>
						</div>
						

						<div class="tab-pane fade" id="account-change-password">
							<div class="card-body pb-2">

								<div class="form-group">
									<label class="form-label">Current password</label> <input
										type="password" class="form-control" id="password" required
										pattern="(?=.*\d)(?=.*[a-zA-Z])(?=.*[0-9]).{8,}" minlength="8"
										maxlength="20">
								</div>
								<div class="alert alert-danger" id="password-danger">비밀번호가
									틀렸습니다.</div>

								<div class="form-group">
									<label class="form-label">New password</label> <input
										type="password" class="form-control" id="newpassword" required
										pattern="(?=.*\d)(?=.*[a-zA-Z])(?=.*[0-9]).{8,}" minlength="8"
										maxlength="20" placeholder="숫자와 영어 포함 8자 이상">
								</div>

								<div class="form-group">
									<label class="form-label">Repeat new password</label> <input
										type="password" class="form-control" id="newrepeatpassword"
										required pattern="(?=.*\d)(?=.*[a-zA-Z])(?=.*[0-9]).{8,}"
										minlength="8" maxlength="20" placeholder="숫자와 영어 포함 8자 이상">
								</div>
								<div class="alert alert-danger" id="password-repeat-danger">비밀번호가
									일치하지 않습니다.</div>
								<div class="alert alert-danger" id="password-type-danger">형식을
									지켜주세요.</div>
								<div class="form-group">
									<div class="text-right mt-3">
										<button type="button" class="btn btn-primary"
											onclick=changepassword()>비밀번호 변경</button>
										
									</div>
								</div>

							</div>
						</div>
						
						<div class="tab-pane fade" id="account-info">
							<!-- 						부트스트랩 신청현황 -->




							<!-- 공사중 ~~~~~~ -->
							<div class="container">
								<div class="row">
									<div class="col-md-12">
										<div class="card card-white mb-5">

											<div class="card-body">
												<ul class="list-unstyled">
												<%
													RequestInfo ri = new RequestInfo();
													Connection con;
													Class.forName("com.mysql.cj.jdbc.Driver");
													System.out.println("DRIVER LOADING.....");
													con = DriverManager.getConnection("jdbc:mysql://localhost:3306/throwsgg?user=root&password=1234");
													System.out.println("Connection success!");
													PreparedStatement pstmt = null;
													ResultSet rs = null;
													
													List<reservationVO> list = new ArrayList<reservationVO>();
// 													List<List<String>> list = new ArrayList<List<String>>();
													String SQL = "select * from reservationtable where userid ='" + (String) session.getAttribute("id") + "' ORDER BY resDate DESC ;";
													System.out.println(SQL);
													pstmt = con.prepareStatement(SQL);
													rs = pstmt.executeQuery();
													int count=0;
													int index[]= new int[3];
													String phoneindex[] = new String[3];
													while(rs.next()){	//데이터 객체 리스트에 넣기
														reservationVO data = new reservationVO();
														data.setReservationIndex(rs.getInt(1));
														data.setPhonNumber(rs.getString(2));
														data.setResTime(rs.getString(3));
														data.setResDate(rs.getString(4));
														data.setResComment(rs.getString(5));
														data.setUserId(rs.getString(6));
														data.setUsername(rs.getString(7));
														data.setOpt(rs.getString(8));
														data.setDesertionNo(rs.getString(9));
														list.add(data);
														count++;
													}
													String pageStrNum = request.getParameter("pageNum");
													if (pageStrNum == null) { // 클릭한게 없으면 1번 페이지
														pageStrNum = "1";
													}
													int pageNum = Integer.parseInt(pageStrNum); //현재 페이지 번호
													int pageSize = 5;	// 5 페이지씩 선택할수 있음
													int pageItem = 3;	// 1페이지당 3개씩 보여주기
													
													
// 													for(int j=( 3 * pageNum ) -3 ; j<pageNum * pageItem; j++) { // 선택된 페이지 부터 3객씩 띄우기 
														
// 														out.println("j : "+j + list.get(j));
																
													
// 													}
													%>
												<% 
													for (int j=( 3 * pageNum) -3 ; j<pageNum * pageItem; j++){    		 
			if(j>=list.size()){
					break;
					}
	    		 if (ri.Daycompare(list.get(j).getResDate())) {%>
					<li class="position-relative booking">
					<div class="media">
					<div class="media-body">
					<h5 class="mb-4">
					<span class="mr-2 d-block d-sm-inline-block mb-1 mb-sm-0">신청자 : </span>
					<span class="border-right pr-2 mr-2"><%out.print(list.get(j).getUsername()); %></span>
					<span><%out.print(list.get(j).getPhonNumber()); %></span>
					<span class="badge badge-success ml-3">예약중</span>
					</h5>
					<div class="mb-3">
					<span class="mr-2 d-block d-sm-inline-block mb-2 mb-sm-0">신청 번호 : </span>
					<span class="bg-light-green"><%out.print(list.get(j).getReservationIndex()); %></span>
					</div>
					<div class="mb-3">
					<span class="mr-2 d-block d-sm-inline-block mb-2 mb-sm-0">신청 날짜 : </span>
					<span class="bg-light-green"><%out.print(list.get(j).getResDate()); %></span>
					</div>
					<div class="mb-3">
					<span class="mr-2 d-block d-sm-inline-block mb-2 mb-sm-0">신청 시간 : </span>
					<span class="bg-light-green"><%out.print(list.get(j).getResTime()); %></span>
					</div>
					<div class="mb-3">
					<span class="mr-2 d-block d-sm-inline-block mb-2 mb-sm-0">내용 : </span>
					<span ><%out.print(list.get(j).getResComment()); %></span>
					</div>
					<div class="mb-5">
					</div>
					
					<a href="#" class="btn-gray" onclick=delinfo(<%= list.get(j).getReservationIndex()%>,<%=list.get(j).getPhonNumber()%>) ><i class="far fa-times-circle"></i>신청취소</a>
					</div>
					</div>
					</li>
				<%}else { %>
					<li class="position-relative booking">
					<div class="media">
					<div class="media-body">
					<h5 class="mb-4">
					<span class="mr-2 d-block d-sm-inline-block mb-1 mb-sm-0">신청자 : </span>
					<span class="border-right pr-2 mr-2"><%out.print(list.get(j).getUsername()); %></span>
					<span><%out.print(list.get(j).getPhonNumber()); %></span>
					<span class="badge badge-success ml-3" style="color:#fff; background-color:gray">지난예약</span>
					</h5>
					<div class="mb-3">
					<span class="mr-2 d-block d-sm-inline-block mb-2 mb-sm-0">신청 번호 : </span>
					<span class="bg-light-gray"><%out.print(list.get(j).getReservationIndex()); %></span>
					</div>
					<div class="mb-3">
					<span class="mr-2 d-block d-sm-inline-block mb-2 mb-sm-0">신청 날짜 : </span>
					<span class="bg-light-gray"><%out.print(list.get(j).getResDate()); %></span>
					</div>
					<div class="mb-3">
					<span class="mr-2 d-block d-sm-inline-block mb-2 mb-sm-0">신청 시간 : </span>
					<span class="bg-light-gray"><%out.print(list.get(j).getResTime()); %></span>
					</div>
					<div class="mb-3">
					<span class="mr-2 d-block d-sm-inline-block mb-2 mb-sm-0">내용 : </span>
					<span ><%out.print(list.get(j).getResComment()); %></span>
					</div>
					<div class="mb-5">
					</div>
					</div>
					</div>
					</li>
				<%}
		} %>
													
												</ul>

											</div>
										</div>

									</div>
								</div>
								
								
<!-- 								번호 선택칸 부분  -->


								<div class="pt-3">
								
								<%
								if(count != 0){
									int pageCount = count/pageItem + (count%pageItem == 0? 0: 1); // 전체 페이지수 계산
									int startPage = ((pageNum-1)/pageItem)*pageItem+1;
									int endPage = startPage + pageItem-1;
									if(endPage>pageCount){
										endPage = pageCount;
									}
								
								%>
                        <ul class="pagination justify-content-end mb-0">
                        <% 
                        if (startPage> pageItem){	//이전 이 뜰 필요있는지 확인
                        %>
                            <li class="page-item ">
                                <a class="page-link" href="userinfo.jsp?pageNum=<%=startPage-pageSize%>">Previous</a>
                            </li>
                            <%} 
                            for(int i=startPage; i<=endPage; i++){
                            	if(i == pageNum){//out.print("start : " +startPage +"end : " + endPage + "i : "+ i);
                            %>
                            <li class="page-item active"><a class="page-link"><%=i%></a></li>
                            <%}else{ %>
                            <li class="page-item"><a class="page-link" href="userinfo.jsp?pageNum=<%=i%>"><%=i%></a></li>
                            <%}} 
                            if(endPage<pageCount){
                            %>
                            
                            <li class="page-item">
                                <a class="page-link" href="userinfo.jsp?pageNum=<%=startPage+pageSize%>">Next</a>
                            </li>
                            <%} }%>
                            
                            
                        </ul>
                    </div>
							</div>
							<!-- 신청현황 끝 -->
						</div>
						
						<!--  낵가 쓴 글               -->
	
	
	<div class="tab-pane fade" id="account-board">
							<div class="container">
								<div class="row">
									<div class="col-md-12">
										<div class="card card-white mb-5">

											<div class="card-body">
												<ul class="list-unstyled">
												<%
													
													Connection con2;
													Class.forName("com.mysql.cj.jdbc.Driver");
													System.out.println("DRIVER LOADING.....");
													con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/throwsgg?user=root&password=1234");
													System.out.println("Connection success!");
													PreparedStatement pstmt2 = null;
													ResultSet rs2 = null;
													
													List<BoardDTO> list2 = new ArrayList<BoardDTO>();
// 													List<List<String>> list = new ArrayList<List<String>>();
													String SQL2 = "select * from board where id ='" + (String) session.getAttribute("id") + "' ORDER BY status DESC ;";
													System.out.println(SQL2);
													pstmt2 = con2.prepareStatement(SQL2);
													rs2 = pstmt2.executeQuery();
													int count2=0;
													int index2=0;
													while(rs2.next()){	//데이터 객체 리스트에 넣기
														BoardDTO data2 = new BoardDTO();
														data2.setNum(rs2.getInt(1));
														data2.setId(rs2.getString(2));
														data2.setName(rs2.getString(3));
														data2.setSubject(rs2.getString(4));
														data2.setContent(rs2.getString(5));
														data2.setRegist_day(rs2.getString(6));
														data2.setHit(rs2.getInt(7));
														data2.setPhone(rs2.getString(8));
														data2.setPetName(rs2.getString(9));
														data2.setBreed(rs2.getString(10));
														data2.setLostDate(rs2.getString(11));
														data2.setGender(rs2.getString(12));
														data2.setAge(rs2.getString(13));
														data2.setLostPlace(rs2.getString(14));
														data2.setFigure(rs2.getString(15));
														data2.setPetImg(rs2.getString(16));
														data2.setStatus(rs2.getString(17));
														
														list2.add(data2);
														count2++;
													}
													String pageStrNum2 = request.getParameter("pageboard");
													if (pageStrNum2 == null) { // 클릭한게 없으면 1번 페이지
														pageStrNum2 = "1";
													}
													int pageboard = Integer.parseInt(pageStrNum2); //현재 페이지 번호
													int pageSize2 = 5;	// 5 페이지씩 선택할수 있음
													int pageItem2 = 3;	// 1페이지당 3개씩 보여주기
													
													
// 													for(int j=( 3 * pageNum ) -3 ; j<pageNum * pageItem; j++) { // 선택된 페이지 부터 3객씩 띄우기 
// 														out.println("j : "+j + list.get(j));
// 													}
													%>
												<% 
													for (int j=( 3 * pageboard) -3 ; j<pageboard * pageItem2; j++){    		 
			if(j>=list2.size()){
					break;
						}
						
						if(list2.get(j).getStatus().equals("lost")){%> 
					<li class="position-relative booking">
					<div class="media">
					<div class="media-body">
					<h5 class="mb-4">
					<span class="mr-2 d-block d-sm-inline-block mb-1 mb-sm-0">신청자 : </span>
					<span class="border-right pr-2 mr-2"><%out.print(list2.get(j).getName()); %></span>
					<span><%out.print(list2.get(j).getPhone()); %></span>
					<span class="badge badge-success ml-3">공고중</span>
					</h5>
					<div class="mb-3">
					<span class="mr-2 d-block d-sm-inline-block mb-2 mb-sm-0">신청 번호 : </span>
					<span class="bg-light-green"><%out.print(list2.get(j).getNum()); %></span>
					</div>
					<div class="mb-3">
					<span class="mr-2 d-block d-sm-inline-block mb-2 mb-sm-0">신청 날짜 : </span>
					<span class="bg-light-green"><%out.print(list2.get(j).getRegist_day()); %></span>
					</div>
					<div class="mb-3">
					<span class="mr-2 d-block d-sm-inline-block mb-2 mb-sm-0">내용 : </span>
					<span ><%out.print(list2.get(j).getContent()); %></span>
					</div>
					<div class="mb-5">

					<div>
					<a onclick=changeStatus(<%= list2.get(j).getNum()%>) class="btn-gray"><i class="far fa-check-circle"></i>완료</a>&nbsp
					<a href="BoardViewPetAction.do?num=<%=list2.get(j).getNum()%>&pageNum=1" class="btn-gray" >자세히 보기</a>
					
					</div>
				
					</div>
					</li>
						
					<%}else { %>
					<li class="position-relative booking">
					<div class="media">
					<div class="media-body">
					<h5 class="mb-4">
					<span class="mr-2 d-block d-sm-inline-block mb-1 mb-sm-0">신청자 : </span>
					<span class="border-right pr-2 mr-2"><%out.print(list2.get(j).getName()); %></span>
					<span><%out.print(list2.get(j).getPhone()); %></span>
					<span class="badge badge-success ml-3" style="color:#fff; background-color:gray">공고종료</span>
					</h5>
					<div class="mb-3">
					<span class="mr-2 d-block d-sm-inline-block mb-2 mb-sm-0">신청 번호 : </span>
					<span class="bg-light-gray"><%out.print(list2.get(j).getNum()); %></span>
					</div>
					<div class="mb-3">
					<span class="mr-2 d-block d-sm-inline-block mb-2 mb-sm-0">신청 날짜 : </span>
					<span class="bg-light-gray"><%out.print(list2.get(j).getRegist_day()); %></span>
					</div>
					
					<div class="mb-3">
					<span class="mr-2 d-block d-sm-inline-block mb-2 mb-sm-0">내용 : </span>
					<span ><%out.print(list2.get(j).getContent()); %></span>
					</div>
					<div class="mb-5">
					
					
					<div>
					<a href="BoardViewPetAction.do?num=<%=list2.get(j).getNum()%>&pageNum=1" class="btn-gray" >자세히 보기</a>
					</div>
				
					</div>
					</div>
					</div>
					</li>
				<% }
						} %>
													
												</ul>

											</div>
										</div>

									</div>
								</div>
								
								
<!-- 								번호 선택칸 부분  -->


								<div class="pt-3">
								
								<%
								if(count2 != 0){
									int pageCount2 = count2/pageItem2 + (count2%pageItem2 == 0? 0: 1); // 전체 페이지수 계산
									int startPage2 = ((pageboard-1)/pageItem2)*pageItem2+1;
									int endPage2 = startPage2 + pageItem2-1;
									if(endPage2>pageCount2){
										endPage2 = pageCount2;
									}
								
								%>
                        <ul class="pagination justify-content-end mb-0">
                        <% 
                        if (startPage2> pageItem2){	//이전 이 뜰 필요있는지 확인
                        %>
                            <li class="page-item ">
                                <a class="page-link" href="userinfo.jsp?pageboard=<%=startPage2-pageSize2%>">Previous</a>
                            </li>
                            <%} 
                            for(int i=startPage2; i<=endPage2; i++){
                            	if(i == pageboard){//out.print("start : " +startPage +"end : " + endPage + "i : "+ i);
                            %>
                            <li class="page-item active"><a class="page-link"><%=i%></a></li>
                            <%}else{ %>
                            <li class="page-item"><a class="page-link" href="userinfo.jsp?pageboard=<%=i%>"><%=i%></a></li>
                            <%}} 
                            if(endPage2<pageCount2){
                            %>
                            
                            <li class="page-item">
                                <a class="page-link" href="userinfo.jsp?pageboard=<%=startPage2+pageSize2%>">Next</a>
                            </li>
                            <%} }%>
                            
                            
                        </ul>
                    </div>
							</div>
						</div>
	<!-- 주문목록 -->
	<div class="tab-pane fade" id="account-orderList">
							<div class="container">
								<div class="row">
									<div class="col-md-12">
										<div class="card card-white mb-5">

											<div class="card-body">
												<ul class="list-unstyled">
												<%
												Connection con3;
												Class.forName("com.mysql.cj.jdbc.Driver");
												System.out.println("DRIVER LOADING.....");
												con3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/throwsgg?user=root&password=1234");
												System.out.println("Connection success!");
													System.out.println("DRIVER LOADING.....");
													System.out.println("Connection success!");
													PreparedStatement pstmt3 = null;
													ResultSet rs3 = null;
													
													ArrayList<SaleorderVO> list3 = new ArrayList<SaleorderVO>();
// 													List<List<String>> list = new ArrayList<List<String>>();
													String SQL3 = "select * from throwsgg.saleorder where useriD ='" + (String) session.getAttribute("id") + "' ORDER BY orderdate DESC ;";
													System.out.println(SQL3);
													pstmt3 = con3.prepareStatement(SQL3);
													rs3 = pstmt3.executeQuery();
													int count3=0;
													int index3=0;
													while(rs3.next()){	//데이터 객체 리스트에 넣기
														SaleorderVO vo = new SaleorderVO(rs3.getString(1),rs3.getString(2),rs3.getString(3),rs3.getString(4),rs3.getString(5),rs3.getString(6),rs3.getString(7),rs3.getInt(8),rs3.getInt(9),rs3.getString(10),rs3.getString(11),rs3.getBoolean(12));
													list3.add(vo);
													}
													String pageStrNum3 = request.getParameter("pageboardOrder");
													if (pageStrNum3 == null) { // 클릭한게 없으면 1번 페이지
														pageStrNum3 = "1";
													}
													int pageboard3 = Integer.parseInt(pageStrNum3); //현재 페이지 번호
													int pageSize3 = 5;	// 5 페이지씩 선택할수 있음
													int pageItem3 = 3;	// 1페이지당 3개씩 보여주기
													
													
// 													for(int j=( 3 * pageNum ) -3 ; j<pageNum * pageItem; j++) { // 선택된 페이지 부터 3객씩 띄우기 
// 														out.println("j : "+j + list.get(j));
// 													}
													%>
												<% 
													for (int j=( 3 * pageboard3) -3 ; j<pageboard3 * pageItem3; j++){     
			if(j>=list3.size()){
					break;
						}
						
						%> <!--결제완료 취소완료--> 
					<li class="position-relative booking">
					<div class="media">
					<div class="media-body">
					<h5 class="mb-4">
					<span class="mr-2 d-block d-sm-inline-block mb-1 mb-sm-0">수령인 : </span>
					<span class="border-right pr-2 mr-2"><%out.print(list3.get(j).getRecipient()); %></span>
					<span><%out.print(list3.get(j).getTel()); %></span>
					<%if(list3.get(j).isStatus()){ %>
					<span class="badge badge-success ml-3">결제완료</span>
					<%}else{ %>
					<span class="badge badge-success ml-3" style="color:#fff; background-color:gray">취소완료</span>
					<%}%>
					</h5>
					<div class="mb-3">
					<span class="mr-2 d-block d-sm-inline-block mb-2 mb-sm-0">주문 번호 : </span>
					<span class="bg-light-green"><%out.print(list3.get(j).getSaleID()); %></span>
					</div>
					<div class="mb-3">
					<span class="mr-2 d-block d-sm-inline-block mb-2 mb-sm-0">주문 날짜 : </span>
					<span class="bg-light-green"><%out.print(list3.get(j).getOrderdate()); %></span>
					</div>
					<div class="mb-3">
					<span class="mr-2 d-block d-sm-inline-block mb-2 mb-sm-0">결제 방법 : </span>
					<span class="bg-light-green"><%=list3.get(j).getCardname()%> <%=list3.get(j).getCardno()%></span>
					</div>
					<div class="mb-3">
					<span class="mr-2 d-block d-sm-inline-block mb-2 mb-sm-0">결제 금액 : </span>
					<span class="bg-light-green"><%=list3.get(j).getTotal()%>원</span>
					</div>
					<div class="mb-5">

					<div>
					<a href="orderDetail.str?saleID=<%=list3.get(j).getSaleID()%>"  class="btn-gray">자세히 보기</a>&nbsp
					<a onclick="detailCardoder('<%=list3.get(j).getDetailLink()%>')" class="btn-gray" >영수증</a>
							<%if(list3.get(j).isStatus()){ %>
					<a href="orderCancle.str?saleID=<%=list3.get(j).getSaleID()%>&&totalPrice=<%=list3.get(j).getTotal()%>"   class="btn-gray" >주문취소</a>
					<%} %>
					</div>
				
					</div>
					</li><%}%>
												</ul>

											</div>
										</div>

									</div>
								</div>
								
								
<!-- 								번호 선택칸 부분  -->


								<div class="pt-3">
								
								<%
								if(count3 != 0){
									int pageCount3 = count3/pageItem3 + (count3%pageItem3 == 0? 0: 1); // 전체 페이지수 계산
									int startPage3 = ((pageboard3-1)/pageItem3)*pageItem3+1;
									int endPage3 = startPage3 + pageItem3 - 1;
									if(endPage3>pageCount3){
										endPage3 = pageCount3;
									}
								
								%>
                        <ul class="pagination justify-content-end mb-0">
                        <% 
                        if (startPage3> pageItem3){	//이전 이 뜰 필요있는지 확인
                        %>
                            <li class="page-item ">
                                <a class="page-link" href="userinfo.jsp?pageboardOrder=<%=startPage3-pageSize3%>">Previous</a>
                            </li>
                            <%} 
                            for(int i=startPage3; i<=endPage3; i++){
                            	if(i == pageboard3){//out.print("start : " +startPage +"end : " + endPage + "i : "+ i);
                            %>
                            <li class="page-item active"><a class="page-link"><%=i%></a></li>
                            <%}else{ %>
                            <li class="page-item"><a class="page-link" href="userinfo.jsp?pageboardOrder=<%=i%>"><%=i%></a></li>
                            <%}} 
                            if(endPage3<pageCount3){
                            %>
                            
                            <li class="page-item">
                                <a class="page-link" href="userinfo.jsp?pageboardOrder=<%=startPage3+pageSize3%>">Next</a>
                            </li>
                            <%} }%>
                            
                            
                        </ul>
                    </div>
							</div>
						</div>
						
						
						
					</div>
				</div>
			</div>
		</div>



	</div>
						
						
						
					</div>
				</div>
			</div>
		</div>



	</div>
	
	
	
	

	<!-- Prism -->

	<script type="text/javascript"
		src="https://mdbgo.io/mikolaj-smolenski/mdb5-demo-pro/dev/js/new-prism.js"></script>
	<script type="text/javascript"
		src="https://mdbgo.io/mikolaj-smolenski/mdb5-demo-pro/dev/js/dist/mdbsnippet.min.js"></script>
	<!-- MDB -->
	<script type="text/javascript" src="js/mdb.min.js"></script>
	<!-- Custom scripts -->
	<script type="text/javascript"></script>

	<script src="http://code.jquery.com/jquery-latest.js"></script>
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
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="js/google-map.js"></script>
	<script src="js/main.js"></script>

	<!-- YOUR WORK HERE -->
	<script>
function detailCardoder(url){
	 var option="resizable=no, scrollbars=no, status=no,width=500, height=500";

	 window.open(url,'test',option);
}
// 	location.reload();
 var openFile = function(event) {
        var input = event.target;

        var reader = new FileReader();
        reader.onload = function(){
          var dataURL = reader.result;
          var output = document.getElementById('output');
          output.src = dataURL;
//           var editor = document.getElementById('editor');
//           editor.src = dataURL;
        };
        reader.readAsDataURL(input.files[0]);
      };
      
      function resetimg(){
    	  var output = document.getElementById('output');
          output.src = "https://bootdey.com/img/Content/avatar/avatar1.png";
      }
      
    
      
      function cancleinfo(){
    	 var modals = document.getElementById("changeinfo-success");
    	 $("#changeinfo-success").modal("show");
//     	  var name = document.forms['userinfo']['name'];
//     	  console.log(name.value);
    	  <%String nickname = (String) session.getAttribute("nickname");
String name = (String) session.getAttribute("name");
String email = (String) session.getAttribute("email");
String phone = (String) session.getAttribute("phone");%>
<%--     	  name.setAttribute('value','<%out.print(name);%>'); --%>
		  $('#nickname').val('<%out.print(nickname);%>');
    	  document.getElementById('name').value='<%out.print(name);%>';
    	  document.getElementById('email').value='<%out.print(email);%>';
    	  $('#phoneNum').val('<%out.print(phone);%>');
      }
     
      
      $(document).ready(function(){
    	    $('a[data-toggle="tab"]').on('show.bs.tab', function(e) {
    	        localStorage.setItem('activeTab', $(e.target).attr('href'));
    	    });
    	    var activeTab = localStorage.getItem('activeTab');
    	    if(activeTab){
    	        $('#myTab a[href="' + activeTab + '"]').tab('show');
    	    }
    	});
      
      function delinfo(num, phone){
 
    	  var index = num;
    	  var phone = phone;
    	  $.ajax({
    		  type: "post",
    			url: "delinfo.lg",
    			data: {
    				id : index,
    				phonenNm : phone,
    			}
    		  
    	  }).done(function(data){
    		  window.location.reload();
    		  alert("취소 완료!");
    	  }).error(function(data){
    		  alert(index)
    	  })
      }
      
      function changeStatus(index){
    	  var num = index;
    	  $.ajax({
    		  type:"post",
    		  url: "changeStatus.lg",
    		  data:{
    			  num: num,
    		  }
    	  }).done(function (data){
    		  window.location.reload();
    		  alert("공고 모집중에서 완료로 변경되었습니다!");
    	  }).error(function(data){
    		  alert("error")
    	  })
      }
      </script>
      <script src="js/newpasswordspace.js"></script>
	<!-- JavaScript Bundle with Popper -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa"
		crossorigin="anonymous"></script>
	<script src="js/telcheck.js"></script>
	<script src="js/repeatPW.js"></script>
	<script src="js/changeinfo.js"></script>
	<script src="js/otherspace.js"></script>
	<script src="js/delMember.js"></script>
	
	"></script>
	
</body>
<!-- <iframe name='blankifr' style='display:none;'></iframe> -->
</html>