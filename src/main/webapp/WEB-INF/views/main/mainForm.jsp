<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link rel="shortcut icon" href="/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="css/mainForm.css" />
<title>항공권 예약 및 여행 정보 | 대한항공</title>
</head>

<body id="LoginForm">
	<%@ include file="../layout/navbar.jsp"%>

	<div class="container">
		<div class="main">
			<main class="main_box">
					<div class="main_airport_img">
						<img src="images/keyvisual-pc.jpg" />
						<form action="/user/ticketgo" method ="post">
						
						
						<div class="search_box">
							<table class="search_form_table">
								<tr>
									<td class="search_form_title">출발지</td>
									<td class="search_form_title2">목적지</td>
								</tr>

								<tr>
									<td><select class='startcontent_box' name="depairportnm">
											<option value='' selected>출발지</option>
											<option value='NAARKSS'>서울/SEL</option>
											<option value='NAARKPK'>부산/PUS</option>
											<option value='NAARKPC'>제주/CJU</option>
									</select></td>
									<td><select class='reachcontent_box' name="arrairportnm">
											<option value='' selected>도착지</option>
											<option value='NAARKSS'>서울/SEL</option>
											<option value='NAARKPK'>부산/PUS</option>
											<option value='NAARKPC'>제주/CJU</option>
									</select></td>
								</tr>
								<tr>
									<td class="search_form_title">탑승일</td>
								</tr>
								<tr>
									<td><input class="start_form_input" type="date" name="depplandtime"/></td>
									<td><input class="reach_form_input" type="date" name="arrplandtime"/></td>
								</tr>
								<!-- 탑승 유형 보시면 성인 몇명 소아 몇명 이런식으로 + 할 수 있게 만들어 놨더라고요 저도 알아보고
                            있으면 말씀 드릴게요!! -->
								<tr>
									<td class="search_form_title">탑승인원</td>
								</tr>
								<tr>
									<td class="category" colspan="2"><select class='category_box'>
											<option value='' selected>성인 1명</option>
											<option value='seoul'>성인 2명</option>
											<option value='busan'>성인 3명</option>
									</select></td>
								</tr>
								<tr>
									<td class="search_form_title">좌석</td>
								</tr>
								<tr>
									<td class="seat" colspan="2"><select class='seat_box'>
											<option value='' selected>일반석</option>
											<option value='first'>퍼스트</option>
											<option value='prestige'>프레스티지</option>
									</select></td>
								</tr>
							</table>
							<div class="test">
								<button type="submit" class="btn btn-primary btn-lg"> <img src="images/icon6.jpg">
								</button>
							</div>
						</div>
						</form>
					</div>
		</div>

		<div class="container">
			<div class="covid">
				<img src="images/tibb__bg-m.png">
				<div class="covid-text1">코로나19 업데이트</div>
				<div class="covid-text2">항공편 정보, 항공편 운항 등 코로나19와 관련된 최신 정보를 확인하실 수 있습니다.</div>
			</div>
		</div>


		<section class="reservation_form">
			<div class="reservation_box">
				<span class="reservation_content1"> <img src="images/icon9.jpg"> <a href="/user/ticketcheck/${sessionScope.principal.id}">
						<button>예약 조회</button>
				</a>
				</span> <img src="images/listicon.png"> <span class="reservation_content2"> <img src="images/icon7.jpg"> <a href="/user/checkin/${sessionScope.principal.id}">
						<button>체크인</button>
				</a>
				</span> <img src="images/listicon.png"> <span class="reservation_content3"> <img src="images/icon8.jpg"> <a href="/travelForm">
						<button>여행 정보</button>
				</a>
				</span>
			</div>
		</section>

		<section class="nowtrip_form">
			<div class="nowtrip_title">지금 떠나기 좋은 여행</div>
			<!-- 캐러셀은 여기서부터 시작인데 제가 크기를 안줄여놔서 혹시 크기 줄이다가 잘 안되는거 있으면
                제가 한거니까 말씀 해주세요!! (좀 까다로울 수도...) -->
			<div class="nowtrip_content">
				<div class="container">

					<div id="demo" class="carousel slide" data-ride="carousel">

						<!-- Indicators -->
						<ul class="carousel-indicators mb-0 pb-0">
							<li data-target="#demo" data-slide-to="0" class="active"></li>
							<li data-target="#demo" data-slide-to="1"></li>
							<li data-target="#demo" data-slide-to="2"></li>
						</ul>

						<!-- The slideshow -->
						<div class="carousel-inner no-padding my-5">
							<div class="carousel-item active">
								<div class="col-xs-4 col-sm-4 col-md-4">
									<a href="#" onclick=abc(this) class="slider_info"> <img class="img-fluid card-img-top" src="images/AMS-list-pc.jpg">
									</a>

								</div>
								<div class="col-xs-4 col-sm-4 col-md-4">
									<a href="#" onclick=abc(this) class="slider_info"> <img class="img-fluid card-img-top rounded-bottom" src="images/BKK-list-pc.jpg">
									</a>

								</div>
								<div class="col-xs-4 col-sm-4 col-md-4">
									<a href="#" onclick=abc(this) class="slider_info"> <img class="img-fluid card-img-top rounded-bottom" src="images/LAX-list-pc.jpg">
									</a>

								</div>
							</div>
							<div class="carousel-item">
								<div class="col-xs-4 col-sm-4 col-md-4">
									<a href="#" onclick=abc(this) class="slider_info"> <img class="img-fluid card-img-top" src="images/LHR-list-pc.jpg">
									</a>

								</div>
								<div class="col-xs-4 col-sm-4 col-md-4">
									<a href="#" onclick=abc(this) class="slider_info"> <img class="img-fluid card-img-top" src="images/MNL-list-pc.jpg">
									</a>

								</div>
								<div class="col-xs-4 col-sm-4 col-md-4">
									<a href="#" onclick=abc(this) class="slider_info"> <img class="img-fluid card-img-top" src="images/YVR-list-pc.jpg">
									</a>

								</div>
							</div>
							<div class="carousel-item">
								<div class="col-xs-4 col-sm-4 col-md-4">
									<a href="#" onclick=abc(this) class="slider_info"> <img class="img-fluid card-img-top" src="images/CDG-list-pc.jpg">
									</a>

								</div>
								<div class="col-xs-4 col-sm-4 col-md-4">
									<a href="#" onclick=abc(this) class="slider_info"> <img class="img-fluid card-img-top" src="images/JFK-list-pc.jpg">
									</a>

								</div>
								<div class="col-xs-4 col-sm-4 col-md-4">
									<a href="#" onclick=abc(this) class="slider_info"> <img class="img-fluid card-img-top" src="images/LAX-list-pc (1).jpg">
									</a>


								</div>
							</div>
						</div>

						<!-- Left and right controls -->
						<a class="carousel-control-prev" href="#demo" data-slide="prev"> <span class="carousel-control-prev-icon sp"></span>
						</a> <a class="carousel-control-next" href="#demo" data-slide="next"> <span class="carousel-control-next-icon sp"></span>
						</a>
					</div>
				</div>
			</div>
		</section>

		</main>
	</div>
	<!-- 메인박스 끝 -->
	</div>
</body>
<%@ include file="../layout/footer.jsp"%>