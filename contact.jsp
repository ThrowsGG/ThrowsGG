<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="java.util.*"%>
<%@ page import="mvc.model.BoardDTO"%>
<%
   List boardList = (List) request.getAttribute("boardlist");
   int total_record = ((Integer) request.getAttribute("total_record")).intValue();
   int pageNum = ((Integer) request.getAttribute("pageNum")).intValue();
   int total_page = ((Integer) request.getAttribute("total_page")).intValue();
%>
<c:set var="userid" value="${id}"></c:set>
<!DOCTYPE html>

<html lang="kr">
  <head>
<title>ThrowsGG</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    

    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
 
    <link rel="stylesheet" href="css/animate.css">
    
    <link rel="stylesheet" href="css/owl.carousel.min.css">
    <link rel="stylesheet" href="css/owl.theme.default.min.css">
    <link rel="stylesheet" href="css/magnific-popup.css">


    <link rel="stylesheet" href="css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="css/jquery.timepicker.css">

    <link rel="stylesheet" href="css/flaticon.css">
    <link rel="stylesheet" href="css/style.css">
<!--     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<!-- <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<!-- <script src="js/bootstrap.min.js"></script> -->
  </head>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
   function checkForm() {
   if (${userid==null}) {
         alert("로그인 해주세요."); 
         return false; 
      } 

//       location.href = "BoardWriteForm.do?id=<c:out value="${userid}"/>"
      location.href = "BoardWriteFindPet.do?id=<c:out value="${userid}"/>"
<%--          location.href = "/BoardWriteForm.do?id=<%=sessionId%>" --%>
   }
   function goData1(){         
      $('input[name=items]').attr('value', null);
      $('input[name=text]').attr('value', null);      
   }
   function goData2(){         
      $('input[name=items]').attr('value', 'status');
      $('input[name=text]').attr('value', 'lost');
   }
   
</script>
<body>
<jsp:include page="Nav.jsp"></jsp:include>
    <!-- END nav -->
    <section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg_2.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
        <div class="row no-gutters slider-text align-items-end">
          <div class="col-md-9 ftco-animate pb-5">
             <p class="breadcrumbs mb-2"><span class="mr-2"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>분실신고 <i class="ion-ios-arrow-forward"></i></span></p>
            <h1 class="mb-0 bread">분실신고</h1>
          </div>
        </div>
      </div>
    </section>

<!--     <section class="ftco-section bg-light"> -->
   <div class="container">
        <p><b>※여기는 동물을 분실한 경우 동물정보를 올려 분실 동물을 찾을 수 있는 공간입니다.</b><br>
        <b>※동물을 분실한 경우 동물보호법 제12조제1항 및 같은 법 시행규칙 제8조제1항 및 제9조제2항에 따라 등록대상동물을10일 이내 시장, 군수, 구청장에게 분실 신고하셔야 합니다.(다만, 동물보호관리시스템에서 소유자가 직접 동물상태 수정 가능)</b><br>
      <b>※로그인 후 분실신고를 등록할 수 있습니다.</b></p>


<%--    <form action="<c:url value="./BoardListAction.do"/>" method="post"> --%>
   <form action="BoardListAction.do" method="post">
         <div align="left">
            <table>
               <tr>
                  <td width="100%" align="left">&nbsp;&nbsp;
                     <div class="btn-group btn-toggle">
                     <input type="hidden" name="items" value="">
                     <input type="hidden" name="text" value="">
                        <input type="submit" id="items01"  class="btn btn-xs btn-default" value="분실중"  style="border-color:black;" onclick="activeMove(1);goData2();"/>
                        <input type="submit" id="items02" class="btn btn-xs btn-primary active" value="전체"  style="border-color:black;" onclick="activeMove(2);goData1();"/>
                     </div>
                  </td>
                  <td width="100%" align="right"><span class="badge badge-success">전체 <%=total_record%>건
                  </span></td>
               </tr>
            </table>
         </div>
         <div style="padding-top: 50px">
            <table class="table table-hover">
               <tr>
                  <th>번호</th>
                  <th>제목</th>
                  <th>작성일</th>
                  <th>조회</th>
                  <th>글쓴이</th>
               </tr>
                  <%
                  for (int j = 0; j < boardList.size(); j++) {
                     BoardDTO notice = (BoardDTO) boardList.get(j);
                     System.out.println("탁스트 "+notice.getStatus());
               %>
                  <tr>
                  <td><%=notice.getNum()%></td>
                  <c:set var="status" value="<%=notice.getStatus() %>" />
                  <c:choose> 
                  <c:when test="${status eq 'find'}">
                  <td><a href="BoardViewPetAction.do?num=<%=notice.getNum()%>&pageNum=<%=pageNum%>"><%=notice.getSubject()%><span class="badge badge-success ml-3" style="color:#fff; background-color:gray">습득완료</span></a></td>
                  </c:when>
                  <c:otherwise>
                   <td><a href="BoardViewPetAction.do?num=<%=notice.getNum()%>&pageNum=<%=pageNum%>"><%=notice.getSubject()%><span class="badge badge-success ml-3" >공고중</span></a></td>
                  </c:otherwise>
                  </c:choose>
                  <td><%=notice.getRegist_day()%></td>
                  <td><%=notice.getHit()%></td>
                  <td><%=notice.getName()%></td>
               </tr>
               <%
                  }
               %>
            </table>
         </div>
         <div align="center">
            <c:set var="pageNum" value="<%=pageNum%>" />
            <c:forEach var="i" begin="1" end="<%=total_page%>">
               <a href="<c:url value="./BoardListAction.do?pageNum=${i}" /> ">
                  <c:choose>
                     <c:when test="${pageNum==i}">
                        <font color='4C5317'><b> [${i}]</b></font>
                     </c:when>
                     <c:otherwise>
                        <font color='4C5317'> [${i}]</font>

                     </c:otherwise>
                  </c:choose>
               </a>
            </c:forEach>
         </div>
         </form>
         <div align="left">
            <table>
               <tr>
                  <td width="100%" align="left">&nbsp;&nbsp; 
                  <form action="BoardListAction.do" method="post">
							<select id="items" name="items" class="txt">
								<!--                         <option value="status">상태</option>  -->
								<option value="subject">제목에서</option>
								<option value="lostPlace">지역</option>
								<option value="name">글쓴이에서</option>
								<option value="breed">품종</option>
							</select> <input name="text" type="text" /> <input type="submit"
								id="btnAdd" class="btn btn-primary " value="검색" />
						</form>
                  </td>
                  <td width="100%" align="right">
                     <a href="#" onclick="checkForm(); return false;" class="btn btn-primary" style="width: max-content;">&laquo;글쓰기</a>
                  </td>
                  
               </tr>
            </table>
         </div>
      
         </div>
<!--       </section> -->

      <div id="map" class="map"></div>
<jsp:include page="lower.jsp"></jsp:include>

    
  

  <!-- loader -->
  <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


  <script src="js/jquery.min.js"></script>
  <script src="js/jquery-migrate-3.0.1.min.js"></script>
  <script src="js/popper.min.js"></script>
<!--   <script src="js/bootstrap.min.js"></script> -->
  <script src="js/jquery.easing.1.3.js"></script>
  <script src="js/jquery.waypoints.min.js"></script>
  <script src="js/jquery.stellar.min.js"></script>
  <script src="js/jquery.animateNumber.min.js"></script>
  <script src="js/bootstrap-datepicker.js"></script>
  <script src="js/jquery.timepicker.min.js"></script>
  <script src="js/owl.carousel.min.js"></script>
  <script src="js/jquery.magnific-popup.min.js"></script>
  <script src="js/scrollax.min.js"></script>
<!--   <script src="js/google-map.js"></script> -->
  <script src="js/main.js"></script>
  <script type="text/javascript">
   function activeMove(activeMove) {
      sessionStorage.setItem("activeMove", activeMove );
   }
   function activeMoveRefresh(){//NAV 인덱스 초기화
      sessionStorage.setItem("activeMove", 0 );
   }
   window.onload = function() {//창이 열릴떄마다 세션에서 현재 navindex값을 가져옴
		document.getElementById('navCategoli0' + sessionStorage.getItem("NaIndex")).className = 'nav-item active';
		console.log('Navindex'+sessionStorage.getItem("NaIndex"))
      if(sessionStorage.getItem("activeMove") == 1){
         document.getElementById('items01').className = 'btn btn-xs btn-primary active';
         document.getElementById('items02').className = 'btn btn-xs btn-default';
      }else{
         document.getElementById('items02').className = 'btn btn-xs btn-primary active';
         document.getElementById('items01').className = 'btn btn-xs btn-default';
      }
     
   console.log('index'+sessionStorage.getItem("activeMove"))
   }

   </script>

    
  </body>
</html>