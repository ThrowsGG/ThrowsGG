document.getElementById('login-danger').style.display = 'none';

$(document).ready(function() {

	var $loginid = $("#loginid") //input에 입력된 내용을 가져온다.
	var $loginPassword = $("#loginPassword") //input에 입력된 내용을 가져온다.

	$("#loginbutton").click(function() {//button 클릭이 발생했을 경우 이벤트발생
		signup()
	})

	$("#loginid").keydown(function(keyNum) {
		//현재의 키보드의 입력값을 keyNum으로 받음
		if (keyNum.keyCode == 13) {
			// keydown으로 발생한 keyNum의 숫자체크
			// 숫자가 enter의 아스키코드 13과 같으면
			// 기존에 정의된 클릭함수를 호출
			$("#loginbutton").click()
		}
	})

	$("#loginPassword").keydown(function(keyNum) {
		//현재의 키보드의 입력값을 keyNum으로 받음
		if (keyNum.keyCode == 13) {
			// keydown으로 발생한 keyNum의 숫자체크
			// 숫자가 enter의 아스키코드 13과 같으면
			// 기존에 정의된 클릭함수를 호출
			$("#loginbutton").click()
		}
	})

})

function signup() {
	var loginid = document.getElementById('loginid');
	var loginpw = document.getElementById('loginPassword');
	$.ajax({
		type: "post",
		url: "login.lg",
		dataType: "text",
		data: {
			id: loginid.value,
			pw: loginpw.value,
		}
	}).done(function(data) {
		if (data != "null") {
			window.location.href = "index.jsp";
		} else {
			document.getElementById('login-danger').style.display = '';
		}
	}).error(function(data) {
		document.getElementById('login-danger').style.display = '';
	})

}