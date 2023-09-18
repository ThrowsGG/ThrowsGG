


function register() {

	var formregister = document.formregister;
	var nickname = document.getElementById('nickname');
	var name = document.getElementById('name');
	var phoneNum = document.getElementById('phoneNum');
	var email = document.getElementById('email');
	var id = document.getElementById('id');
	var password = repeatpw;
	if (name.checkValidity() && nickname.checkValidity() && phoneNum.checkValidity() && email.checkValidity() && id.checkValidity() && password && !idTF) {
		formregister.method = "post";
		formregister.action = "insert.lg";
		formregister.submit();    // 자바스크립트에서 서블릿으로 전송

	} else {

	}
}