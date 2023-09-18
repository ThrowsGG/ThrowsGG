<%@page import="javax.naming.InitialContext"%>
<%@page import="javax.sql.DataSource"%>
<%@page import="javax.naming.Context"%>
<%@page import="java.sql.*"%>
<%@page import="javax.*"%>
<%@page import="java.lang.reflect.Parameter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="vo.*"%>
<%@page import="gg.*"%>
<%@page import="java.util.*"%>

<jsp:useBean id="abandonList" class="vo.AbandonList"></jsp:useBean>
<jsp:useBean id="mapAddresChange" class="gg.MapAddresChange" scope="request"></jsp:useBean>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="sessionId" value="${id}" scope="session"></c:set>
<c:set var="sessionnickname" value="${nickname}" scope="session"></c:set>
<%
abandonList = ApiManagement.getDataList("1");
ArrayList<IndexCommentsVO> commentList = (ArrayList<IndexCommentsVO>) request.getAttribute("commentList");//현재 페이지의 유기동물의 유기번호
DateAbandon dateAbandon = (DateAbandon) request.getAttribute("abvo");//해당 유기번호 동물의 데이터
System.out.println("blog-single.jsp => " + dateAbandon.toString());
String[] addresses = mapAddresChange.geocoding(dateAbandon.getCareAddr()).split(",");// 해당 동물의 보호소의 주소를 좌표값으로 변환하는 함수를 호출하여 x,y 값을 string 배열로 받음
String desertionNo = dateAbandon.getDesertionNo();
// String userid = (String)session.getAttribute("id");

// System.out.println("blog-single.jsp 유기번호 = " + desertionNo);
// System.out.println("blog-single.jsp 유기번호 = " + commentList.toString());
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<!-- <link rel="preconnect" href="https://fonts.googleapis.com"> -->
<!-- <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet"> -->
<!-- <title>Pet Sitting - Free Bootstrap 4 Template by Colorlib</title> -->
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"> -->

<!-- <link rel="stylesheet" href="css/animate.css"> -->

<!-- <link rel="stylesheet" href="css/owl.carousel.min.css"> -->
<!-- <link rel="stylesheet" href="css/owl.theme.default.min.css"> -->
<!-- <link rel="stylesheet" href="css/magnific-popup.css"> -->


<!-- <link rel="stylesheet" href="css/bootstrap-datepicker.css"> -->
<!-- <link rel="stylesheet" href="css/jquery.timepicker.css"> -->

<!-- <link rel="stylesheet" href="css/flaticon.css"> -->
<!-- <link rel="stylesheet" href="css/style.css"> -->
<!-- 모달 라이브러리 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<!-- 모달 라이브러리 -->
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=qhzingc5km"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<script type="text/javascript">
setInterval(function () { CommentSelect(); }, 2000);
$( document ).ready(function() {
	CommentSelect();
});
$(document).ready(function() {//입력폼 글자수 제한 300
    $('#messageCM').on('keyup', function() {
        $('#test_cnt').html("("+$(this).val().length+" / 300)");
 
        if($(this).val().length > 300) {
            $(this).val($(this).val().substring(0, 300));
            $('#test_cnt').html("(300 / 300)");
        }
    });
});
// 	console.log('74LINE_sessionID : '+${sessionId})
	 function CommentSelect(){
    $.ajax({
        type: "POST", // HTTP Method
        url: "blog-singleSelect.bgs", // 목적지
        data: {
		   desertionNo: <%=dateAbandon.getDesertionNo()%>
        }
    }).done(function(data) {
    	console.log("SelectAJax")
        // 			location.reload()
       	console.log('부모 댓글'+data)
        let memberInfo = ""
        const jsonInfo = JSON.parse(data)
        const commentCount = jsonInfo.listsize;
		$("#commentCount").html(commentCount+" Comments");
		const sessionid = '${sessionId}';
		const sessionNick = '${sessionnickname}';
		console.log(sessionid)
         if (!(Object.values(jsonInfo.members).length == 0)) {//08_09 통합 후 수정
        console.log("데이터있음")
        for (const i in jsonInfo.members) {//부모 for문
            const comment = jsonInfo.members[i].comment;
            const indexComment = jsonInfo.members[i].indexComment;
            const userID = jsonInfo.members[i].userID;
            const regist_date = jsonInfo.members[i].regist_date;
            const cmsessionNick = jsonInfo.members[i].Nick;
            const prprofile = jsonInfo.members[i].profile;
            console.log(userID)
            memberInfo += '<li class="comment" id="'+indexComment+'">'
            memberInfo += '<div class="vcard bio">'
            memberInfo += '<img src="'+prprofile+'" alt="Image placeholder" style = "width: 50px;  height: 50px;">'
            memberInfo += '</div>'
           	memberInfo += '<h3>'+ cmsessionNick +'</h3>'
            memberInfo += '<div class="comment-body">'
            memberInfo += '<div class="meta">'+userID+" - "+regist_date+'</div>'
            memberInfo += '<p>' + comment + '</p>'
            memberInfo += '<p>'
			if(sessionid != null){
            memberInfo += '<button class="reply" id="reply" value=' + indexComment +' onclick="fnMove(); '
            memberInfo += ' ChildCommentInsert(this,&quot;' + comment + '&quot;);" type="button" >Reply</button>'
            if(sessionid == userID){
            memberInfo += '<button class="reply" id="Del" value=' + indexComment + ' type="button" onclick="CommentdDelete(this);">Del</button>'
            memberInfo += '<button class="reply" id="modify" type="button"  value=' + indexComment + ' onclick = "CommentModify(this,&quot;' + userID + '&quot;,&quot;' + comment + '&quot;); '
            memberInfo +=  'fnMove(&quot;<c:out value="${userid}"/>&quot;);">Modify</button>'
            }
			}
            memberInfo += '</div>'
            	if(!(Object.values(jsonInfo.child).length == 0)){//childcommentlist가 있을경우
            	for (const i in jsonInfo.child) {//자식 for문
					if(indexComment == jsonInfo.child[i].groupNum){//현재 부모 index번호와 childcommentlist의  groupnum이 같을경우
		                 const childComment = jsonInfo.child[i].comment;
		                 const childIndexComment = jsonInfo.child[i].indexComment;
		                 const childUserID = jsonInfo.child[i].userID;
		                 const childRegist_date = jsonInfo.child[i].regist_date;
		                 const childGroupNum = jsonInfo.child[i].groupNum; // 해당 코멘트가 속해있는 부모코멘트 index번호
		                 const childNickname = jsonInfo.child[i].nickname; 
		                 const chprofile = jsonInfo.child[i].chprofile; // 해당 코멘트가 속해있는 부모코멘트 index번호
		                 console.log(childComment)
		                 console.log(childIndexComment)
		                 console.log(childUserID)
		                 console.log(childRegist_date)
		                 console.log(childGroupNum)
		                 memberInfo += '<ul class="children">'
		                 memberInfo += '<li class="comment" id="&quot;'+childIndexComment+'&quot;">'
		                 memberInfo += '<div class="vcard bio">'
		                 memberInfo += '<img src="'+chprofile+'" alt="Image placeholder" style = "width: 50px;  height: 50px;">'
		                 memberInfo += '</div>'
		                 memberInfo += '<h3>'+ childNickname +'</h3>'
		                 memberInfo += '<div class="comment-body">'
		                 memberInfo += '<div class="meta">'+childUserID+" - "+regist_date+'</div>'
		                 memberInfo += '<p>' + childComment + '</p>'
		                 memberInfo += '<p>'
		                 if(sessionid == childUserID){
		                 memberInfo += '<button class="reply" id="Del" value=' + childIndexComment + ' type="button" onclick="ChiildCommentdDelete(this);">Del</button>'
		                 memberInfo += '<button class="reply" id="modify" type="button"  value=' + childIndexComment + ' onclick = "ChildCommentModify(this,&quot;' + childUserID + '&quot;,&quot;' + childComment + '&quot;); '
		                 memberInfo +=  'fnMove(&quot;<c:out value="${userid}"/>&quot;);">Modify</button>'
		                 }
		                 memberInfo += '</div></li></ul>'
					} 
            	}
				 memberInfo += '</li>' //부모 li  close
				$('#commentListUL').html(memberInfo)
            	}else{
            		 memberInfo +=  '</li>'
            		 $('#commentListUL').html(memberInfo)
            	}
        }
    }else {
        console.log("데이터없음")
        $('#commentListUL').html(memberInfo)
    }
    }).fail(function(Response) {
        console.log('에러')
    });
 }
function ChildCommentInsertAjax(ChildGroupNum){//reply코멘트 입력
	console.log('ChildCommentInsert ajax 실행');
    $.ajax({
        type: "POST", // HTTP Method
        url: "ChildCommentInsert.bgs", // 목적지
        data: {
            userid: '${sessionId}', // 현재 reply 작성한 유저의 id
            content: $("#messageCM").val(),// 입력폼 내용
            desertionNo: <%=desertionNo%>,//해당 유기견 번호
            nickname:'${sessionnickname}',
    		groupNum: ChildGroupNum//reply할 코멘트의 indexcomments번호
        }
    }).done(function(data) {
    	CommentSelect();
    }).fail(function(Response) {
        console.log('에러')
    });
    document.getElementById("messageCM").value = '';
    $("#buttonSubmit").prop('value', 'Post Comment');
    $("#buttonSubmit").removeAttr("onclick"); // 온클릭 속성을 삭제
    $('#buttonSubmit').attr('onclick', 'CommentInsert();')
} // 수정 후 수정버튼을 다시 입력버튼으로 수정


function ChiildCommentdDelete(objButton) { //자식 코멘트 삭제 ajax
    console.log('ChildCommentdDeleteAjax');
    const commentNum = objButton.value; //눌러진 버튼의 value값
    const id = '${sessionScope.id}';
    $.ajax({
        type: "POST", // HTTP Method
        url: "ChildCommentDelete.bgs", // 목적지
        data: {
            userid: id, // 전송 데이터
            desertionNo: <%=desertionNo%> ,
            indexComments: commentNum
        }
    }).done(function(data) {
    	CommentSelect();
    }).fail(function(Response) {
        console.log('에러')
    });
    document.getElementById("messageCM").value = '';
}
function ChiildCommentModify(commentNum) { //자식 코멘트 수정 ajax
    const id = '${sessionScope.id}'; //후에 세션 아이디로 대체
    $.ajax({
        type: "POST", // HTTP Method
        url: "ChildCommentModify.bgs", // 목적지
        data: { // 전송 데이터
            userid: id,
            desertionNo: <%=desertionNo%> ,
            Comments: $("#messageCM").val(),
            indexComments: commentNum
        }
    }).done(function(data) {
    	CommentSelect();
    }).fail(function(Response) {
        console.log('에러')
    });
    document.getElementById("messageCM").value = '';//수정훔 입력폼 비우기
    $("#buttonSubmit").removeAttr("onclick"); // 온클릭 속성을 삭제
    $('#buttonSubmit').attr('onclick', 'CommentInsert();')
}
function CommentInsert() { // 제출 버튼 이벤트 지정
    console.log('InsertAjax'); 
    $.ajax({
        type: "POST", // HTTP Method
        url: "blog-singleInsert.bgs", // 목적지
        data: {
            userid: '${sessionScope.id}', // 전송 데이터
            content: $("#messageCM").val(),
            desertionNo: <%=desertionNo%>,
    		nickname: '${sessionnickname}'
        }
    }).done(function(data) {
    	CommentSelect();
    }).fail(function(Response) {
        console.log('에러')
    });
    document.getElementById("messageCM").value = '';
};

function CommentdDelete(objButton) { // 제출 버튼 이벤트 지정
    console.log('CommentdDelete');
    const commentNum = objButton.value; //눌러진 버튼의 value값
    const id = '${sessionScope.id}';
    $.ajax({
        type: "POST", // HTTP Method
        url: "blog-singleDelete.bgs", // 목적지
        data: {
            userid: id, // 전송 데이터
            desertionNo: <%=desertionNo%> ,
            indexComments: commentNum
        }
    }).done(function(data) {
    	CommentSelect();
    }).fail(function(Response) {
        console.log('에러')
    });
    document.getElementById("messageCM").value = '';
}

function modifyButton(commentNum) { //수정버튼 클릭시 호출 메서드
    const id = '${sessionScope.id}'; //후에 세션 아이디로 대체
    $.ajax({
        type: "POST", // HTTP Method
        url: "blog-singleModify.bgs", // 목적지
        data: { // 전송 데이터
            userid: id,
            desertionNo: <%=desertionNo%> ,
            Comments: $("#messageCM").val(),
            indexComments: commentNum
        }
    }).done(function(data) {
    	CommentSelect();
    }).fail(function(Response) {
        console.log('에러')
    });
    document.getElementById("messageCM").value = '';//수정훔 입력폼 비우기
    $("#buttonSubmit").removeAttr("onclick"); // 온클릭 속성을 삭제
    $('#buttonSubmit').attr('onclick', 'CommentInsert();')
  } // 수정 후 수정버튼을 다시 입력버튼으로 수정

//reply, modify 클릭 시 입력 폼 submit onclick 값을 변경 시켜 호출 함수 변경
function CommentModify(objButton, userID, comments) { // 입력 폼에 현재 입력된 내용 표시와 버튼의 onclick 호출 내용변경
    console.log('CommentModify');
    const commentNum = objButton.value;
    $("#messageCM").val(comments); //입력폼에 입력되었던 내용을 set
    $("#buttonSubmit").removeAttr("onclick"); // 온클릭 속성을 삭제
    $('#buttonSubmit').attr('onclick', 'modifyButton(' + commentNum + ');'); // 온클릭 속성을 다시부여
}
function ChildCommentModify(objButton, userID, comments) { // 입력 폼에 현재 입력된 내용 표시와 버튼의 onclick 호출 내용변경
    console.log('ChildCommentModify');
    const commentNum = objButton.value;
    $("#messageCM").val(comments); //입력폼에 입력되었던 내용을 set
    $("#buttonSubmit").removeAttr("onclick"); // 온클릭 속성을 삭제
    $('#buttonSubmit').attr('onclick', 'ChiildCommentModify(' + commentNum + ');'); // 온클릭 속성을 다시부여
}
function ChildCommentInsert(objButton,comments) { // 입력 폼에 현재 입력된 내용 표시와 버튼의 onclick 호출 내용변경
    console.log('ChildCommentInsert');
    const ChildGroupNum = objButton.value;//해당 리플이 속한 부모 댓글의 index번호
   // $("#messageCM").val(comments); //입력폼에 입력되었던 내용을 set
    $("#buttonSubmit").prop('value', 'Reply');
    $("#buttonSubmit").removeAttr("onclick"); // 온클릭 속성을 삭제
    $('#buttonSubmit').attr('onclick', 'ChildCommentInsertAjax(' + ChildGroupNum + ');'); // 온클릭 속성을 다시부여
    
}
</script>
<body>
<jsp:include page="Nav.jsp"></jsp:include>
<section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg_2.jpg');" data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div class="row no-gutters slider-text align-items-end">
				<div class="col-md-9 ftco-animate pb-5">
					<p class="breadcrumbs mb-2">
						<span class="mr-2"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> <span class="mr-2"><a href="blog.html">공고게시판 <i class="ion-ios-arrow-forward"></i></a></span> <span><i class="ion-ios-arrow-forward"></i>
						</span>
					</p>
					<h1 class="mb-0 bread">상세정보</h1>
				</div>
			</div>
		</div>
	</section>

	<section class="ftco-section ftco-degree-bg">
		<div class="container">
			<div class="row">
				<div class="col-lg-8 ftco-animate">
					<p>
						<img src="<%=dateAbandon.getPopfile()%>" alt="" class="img-fluid">
					</p>
					<h2 class="mb-3"></h2>
					<h2 class="mb-3 mt-5">특이사항</h2>
					<table style="width: 100%;" border=1pxsolidblack;>
						<tbody>
							<tr>
								<td style="width: 18.2668%; background-color: rgb(98, 99, 99); text-align: center;"><div style="text-align: center;">
										<span style="font-size: 14px;"><span style="color: rgb(255, 255, 255);">종</span></span><span style="font-size: 13px;"><br></span>
									</div></td>
								<td style="width: 31.7989%; text-align: center;"><div style="text-align: center;"><%=dateAbandon.getKindCd()%></div></td>
								<td style="width: 16.82%; background-color: rgb(98, 99, 99); text-align: center;"><div style="text-align: center;">
										<span style="font-size: 14px;"><span style="color: rgb(255, 255, 255);">나이</span></span><span style="font-size: 13px;"><br></span>
									</div></td>
								<td style="width: 33.1143%; text-align: center;"><div style="text-align: center;"><%=dateAbandon.getAge()%></div></td>
							</tr>
							<tr>
								<td style="width: 18.2668%; background-color: rgb(98, 99, 99); text-align: center;"><div style="text-align: center;">
										<span style="font-size: 14px;"><span style="color: rgb(255, 255, 255);">성별</span></span><span style="font-size: 13px;"><br></span>
									</div></td>
								<td style="width: 31.7989%; text-align: center;"><div style="text-align: center;"><%=dateAbandon.getSexCd()%></div></td>
								<td style="width: 16.82%; background-color: rgb(98, 99, 99); text-align: center;"><div style="text-align: center;">
										<span style="font-size: 14px;"><span style="color: rgb(255, 255, 255);">체중</span></span><span style="font-size: 13px;"><br></span>
									</div></td>
								<td style="width: 33.1143%; text-align: center;"><div style="text-align: center;"><%=dateAbandon.getWeight()%></div></td>
							</tr>
							<tr>
								<td style="width: 18.2668%; background-color: rgb(98, 99, 99); text-align: center;"><div style="text-align: center;">
										<span style="font-size: 14px;"><span style="color: rgb(255, 255, 255);">상태</span></span><span style="font-size: 13px;"><br></span>
									</div></td>
								<td style="width: 31.7989%; text-align: center;"><div style="text-align: center;"><%=dateAbandon.getProcessState()%></div></td>
								<td style="width: 16.82%; background-color: rgb(98, 99, 99); text-align: center;"><div style="text-align: center;">
										<span style="font-size: 14px;"><span style="color: rgb(255, 255, 255);">중성화유무</span></span><span style="font-size: 13px;"><br></span>
									</div></td>
								<td style="width: 33.1143%; text-align: center;"><div style="text-align: center;"><%=dateAbandon.getNeuterYn()%></div></td>
							</tr>
							<tr>
								<td style="width: 18.2668%; background-color: rgb(98, 99, 99); text-align: center;"><div style="text-align: center;">
										<span style="color: rgb(255, 255, 255); font-size: 14px;">발견장소</span>
									</div></td>
								<td style="width: 31.7989%; text-align: center;"><div style="text-align: center;"><%=dateAbandon.getHappenPlace()%></div></td>
								<td style="width: 16.82%; background-color: rgb(98, 99, 99); text-align: center;"><div style="text-align: center;">
										<span style="color: rgb(255, 255, 255); font-size: 14px;">특징</span>
									</div></td>
								<td style="width: 33.1143%; text-align: center;"><div style="text-align: center;"><%=dateAbandon.getSpecialMark()%></div></td>
							</tr>
							<tr>
								<td style="width: 18.2668%; background-color: rgb(98, 99, 99); text-align: center;"><div style="text-align: center;">
										<span style="color: rgb(255, 255, 255); font-size: 14px;">보호소 이름</span>
									</div></td>
								<td style="width: 31.7989%; text-align: center;"><div style="text-align: center;"><%=dateAbandon.getCareNm()%></div></td>
								<td style="width: 16.82%; background-color: rgb(98, 99, 99); text-align: center;"><div style="text-align: center;">
										<span style="color: rgb(255, 255, 255); font-size: 14px;">보호소 전화번호</span>
									</div></td>
								<td style="width: 33.1143%; text-align: center;"><div style="text-align: center;"><%=dateAbandon.getCareTel()%></div></td>
							</tr>
						</tbody>
					</table>
					<h2 class="mb-3 mt-5 googleft">보호소 위치정보</h2>
					<p>
					<div id="map" style="width: 100%; height: 400px;"></div>
					</p>
					<div class="pt-5 mt-5" id="ajaxASDiv">
						<h3 class="mb-5" id="commentCount"></h3>
						<ul class="comment-list" id="commentListUL">
						</ul>
						<!-- END comment-list -->
						<!-- 						코멘트 입력 창 -->
						<c:choose>
							<c:when test="${sessionScope.id != null}">
								<div class="comment-form-wrap pt-5" id="leaveCommFrm">
									<h3 class="mb-5">Leave a comment</h3>
									<form action="#" class="p-5 bg-light">
										<div class="form-group">
											<input type="hidden" class="form-control" id="name" value="" readonly="readonly">
										</div>

										<div class="form-group">
											<label for="messageCM">Message</label>
											<textarea name="messageCM" id="messageCM" cols="30" rows="10" class="form-control"></textarea>
										</div>
										<div id="test_cnt">(0 / 300)</div>
										<div class="form-group">
											<input type="button" value="Post Comment" class="btn py-3 px-4 btn-primary" name="buttonSubmit" id="buttonSubmit" onclick="CommentInsert();" style="width: 100%;">
										</div>
									</form>
								</div>
							</c:when>
							<c:otherwise>
								<div class="comment-form-wrap pt-5" id="leaveCommFrm">
									<h3 class="mb-5">Leave a comment</h3>
									<form action="#" class="p-5 bg-light">
										<div class="form-group">
											 <input type="hidden" class="form-control" id="name" value="" readonly="readonly">
										</div>

										<div class="form-group">
											<label for="messageCM">Message</label>
											<textarea name="messageCM" id="messageCM" cols="30" rows="10" class="form-control" readonly="readonly" "></textarea>
										</div>
										<div class="form-group">
											<input type="button" value="SIGN IN" class="btn py-3 px-4 btn-primary" name="buttonSubmit" id="buttonSubmit" onclick="resNoSession()" style="background: #dc3545; border: 1px solid #dc3545; width: 100%;">
										</div>

									</form>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
				</div>
				<div class="modal fade bd-example-modal-xl" tabindex="-1" role="dialog" aria-labelledby="myExtraLargeModalLabel" aria-hidden="true">
					<div class="modal-dialog modal-xl">
						<div class="modal-content" style="width: fit-content; position: fixed; top: auto; left: 50%; transform: translate(-50%, 0%);">
							<div class="modal-header">
								<h5 class="modal-title h4" id="myExtraLargeModalLabel">Reservation</h5>
								<button type="button" class="close" data-dismiss="modal" aria-label="Close">
									<span aria-hidden="true">×</span>
								</button>
							</div>
							<div class="modal-body">
								<div class="popup_cont" style="padding-top: 0px; padding-left: 0px; padding-bottom: 0px; padding-right: 0px;">
									<section class="ftco-appointment ftco-section ftco-no-pt ftco-no-pb img" style="background-image: url(images/bg_3.jpg);">
										<div class="overlay"></div>
										<div class="container">
											<div class="row d-md-flex justify-content-end">
												<div class="col-md-12 col-lg-6 half p-3 py-5 pl-lg-5 ftco-animate fadeInUp ftco-animated">
													<h2 class="mb-4">Free Consultation</h2>
													<form action="reservation.bgs" class="appointment" method="post">
														<input type="hidden" value="<%=desertionNo%>" name="resdesertionNo">
														<input type="hidden" value="${sessionId}" name="sessionId">
														<input type="hidden" value="<%=dateAbandon.getCareNm()%>" name="Aban_careNm"> 
														<input type="hidden" value="<%=dateAbandon.getCareTel()%>" name="Aban_CareTel"> 
														<input type="hidden" value="<%=dateAbandon.getCareAddr()%>" name="Aban_careAddr"> 
														<input type="hidden" value="<%=dateAbandon.getChargeNm()%>" name="Aban_careChargeNm"> 
														<input type="hidden" value="<%=dateAbandon.getOfficetel()%>" name="Aban_careOfficeTel"> 
														<div class="row">
															<div class="col-md-12">
																<div class="form-group">
																	<div class="form-field">
																		<div class="select-wrap">
																			<div class="icon">
																				<span class="fa fa-chevron-down"></span>
																			</div>
																			<select name="opt" id="" class="form-control">
																				<option value="입양">입양</option>
																				<option value="방문">방문</option>
																			</select>
																		</div>
																	</div>
																</div>
															</div>
															<div class="col-md-6">
																<div class="form-group">
																	<input type="text" class="form-control" placeholder="Your Name" name="name">
																</div>
															</div>
															<div class="col-md-6">
																<div class="form-group">
																	<input type="text" class="form-control" placeholder="Vehicle number" name="phonenum">
																</div>
															</div>
															<div class="col-md-6">
																<div class="form-group">
																	<div class="input-wrap">
																		<div class="icon">
																			<span class="fa fa-calendar"></span>
																		</div>
																		<input type="text" class="form-control appointment_date" placeholder="Date" name="calender" id="resCal">
																	</div>
																</div>
															</div>
															<div class="col-md-6">
																<div class="form-group">
																	<div class="input-wrap">
																		<div class="icon">
																			<span class="fa fa-clock-o"></span>
																		</div>
																		<input type="text" class="form-control appointment_time ui-timepicker-input" placeholder="Time" autocomplete="off" name="time">
																	</div>
																</div>
															</div>
															<div class="col-md-12">
																<div class="form-group">
																	<textarea id="" cols="30" rows="7" class="form-control" placeholder="Message" name="message"></textarea>
																</div>
															</div>
															<div class="col-md-12">
																<div class="form-group">
																	<input type="submit" value="Send message" class="btn btn-primary py-3 px-4" onclick="window.location.reload(true);">
																</div>
															</div>
														</div>
													</form>
												</div>
											</div>
										</div>
									</section>
								</div>
							</div>
						</div>

					</div>
				</div>
				<!-- .col-md-8 -->
				<div class="col-lg-4 sidebar pl-lg-5 ftco-animate">
					<div class="sidebar-box ftco-animate">
						<div class="form-group">
							<h3 class="mb-5" style="text-align: center;">방문 예약하기</h3>
							<c:choose>
								<c:when test="${sessionId != null}">
								<c:choose>
									<c:when test="${checkReserve == true}">
										<button type="button" onclick="alert('예약이 마감되었습니다')" class="btn btn-primary" style="width: 100%;background-color: #ccc;border: 1px solid #ccc;">RESERVATION Expired</button>
									</c:when>
									<c:otherwise>
										<button type="button" class="btn btn-primary" data-toggle="modal" data-target=".bd-example-modal-xl" style="width: 100%;">RESERVATION</button>
									</c:otherwise>
									</c:choose>
								</c:when>
								<c:otherwise>
									<button type="button" onclick="resNoSession(); return false;" class="btn btn-primary" style="background: #dc3545; border: 1px solid #dc3545; width: 100%;">SING IN</button>
								</c:otherwise>
							</c:choose>
						</div>
					</div>

					<div class="sidebar-box ftco-animate">
						<h3>Recent News</h3>
						<c:forEach var="Result" items="<%=abandonList.getList()%>">
							<div class="block-21 mb-4 d-flex">
								<a  class="blog-img mr-4" style="background-image: url('${Result.getFilename()}');"></a>
								<div class="text">
									<h3 class="heading">특징 : ${Result.getSpecialMark()}</h3>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- .section -->
	<jsp:include page="lower.jsp"></jsp:include>
	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>

	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="js/jquery.min.js"></script>
	<script src="js/jquery-migrate-3.0.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/jquery.stellar.min.js"></script>
	-->
	<script src="js/jquery.animateNumber.min.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/jquery.timepicker.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/scrollax.min.js"></script>
	<script src="js/main.js"></script>
	<script type="text/javascript" src="js/mkc_javascript.js"></script>
	<script>
/*네이버 지도 api 좌표로 맵 마크 표시 함수*/

var cityhall = new naver.maps.LatLng(<%=addresses[0]%>, <%=addresses[1]%>),
    map = new naver.maps.Map('map', {
        center: cityhall.destinationPoint(0, 500),
        zoom: 15
    }),
    marker = new naver.maps.Marker({
        map: map,
        position: cityhall
    });

var contentString = [
    '<div class="iw_inner">',
    '   <h4 class="google_ft"><%=dateAbandon.getCareNm()%></h4>',
    '   <p class="google_ft"><%=dateAbandon.getCareAddr()%><br />',
    '   <%=dateAbandon.getOfficetel()%>',
    '  </p>',
    '</div>' ].join('');

		var infowindow = new naver.maps.InfoWindow({
			content : contentString
		});

		naver.maps.Event.addListener(marker, "click", function(e) {
			if (infowindow.getMap()) {
				infowindow.close();
			} else {
				infowindow.open(map, marker);
			}
		});

		infowindow.open(map, marker);
	</script>

</body>
</html>