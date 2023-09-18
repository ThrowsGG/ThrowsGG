<%@page import="mvc.model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" trimDirectiveWhitespaces="true"%>
<%@page import="vo.*"%>
<%@page import="gg.*"%>
<%@page import="mvc.*"%>
<%@page import="gg.*"%>
<%@page import="java.util.*"%>
<%@page import="mvc.model.BoardDTO"%>
<%@page import="dao.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="UTF-8">
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<!-- <link -->
<!-- 	href="https://fonts.googleapis.com/css?family=Montserrat:200,300,400,500,600,700,800&display=swap" -->
<!-- 	rel="stylesheet"> -->
<!-- <link rel="stylesheet" -->
<!-- 	href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"> -->
<!-- <link rel="stylesheet" href="css/animate.css"> -->
<!-- <link rel="stylesheet" href="css/owl.carousel.min.css"> -->
<!-- <link rel="stylesheet" href="css/owl.theme.default.min.css"> -->
<!-- <link rel="stylesheet" href="css/magnific-popup.css"> -->
<!-- <link rel="stylesheet" href="css/bootstrap-datepicker.css"> -->
<!-- <link rel="stylesheet" href="css/jquery.timepicker.css"> -->
<!-- <link rel="stylesheet" href="css/flaticon.css"> -->
<!-- <link rel="stylesheet" href="css/style.css"> -->
<!-- <link rel="stylesheet" href="css/pop.css"> -->
</head>

<body>
<jsp:include page="Nav.jsp"></jsp:include>
	<div class="hero-wrap js-fullheight"
		style="background-image: url('images/bg_1.jpg');"
		data-stellar-background-ratio="0.5">
		<div class="overlay"></div>
		<div class="container">
			<div
				class="row no-gutters slider-text js-fullheight align-items-center justify-content-center"
				data-scrollax-parent="true">
				<div class="col-md-11 ftco-animate text-center">
					<h1 class="mb-4">May all the animals in the world be happy</h1>
					
				</div>
			</div>
		</div>
	</div>
<jsp:include page="service.jsp"></jsp:include>

<!-- 	<section class="ftco-section bg-light ftco-faqs"> -->
<!-- 		<div class="container"> -->
<!-- 			<div class="row"> -->
<!-- 				<div class="col-lg-6 order-md-last"> -->
<!-- 					<div -->
<!-- 						class="img img-video d-flex align-self-stretch align-items-center justify-content-center justify-content-md-center mb-4 mb-sm-0" -->
<!-- 						style="background-image: url(images/about.jpg);"> -->
<!-- 						<a href="https://vimeo.com/45830194" -->
<!-- 							class="icon-video popup-vimeo d-flex justify-content-center align-items-center"> -->
<!-- 							<span class="fa fa-play"></span> -->
<!-- 						</a> -->
<!-- 					</div> -->
<!-- 					<div class="d-flex mt-3"> -->
<!-- 						<div class="img img-2 mr-md-2" -->
<!-- 							style="background-image: url(images/about-2.jpg);"></div> -->
<!-- 						<div class="img img-2 ml-md-2" -->
<!-- 							style="background-image: url(images/about-3.jpg);"></div> -->
<!-- 					</div> -->
<!-- 				</div> -->

<!-- 				<div class="col-lg-6"> -->
<!-- 					<div class="heading-section mb-5 mt-5 mt-lg-0"> -->
<!-- 						<h2 class="mb-3">Frequently Asks Questions</h2> -->
<!-- 						<p>Far far away, behind the word mountains, far from the -->
<!-- 							countries Vokalia and Consonantia, there live the blind texts.</p> -->
<!-- 					</div> -->
<!-- 					<div id="accordion" class="myaccordion w-100" -->
<!-- 						aria-multiselectable="true"> -->
<!-- 						<div class="card"> -->
<!-- 							<div class="card-header p-0" id="headingOne"> -->
<!-- 								<h2 class="mb-0"> -->
<!-- 									<button href="#collapseOne" -->
<!-- 										class="d-flex py-3 px-4 align-items-center justify-content-between btn btn-link" -->
<!-- 										data-parent="#accordion" data-toggle="collapse" -->
<!-- 										aria-expanded="true" aria-controls="collapseOne"> -->
<!-- 										<p class="mb-0">How to train your pet dog?</p> -->
<!-- 										<i class="fa" aria-hidden="true"></i> -->
<!-- 									</button> -->
<!-- 								</h2> -->
<!-- 							</div> -->
<!-- 							<div class="collapse show" id="collapseOne" role="tabpanel" -->
<!-- 								aria-labelledby="headingOne"> -->
<!-- 								<div class="card-body py-3 px-0"> -->
<!-- 									<ol> -->
<!-- 										<li>Far far away, behind the word mountains</li> -->
<!-- 										<li>Consonantia, there live the blind texts</li> -->
<!-- 										<li>When she reached the first hills of the Italic -->
<!-- 											Mountains</li> -->
<!-- 										<li>Bookmarksgrove, the headline of Alphabet Village</li> -->
<!-- 										<li>Separated they live in Bookmarksgrove right</li> -->
<!-- 									</ol> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->

<!-- 						<div class="card"> -->
<!-- 							<div class="card-header p-0" id="headingTwo" role="tab"> -->
<!-- 								<h2 class="mb-0"> -->
<!-- 									<button href="#collapseTwo" -->
<!-- 										class="d-flex py-3 px-4 align-items-center justify-content-between btn btn-link" -->
<!-- 										data-parent="#accordion" data-toggle="collapse" -->
<!-- 										aria-expanded="false" aria-controls="collapseTwo"> -->
<!-- 										<p class="mb-0">How to manage your pets?</p> -->
<!-- 										<i class="fa" aria-hidden="true"></i> -->
<!-- 									</button> -->
<!-- 								</h2> -->
<!-- 							</div> -->
<!-- 							<div class="collapse" id="collapseTwo" role="tabpanel" -->
<!-- 								aria-labelledby="headingTwo"> -->
<!-- 								<div class="card-body py-3 px-0"> -->
<!-- 									<ol> -->
<!-- 										<li>Far far away, behind the word mountains</li> -->
<!-- 										<li>Consonantia, there live the blind texts</li> -->
<!-- 										<li>When she reached the first hills of the Italic -->
<!-- 											Mountains</li> -->
<!-- 										<li>Bookmarksgrove, the headline of Alphabet Village</li> -->
<!-- 										<li>Separated they live in Bookmarksgrove right</li> -->
<!-- 									</ol> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->

<!-- 						<div class="card"> -->
<!-- 							<div class="card-header p-0" id="headingThree" role="tab"> -->
<!-- 								<h2 class="mb-0"> -->
<!-- 									<button href="#collapseThree" -->
<!-- 										class="d-flex py-3 px-4 align-items-center justify-content-between btn btn-link" -->
<!-- 										data-parent="#accordion" data-toggle="collapse" -->
<!-- 										aria-expanded="false" aria-controls="collapseThree"> -->
<!-- 										<p class="mb-0">What is the best grooming for your pets?</p> -->
<!-- 										<i class="fa" aria-hidden="true"></i> -->
<!-- 									</button> -->
<!-- 								</h2> -->
<!-- 							</div> -->
<!-- 							<div class="collapse" id="collapseThree" role="tabpanel" -->
<!-- 								aria-labelledby="headingTwo"> -->
<!-- 								<div class="card-body py-3 px-0"> -->
<!-- 									<ol> -->
<!-- 										<li>Far far away, behind the word mountains</li> -->
<!-- 										<li>Consonantia, there live the blind texts</li> -->
<!-- 										<li>When she reached the first hills of the Italic -->
<!-- 											Mountains</li> -->
<!-- 										<li>Bookmarksgrove, the headline of Alphabet Village</li> -->
<!-- 										<li>Separated they live in Bookmarksgrove right</li> -->
<!-- 									</ol> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->

<!-- 						<div class="card"> -->
<!-- 							<div class="card-header p-0" id="headingFour" role="tab"> -->
<!-- 								<h2 class="mb-0"> -->
<!-- 									<button href="#collapseFour" -->
<!-- 										class="d-flex py-3 px-4 align-items-center justify-content-between btn btn-link" -->
<!-- 										data-parent="#accordion" data-toggle="collapse" -->
<!-- 										aria-expanded="false" aria-controls="collapseFour"> -->
<!-- 										<p class="mb-0">What are those requirements for sitting -->
<!-- 											pets?</p> -->
<!-- 										<i class="fa" aria-hidden="true"></i> -->
<!-- 									</button> -->
<!-- 								</h2> -->
<!-- 							</div> -->
<!-- 							<div class="collapse" id="collapseFour" role="tabpanel" -->
<!-- 								aria-labelledby="headingTwo"> -->
<!-- 								<div class="card-body py-3 px-0"> -->
<!-- 									<p>Far far away, behind the word mountains, far from the -->
<!-- 										countries Vokalia and Consonantia, there live the blind texts. -->
<!-- 										Separated they live in Bookmarksgrove right at the coast of -->
<!-- 										the Semantics, a large language ocean.</p> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</section> -->

<!-- 	<section class="ftco-section testimony-section" -->
<!-- 		style="background-image: url('images/bg_2.jpg');"> -->
<!-- 		<div class="overlay"></div> -->
<!-- 		<div class="container"> -->
<!-- 			<div class="row justify-content-center pb-5 mb-3"> -->
<!-- 				<div class="col-md-7 heading-section text-center ftco-animate"> -->
<!-- 					<h2>Happy Clients &amp; Feedbacks</h2> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="row ftco-animate"> -->
<!-- 				<div class="col-md-12"> -->
<!-- 					<div class="carousel-testimony owl-carousel ftco-owl"> -->
<!-- 						<div class="item"> -->
<!-- 							<div class="testimony-wrap py-4"> -->
<!-- 								<div -->
<!-- 									class="icon d-flex align-items-center justify-content-center"> -->
<!-- 									<span class="fa fa-quote-left"></span> -->
<!-- 								</div> -->
<!-- 								<div class="text"> -->
<!-- 									<p class="mb-4">Far far away, behind the word mountains, -->
<!-- 										far from the countries Vokalia and Consonantia, there live the -->
<!-- 										blind texts.</p> -->
<!-- 									<div class="d-flex align-items-center"> -->
<!-- 										<div class="user-img" -->
<!-- 											style="background-image: url(images/person_1.jpg)"></div> -->
<!-- 										<div class="pl-3"> -->
<!-- 											<p class="name">Roger Scott</p> -->
<!-- 											<span class="position">Marketing Manager</span> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div class="item"> -->
<!-- 							<div class="testimony-wrap py-4"> -->
<!-- 								<div -->
<!-- 									class="icon d-flex align-items-center justify-content-center"> -->
<!-- 									<span class="fa fa-quote-left"></span> -->
<!-- 								</div> -->
<!-- 								<div class="text"> -->
<!-- 									<p class="mb-4">Far far away, behind the word mountains, -->
<!-- 										far from the countries Vokalia and Consonantia, there live the -->
<!-- 										blind texts.</p> -->
<!-- 									<div class="d-flex align-items-center"> -->
<!-- 										<div class="user-img" -->
<!-- 											style="background-image: url(images/person_2.jpg)"></div> -->
<!-- 										<div class="pl-3"> -->
<!-- 											<p class="name">Roger Scott</p> -->
<!-- 											<span class="position">Marketing Manager</span> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div class="item"> -->
<!-- 							<div class="testimony-wrap py-4"> -->
<!-- 								<div -->
<!-- 									class="icon d-flex align-items-center justify-content-center"> -->
<!-- 									<span class="fa fa-quote-left"></span> -->
<!-- 								</div> -->
<!-- 								<div class="text"> -->
<!-- 									<p class="mb-4">Far far away, behind the word mountains, -->
<!-- 										far from the countries Vokalia and Consonantia, there live the -->
<!-- 										blind texts.</p> -->
<!-- 									<div class="d-flex align-items-center"> -->
<!-- 										<div class="user-img" -->
<!-- 											style="background-image: url(images/person_3.jpg)"></div> -->
<!-- 										<div class="pl-3"> -->
<!-- 											<p class="name">Roger Scott</p> -->
<!-- 											<span class="position">Marketing Manager</span> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div class="item"> -->
<!-- 							<div class="testimony-wrap py-4"> -->
<!-- 								<div -->
<!-- 									class="icon d-flex align-items-center justify-content-center"> -->
<!-- 									<span class="fa fa-quote-left"></span> -->
<!-- 								</div> -->
<!-- 								<div class="text"> -->
<!-- 									<p class="mb-4">Far far away, behind the word mountains, -->
<!-- 										far from the countries Vokalia and Consonantia, there live the -->
<!-- 										blind texts.</p> -->
<!-- 									<div class="d-flex align-items-center"> -->
<!-- 										<div class="user-img" -->
<!-- 											style="background-image: url(images/person_1.jpg)"></div> -->
<!-- 										<div class="pl-3"> -->
<!-- 											<p class="name">Roger Scott</p> -->
<!-- 											<span class="position">Marketing Manager</span> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 						<div class="item"> -->
<!-- 							<div class="testimony-wrap py-4"> -->
<!-- 								<div -->
<!-- 									class="icon d-flex align-items-center justify-content-center"> -->
<!-- 									<span class="fa fa-quote-left"></span> -->
<!-- 								</div> -->
<!-- 								<div class="text"> -->
<!-- 									<p class="mb-4">Far far away, behind the word mountains, -->
<!-- 										far from the countries Vokalia and Consonantia, there live the -->
<!-- 										blind texts.</p> -->
<!-- 									<div class="d-flex align-items-center"> -->
<!-- 										<div class="user-img" -->
<!-- 											style="background-image: url(images/person_2.jpg)"></div> -->
<!-- 										<div class="pl-3"> -->
<!-- 											<p class="name">Roger Scott</p> -->
<!-- 											<span class="position">Marketing Manager</span> -->
<!-- 										</div> -->
<!-- 									</div> -->
<!-- 								</div> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</section> -->

<!-- 	<section class="ftco-section bg-light"> -->
<!-- 		<div class="container"> -->
<!-- 			<div class="row justify-content-center pb-5 mb-3"> -->
<!-- 				<div class="col-md-7 heading-section text-center ftco-animate"> -->
<!-- 					<h2>Affordable Packages</h2> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="row"> -->
<!-- 				<div class="col-md-4 ftco-animate"> -->
<!-- 					<div class="block-7"> -->
<!-- 						<div class="img" -->
<!-- 							style="background-image: url(images/pricing-1.jpg);"></div> -->
<!-- 						<div class="text-center p-4"> -->
<!-- 							<span class="excerpt d-block">Personal</span> <span class="price"><sup>$</sup> -->
<!-- 								<span class="number">49</span> <sub>/mos</sub></span> -->

<!-- 							<ul class="pricing-text mb-5"> -->
<!-- 								<li><span class="fa fa-check mr-2"></span>5 Dog Walk</li> -->
<!-- 								<li><span class="fa fa-check mr-2"></span>3 Vet Visit</li> -->
<!-- 								<li><span class="fa fa-check mr-2"></span>3 Pet Spa</li> -->
<!-- 								<li><span class="fa fa-check mr-2"></span>Free Supports</li> -->
<!-- 							</ul> -->

<!-- 							<a href="#" class="btn btn-primary d-block px-2 py-3">Get -->
<!-- 								Started</a> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="col-md-4 ftco-animate"> -->
<!-- 					<div class="block-7"> -->
<!-- 						<div class="img" -->
<!-- 							style="background-image: url(images/pricing-2.jpg);"></div> -->
<!-- 						<div class="text-center p-4"> -->
<!-- 							<span class="excerpt d-block">Business</span> <span class="price"><sup>$</sup> -->
<!-- 								<span class="number">79</span> <sub>/mos</sub></span> -->

<!-- 							<ul class="pricing-text mb-5"> -->
<!-- 								<li><span class="fa fa-check mr-2"></span>5 Dog Walk</li> -->
<!-- 								<li><span class="fa fa-check mr-2"></span>3 Vet Visit</li> -->
<!-- 								<li><span class="fa fa-check mr-2"></span>3 Pet Spa</li> -->
<!-- 								<li><span class="fa fa-check mr-2"></span>Free Supports</li> -->
<!-- 							</ul> -->

<!-- 							<a href="#" class="btn btn-primary d-block px-2 py-3">Get -->
<!-- 								Started</a> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="col-md-4 ftco-animate"> -->
<!-- 					<div class="block-7"> -->
<!-- 						<div class="img" -->
<!-- 							style="background-image: url(images/pricing-3.jpg);"></div> -->
<!-- 						<div class="text-center p-4"> -->
<!-- 							<span class="excerpt d-block">Ultimate</span> <span class="price"><sup>$</sup> -->
<!-- 								<span class="number">109</span> <sub>/mos</sub></span> -->

<!-- 							<ul class="pricing-text mb-5"> -->
<!-- 								<li><span class="fa fa-check mr-2"></span>5 Dog Walk</li> -->
<!-- 								<li><span class="fa fa-check mr-2"></span>3 Vet Visit</li> -->
<!-- 								<li><span class="fa fa-check mr-2"></span>3 Pet Spa</li> -->
<!-- 								<li><span class="fa fa-check mr-2"></span>Free Supports</li> -->
<!-- 							</ul> -->

<!-- 							<a href="#" class="btn btn-primary d-block px-2 py-3">Get -->
<!-- 								Started</a> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</section> -->


<!-- 	<section class="ftco-section"> -->
<!-- 		<div class="container"> -->
<!-- 			<div class="row justify-content-center pb-5 mb-3"> -->
<!-- 				<div class="col-md-7 heading-section text-center ftco-animate"> -->
<!-- 					<h2>Pets Gallery</h2> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 			<div class="row"> -->
<!-- 				<div class="col-md-4 ftco-animate"> -->
<!-- 					<div class="work mb-4 img d-flex align-items-end" -->
<!-- 						style="background-image: url(images/gallery-1.jpg);"> -->
<!-- 						<a href="images/gallery-1.jpg" -->
<!-- 							class="icon image-popup d-flex justify-content-center align-items-center"> -->
<!-- 							<span class="fa fa-expand"></span> -->
<!-- 						</a> -->
<!-- 						<div class="desc w-100 px-4"> -->
<!-- 							<div class="text w-100 mb-3"> -->
<!-- 								<span>Cat</span> -->
<!-- 								<h2> -->
<!-- 									<a href="work-single.html">Persian Cat</a> -->
<!-- 								</h2> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="col-md-4 ftco-animate"> -->
<!-- 					<div class="work mb-4 img d-flex align-items-end" -->
<!-- 						style="background-image: url(images/gallery-2.jpg);"> -->
<!-- 						<a href="images/gallery-2.jpg" -->
<!-- 							class="icon image-popup d-flex justify-content-center align-items-center"> -->
<!-- 							<span class="fa fa-expand"></span> -->
<!-- 						</a> -->
<!-- 						<div class="desc w-100 px-4"> -->
<!-- 							<div class="text w-100 mb-3"> -->
<!-- 								<span>Dog</span> -->
<!-- 								<h2> -->
<!-- 									<a href="work-single.html">Pomeranian</a> -->
<!-- 								</h2> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="col-md-4 ftco-animate"> -->
<!-- 					<div class="work mb-4 img d-flex align-items-end" -->
<!-- 						style="background-image: url(images/gallery-3.jpg);"> -->
<!-- 						<a href="images/gallery-3.jpg" -->
<!-- 							class="icon image-popup d-flex justify-content-center align-items-center"> -->
<!-- 							<span class="fa fa-expand"></span> -->
<!-- 						</a> -->
<!-- 						<div class="desc w-100 px-4"> -->
<!-- 							<div class="text w-100 mb-3"> -->
<!-- 								<span>Cat</span> -->
<!-- 								<h2> -->
<!-- 									<a href="work-single.html">Sphynx Cat</a> -->
<!-- 								</h2> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->

<!-- 				<div class="col-md-4 ftco-animate"> -->
<!-- 					<div class="work mb-4 img d-flex align-items-end" -->
<!-- 						style="background-image: url(images/gallery-4.jpg);"> -->
<!-- 						<a href="images/gallery-4.jpg" -->
<!-- 							class="icon image-popup d-flex justify-content-center align-items-center"> -->
<!-- 							<span class="fa fa-expand"></span> -->
<!-- 						</a> -->
<!-- 						<div class="desc w-100 px-4"> -->
<!-- 							<div class="text w-100 mb-3"> -->
<!-- 								<span>Cat</span> -->
<!-- 								<h2> -->
<!-- 									<a href="work-single.html">British Shorthair</a> -->
<!-- 								</h2> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="col-md-4 ftco-animate"> -->
<!-- 					<div class="work mb-4 img d-flex align-items-end" -->
<!-- 						style="background-image: url(images/gallery-5.jpg);"> -->
<!-- 						<a href="images/gallery-5.jpg" -->
<!-- 							class="icon image-popup d-flex justify-content-center align-items-center"> -->
<!-- 							<span class="fa fa-expand"></span> -->
<!-- 						</a> -->
<!-- 						<div class="desc w-100 px-4"> -->
<!-- 							<div class="text w-100 mb-3"> -->
<!-- 								<span>Dog</span> -->
<!-- 								<h2> -->
<!-- 									<a href="work-single.html">Beagle</a> -->
<!-- 								</h2> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 				<div class="col-md-4 ftco-animate"> -->
<!-- 					<div class="work mb-4 img d-flex align-items-end" -->
<!-- 						style="background-image: url(images/gallery-6.jpg);"> -->
<!-- 						<a href="images/gallery-6.jpg" -->
<!-- 							class="icon image-popup d-flex justify-content-center align-items-center"> -->
<!-- 							<span class="fa fa-expand"></span> -->
<!-- 						</a> -->
<!-- 						<div class="desc w-100 px-4"> -->
<!-- 							<div class="text w-100 mb-3"> -->
<!-- 								<span>Dog</span> -->
<!-- 								<h2> -->
<!-- 									<a href="work-single.html">Pug</a> -->
<!-- 								</h2> -->
<!-- 							</div> -->
<!-- 						</div> -->
<!-- 					</div> -->
<!-- 				</div> -->
<!-- 			</div> -->
<!-- 		</div> -->
<!-- 	</section> -->



	
<jsp:include page="lower.jsp"></jsp:include>
	
	<!-- loader -->
	<div id="ftco-loader" class="show fullscreen">
		<svg class="circular" width="48px" height="48px">
			<circle class="path-bg" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke="#eeeeee" />
			<circle class="path" cx="24" cy="24" r="22" fill="none"
				stroke-width="4" stroke-miterlimit="10" stroke="#F96D00" /></svg>
	</div>
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
	
	<!-- 따로임포트 -->
	<script type="text/javascript" src="js/mkc_javascript.js"></script>
	
</body>
</html>