/**
 * 
 */


var names = document.getElementById('name');
names.onkeyup = function checkname() {
	var namevalue = document.getElementById('name').value;
	if (window.event.keyCode == 32) {     // 공백 체크     
		this.value = namevalue.trim();
	}
}


var nickname = document.getElementById('nickname');
nickname.onkeyup = function repeat() {
	var nick = document.getElementById('nickname').value;
	if (window.event.keyCode == 32) {     // 공백 체크                             
		this.value = nick.trim();
	}
}


var email = document.getElementById('email');
email.onkeyup = function repeat() {
	var emailvalue = document.getElementById('email').value;
	if (window.event.keyCode == 32) {     // 공백 체크   
		this.value = '';                       // 커서가 앞으로가는 오류 해결
		this.value = emailvalue.trim();
	}
}