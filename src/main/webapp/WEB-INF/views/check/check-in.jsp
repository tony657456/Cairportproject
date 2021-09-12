<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="shortcut icon" href="/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="/css/check-in.css" />
<title>조회 | 체크인</title>
</head>

<body id="LoginForm">
	<%@ include file="../layout/navbar.jsp"%>
	<div class="container">
		<div class="plan-text">온라인 체크인</div>
		<div>언제 어디서나 공항 도착 전에 홈페이지와 모바일웹/앱에서 미리 탑승 수속을 할 수 있습니다. 빠르고 간편한 온라인 체크인을 이용해 기다리는 시간을 절약 하세요.</div>
		<div>
			<a style="color: #e60000">*</a>이용 시간 : 항공편 출발 48시간~30분 전
		</div>
		<div>
			<a style="color: #e60000">*</a>이용 대상 : 예약이 확인된 전자항공권(E-티켓) 소지 승객
		</div>
		<div class="plan">
			<c:forEach var="checkin" items="${checkins}">
			<div class="plan-people">
			<span>체크인 가능한 티켓&nbsp;&nbsp;|&nbsp;&nbsp;${checkin.planeTicket.depairportnm} <img src="/images/icon23.png"> ${checkin.planeTicket.arrairportnm}</span></div>
			<div class="plan-box">
				<!-- 가는 편 정보 -->
				<div class="plan-go">
					<div>
								<div class="plan-en">
									<fmt:parseDate var="dateString" value="${checkin.planeTicket.depplandtime}" pattern="yyyyMMddHHmm" />
									<span class="plan-data-time1">시간&nbsp;:&nbsp;<fmt:formatDate value="${dateString}" pattern="HH시 mm분" />&nbsp; <fmt:parseDate var="dateString" value="${checkin.planeTicket.arrplandtime}"
											pattern="yyyyMMddHHmm" />
									</span> <span class="plan-data-time2">-&nbsp;<span class="plan-data-time1">&nbsp;<fmt:formatDate value="${dateString}" pattern="HH시 mm분" />&nbsp;&nbsp;|&nbsp;
									</span> <span class="plan-data-air">항공기&nbsp;:&nbsp;${checkin.planeTicket.vihicleId}&nbsp;</span>&nbsp;|&nbsp;&nbsp;<span class="plan-data-seat">가격&nbsp;:&nbsp;${checkin.planeTicket.price}원&nbsp;</span>
								</div>
					</div>
				</div>
			</div>
			</c:forEach>
		<!-- 여정 정보 끝 -->
			<a href="/user/checkQr" type="button" class="confirm_table_box2">온라인 체크인 하기</a>
					</div>
		</div>
		<!-- 여정 정보 끝 -->
		
		<div class="plan-text">체크인 후 공항 이용 방법</div>
			<div class="reservation_box">
				<img src="/images/1.png" width="80px" height="80px">
				<div class="plan-text3">1. 터미널 도착</div>
				</div>
				<div class="plan-text2">- 부칠 짐이 없을 때 : 탑승권을 가지고 바로 출발장으로 이동해 주세요.</div>
				<div class="plan-text4">- 부칠 짐이 있을 때 : 탑승권을 가지고 셀프 백드랍(자동 수하물 위탁 기기) 또는 공항 카운터에서 짐을 부치고, 출발장으로 이동해 주세요.</div>
				<a href="https://www.koreanair.com/kr/ko/airport/check-in/airport-check-in/self-bagdrop" class="plan-text4">&nbsp;&nbsp;셀프백 드랍 자세히 보기 </a>

			<div class="reservation_box">
			<img src="/images/2.png" width="80px" height="80px">
				<div class="plan-text3">2. 보안 검색 및 출국 심사</div>
				</div>
				<div class="plan-text2">- 보안 요원에게 탑승권을 제시하고 보안 검색대를 통과해 주세요.</div>
				<div class="plan-text4">- 유효한 여권과 여행서류를 소지하고 출국 심사를 진행해 주세요.</div>
				
			<div class="reservation_box">
				<img src="/images/3.png" width="80px" height="80px">
				<div class="plan-text3">3. 항공기 탑승</div>
				</div>
				<div class="plan-text2">- 탑승구 직원 및 기내 승무원에게 탑승권을 제시하고 항공기에 탑승해 주세요.</div>



	<!-- 푸터시작 -->
	<%@ include file="../layout/footer.jsp"%>