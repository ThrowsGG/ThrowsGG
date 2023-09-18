///**
// * 
// */

document.getElementById('password-danger').style.display = 'none';
document.getElementById('password-repeat-danger').style.display = 'none';
document.getElementById('password-type-danger').style.display = 'none';
document.getElementById('type-danger').style.display = 'none';

function changeinfo() {
	var img = jQuery('#output').attr("src");
	var nickname = document.getElementById('nickname');
	var name = document.getElementById('name');
	var email = document.getElementById('email');
	var phoneNum = document.getElementById('phone');
	if (name.checkValidity() && phoneNum.checkValidity() && email.checkValidity() && nickname.checkValidity()) {
		$.ajax({
			type: "post",
			url: "infochange.lg",
			dataType: "text",
			data: {
				img: img,
				nickname: nickname.value,
				name: name.value,
				email: email.value,
				phone: phoneNum.value,
			}
		}).done(function(data) {
			if (data == "true") {
				location.replace('userinfo.jsp');
				alert("수정 완료")
			} else {
				alert("??");
			}
		}).error(function(data) {
			alert("??????");
		})
	} else {
		document.getElementById('type-danger').style.display = '';
	}
}

function checkrepeatpassword() {
	var npw = document.getElementById('newpassword').value;
	var nrpw = document.getElementById('newrepeatpassword').value;
	if (npw == nrpw) {
		return true;
	} else {
		return false;
	}
}

function changepassword() {
	var pw = document.getElementById('password');
	var npw = document.getElementById('newpassword');
	var nrpw = document.getElementById('newrepeatpassword');

	if (pw.checkValidity() && npw.checkValidity() && nrpw.checkValidity()) {
		if (checkrepeatpassword()) {
			$.ajax({
				type: "post",
				url: "pwcheck.lg",
				dataType: "text",
				data: {
					pw: pw.value,
					npw: npw.value,
					nrpw: nrpw.value,
				}
			}).done(function(data) {
				if (data == "success") {
					document.getElementById('password-repeat-danger').style.display = 'none';
					document.getElementById('password-danger').style.display = 'none';
					document.getElementById('password-type-danger').style.display = 'none';
					$('#password').val('');
					$('#newpassword').val('');
					$('#newrepeatpassword').val('');
					alert("변경완료~!");

				} else {
					document.getElementById('password-type-danger').style.display = 'none';
					document.getElementById('password-repeat-danger').style.display = 'none';
					document.getElementById('password-danger').style.display = '';
				}
			}).error(function(data) {
				alert("error")
			})
		} else {

			document.getElementById('password-danger').style.display = 'none';
			document.getElementById('password-type-danger').style.display = 'none';
			document.getElementById('password-repeat-danger').style.display = '';
		}
	} else {
		document.getElementById('password-danger').style.display = 'none';
		document.getElementById('password-repeat-danger').style.display = 'none';
		document.getElementById('password-type-danger').style.display = '';
	}


}