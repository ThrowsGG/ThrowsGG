/*blog-single 페이지로 유기번호를 넘기는 js 함수 - mkc */
function goData(formIndex) {
	$("#frm" + formIndex).submit();
}
//* blog - single 페이지에서 대댓글(reply)버튼 누를시 쓰기 폼으로 스크롤 이동 - mkc * /
function fnMove(mkc) {
//	$('input[id=name]').attr('value', mkc);
	var offset = $("#leaveCommFrm").offset();
	$('html, body').animate({ scrollTop: offset.top }, 1000);
}
function resNoSession() {
	alert('로그인이 필요한 서비스입니다');
	location.replace = 'join.jsp'

}

//function setClassName(index) {
//	document.getElementById('navCategoli0'+index).className = 'nav-item active';
////	alert(document.getElementById('navCategoli0'+i).className);
//}


