<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta http-equiv="x-ua-compatible" content="ie=edge" />
<!-- 구글 로그인  -->
<!-- <meta name="google-signin-scope" content="profile email"> -->
    <meta name="google-signin-client_id" content="클라이언트 아이디">
    
<!--     구글 로그인  -->
<title>ThrowsGG</title>
<!-- MDB icon -->
<link rel="icon" href="img/mdb-favicon.ico" type="image/x-icon" />
<!-- Font Awesome -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" />
<!-- Google Fonts Roboto -->
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;500;700;900&display=swap" />
<!-- MDB -->
<link rel="stylesheet" href="css/mdb.min.css" />

<!-- Prism -->
<link rel="stylesheet" href="https://mdbgo.io/mikolaj-smolenski/mdb5-demo-pro/dev/css/new-prism.css" />




<!-- Custom styles -->
<style>
body {
	position: relative;
	padding-top: 0;
}

main {
	padding-left: 240px;
}
</style>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link href="https://fonts.googleapis.com/css?family=Montserrat:200,300,400,500,600,700,800&display=swap" rel="stylesheet">

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">

<link rel="stylesheet" href="css/animate.css">

<link rel="stylesheet" href="css/owl.carousel.min.css">
<link rel="stylesheet" href="css/owl.theme.default.min.css">
<link rel="stylesheet" href="css/magnific-popup.css">


<link rel="stylesheet" href="css/bootstrap-datepicker.css">
<link rel="stylesheet" href="css/jquery.timepicker.css">

<link rel="stylesheet" href="css/flaticon.css">
<link rel="stylesheet" href="css/style.css">
</head>

<body data-mdb-spy="scroll" data-mdb-target="#scrollspy1" data-mdb-offset="1" class="scrollspy-example">
	<!-- YOUR WORK HERE -->
	<jsp:include page="Nav.jsp"></jsp:include>

	<main>
		<div class="container my-5">
			<div class="row">
				<!-- Left column -->
				<div class="col-md-10 mb-4 mb-md-0">
					<!--Section: Docs content-->
					<section>

						<!--Section: login register example-->
						<section id="section-login-register-example">
							<!-- Section title -->
							<h2 class="my-5 mb-2">Login - register</h2>
							<!-- Section: Demo -->
							<section class="border p-4 text-center w-100 rounded-top">
								<div class="container d-flex flex-column w-50">
									<!-- Pills navs -->
									<ul class="nav nav-pills nav-justified mb-3" id="ex1" role="tablist">
										<li class="nav-item" role="presentation"><a class="nav-link active" id="tab-login" data-mdb-toggle="pill" href="#pills-login" role="tab" aria-controls="pills-login" aria-selected="true">Login</a></li>
										<li class="nav-item" role="presentation"><a class="nav-link" id="tab-register" data-mdb-toggle="pill" href="#pills-register" role="tab" aria-controls="pills-register" aria-selected="false">Register</a></li>
									</ul>
									<!-- Pills navs -->

									<!-- Pills content -->
									<!-- 로그인 시작 -->
									<div class="tab-content">
										<div class="tab-pane fade show active" id="pills-login" role="tabpanel" aria-labelledby="tab-login">
											<!-- 											<form> -->

											<!-- Email input -->
											<div class="form-outline mb-4">
												<input type="text" id="loginid" class="form-control" /> <label class="form-label" for="loginName">id</label>
											</div>

											<!-- Password input -->
											<div class="form-outline mb-4">
												<input type="password" id="loginPassword" class="form-control" /> <label class="form-label" for="loginPassword">Password</label>
											</div>
											<div class="alert alert-danger" id="login-danger">아이디나 비밀번호를 다시 확인하세요.</div>

											<!-- 2 column grid layout -->
											<div class="row mb-4">
												<div class="col-md-6 d-flex justify-content-center">
													<!-- Simple link -->
													<a href="Findpassword.jsp">Forgot password?</a>
												</div>
											</div>

											<!-- Submit button -->
											<button type="submit" onclick=signup() id="loginbutton" class="btn btn-primary btn-block mb-4">Sign in</button>
											
											
											
											<!-- Register buttons -->
											<div class="text-center">
												<p>
													Not a member? <a href="#!">Register</a>
												</p>
											</div>
											<div class="row mb-4" style="text-align: center; display :inline-block;">
											
      <a class="btn" href="javascript:void(0)" onclick= kakaoLogin()  >
          <img
           src="//k.kakaocdn.net/14/dn/btqCn0WEmI3/nijroPfbpCa4at5EIsjyf0/o.jpg"
           width="240"
         />
          
      </a>
	
	
<!-- 	<li onclick="kakaoLogout();"> -->
<!--       <a href="javascript:void(0)"> -->
<!--           <span>카카오 로그아웃</span> -->
<!--       </a> -->
<!-- 	</li> -->
</ul>
<!-- 	간편 로그인  -->
<script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
<!-- 간편 로그인 -->
<script>
Kakao.init('클라이언트 아이디'); //발급받은 키 중 javascript키를 사용해준다.
console.log(Kakao.isInitialized()); // sdk초기화여부판단
//카카오로그인
function kakaoLogin() {
	var id = null;
	var nickname = null;
	var email = null;
    Kakao.Auth.login({
      success: function (response) {
        Kakao.API.request({
          url: '/v2/user/me',
          data: {
           property_keys: ["kakao_account.email","id", "properties.nickname","properties.profile_image"]
       },
          success: function (response) {

        	  console.log(response)
                     console.log(response);
                        // @breif 아이디
                        id = response.id;
                        email = response.kakao_account.email;
                        // @breif 닉네임
                        nickname = response.properties.nickname;
                        img = response.properties.profile_image;
                        // @breif 프로필 이미지
//                         document.getElementById( "kakaoProfileImg" ).src = res.properties.profile_image;
                        // @breif 썸네일 이미지
//                         document.getElementById( "kakaoThumbnailImg" ).src = res.properties.thumbnail_image;
                            	  alert(id + " " + email + " " + nickname + img);
        	
        	  $.ajax({
					type: "post",
					url: "easylogin.lg",
					dataType: "text",
					data: {
						id: id,
						email: email,
						nickname: nickname,
						img: img
					}
				}).done(function(data) {
					if (data != "null") {
						window.location.href = "index.jsp";
					} else {
						alert("fail");
					}
				}).error(function(data) {
					alert("error");
				})
        	  
          },
          fail: function (error) {
            console.log(error)
          },
        })
      },
      fail: function (error) {
        console.log(error)
      },
    })
  }
  </script>
  
<!--   naver Login -->

<!-- <ul> -->
<!-- 	<li> -->
<!--       아래와같이 아이디를 꼭 써준다. -->
<!--       <a id="naverIdLogin_loginButton" href="javascript:void(0)"> -->
<!--           <span>네이버 로그인</span> -->
<!--       </a> -->
<!-- 	</li> -->
<!-- </ul> -->

<!-- 네이버 스크립트 -->
<!-- <script src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.2.js" charset="utf-8"></script> -->

<script>

// var naverLogin = new naver.LoginWithNaverId(
// 		{
// 			clientId: "80mdf88flkWWJT1f93Tz", //내 애플리케이션 정보에 cliendId를 입력해줍니다.
// 			callbackUrl: "http://localhost:8181/naverLogin", // 내 애플리케이션 API설정의 Callback URL 을 입력해줍니다.
// 			isPopup: false,
// 			callbackHandle: true
// 		}
// 	);	

// naverLogin.init();

// window.addEventListener('load', function () {
// 	naverLogin.getLoginStatus(function (status) {
// 		if (status) {
// 			var email = naverLogin.user.getEmail(); // 필수로 설정할것을 받아와 아래처럼 조건문을 줍니다.
    		
// 			console.log(naverLogin.user); 
    		
//             if( email == undefined || email == null) {
// 				alert("이메일은 필수정보입니다. 정보제공을 동의해주세요.");
// 				naverLogin.reprompt();
// 				return;
// 			}
// 		} else {
// 			console.log("callback 처리에 실패하였습니다.");
// 		}
// 	});
// });


// var testPopUp;
// function openPopUp() {
//     testPopUp= window.open("https://nid.naver.com/nidlogin.logout", "_blank", "toolbar=yes,scrollbars=yes,resizable=yes,width=1,height=1");
// }
// function closePopUp(){
//     testPopUp.close();
// }

// function naverLogout() {
// 	openPopUp();
// 	setTimeout(function() {
// 		closePopUp();
// 		}, 1000);
	
	
// }
</script>

<!-- 구글 로그인  -->
<script src="https://accounts.google.com/gsi/client" async defer></script>
      <script src="https://apis.google.com/js/platform.js" async defer></script>
      <script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
      <script>
        function handleCredentialResponse(response) {
        	const responsePayload = parseJwt(response.credential);
        	console.log("ID: " + responsePayload.sub);
            console.log('Full Name: ' + responsePayload.name);
            console.log('Given Name: ' + responsePayload.given_name);
            console.log('Family Name: ' + responsePayload.family_name);
            console.log("Image URL: " + responsePayload.picture);
            console.log("Email: " + responsePayload.email);
            
            $.ajax({
				type: "post",
				url: "easylogin.lg",
				dataType: "text",
				data: {
					id: responsePayload.sub,
					email: responsePayload.email,
					nickname: responsePayload.name,
					img: responsePayload.picture
				}
			}).done(function(data) {
				if (data != "null") {
						window.location.href = "index.jsp";
				} else {
					alert("fail");
				}
			}).error(function(data) {
				alert("error");
			})
        }
        function parseJwt (token) {
            var base64Url = token.split('.')[1];
            var base64 = base64Url.replace(/-/g, '+').replace(/_/g, '/');
            var jsonPayload = decodeURIComponent(atob(base64).split('').map(function(c) {
                return '%' + ('00' + c.charCodeAt(0).toString(16)).slice(-2);
            }).join(''));

            return JSON.parse(jsonPayload);
        };
        window.onload = function () {
          google.accounts.id.initialize({
            client_id: "클라이언트 아이디",
            callback: handleCredentialResponse
          });
          google.accounts.id.renderButton(
            document.getElementById("buttonDiv"),
            { theme: "outline", size: "large" }  // customization attributes
          );
          google.accounts.id.prompt(); // also display the One Tap dialog
        }
    </script>
<div id="buttonDiv" class="g-signin2" data-width="240" data-height="50" style="margin-left: 5px;"></div>    </div>

<!-- <div class="g-signin2" data-onsuccess="onSignIn" data-theme="dark" ></div> -->
<!-- <script src="https://apis.google.com/js/platform.js" async defer></script> -->
    <script>
//       function onSignIn(googleUser) {
//     	  console.log('??');
//         // Useful data for your client-side scripts:
//         var profile = googleUser.getBasicProfile();
//         console.log("ID: " + profile.getId()); // Don't send this directly to your server!
//         console.log('Full Name: ' + profile.getName());
//         console.log('Given Name: ' + profile.getGivenName());
//         console.log('Family Name: ' + profile.getFamilyName());
//         console.log("Image URL: " + profile.getImageUrl());
//         console.log("Email: " + profile.getEmail());

// //         The ID token you need to pass to your backend:
//         var id_token = googleUser.getAuthResponse().id_token;
//         console.log("ID Token: " + id_token);
        
//         var auth2 = gapi.auth2.getAuthInstance();
//         console.log('??');
//         if (auth2.isSignedIn.get()) {
//         	  var profile = auth2.currentUser.get().getBasicProfile();
//         	  console.log('ID: ' + profile.getId());
//         	  console.log('Full Name: ' + profile.getName());
//         	  console.log('Given Name: ' + profile.getGivenName());
//         	  console.log('Family Name: ' + profile.getFamilyName());
//         	  console.log('Image URL: ' + profile.getImageUrl());
//         	  console.log('Email: ' + profile.getEmail());
//         	}
//       }
    </script> 

<!-- <ul> -->
<!--  <li id="GgCustomLogin"> -->
<!--   <a href="javascript:void(0)"> -->
<!--    <span>Login with Google</span> -->
<!--   </a> -->
<!--  </li> -->
<!-- </ul> -->
<script>

//처음 실행하는 함수
// function init() {
// 	gapi.load('auth2', function() {
// 		gapi.auth2.init();
// 		options = new gapi.auth2.SigninOptionsBuilder();
// 		options.setPrompt('select_account');
//         // 추가는 Oauth 승인 권한 추가 후 띄어쓰기 기준으로 추가
// 		options.setScope('email profile openid https://www.googleapis.com/auth/user.birthday.read');
//         // 인스턴스의 함수 호출 - element에 로그인 기능 추가
//         // GgCustomLogin은 li태그안에 있는 ID, 위에 설정한 options와 아래 성공,실패시 실행하는 함수들
// 		gapi.auth2.getAuthInstance().attachClickHandler('GgCustomLogin', options, onSignIn, onSignInFailure);
// 	})
// }

// function onSignIn(googleUser) {
// 	var access_token = googleUser.getAuthResponse().access_token
// 	$.ajax({
//     	// people api를 이용하여 프로필 및 생년월일에 대한 선택동의후 가져온다.
// 		url: 'https://people.googleapis.com/v1/people/me'
//         // key에 자신의 API 키를 넣습니다.
// 		, data: {personFields:'birthdays', key:'AIzaSyDoorkOZ8Dz-x8xdy9Jsr6OVIzx-9Ijeqk', 'access_token': access_token}
// 		, method:'GET'
// 	})
// 	.done(function(e){
//         //프로필을 가져온다.
// 		var profile = googleUser.getBasicProfile();
// 		console.log(profile)
// 	})
// 	.fail(function(e){
// 		console.log(e);
// 	})
// }
// function onSignInFailure(t){		
// 	console.log(t);
// }
</script>


<!-- 구글 로그인  -->
											<!-- 											</form> -->
										</div>
										
										
										
										<!-- 로그인 부분 끝 -->
											<!-- 회원 가입 부분 -->
										<div class="tab-pane fade" id="pills-register" role="tabpanel" aria-labelledby="tab-register">
											<form class="row g-3 needs-validation" novalidate name="formregister" method="post" action="insert.lg" encType="UTF-8">

												<!-- id input -->
												<div class="form-outline mb-4">
													<input type="text" id="id" name="id" class="form-control" required minlength="5" maxlength="20" placeholder="5자 이상"   /> <label class="form-label" for="registerEmail">id</label>
												</div>
												<div class="alert alert-danger" id="id-danger">사용중인 아이디 입니다.</div>
												<div class="alert alert-success" id="id-success">사용 가능한 아이디 입니다.</div>
												<div class="alert alert-danger" id="id-danger2">사용 불가 아이디 입니다.</div>

												<!-- Password input -->
												<div class="form-outline mb-4">
													<input type="password" id="registerPassword" name="password" class="form-control" required pattern="(?=.*\d)(?=.*[a-zA-Z])(?=.*[0-9]).{8,}" minlength="8" maxlength="20" placeholder="숫자와 영어 포함 8자 이상" /> <label class="form-label" for="registerPassword">Password</label>
												</div>

												<!-- Repeat Password input -->
												<div class="form-outline mb-4">
													<input type="password" id="registerRepeatPassword" class="form-control" required pattern="(?=.*\d)(?=.*[a-zA-Z])(?=.*[0-9]).{8,}" minlength="8" maxlength="20" /> <label class="form-label" for="registerRepeatPassword">Repeat password</label>
												</div>

												<div class="alert alert-danger" id="alert-danger">비밀번호가 일치하지 않습니다.</div>
												<div class="alert alert-success" id="alert-success">비밀번호가 일치합니다.</div>


												<!-- Nickname input -->
												<div class="form-outline mb-4">
													<input type="text" id="nickname" class="form-control" name="nickname" required minlength="2" maxlength="20" placeholder="2자 이상" /> <label class="form-label" for="registerName">Nickname</label>
												</div>


												<!-- name input -->
												<div class="form-outline mb-4">
													<input type="text" id="name" class="form-control" name="name" required minlength="2" maxlength="20" placeholder="2자 이상"  /> <label class="form-label" for="registerName">name</label>
												</div>

												<!-- phone input -->
												<div class="form-outline mb-4">
													<input type="tel" class="form-control" name="phone" id="phone" required pattern="[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}" maxlength="13" placeholder=" - 자동" /> <label class="form-label" for="registerUsername">phone number</label>
												</div>

												<!-- Email input -->
												<div class="form-outline mb-4">
													<input type="email" id="email" name="email" class="form-control" required pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" maxlength="30" placeholder="ex)abc123@gmail.com" /> <label class="form-label" for="loginName">Email</label>
												</div>





												

												<!-- Submit button -->
												<button type="submit" onclick=register() class="btn btn-primary btn-block mb-3" id="submit">회원 가입</button>
											</form>
										</div>
									</div>
									<!-- Pills content -->
								</div>
							</section>

							<!-- Section: Demo -->

						</section>
						<!--Section: login register example-->

					</section>

				</div>
				<!-- Left column -->


			</div>
		</div>
	</main>

	<!-- Prism -->

	<script type="text/javascript" src="https://mdbgo.io/mikolaj-smolenski/mdb5-demo-pro/dev/js/new-prism.js"></script>
	<script type="text/javascript" src="https://mdbgo.io/mikolaj-smolenski/mdb5-demo-pro/dev/js/dist/mdbsnippet.min.js"></script>
	<!-- MDB -->
	<script type="text/javascript" src="js/mdb.min.js"></script>
	<!-- Custom scripts -->
	<script type="text/javascript"></script>

	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<script src="js/jquery.min.js"></script>
	<script src="js/jquery-migrate-3.0.1.min.js"></script>
	<script src="js/popper.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/jquery.easing.1.3.js"></script>
	<script src="js/jquery.waypoints.min.js"></script>
	<script src="js/jquery.stellar.min.js"></script>
	<script src="js/jquery.animateNumber.min.js"></script>
	<script src="js/bootstrap-datepicker.js"></script>
	<script src="js/jquery.timepicker.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/scrollax.min.js"></script>
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
	<script src="js/google-map.js"></script>
	<script src="js/main.js"></script>

	<!-- YOUR WORK HERE -->
	<script src="js/telcheck.js"></script>
	<script src="js/login-check.js"></script>
	<script src="js/repeatPW.js"></script>
	<script src="js/idoverlapcheck.js"></script>
	<script src="js/join.js"></script>
	<script src="js/signup.js"></script>
	<script src="js/otherspace.js"></script>
	<script src="js/loginspace.js"></script>

</body>

</html>
