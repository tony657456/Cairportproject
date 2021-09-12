<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link rel="shortcut icon" href="/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="css/ticket.css" />
<title>예매하기</title>
</head>

<body id="LoginForm">
	<%@ include file="../layout/navbar.jsp"%>

	<div class="big_box">
		<div class="container">
			<div class="main">
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
	</div>
</body>
<%@ include file="../layout/footer.jsp"%>