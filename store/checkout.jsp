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
<style type="text/css">
.btn.btn-primary {
	color: #212529;
	background-color: #ffcb0d !important;
	border-color: #ffc800 !important;
}
</style>
</head>

<body>
	<!-- Breadcrumb Start -->
	<div class="container-fluid">
		<div class="row px-xl-5">
			<div class="col-12">
				<nav class="breadcrumb bg-light mb-30">
					<a class="breadcrumb-item text-dark" href="#">Home</a> <a class="breadcrumb-item text-dark" href="#">Shop</a> <span class="breadcrumb-item active">Checkout</span>
				</nav>
			</div>
		</div>
	</div>
	<!-- Breadcrumb End -->


	<!-- Checkout Start -->
	<div class="container-fluid">
		<div class="row px-xl-5">
			<div class="col-lg-8">
				<h5 class="section-title position-relative text-uppercase mb-3">
					<span class="bg-secondary pr-3">Billing Address</span>
				</h5>
				<div class="bg-light p-30 mb-5">
					<div class="row">
						<div class="col-md-6 form-group">
							<label></label>SENDER<input class="form-control" id="name" type="text" value="${sessionScope.name}">
						</div>
						<div class="col-md-6 form-group">
							<label>RECIPIENT</label> <input class="form-control" type="text" id="recipient"  value="${sessionScope.name}">
						</div>
						<div class="col-md-6 form-group">
							<label>E-mail</label> <input class="form-control" id="email" type="text" placeholder="example@email.com" value="${sessionScope.email }">
						</div>
						<div class="col-md-6 form-group">
							<label>Mobile No</label> <input type="tel" class="form-control" name="phone" id="phone" required pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" maxlength="13" placeholder=" - 자동" value="${sessionScope.phone }" />
						</div>
						<div class="col-md-6 form-group">
							<label>Address Line </label> <input type="text" id="sample4_postcode" placeholder="우편번호" class="form-control" readonly="readonly" onclick="sample4_execDaumPostcode()">
						</div>
						<div class="col-md-6 form-group">
							<label>Address Line </label> <input type="text" id="sample4_detailAddress" placeholder="상세주소" class="form-control">
						</div>
						<div class="col-md-6 form-group">
							<label>Address Line </label> <input type="text" id="sample4_roadAddress" placeholder="도로명주소" class="form-control" readonly="readonly" onclick="sample4_execDaumPostcode()">
						</div>
						<div class="col-md-6 form-group">
							<label>Address Line </label> <input type="text" id="sample4_jibunAddress" placeholder="지번주소" class="form-control" readonly="readonly" onclick="sample4_execDaumPostcode()">
						</div>
						<input type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" class="btn btn-block btn-primary font-weight-bold py-3"><br> <span id="guide" style="color: #999; display: none" class="form-control"></span>
						<!-- 						<div class="col-md-12"> -->
						<!-- 							<div class="custom-control custom-checkbox"> -->
						<!-- 								<input type="checkbox" class="custom-control-input" id="shipto"> <label class="custom-control-label" for="shipto" data-toggle="collapse" data-target="#shipping-address">Ship to different address</label> -->
						<!-- 							</div> -->
						<!-- 						</div> -->
					</div>
				</div>
				<!-- 				<div class="collapse mb-5" id="shipping-address"> -->
				<!-- 					<h5 class="section-title position-relative text-uppercase mb-3"> -->
				<!-- 						<span class="bg-secondary pr-3">Shipping Address</span> -->
				<!-- 					</h5> -->
				<!-- 					<div class="bg-light p-30"> -->
				<!-- 						<div class="row"> -->
				<!-- 							<div class="col-md-6 form-group"> -->
				<!-- 								<label>First Name</label> <input class="form-control" type="text" placeholder="John"> -->
				<!-- 							</div> -->
				<!-- 							<div class="col-md-6 form-group"> -->
				<!-- 								<label>Last Name</label> <input class="form-control" type="text" placeholder="Doe"> -->
				<!-- 							</div> -->
				<!-- 							<div class="col-md-6 form-group"> -->
				<!-- 								<label>E-mail</label> <input class="form-control" type="text" placeholder="example@email.com"> -->
				<!-- 							</div> -->
				<!-- 							<div class="col-md-6 form-group"> -->
				<!-- 																<label>Mobile No</label> <input class="form-control" type="tel" required pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" maxlength="13" placeholder=" - 자동" />  -->
				<!-- 								<label>Mobile No</label> <input type="tel" class="form-control" name="phone" id="phone01" required pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" maxlength="13" placeholder=" - 자동" /> -->
				<!-- 							</div> -->
				<!-- 							<div class="col-md-6 form-group"> -->
				<!-- 								<label>Address Line 1</label> <input class="form-control" type="text" placeholder="123 Street"> -->
				<!-- 							</div> -->
				<!-- 							<div class="col-md-6 form-group"> -->
				<!-- 								<label>Address Line 2</label> <input class="form-control" type="text" placeholder="123 Street"> -->
				<!-- 							</div> -->
				<!-- 						</div> -->
				<!-- 					</div> -->
				<!-- 				</div> -->
			</div>
			<div class="col-lg-4">
				<div class="mb-5">
					<h5 class="section-title position-relative text-uppercase mb-3">
						<span class="bg-secondary pr-3">Payment</span>
					</h5>
					<div class="bg-light p-30">
						<button type="button" class="btn btn-block btn-primary font-weight-bold py-3" onclick="payment()">Place Order</button>
					</div>
				</div>
				<h5 class="section-title position-relative text-uppercase mb-3">
					<span class="bg-secondary pr-3">Order Total</span>
				</h5>
				<div class="bg-light p-30 mb-5">
					<div class="border-bottom">
						<h6 class="mb-3">Products</h6>
						<table class="table table-light table-borderless table-hover text-center mb-0">
							<thead class="thead-dark">
								<tr>
									<th>Products</th>
									<th>Quantity</th>
									<th>Total</th>
								</tr>
							</thead>
							<tbody class="align-middle">
								<c:forEach var="carVo" items="${carVoList}">
									<tr>
										<td class="align-middle" style="text-align: left; font-size: 12px;"><img src="${carVo.getFirstImg()}" alt="" style="width: 50px;">${carVo.getPname() }</td>
										<td class="align-middle">${carVo.getAmount()}</td>
										<td class="align-middle" id="totalPrice${voIndex.index}">${carVo.getTotalPrice()}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
					<div class="border-bottom pt-3 pb-2">
						<div class="d-flex justify-content-between mb-3">
							<h6>Subtotal</h6>
							<h6>${totalMoney}</h6>
						</div>
						<div class="d-flex justify-content-between">
							<h6 class="font-weight-medium">Shipping</h6>
							<h6 class="font-weight-medium">2500</h6>
						</div>
					</div>
					<div class="pt-2">
						<div class="d-flex justify-content-between mt-2">
							<h5>Total</h5>
							<h5 id="FtotalPrice">${totalMoney + 2500}</h5>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Checkout End -->


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
	<!-- Daum 우편번호 api -->
<!-- 	<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> -->
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
	<!-- iamport.payment.js -->
	<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
	<script type="text/javascript">
	function payment() {
        var IMP = window.IMP; // 생략가능
        IMP.init('imp60214404'); // 'iamport' 대신 부여받은 "가맹점 식별코드"를 사용
        var msg;
        
        var oderName = '${carVoList.get(0).getPname() } 외 ${carVoList.size() - 1}개';
		var name = $( 'input#name' ).val();
		var recipient = $( 'input#recipient' ).val();
		var phone = $( 'input#phone' ).val();
		var email =  $( 'input#email' ).val();
		var totalAmount = document.getElementById("FtotalPrice").innerText;
		var sample4_roadAddress = $( 'input#sample4_roadAddress' ).val();
		var sample4_detailAddress = $( 'input#sample4_detailAddress' ).val();
		if (name != ''&& phone != '' && email != '' && sample4_roadAddress != '' && sample4_detailAddress != '') {
	        IMP.request_pay({
	            pg : 'html5_inicis',
	            pay_method : 'card',
	            merchant_uid : 'merchant_' + new Date().getTime(),
	            name : oderName,
	            amount : totalAmount,
	            buyer_email : email,
	            buyer_name : name,
	            buyer_tel : phone,
	            buyer_addr : sample4_roadAddress+' '+sample4_detailAddress,
				buyer_postcode : '123-456',
				}, function(rsp) { // callback
					if (rsp.success) {
						// 결제 성공 시 로직,
						msg = '결제가 완료되었습니다.';
						msg += '\n은행 : ' + rsp.card_name;
						msg += '\n카드번호 : ' + rsp.card_number;
						msg += '\n주문번호 : ' + rsp.imp_uid;
						msg += '\nName : ' + oderName;
						msg += '\namount : ' + totalAmount;
						msg += '\nbuyer_email : ' + email;
						msg += '\nbuyer_name : ' + name;
						msg += '\nbuyer_tel : ' + phone;
						msg += '\nbuyer_addr : ' + sample4_roadAddress+' '+sample4_detailAddress;
						alert(msg);
						InsertSaleOrder(rsp.imp_uid, rsp.buyer_addr, rsp.buyer_tel, rsp.card_name, rsp.card_number, totalAmount, rsp.receipt_url,recipient);
					} else {
						// 결제 실패 시 로직,
						msg = '결제에 실패하였습니다.';
						msg += '에러내용 : ' + rsp.error_msg;
						alert(msg);
					}
				});
		} else{
			alert('양식이 유효하지 않습니다');
		}

	}
	function InsertSaleOrder(saleID,addr,tel,cardName,cardNo,total,detailLink,recipient) { // 제출 버튼 이벤트 지정
	    console.log('InsertSaleOrderAjax'); 
	    $.ajax({
	        type: "POST", // HTTP Method
	        url: "InsertSaleOrder.str", // 목적지
	        data: {
	            userid: '${sessionScope.id}', // 전송 데이터
	            saleID : saleID,
	            addr: addr,
	            tel: tel,
	            cardName: cardName,
	    		cardno: cardNo,
	    		total: total,
	    		detailLink: detailLink,
	    		recipient: recipient,
	    		prodcount: '${carVoList.size()}'
	    	}
	    }).done(function(data) {
	    	location.replace('userinfo.jsp');
	    }).fail(function(Response) {
	        console.log('에러')
	    });
	}

		function sample4_execDaumPostcode() {
			new daum.Postcode(
					{
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var roadAddr = data.roadAddress; // 도로명 주소 변수
							var extraRoadAddr = ''; // 참고 항목 변수

							// 법정동명이 있을 경우 추가한다. (법정리는 제외)
							// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
							if (data.bname !== ''
									&& /[동|로|가]$/g.test(data.bname)) {
								extraRoadAddr += data.bname;
							}
							// 건물명이 있고, 공동주택일 경우 추가한다.
							if (data.buildingName !== ''
									&& data.apartment === 'Y') {
								extraRoadAddr += (extraRoadAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
							if (extraRoadAddr !== '') {
								extraRoadAddr = ' (' + extraRoadAddr + ')';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							document.getElementById('sample4_postcode').value = data.zonecode;
							document.getElementById("sample4_roadAddress").value = roadAddr;
							document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

							// 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
							//                 if(roadAddr !== ''){
							//                     document.getElementById("sample4_extraAddress").value = '';
							//                 } else {
							//                     document.getElementById("sample4_extraAddress").value = '';
							//                 }

							var guideTextBox = document.getElementById("guide");
							// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
							if (data.autoRoadAddress) {
								var expRoadAddr = data.autoRoadAddress
										+ extraRoadAddr;
								guideTextBox.innerHTML = '(예상 도로명 주소 : '
										+ expRoadAddr + ')';
								guideTextBox.style.display = 'block';

							} else if (data.autoJibunAddress) {
								var expJibunAddr = data.autoJibunAddress;
								guideTextBox.innerHTML = '(예상 지번 주소 : '
										+ expJibunAddr + ')';
								guideTextBox.style.display = 'block';
							} else {
								guideTextBox.innerHTML = '';
								guideTextBox.style.display = 'none';
							}
						}
					}).open();
		}

		var autoHypenPhone = function(str) {
			str = str.replace(/[^0-9]/g, '');
			var tmp = '';
			if (str.length < 4) {
				return str;
			} else if (str.length < 7) {
				tmp += str.substr(0, 3);
				tmp += '-';
				tmp += str.substr(3);
				return tmp;
			} else if (str.length < 11) {
				tmp += str.substr(0, 3);
				tmp += '-';
				tmp += str.substr(3, 3);
				tmp += '-';
				tmp += str.substr(6);
				return tmp;
			} else {
				tmp += str.substr(0, 3);
				tmp += '-';
				tmp += str.substr(3, 4);
				tmp += '-';
				tmp += str.substr(7);
				return tmp;
			}

			return str;
		}

		var phoneNum = document.getElementById('phone');
		phoneNum.onkeyup = function() {
			console.log(this.value);
			this.value = autoHypenPhone(this.value);
		}
	</script>
</body>

</html>