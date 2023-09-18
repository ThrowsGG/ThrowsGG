<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	System.out.println(DBaddresses[0]+" "+DBaddresses[1]);
%>
<c:set var="session_userid" value="${id}"></c:set>
<!DOCTYPE html>
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
<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no">
<script type="text/javascript" src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=qhzingc5km&submodules=geocoder"></script>
<script src="http://code.jquery.com/jquery-latest.min.js"></script>
<title>공고글 수정하기</title>
</head>
<script type="text/javascript">
   function checkForm() {
      if (!document.newWrite.subject.value) {
         alert("제목을 입력하세요.");
         return false;
      }
      if (!document.newWrite.name.value) {
         alert("성명을 입력하세요.");
         return false;
      }
      if (!document.newWrite.phone.value) {
         alert("연락처를 입력하세요.");
         return false;
      }
      if (!document.newWrite.petName.value) {
         alert("동물이름을 입력하세요.");
         return false;
      }
      if (!document.newWrite.breed.value) {
         alert("품종을 입력하세요.");
         return false;
      }
      if (!document.newWrite.lostDate.value) {
         alert("분실날짜를 입력하세요.");
         return false;
      }
      if (!document.newWrite.gender.value) {
         alert("성별을 입력하세요.");
         return false;
      }
      if (!document.newWrite.age.value) {
         alert("나이를 입력하세요.");
         return false;
      }
      if (!document.newWrite.lostPlace.value) {
         alert("분실장소를 입력하세요.");
         return false;
      }
      if (!document.newWrite.figure.value) {
         alert("특징을 입력하세요.");
         return false;
      }
      if (!document.newWrite.content.value) {
         alert("내용을 입력하세요.");
         return false;
      }
   }
      function goData() {
         var src = jQuery('#output').attr("src");
         var form = document.newWrite;
         var textContent = document.getElementById('content').innerHTML
         $('input[name=petPicture]').attr('value', src);
         $('input[name=content]').attr('value', textContent);
         console.log(edit)
         console.log(textContent)
         console.log(form)
      }
      
     $(".rollover").on('mouseenter', function() {
           $(this).attr("src", $(this).attr("src").replace("_off","_on"));
      }).on('mouseleave', function() {
           $(this).attr("src", $(this).attr("src").replace("_on", "_off"));
      });
      
</script>
<body>
   <jsp:include page="../Nav.jsp" />
   <section class="hero-wrap hero-wrap-2" style="background-image: url('images/bg_2.jpg');" data-stellar-background-ratio="0.5">
      <div class="overlay"></div>
      <div class="container">
         <div class="row no-gutters slider-text align-items-end">
            <div class="col-md-9 ftco-animate pb-5 fadeInUp ftco-animated">
               <p class="breadcrumbs mb-2">
                  <span class="mr-2"><a href="index.html">Home <i class="ion-ios-arrow-forward"></i></a></span> <span>커뮤니티 <i class="ion-ios-arrow-forward"></i></span>
               </p>
               <h1 class="mb-0 bread">글수정</h1>
            </div>
         </div>
      </div>
   </section>
   <div class="container">
      <form name="newUpdate" id="newUpdate" action="BoardPetUpdateAction.do?num=<%=notice.getNum()%>&pageNum=<%=nowpage%>" class="form-horizontal" method="post" onsubmit="return checkForm()">
               <input type="hidden" value="" name="petPicture">
               <input type="hidden" value="" name="content">
               <input name="id" type="hidden" class="form-control1" value="${session_userid}">               
         <div class="card">
            <div class="card-body">
               <h3 class="card-title">반려동물 분실 신고</h3>
               <h6 class="card-subtitle">※ 동물보호법 제12조제1항 및 같은 법 시행규칙 제8조제1항 및 제9조제2항에 따라 동물분실신고를 하는 공간입니다.</h6>
               <div class="row">
                  <div class="col-lg-5 col-md-5 col-sm-6">
                     <button type="button" id="btn-image">IMG 업로드</button>
                     <input id="img-selector" type="file" accept="image/*" onchange='openFile(event)'>
                     <div id="editor" class="white-box text-center" contenteditable="true"><img id='output' src="<%=notice.getPetImg()%>" class="rollover"></div>
                  </div>
                  <div class="col-lg-7 col-md-7 col-sm-6">
                     <h4 class="box-title mt-5">제목</h4>
                     <input name="subject" type="text" value="<%=notice.getSubject() %>">
                     <h4 class="box-title mt-5">하고싶은말</h4>
                     <div class="col-sm-12">
                        <div class="content-menu">
                           <button type="button" id="btn-bold">
                              <b>B</b>
                           </button>
                           <button type="button" id="btn-italic">
                              <i>I</i>
                           </button>
                           <button type="button" id="btn-underline">
                              <u>U</u>
                           </button>
                           <button type="button" id="btn-strike">
                              <s>S</s>
                           </button>
                           <button type="button" id="btn-ordered-list">OL</button>
                           <button type="button" id="btn-unordered-list">UL</button>
                        </div>
                        <div id="content" class="" contenteditable="true"><%=notice.getContent()%></div>
                     </div>
                  </div>
                  <div class="col-lg-12 col-md-12 col-sm-12">
                     <h3 class="box-title mt-5">일반적인 정보</h3>
                     <div class="table-responsive">
                        <table class="table table-striped table-product">
                           <tbody>
                              <tr>
                                 <td><b>작성자 명</b></td>
                                 <td><input name="name" type="text" class="form-control1" value="<%=notice.getName()%>" readonly></td>
                              </tr>
                              <tr>
                                 <td><b>연락처</b></td>
                                 <td><input id="phone" name="phone" type="text" class="form-control1" value="<%=notice.getPhone()%>" placeholder="-는 자동" maxlength=13></td>
                              </tr>
                              <tr>
                                 <td width="390"><b>동물 이름</b></td>
                                 <td><input name="petName" type="text" class="form-control1" value="<%=notice.getPetName()%>" placeholder="petName"></td>
                              </tr>
                              <tr>
                                 <td><b>품종</b></td>
                                 <td><input name="breed" type="text" class="form-control1" value="<%=notice.getBreed()%>" placeholder="breed"></td>
                              </tr>
                              <tr>
                                 <td><b>분실날짜</b></td>
                                    <td>
                                    <div class="input-wrap">
                                       <input type="text" class="form-control1 appointment_date" value="<%=notice.getLostDate()%>" placeholder="lostDate" name="lostDate"><span class="fa fa-calendar"></span>
                                    </div>
                                    </td>
                              </tr>
                              <tr>
                                 <td><b>성별</b></td>
                                 <td>
                                    <div class="select-wrap">
                                       <div class="icon">
                                          <select name="gender" id="" class="form-control1">
                                             <option value="수컷">수컷</option>
                                             <option value="암컷">암컷</option>
                                          </select>
                                       </div>
                                    </div>
                                 </td>
                              </tr>
                              <tr>
                                 <td><b>나이</b></td>
                                 <td><input name="age" type="text" class="form-control1" value="<%=notice.getAge()%>" placeholder="age"></td>
                              </tr>
                              <tr>
                                 <td><b>특징</b></td>
                                 <!--<td><input name="figure" type="text" class="form-control1" style="width:500px" placeholder="특징"></td> -->
                                 <td><textarea name="figure" cols="50" rows="3" class="form-control1" placeholder="반려동물의 특징을 설명해주세요."><%=notice.getFigure()%></textarea></td>
                              </tr>
                               <tr>
                                 <td><b>분실장소</b></td>
                                 <td>                                                                 </td>
                              </tr> 
                           </tbody>
                        </table>
                            <div id="map" style="width: 100%; height: 400px;">
                             <div class="search" style="position: absolute;z-index: 1000;top: 20px;left: 20px;">
                             <input type="hidden" value="<%=notice.getLostPlace()%>" id="insertAddress" name="lostPlace">
				            <input id="NAVERaddress" type="text" placeholder="검색할 주소" value="<%=notice.getLostPlace()%>">
				            <input id="submitAD" type="button" value="주소 검색">
				        </div>
                        </div>
                        <div class="col-sm-offset-2 col-sm-10 ">
                           <input type="submit" class="btn btn-primary " value="수정완료" onclick="goData();">
                           <!--                 <input type="reset" class="btn btn-primary " value="취소 "> -->
                           <a href="javascript:history.back()" class="btn btn-primary">취소</a>

                        </div>
                     </div>
                  </div>
               </div>

            </div>
         </div>
      </form>
      
   </div>
   <script src="http://code.jquery.com/jquery-latest.js"></script>
   <script src="js/jquery.min.js"></script> 
   <script src="js/jquery-migrate-3.0.1.min.js"></script>
   <script src="js/jquery.waypoints.min.js"></script>

   <script src="js/jquery.stellar.min.js"></script>
   <script src="js/bootstrap-datepicker.js"></script>   
   <script src="js/owl.carousel.min.js"></script>   
   <script src="js/jquery.magnific-popup.min.js"></script>
   <script src="js/main.js"></script>
   <script src="js/telcheck.js"></script>
   
   
</body>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script>
   const content = document.getElementById('content');
   const editor = document.getElementById('editor');
   const btnBold = document.getElementById('btn-bold');
   const btnItalic = document.getElementById('btn-italic');
   const btnUnderline = document.getElementById('btn-underline');
   const btnStrike = document.getElementById('btn-strike');
   const btnOrderedList = document.getElementById('btn-ordered-list');
   const btnUnorderedList = document.getElementById('btn-unordered-list');
   const btnImage = document.getElementById('btn-image');
   const imageSelector = document.getElementById('img-selector');

   btnBold.addEventListener('click', function() {
      setStyle('bold');
   });

   btnItalic.addEventListener('click', function() {
      setStyle('italic');
   });

   btnUnderline.addEventListener('click', function() {
      setStyle('underline');
   });

   btnStrike.addEventListener('click', function() {
      setStyle('strikeThrough')
   });

   btnOrderedList.addEventListener('click', function() {
      setStyle('insertOrderedList');
   });

   btnUnorderedList.addEventListener('click', function() {
      setStyle('insertUnorderedList');
   });

    btnImage.addEventListener('click', function () {
        imageSelector.click();
    });

    imageSelector.addEventListener('change', function (e) {
        const files = e.target.files;
        if (!!files) {
            insertImageDate(files[0]);
        }
    });
   

   content.addEventListener('keydown', function() {
      checkStyle();
   });

   content.addEventListener('mousedown', function() {
      checkStyle();
   });

   function setStyle(style) {
      document.execCommand(style);
      focusEditor();
      checkStyle();
   }

   function checkStyle() {
      if (isStyle('bold')) {
         btnBold.classList.add('active');
      } else {
         btnBold.classList.remove('active');
      }
      if (isStyle('italic')) {
         btnItalic.classList.add('active');
      } else {
         btnItalic.classList.remove('active');
      }
      if (isStyle('underline')) {
         btnUnderline.classList.add('active');
      } else {
         btnUnderline.classList.remove('active');
      }
      if (isStyle('strikeThrough')) {
         btnStrike.classList.add('active');
      } else {
         btnStrike.classList.remove('active');
      }
      if (isStyle('insertOrderedList')) {
         btnOrderedList.classList.add('active');
      } else {
         btnOrderedList.classList.remove('active');
      }
      if (isStyle('insertUnorderedList')) {
         btnUnorderedList.classList.add('active');
      } else {
         btnUnorderedList.classList.remove('active');
      }
   }

   function isStyle(style) {
      return document.queryCommandState(style);
   }

   // 버튼 클릭 시 에디터가 포커스를 잃기 때문에 다시 에디터에 포커스를 해줌
   function focusEditor() {
      content.focus({
         preventScroll : true
      });
   }

   function insertImageDate(file) {
      const reader = new FileReader();
      reader.addEventListener('load', function(e) {
         focusEditor();
         document.execCommand('insertImage', false, `${reader.result}`);
      });
      reader.readAsDataURL(file);
   }

   var openFile = function(event) {
      var input = event.target;
      var reader = new FileReader();
      reader.onload = function() {
         var dataURL = reader.result;
         var output = document.getElementById('output');
         output.src = dataURL;
      };
      reader.readAsDataURL(input.files[0]);
   };
   //네이버 지도 api - start
   var HOME_PATH = window.HOME_PATH || '.';
   var map = new naver.maps.Map("map", {
	    center: new naver.maps.LatLng(<%=Float.parseFloat(DBaddresses[0]) %>, <%=Float.parseFloat(DBaddresses[1]) %>),
	    zoom: 15,
	    mapTypeControl: true
	});
   
	var infoWindow = new naver.maps.InfoWindow({
	    anchorSkew: true
	});

	map.setCursor('pointer');

	function searchCoordinateToAddress(latlng) {

	    infoWindow.close();

	    naver.maps.Service.reverseGeocode({
	        coords: latlng,
	        orders: [
	            naver.maps.Service.OrderType.ADDR,
	            naver.maps.Service.OrderType.ROAD_ADDR
	        ].join(',')
	    }, function(status, response) {
	        if (status === naver.maps.Service.Status.ERROR) {
	            return alert('형식이 맞지 않습니다');
	        }

	        var items = response.v2.results,
	            address = '',
	            htmlAddresses = [];

	        for (var i=0, ii=items.length, item, addrType; i<ii; i++) {
	            item = items[i];
	            address = makeAddress(item) || '';
	            addrType = item.name === 'roadaddr' ? '[도로명 주소]' : '[지번 주소]';
				if(addrType === '[지번 주소]'){
					$('input[id=insertAddress]').attr('value', address);
					$('input[id=NAVERaddress]').attr('value', address);		
					console.log(address)
				}
	            htmlAddresses.push((i+1) +'. '+ addrType +' '+ address);
	        }
	            

	        infoWindow.setContent([
	            '<div style="padding:10px;min-width:200px;line-height:150%;">',
	            '<h4 style="margin-top:5px;">검색 좌표</h4><br />',
	            htmlAddresses.join('<br />'),
	            '</div>'
	        ].join('\n'));

	        infoWindow.open(map, latlng);
	    });
	}

	function searchAddressToCoordinate(address) {
	    naver.maps.Service.geocode({
	        query: address
	    }, function(status, response) {
	        if (status === naver.maps.Service.Status.ERROR) {
	            return alert('Something Wrong!');
	        }

	        if (response.v2.meta.totalCount === 0) {
	            return alert('검색결과가 존재하지 않습니다');
	        }

	        var htmlAddresses = [],
	            item = response.v2.addresses[0],
	            point = new naver.maps.Point(item.x, item.y);

	        if (item.roadAddress) {
	            htmlAddresses.push('[도로명 주소] ' + item.roadAddress);
	        }

	        if (item.jibunAddress) {
	            htmlAddresses.push('[지번 주소] ' + item.jibunAddress);
	        	$('input[id=insertAddress]').attr('value', item.jibunAddress);
	        }

	        if (item.englishAddress) {
	            htmlAddresses.push('[영문명 주소] ' + item.englishAddress);
	        }

	        infoWindow.setContent([
	            '<div style="padding:10px;min-width:200px;line-height:150%;">',
	            '<h4 style="margin-top:5px;">검색 주소 : '+ address +'</h4><br />',
	            htmlAddresses.join('<br />'),
	            '</div>'
	        ].join('\n'));

	        map.setCenter(point);
	        infoWindow.open(map, point);
	    });
	}

	function initGeocoder() {
	    map.addListener('click', function(e) {
	        searchCoordinateToAddress(e.coord);
	    });

	    $('#NAVERaddress').on('keydown', function(e) {
	        var keyCode = e.which;

	        if (keyCode === 13) { // Enter Key
	            searchAddressToCoordinate($('#address').val());
	        }
	    });

	    $('#submitAD').on('click', function(e) {
	        e.preventDefault();

	        searchAddressToCoordinate($('#NAVERaddress').val());
	    });

<%-- 	    searchAddressToCoordinate('<%=notice.getLostPlace()%>'); --%>
	}

	function makeAddress(item) {
	    if (!item) {
	        return;
	    }

	    var name = item.name,
	        region = item.region,
	        land = item.land,
	        isRoadAddress = name === 'roadaddr';

	    var sido = '', sigugun = '', dongmyun = '', ri = '', rest = '';

	    if (hasArea(region.area1)) {
	        sido = region.area1.name;
	    }

	    if (hasArea(region.area2)) {
	        sigugun = region.area2.name;
	    }

	    if (hasArea(region.area3)) {
	        dongmyun = region.area3.name;
	    }

	    if (hasArea(region.area4)) {
	        ri = region.area4.name;
	    }

	    if (land) {
	        if (hasData(land.number1)) {
	            if (hasData(land.type) && land.type === '2') {
	                rest += '산';
	            }

	            rest += land.number1;

	            if (hasData(land.number2)) {
	                rest += ('-' + land.number2);
	            }
	        }

	        if (isRoadAddress === true) {
	            if (checkLastString(dongmyun, '면')) {
	                ri = land.name;
	            } else {
	                dongmyun = land.name;
	                ri = '';
	            }

	            if (hasAddition(land.addition0)) {
	                rest += ' ' + land.addition0.value;
	            }
	        }
	    }

	    return [sido, sigugun, dongmyun, ri, rest].join(' ');
	}

	function hasArea(area) {
	    return !!(area && area.name && area.name !== '');
	}

	function hasData(data) {
	    return !!(data && data !== '');
	}

	function checkLastString (word, lastString) {
	    return new RegExp(lastString + '$').test(word);
	}

	function hasAddition (addition) {
	    return !!(addition && addition.value);
	}

	naver.maps.onJSContentLoaded = initGeocoder;
	//네이버 지도 api - end
</script>
<style>
div#content {
   padding: 16px 24px;
   border: 1px solid #D6D6D6;
   border-radius: 4px;
}
#img-selector {
   display: none;
}


#editor img {
   width: 100%;
   height: 100%
}

button.active {
   background-color: #828282;
   color: #000000;
}
</style>
</html>