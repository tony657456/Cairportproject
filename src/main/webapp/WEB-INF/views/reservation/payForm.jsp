<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="shortcut icon" href="/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="/css/pay.css" />
<title>결제하기</title>
</head>

<body>
<body id="LoginForm">
	<%@ include file="../layout/navbar.jsp"%>
</body>
<!-- 헤더 부분 끝 -->

<body>
	<div class="container">

		<div class="plan-text">여정 정보</div>

		<!-- 여정 정보 시작 -->
		<div class="plan">
			<div class="plan-people">
			<span>선택된 티켓&nbsp;&nbsp;|&nbsp;&nbsp;${sessionScope.go.depairportnm} <img src="/images/icon23.png"> ${sessionScope.go.arrairportnm}</span></div>
			<div class="plan-box">
				<!-- 가는 편 정보 -->
				<div class="plan-go">
					<div>
						<div class="plan-en">
							<fmt:parseDate var="dateString" value="${sessionScope.go.depplandtime}" pattern="yyyyMMddHHmm" />
							<span class="plan-data-time1">시간&nbsp;:&nbsp;<fmt:formatDate value="${dateString}" pattern="HH시 mm분" />&nbsp;
							<fmt:parseDate var="dateString" value="${sessionScope.go.arrplandtime}" pattern="yyyyMMddHHmm" />
							</span> <span class="plan-data-time2">-&nbsp;<span class="plan-data-time1">&nbsp;<fmt:formatDate value="${dateString}" pattern="HH시 mm분" />&nbsp;&nbsp;|&nbsp;</span> 
							<span class="plan-data-air">항공기&nbsp;:&nbsp;${sessionScope.go.vihicleId}&nbsp;</span>&nbsp;|&nbsp;&nbsp;<span class="plan-data-seat">가격&nbsp;:&nbsp;${sessionScope.go.price}원&nbsp;</span>
						</div>
					</div>
				</div>
			</div>

			<!-- 오는 편 정보 -->
			<div class="plan-people">
			<span>선택된 티켓&nbsp;&nbsp;|&nbsp;&nbsp;${sessionScope.back.depairportnm} <img src="/images/icon23.png"> ${sessionScope.back.arrairportnm}</span></div>
			<div class="plan-box">
				<div class="plan-go">
					<div>
						<div class="plan-en">
							<fmt:parseDate var="dateString" value="${sessionScope.back.arrplandtime}" pattern="yyyyMMddHHmm" />
							<span class="plan-data-time1">시간&nbsp;:&nbsp;<fmt:formatDate value="${dateString}" pattern="HH시 mm분" />&nbsp;
							<fmt:parseDate var="dateString" value="${sessionScope.back.arrplandtime}" pattern="yyyyMMddHHmm" />
							</span> <span class="plan-data-time2">-&nbsp;<span class="plan-data-time1">&nbsp;<fmt:formatDate value="${dateString}" pattern="HH시 mm분" />&nbsp;&nbsp;|&nbsp;</span> 
							<span class="plan-data-air">항공기&nbsp;:&nbsp;${sessionScope.back.vihicleId}&nbsp;</span>&nbsp;|&nbsp;&nbsp;<span class="plan-data-seat">가격&nbsp;:&nbsp;${sessionScope.back.price}원&nbsp;</span>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- 여정 정보 끝 -->

		<!-- 정보 입력 박스 시작 -->
		<div class="plan-text">승객 정보</div>

		<div class="plan-input-box">

			<div class="plan-people">성인 1</div>

			<div class="plan-people-box">
				<div class="guide">
					<p>
						예약 후 성명 변경은 <span style="color: #2e64de">불가</span>하오니 실제 탑승하실 분의 <span style="color: #2e64de">신분증상 성명</span>으로 입력하시기 바랍니다.
					</p>
				</div>

				<form>
					<div class="form">
						<label class="form-label">국적</label> <input type="text" class="form-control" id="country" placeholder="대한민국" readonly>
						<div id="emailHelp" class="form-text">
							본 사이트는 한국에 거주하는 내국인을 위한 사이트로, <br />한국 거주 외국인 또는 해외거주 내국인은 국가/언어 설정을 변경하여 해당 사이트로 이동하시기 바랍니다.
						</div>
					</div>

					<div class="form">
						<label class="form-label">승객 성</label> <input type="text" class="form-control" value = "${principal.firstname}" id="familyname" placeholder="예) 김 또는 KIM">
						<div id="emailHelp" class="form-text">*&nbsp;공항에서 제시할 신분증 상 언어와 반드시 일치해야 합니다.</div>
					</div>

					<div class="form">
						<label class="form-label">승객 이름</label> <input type="text" class="form-control" value = "${principal.lastname}" id="firstname" placeholder="예) 대한 또는 DEAHAN">
						<div id="emailHelp" class="form-text">*&nbsp;공항에서 제시할 신분증 상 언어와 반드시 일치해야 합니다.</div>
					</div>

					<div class="form">
						<p>
						<label class="form-label">성별</label>

						<input type="text" class="form-control" value = "${principal.gender}">
						</p>
					</div>

					<div class="form-birthday">
						<label class="form-label">생년월일 (YYYY.MM.DD.)</label> <input type="number" class="form-control" value = "${principal.birthday}" id="birthday">
					</div>

					<a href="#" type="button" class="btn btn-primary btn">확인</a>
			</div>

			<div class="plan-tel">연락처 정보</div>
			<div class="plan-note">유의 사항</div>
		</div>

	</div>

	<!-- 푸터 부분 시작 -->
	<div class="container">
		<div class="footer">
			<sapn class="total-price">예상 결제 금액</sapn>
			<div class="totla-price2">${GoBackPrice} 원</div>

			<button type="button" class="btn btn-primary btn-lg" id="payment" onclick="pay()">결제하기</button>

		</div>
	</div>
	<!-- 푸터 부분 끝 -->
	
	<script>
    function pay(){
    // const를 function으로 바꾼다.
    const IMP = window.IMP; // 생략해도 괜찮습니다.
    IMP.init("imp33242811"); // "imp00000000" 대신 발급받은 "가맹점 식별코드"를 사용합니다.

    // IMP.request_pay(param, callback) 호출
    IMP.request_pay({ // param
    pg: "html5_inicis",
    pay_method: "card",
    merchant_uid: "ORD20180131-0000099",
    name: "회전 의자",
    amount: 100,
    buyer_email: "gildong@gmail.com",
    buyer_name: "홍길동",
    buyer_tel: "010-4242-4242",
    buyer_addr: "서울특별시 강남구 신사동",
    buyer_postcode: "01181"
  }, rsp => { // callback
    if (rsp.success) {
        console.log("결제 성공");
        console.log(rsp);
        console.log("나 실행??")
        location.href="/user/pay"
        // 결제 성공 시 로직,
       
    } else {
        console.log("결제 실패");
        console.log(rsp);
        // 결제 실패 시 로직,
      
             }
        });
    }
    
  
  </script> 
  
  
    
 <!-- jQuery -->
  <script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
  <!-- iamport.payment.js -->
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>

</body>