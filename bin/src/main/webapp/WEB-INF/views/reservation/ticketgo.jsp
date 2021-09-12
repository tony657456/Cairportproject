<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="//font.elice.io/EliceDigitalBaeum.css" rel="stylesheet">
    <link rel="stylesheet" href="css/ticket.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>  
    <title>예매하기</title>
</head>
<body>
    <body id="LoginForm">
        <div class="container">
          <!-- 헤더 부분 시작 -->
          <header>
            <nav>
              <div class="logo">
                <a href="mainForm.html">
                  <img src="images/logo--koreanair-pc.png" />
                  <img src="images/logo--skyteam-pc.png" />
                </a>
              </div>
      
              <div class="menu">
                <div><a href="#">예매</a></div>
                <div><a href="#">조회</a></div>
                <div><a href="#">체크인</a></div>
                <div><a href="#">현황</a></div>
              </div>
      
              <div class="menu2">
                <div class="login"><a href="login.html">로그인</a></div>
                <img src="images/icon2.png"/>
              </div>
            </nav>
          </header>
          <!-- 헤더 부분 끝 -->
      </div>
    </body>
    
    <body>
      <div class="container">
    
       <!-- 제목 + 출발지, 도착지 정보 박스 -->
        <div class="text_box">
            <span class="text-title">가는 편</span>
    
            <!-- 출발지 정보 받아와야함 -->
            <span class="form-rute">&nbsp;출발지&nbsp;</span>
            <img src="images/icon1.jpg"/>
            <!-- 도착지 정보 받아와야함 -->
            <span class="to-rute">&nbsp;도착지&nbsp;</span>
        </div>
        <!-- 제목 + 출발지, 도착지 정보 끝 -->
    
        <!-- 티켓 목록 박스 -->
        <div class="button">
        <!-- 정렬 박스 -->
        <div class="dropdown">
            <a class="btn btn-outline-primary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false">
              정렬
            </a>
          
            <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
              <li><a class="dropdown-item" href="#">최저 요금 순</a></li>
              <li><a class="dropdown-item" href="#">출발 시간 순</a></li>
              <li><a class="dropdown-item" href="#">도착 시간 순</a></li>
            </ul>
        </div>
        <!-- 정렬 박스 끝-->

        </div>
        <c:forEach var="airportList" itmes = "airportList">
        <div class="list-box">
          <!-- 시간, 항공기 정보 -->
          <span class="ticket-list-box">
            <div class="ticket-list-text-box">
              <div class="ticket-list-time-box">
                <span class="form-time">&nbsp;${airport.depPlandTime}&nbsp;</span>
    
                  <!-- 소요 시간 박스 -->
                    <span class="form-to-time">&nbsp;소요시간&nbsp;</span>
                    <img src="images/icon3.png"/>
                  <!-- 소요 시간 박스 끝 -->
    
                <span class="form-time">&nbsp;도착시간&nbsp;</span>
              </div>
              <div class="air-data">&nbsp;항공기정보&nbsp;</div>
            </div>
            <!-- 시간, 항공기 정보 끝 -->
          </span>
    
          <!-- 좌석 등급 별 정보 -->
          <!-- 특가 -->
          <div class="sale-seat"  onclick="choice">
            <div>특가운임</div>
            <span class="sale-seat-price">가격정보</span>
          </div>
          <!-- 정상 -->
          <div class="seat">
            <div>정상운임</div>
            <span class="seat-price">가격정보</span>
          </div>
          <!-- 프레스티지 -->
          <div class="prestige-seat">
            <div>프레스티지</div>
            <span class="prestige-seat-price">가격정보</span>
          </div>
    
        </div>
        </c:forEach>
        <!-- 티켓 목록 박스 끝-->
      </div>
    
      <!-- 푸터 부분 시작 -->
      <div class="container">
        <div class="footer">
          <sapn class="total-price">예상 결제 금액</sapn>
          <div class="totla-price2">데이터 원</div>
    
          <a href="ticket-return.html" button type="button" class="btn btn-primary btn-lg">다음 여정
          </a>
    
        </div>
      </div>
      <!-- 푸터 부분 끝 -->
    </body>
    
    <script>
      function choice() {
        alert("선택되었습니다.");
      }
    </script>

</body>
</html>