<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<link rel="shortcut icon" href="/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="/css/ticket-return.css" />
<title>예매하기</title>
</head>
<body>
<body id="LoginForm">
	<%@ include file="../layout/navbar.jsp"%>
</body>
<!-- 헤더 부분 끝 -->

<body>
	<div class="container">

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
		</div>

		<!-- 제목 + 출발지, 도착지 정보 박스 -->
		<div class="text_box">
			<span class="text-title">오는 편</span>

			<!-- 출발지 정보 받아와야함 -->
			<span class="form-rute">&nbsp;${backairportListDto.get(0).depAirportNm}&nbsp;</span> <img src="/images/icon1.jpg" />
			<!-- 도착지 정보 받아와야함 -->
			<span class="to-rute">&nbsp;${backairportListDto.get(0).arrAirportNm}&nbsp;</span>

		</div>
		<!-- 제목 + 출발지, 도착지 정보 끝 -->

		<!-- 티켓 목록 박스 -->
		<div class="button">
			<!-- 정렬 박스 -->
			<div class="dropdown">
				<a class="btn btn-outline-primary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false"> 정렬 </a>

				<ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
					<li><a class="dropdown-item" href="#">최저 요금 순</a></li>
					<li><a class="dropdown-item" href="#">출발 시간 순</a></li>
					<li><a class="dropdown-item" href="#">도착 시간 순</a></li>
				</ul>
			</div>
			<!-- 정렬 박스 끝-->

		</div>

		<div id="my-box-box">
			<c:forEach var="backairportList" items="${backairportListDto}">

				<div class="list-box">
					<!-- 시간, 항공기 정보 -->
					<span class="ticket-list-box">
						<div class="ticket-list-text-box">
							<div class="ticket-list-time-box">
								<fmt:parseDate var="dateString" value="${backairportList.getDepPlandTime()}" pattern="yyyyMMddHHmm" />

								<span class="form-time">&nbsp;<fmt:formatDate value="${dateString}" pattern="HH시 mm분" />&nbsp;
								</span>

								<div class="form_time_box">
									<!-- 소요 시간 박스 -->
									<span class="form-to-time">&nbsp;소요시간&nbsp;</span> <img src="/images/icon3.png" />
								</div>
								<!-- 소요 시간 박스 끝 -->

								<fmt:parseDate var="dateString" value="${backairportList.getArrPlandTime()}" pattern="yyyyMMddHHmm" />

								<span class="form-time">&nbsp; <fmt:formatDate value="${dateString}" pattern="HH시 mm분" />&nbsp;
								</span>
							</div>
							<div class="air-data">&nbsp;${backairportList.getVihicleId()}&nbsp;</div>
						</div> <!-- 시간, 항공기 정보 끝 -->
					</span>

					<!-- 좌석 등급 별 정보 -->
					<!-- 특가 -->
					<button class="sale-seat">
						<div>특가운임</div>
						<span class="sale-seat-price">매진</span>
					</button>
					<!-- 정상 -->
					<button id="${backairportList.vihicleId}" class="seat" type="button"
						onClick="primaryseat('${backairportList.vihicleId}', ${backairportList.economyCharge}, '${backairportList.arrAirportNm}','${backairportList.arrPlandTime}','${backairportList.depAirportNm}','${backairportList.depPlandTime}')">
						<div>정상운임</div>
						<span class="seat-price">${backairportList.getEconomyCharge()}원</span>
					</button>
					<!-- 프레스티지 -->
					<button class="prestige-seat">
						<div>프레스티지</div>
						<span class="prestige-seat-price">${backairportList.getPrestigeCharge()}원</span>
					</button>

				</div>
				<!-- 티켓 목록 박스 끝-->
			</c:forEach>
		</div>
	</div>

	<!-- 푸터 부분 시작 -->
	<div class="container">
		<div class="footer">
			<sapn class="total-price">예상 결제 금액</sapn>
			<div id="goprice" class="totla-price2">
				<span id="price"></span> 원
			</div>

			<a href="/user/payForm" type="button" class="btn btn-primary btn-lg">결제하기 </a>
		</div>
	</div>
	<!-- 푸터 부분 끝 -->
</body>
<script>      

	  let selectedTicket;

      async function primaryseat(vihicleId, price, arrAirportNm, arrPlandTime, depAirportNm, depPlandTime) {
    	  console.log(vihicleId, price, arrAirportNm, arrPlandTime, depAirportNm, depPlandTime);
    	  
    	  // butto id를 고유한 값으로 지정해서 찾음
    	  let tmp = $("#"+ vihicleId);
    	  
    	  let p = tmp.parent();
    	
    	  let mybox = $("#my-box-box");
    	  mybox.empty();
    	  mybox.append(p);
    	  
    	  
    	  let primaryDto = {
    			  vihicleId: vihicleId,
    			  price: price,
    			  depairportnm: depAirportNm,
    			  arrairportnm: arrAirportNm,
    			  depplandtime: depPlandTime,
    			  arrplandtime: arrPlandTime
    	  };
    	  
    	  $("#price").text(price);
    	  
    	  console.log(primaryDto);
    	  
    	  let response = await fetch("/user/back", {
    		  method: "post",
    		  body: JSON.stringify(primaryDto),
    		  headers: {
    			  "Content-Type": "application/json; charset=utf-8"
    		  }
    	  });
    	  
    	  let parseResponse = await response.text();
    	  
    	  if(parseResponse === "ok"){
    		  alert("오는편이 선택되었습니다.");
    	  }
	  
      }
    </script>


</body>
</html>