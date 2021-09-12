<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="//font.elice.io/EliceDigitalBaeum.css" rel="stylesheet">
    <link rel="stylesheet" href="css/pay.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>  
    <title>결제하기</title>
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
                <div class="login"><a href="#">로그인</a></div>
                <img src="images/icon2.png"/>
              </div>
            </nav>
          </header>
      </div>
    </body>
    <!-- 헤더 부분 끝 -->

    <body>
        <div class="container">

            <div class="plan-text">여정 정보</div>

        <!-- 여정 정보 시작 -->
        <div class="plan">
            <div class="plan-box">
                <!-- 가는 편 정보 -->
                <div class="plan-go">
                    <div class="plan-text1">
                        <span class="plan-title1">가는편</span>
                    </div>
                    <div>
                        <span class="plan-en">FROM</span>
                        <span class="plan-kr">${airportList.get(0).arrAirportNm}</span>

                        <img src="images/icon4.jpg">

                        <span class="plan-en">TO</span>
                        <span class="plan-kr">${airportList.get(0).depAirportNm}</span>

                        <div class="plan-data">
                        <span class="plan-data-time1">&nbsp;${airportList.get(0).depPlandTime}&nbsp;</span>
                        <span class="plan-data-time2">-&nbsp;${airportList.get(0).arrPlandTime}&nbsp;</span>
                        <span class="plan-data-air">&nbsp;${airportList.get(0).vihicleId}&nbsp;</span>
                        <span class="plan-data-seat">&nbsp;일반석(Y)&nbsp;</span>
                        </div>
                    </div>
                </div>
            </div>

                <!-- 오는 편 정보 -->
                <div class="plan-box">
                    <div class="plan-return">
                        <div class="plan-text1">
                            <span class="plan-title1">오는 편</span>
                        </div>
                        <div>
                            <span class="plan-en">FROM</span>
                            <span class="plan-kr">${airportList.get(0).depAirportNm}</span>

                            <img src="images/icon4.jpg">

                            <span class="plan-en">TO</span>
                            <span class="plan-kr">${airportList.get(0).arrAirportNm}</span>

                            <div class="plan-data">
                                <span class="plan-data-time1">&nbsp;${airportList.get(0).depPlandTime}&nbsp;</span>
                                <span class="plan-data-time2">&nbsp;-&nbsp;${airportList.get(0).arrPlandTime}&nbsp;</span>
                                <span class="plan-data-air">&nbsp;${airportList.get(0).vihicleId}&nbsp;</span>
                                <span class="plan-data-seat">&nbsp;일반석(Y)&nbsp;</span>
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
                      <label  class="form-label">국적</label>
                      <input type="text" class="form-control" id="country" placeholder="대한민국" readonly>
                      <div id="emailHelp" class="form-text">본 사이트는 한국에 거주하는 내국인을 위한 사이트로, <br/>한국 거주 외국인 또는 해외거주 내국인은 국가/언어 설정을 변경하여 해당 사이트로 이동하시기 바랍니다.</div>
                    </div>

                    <div class="form">
                        <label  class="form-label">승객 성</label>
                        <input type="text" class="form-control" id="familyname" placeholder="예) 김 또는 KIM">
                        <div id="emailHelp" class="form-text">*&nbsp;공항에서 제시할 신분증 상 언어와 반드시 일치해야 합니다.</div>
                    </div>

                    <div class="form">
                        <label  class="form-label">승객 성</label>
                        <input type="text" class="form-control" id="firstname" placeholder="예) 대한 또는 DEAHAN">
                        <div id="emailHelp" class="form-text">*&nbsp;공항에서 제시할 신분증 상 언어와 반드시 일치해야 합니다.</div>
                    </div>

                    <div class="form">
                    <p>
                        <div>성별</div>
                      
                        <label for="male">남성</label>
                        <input id="male" type="radio"  value="남성" name="ss">
                      
                        <label for="female">여성</label>
                        <input id="female" type="radio" checked value="여성" name="ss">
                    </p>
                    </div>  

                    <div class="form-birthday">
                        <label  class="form-label">생년월일 (YYYY.MM.DD.)</label>
                        <input type="number" class="form-control" id="birthday">
                    </div>

                    <a href="" button type="button" class="btn btn-primary btn">확인</a>
            </div>

            <div class="plan-tel">연락처 정보</div>
            <div class="plan-note">유의 사항</div>
            </div>

    </div>

      <!-- 푸터 부분 시작 -->
      <div class="container">
        <div class="footer">
          <span class="total-price">예상 결제 금액</span>
          <div class="totla-price2">데이터 원</div>
    
          <a href="" button type="button" class="btn btn-primary btn-lg">결제하기</a>
    
        </div>
      </div>
      <!-- 푸터 부분 끝 -->

    </body>