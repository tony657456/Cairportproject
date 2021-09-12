<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../layout/header.jsp"%>
<link rel="shortcut icon" href="/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="/css/ticket-check.css" />
<title>조회 | 체크인</title>
</head>

<body id="LoginForm">
	<%@ include file="../layout/navbar.jsp"%>

	<div class="container">
		<div class="plan-text">나의 예약</div>
		<div>홈페이지에서 로그인 후 구매한 예약/항공원 목록을 보여 드립니다.</div>
		<div>고객님의 예약 및 항공원 구매 기록은 시스템 사정으로 간혹 다소 지연되어 나타나는 경우가 있으니 잠시후에 확인하여 주시면 감사하겠습니다.</div>

		<div class="plan">
			<c:forEach var="payment" items="${payments}">
				<div class="plan-text2">
					<span>예약된 티켓&nbsp;&nbsp;|&nbsp;&nbsp;${payment.planeTicket.depairportnm} <img src="/images/icon23.png"> ${payment.planeTicket.arrairportnm}
					</span>
				</div>
				<!-- 여정 정보 시작 -->
				<div class="plan-people">
					<div class="plan-box">
						<!-- 가는 편 정보 -->
						<div class="plan-go">
							<div>
								<div class="plan-en">
									<fmt:parseDate var="dateString" value="${payment.planeTicket.depplandtime}" pattern="yyyyMMddHHmm" />
									<span class="plan-data-time1">시간&nbsp;:&nbsp;<fmt:formatDate value="${dateString}" pattern="HH시 mm분" />&nbsp; <fmt:parseDate var="dateString"
											value="${payment.planeTicket.arrplandtime}" pattern="yyyyMMddHHmm" />
									</span> <span class="plan-data-time2">-&nbsp;<span class="plan-data-time1">&nbsp;<fmt:formatDate value="${dateString}" pattern="HH시 mm분" />&nbsp;&nbsp;|&nbsp;
									</span> <span class="plan-data-air">항공기&nbsp;:&nbsp;${payment.planeTicket.vihicleId}&nbsp;</span>&nbsp;|&nbsp;&nbsp;<span class="plan-data-seat">가격&nbsp;:&nbsp;${payment.planeTicket.price}원&nbsp;</span>
								</div>
							</div>
						</div>
					</div>
					<!-- 여정 정보 끝 -->
			</c:forEach>

		</div>
		<!-- 여정 정보 끝 -->
		<div class="confirm_table">
			<button class="confirm_table_box1" id="cancel" onclick="Cancel()">예약취소</button>
		</div>
	</div>

</body>
<%@ include file="../layout/footer.jsp"%>