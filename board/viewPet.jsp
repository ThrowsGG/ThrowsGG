<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<%@ page import="mvc.model.BoardDTO"%>
<%@page import="vo.*"%>
<%@page import="gg.*"%>
<jsp:useBean id="mapAddresChange" class="gg.MapAddresChange" scope="request"></jsp:useBean>

<%
   BoardDTO notice = (BoardDTO) request.getAttribute("board");
   int num = ((Integer) request.getAttribute("num")).intValue();
   int nowpage = ((Integer) request.getAttribute("page")).intValue();
   String[] DBaddresses = mapAddresChange.geocoding(notice.getLostPlace()).split(",");// 해당 동물의 보호소의 주소를 좌표값으로 변환하는 함수를 호출하여 x,y
%>
<c:set var="sessionId" value="${id}" scope="session"></c:set>
<c:set var="sessionnickname" value="${nickname}" scope="session"></c:set>
<html>
<style>
body {
   background-color: #edf1f5;
   margin-top: 20px;
}

.card {
   margin-bottom: 30px;
}

.card {
   position: relative;
   display: flex;
   flex-direction: column;
   min-width: 0;
   word-wrap: break-word;
   background-color: #fff;
   background-clip: border-box;
   border: 0 solid transparent;
   border-radius: 0;
}

.card .card-subtitle {
   font-weight: 300;
   margin-bottom: 10px;
   color: #8898aa;
}

.table-product.table-striped tbody tr:nth-of-type(odd) {
   background-color: #f3f8fa !important
}

.table-product td {
   border-top: 0px solid #dee2e6 !important;
   color: #728299 !important;
}

</style>
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=qhzingc5km&submodules=geocoder"></script>
<title>글읽기</title>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
</head>
<script type="text/javascript">
/*blog-single 페이지로 유기번호를 넘기는 js 함수 - mkc */
// setInterval(function () { CommentSelect(); }, 2000);

$(document).ready(function() {//입력폼 글자수 제한 300
    $('#messageCM').on('keyup', function() {
        $('#test_cnt').html("("+$(this).val().length+" / 300)");
 
        if($(this).val().length > 300) {
            $(this).val($(this).val().substring(0, 300));
            $('#test_cnt').html("(300 / 300)");
        }
    });
});
function CommentSelect(){
    $.ajax({
        type: "POST", // HTTP Method
        url: "boardCommentSelect.bcc", // 목적지
        data: {
		   desertionNo:<%=notice.getNum()%>
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
$( document ).ready(function() {
 	CommentSelect();
 });
// 	 function CommentSelect(){
//     $.ajax({
//         type: "POST", // HTTP Method
//         url: "boardCommentSelect.bcc", // 목적지
//         data: {
<%-- 		   desertionNo: <%=notice.getNum()%> --%>
//         }
//     }).done(function(data) {
//     	console.log("SelectAJax")
//         // 			location.reload()
//        	console.log('부모 댓글'+data)
//         let memberInfo = ""
//         const jsonInfo = JSON.parse(data)
//         const commentCount = jsonInfo.listsize;
// 		$("#commentCount").html(commentCount+" Comments");
// 		const sessionid = '${sessionScope.id}';
// 		const sessionNick = '${sessionnickname}';
// 		console.log(sessionid)
//          if (!(Object.values(jsonInfo.members).length == 0)) {//08_09 통합 후 수정
//         console.log("데이터있음")
//         for (const i in jsonInfo.members) {//부모 for문
//             const comment = jsonInfo.members[i].comment;
//             const indexComment = jsonInfo.members[i].indexComment;
//             const userID = jsonInfo.members[i].userID;
//             const regist_date = jsonInfo.members[i].regist_date;
//             const cmsessionNick = jsonInfo.members[i].Nick;
//             const prprofile = jsonInfo.members[i].profile;
//             console.log(userID)
//             memberInfo += '<li class="comment" id="'+indexComment+'">'
//             memberInfo += '<div class="vcard bio">'
//             memberInfo += '<img src="'+prprofile+'" alt="Image placeholder" style = "width: 50px;  height: 50px;">'
//             memberInfo += '</div>'
//            	memberInfo += '<h3>'+ cmsessionNick +'</h3>'
//             memberInfo += '<div class="comment-body">'
//             memberInfo += '<div class="meta">'+userID+" - "+regist_date+'</div>'
//             memberInfo += '<p>' + comment + '</p>'
//             memberInfo += '<p>'
// 			if(sessionid != null){
//             memberInfo += '<button class="reply" id="reply" value=' + indexComment +' onclick="fnMove(); '
//             memberInfo += 'ChildCommentInsert(this,&quot;' + comment + '&quot;);" type="button" >Reply</button>'
//             if(sessionid == userID){
//             memberInfo += '<button class="reply" id="Del" value=' + indexComment + ' type="button" onclick="CommentdDelete(this);">Del</button>'
//             memberInfo += '<button class="reply" id="modify" type="button"  value=' + indexComment + ' onclick = "CommentModify(this,&quot;' + userID + '&quot;,&quot;' + comment + '&quot;); '
//             memberInfo +=  'fnMove(&quot;<c:out value="${userid}"/>&quot;);">Modify</button>'
//             }
// 			}
//             memberInfo += '</div>'
//             	if(!(Object.values(jsonInfo.child).length == 0)){//childcommentlist가 있을경우
//             	for (const i in jsonInfo.child) {//자식 for문
// 					if(indexComment == jsonInfo.child[i].groupNum){//현재 부모 index번호와 childcommentlist의  groupnum이 같을경우
// 		                 const childComment = jsonInfo.child[i].comment;
// 		                 const childIndexComment = jsonInfo.child[i].indexComment;
// 		                 const childUserID = jsonInfo.child[i].userID;
// 		                 const childRegist_date = jsonInfo.child[i].regist_date;
// 		                 const childGroupNum = jsonInfo.child[i].groupNum; // 해당 코멘트가 속해있는 부모코멘트 index번호
// 		                 const childNickname = jsonInfo.child[i].nickname; // 해당 코멘트가 속해있는 부모코멘트 index번호
// 		                 const chprofile=jsonInfo.child[i].chprofile;
// 		                 console.log(childComment)
// 		                 console.log(childIndexComment)
// 		                 console.log(childUserID)
// 		                 console.log(childRegist_date)
// 		                 console.log(childGroupNum)
// 		                 memberInfo += '<ul class="children">'
// 		                 memberInfo += '<li class="comment" id="&quot;'+childIndexComment+'&quot;">'
// 		                 memberInfo += '<div class="vcard bio">'
// 		                 memberInfo += '<img src="'+chprofile+'" alt="Image placeholder" style = "width: 50px;  height: 50px;">'		        
// 		                 memberInfo += '</div>'
// 		                 memberInfo += '<h3>'+ childNickname +'</h3>'
// 		                 memberInfo += '<div class="comment-body">'
// 		                 memberInfo += '<div class="meta">'+childUserID+" - "+regist_date+'</div>'
// 		                 memberInfo += '<p>' + childComment + '</p>'
// 		                 memberInfo += '<p>'
// 		                 if(sessionid == childUserID){
// 		                 memberInfo += '<button class="reply" id="Del" value=' + childIndexComment + ' type="button" onclick="ChiildCommentdDelete(this);">Del</button>'
// 		                 memberInfo += '<button class="reply" id="modify" type="button"  value=' + childIndexComment + ' onclick = "ChildCommentModify(this,&quot;' + childUserID + '&quot;,&quot;' + childComment + '&quot;); '
// 		                 memberInfo +=  'fnMove(&quot;<c:out value="${userid}"/>&quot;);">Modify</button>'
// 		                 }
// 		                 memberInfo += '</div></li></ul>'
// 					} 
//             	}
// 				 memberInfo += '</li>' //부모 li  close
// 				$('#commentListUL').html(memberInfo)
//             	}else{
//             		 memberInfo +=  '</li>'
//             		 $('#commentListUL').html(memberInfo)
//             	}
//         }
//     }else {
//         console.log("데이터없음")
//         $('#commentListUL').html(memberInfo)
//     }
//     }).fail(function(Response) {
//         console.log('에러')
//     });
//  }
function ChildCommentInsertAjax(ChildGroupNum){//reply코멘트 입력
	console.log('boardChildCommentInsert ajax 실행 세션 ID')
    $.ajax({
        type: "POST", // HTTP Method
        url: "boardChildCommentInsert.bcc", // 목적지
        data: {
            userid: '${sessionScope.id}', // 현재 reply 작성한 유저의 id
            content: $("#messageCM").val(),// 입력폼 내용
            desertionNo: <%=num%>,//해당 유기견 번호
            nickname:'${sessionnickname}',
    		groupNum: ChildGroupNum//reply할 코멘트의 indexcomments번호
        }
    }).done(function(data) {
    	CommentSelect();
    }).fail(function(Response) {
        console.log('에러')
    });
    document.getElementById("messageCM").value = '';
    $("#buttonSubmit").removeAttr("onclick"); // 온클릭 속성을 삭제
    $('#buttonSubmit').attr('onclick', 'CommentInsert();')
} // 수정 후 수정버튼을 다시 입력버튼으로 수정


function ChiildCommentdDelete(objButton) { //자식 코멘트 삭제 ajax
    console.log('boardChildCommentDelete');
    const commentNum = objButton.value; //눌러진 버튼의 value값
    const id = '${sessionScope.id}';
    $.ajax({
        type: "POST", // HTTP Method
        url: "boardChildCommentDelete.bcc", // 목적지
        data: {
            userid: id, // 전송 데이터
            desertionNo: <%=num%> ,
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
        url: "boardChildCommentModify.bcc", // 목적지
        data: { // 전송 데이터
            userid: id,
            desertionNo: <%=num%> ,
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
        url: "boardCommentInsert.bcc", // 목적지
        data: {
            userid: '${sessionScope.id}', // 전송 데이터
            content: $("#messageCM").val(),
            desertionNo: <%=num%>,
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
    console.log('boardCommentDelete');
    const commentNum = objButton.value; //눌러진 버튼의 value값
    const id = '${sessionScope.id}';
    $.ajax({
        type: "POST", // HTTP Method
        url: "boardCommentDelete.bcc", // 목적지
        data: {
            userid: id, // 전송 데이터
            desertionNo: <%=num%> ,
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
        url: "boardCommentModify.bcc", // 목적지
        data: { // 전송 데이터
            userid: id,
            desertionNo: <%=num%> ,
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
    $("#buttonSubmit").removeAttr("onclick"); // 온클릭 속성을 삭제
    $('#buttonSubmit').attr('onclick', 'ChildCommentInsertAjax(' + ChildGroupNum + ');'); // 온클릭 속성을 다시부여
    console.log('ChildCommentInsertTest'+ChildGroupNum)
}
function goData(DesertionNo) {
	var form = document.frm;
	$("#frm").submit();
}
//* blog - single 페이지에서 대댓글(reply)버튼 누를시 쓰기 폼으로 스크롤 이동 - mkc * /
function fnMove() {
// 	$('input[id=name]').attr('value', mkc);
	var offset = $("#leaveCommFrm").offset();
	$('html, body').animate({ scrollTop: offset.top }, 1000);
}
function resNoSession() {
	alert('로그인이 필요한 서비스입니다');
	location.href = 'join.jsp'

}

</script>

<body>
<jsp:include page="../Nav.jsp" />
       <section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg_2.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end">
          <div class="col-md-9 ftco-animate pb-5 fadeInUp ftco-animated">
             <p class="breadcrumbs mb-2"><span class="mr-2"><a href="index.html">커뮤니티 <i class="ion-ios-arrow-forward"></i></a></span> <span>글내용 <i class="ion-ios-arrow-forward"></i></span></p>
            <h1 class="mb-0 bread"><%=notice.getSubject()%></h1>
          </div>
        </div>
      </div>
    </section>
    
    
 <div class="container">
<%--       <form name="newUpdate" action="BoardUpdateAction.do?num=<%=notice.getNum()%>&pageNum=<%=nowpage%>" class="form-horizontal" method="post"> --%>
         <input type="hidden" value="" name="petPicture"> <input type="hidden" value="" name="content"> <input name="id" type="hidden" class="form-control1" value="${session_userid}">
         <div class="card">
            <div class="card-body">
               <h3 class="card-title">반려동물 분실 신고</h3>
               <h6 class="card-subtitle">※ 동물보호법 제12조제1항 및 같은 법 시행규칙 제8조제1항 및 제9조제2항에 따라 동물분실신고를 하는 공간입니다.</h6>
               <div class="row">
                  <div class="col-lg-5 col-md-5 col-sm-6">
                     <div id="editor" class="white-box text-center"><img src="<%=notice.getPetImg()%>"></div>
                  </div>
                  <div class="col-lg-7 col-md-7 col-sm-6">
                     <h4 class="box-title mt-5">글쓴이의 당부</h4>
                     <div class="col-sm-12">
                        <div id="content" class="form-control1" ><%=notice.getContent() %></div>
                     </div>
                  </div>
                  <div class="col-lg-12 col-md-12 col-sm-12">
                     <h3 class="box-title mt-5">분실동물 정보</h3>
                     <div class="table-responsive">
                        <table class="table table-striped table-product">
                           <tbody>
                              <tr>
                                 <td><b>작성자 명</b></td>
                                 <td><%=notice.getName()%></td>
                              </tr>
                              <tr>
                                 <td><b>연락처</b></td>
                                 <td><%=notice.getPhone() %></td>
                              </tr>
                              <tr>
                                 <td width="390"><b>동물 이름</b></td>
                                 <td><%=notice.getPetName() %></td>
                              </tr>
                              <tr>
                                 <td><b>품종</b></td>
                                 <td><%=notice.getBreed() %></td>
                              </tr>
                              <tr>
                                 <td><b>분실날짜</b></td>
                                 <td><%=notice.getLostDate() %></td>
                              </tr>
                              <tr>
                                 <td><b>성별</b></td>
                                 <td><%=notice.getGender()%></td>
                              </tr>
                              <tr>
                                 <td><b>나이</b></td>
                                 <td><%=notice.getAge()%></td>
                              </tr>
                              <tr>
                                 <td><b>특징</b></td>
                                 <!--<td><input name="figure" type="text" class="form-control1" style="width:500px" placeholder="특징"></td> -->
                                 <td><textarea name="figure" cols="50" rows="3" class="form-control1" readonly><%=notice.getFigure() %></textarea></td>
                              </tr>
                              <tr>
                                 <td><b>분실장소</b></td>
                                 <td><%=notice.getLostPlace()%></td>
                              </tr>
                           </tbody>
                        </table>
                        <div id="map" style="width: 100%; height: 400px;"></div>
                        <div class="form-group row">
                           <div class="col-sm-offset-2 col-sm-10 ">
                              <c:set var="userId" value="<%=notice.getId()%>" />
                              <c:if test="${sessionId == userId}">
                                 <p>
                                    <a href="BoardDeleteAction.do?num=<%=notice.getNum()%>&pageNum=<%=nowpage%>" class="btn btn-danger"> 삭제</a>
                                    <a href="BoardModifyPetAction.do?id=<%=notice.getId()%>&num=<%=notice.getNum()%>&pageNum=<%=nowpage%>" class="btn btn-success"> 수정하기</a>
<%--                                     <a href="BoardViewAction.do?num=<%=notice.getNum()%>&pageNum=<%=nowpage%>" class="btn btn-success"> 수정하기</a> --%>
                                    
<!--                                     <input type="submit" class="btn btn-success" value="수정 " > -->
                              </c:if>
                              <a href="BoardListAction.do?pageNum=<%=nowpage%>" class="btn btn-primary"> 목록</a>
                           </div>
                        </div>
					<div class="pt-5 mt-5" id="ajaxASDiv">
						<h3 class="mb-5" id="commentCount"></h3>
						<ul class="comment-list" id="commentListUL">
						</ul>
						<!-- END comment-list -->
						<!-- 						코멘트 입력 창 -->
						<c:choose>
							<c:when test="${sessionId != null}">
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
											<input type="button" value="Post Comment" class="btn py-3 px-4 btn-primary" name="buttonSubmit" id="buttonSubmit" onclick="CommentInsert();">
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
											<textarea name="messageCM" id="messageCM" cols="30" rows="10" class="form-control" readonly="readonly"></textarea>
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
                  </div>
               </div>

            </div>
         </div>
<!--       </form> -->
   </div>    
</body>
<script type="text/javascript">
/*네이버 지도 api 좌표로 맵 마크 표시 함수*/

var cityhall = new naver.maps.LatLng(<%=Float.parseFloat(DBaddresses[0]) %>, <%=Float.parseFloat(DBaddresses[1]) %>),
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
    '   <h6 class="google_ft"><%=notice.getLostPlace()%></h6>',
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
<style>
#editor img {
   width: 100%;
   height: 100%
}

div#content {
   padding: 16px 24px;
   border: 1px solid #D6D6D6;
   border-radius: 4px;
}
</style>
</html>