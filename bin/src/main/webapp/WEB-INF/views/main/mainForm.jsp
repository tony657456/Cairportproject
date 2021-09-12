<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<head>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css">
    <link href="//font.elice.io/EliceDigitalBaeum.css" rel="stylesheet">
    <link rel="stylesheet" href="css/mainForm.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"></script>
</head>

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
                    <img src="images/icon2.png" />
                </div>
            </nav>
        </header>
        <!-- 헤더 부분 끝 -->
    </div>

    <div class="container">
    <div class="main">
        <main class="main_box">
            <section>
                <div class="main_airport_img">
                    <img src="images/keyvisual-pc.jpg" />
                    <div class="search_box">
                        <form action = "/airport" method="post">
                            <table class="search_form_table">
                                <tr>
                                    <td class="search_form_title">출발지</td>
                                    <td class="search_form_title2">목적지</td>
                                </tr>
                                <tr>
                                    <td>
                                        <select class='startcontent_box' name="depAirportNm">
                                            <option value='depature'>출발지</option>
                                            <option value='seoul'>서울/SEL</option>
                                            <option value='busan'>부산/PUS</option>
                                            <option value='jeju'>제주/CJU</option>
                                        </select>
                                    </td>
                                    <td>
                                        <select class='reachcontent_box' name="arrAirportNm">
                                            <option value='' selected>도착지</option>
                                            <option value='seoul'>서울/SEL</option>
                                            <option value='busan'>부산/PUS</option>
                                            <option value='jeju'>제주/CJU</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="search_form_title">탑승일</td>
                                </tr>
                                <tr>
                                    <td><input class="start_form_input" type="date" placeholder=" 출발일" name="depPlandTime"/></td>
                                    <td><input class="reach_form_input" type="date" placeholder=" 도착일" name="arrPlandTime"/></td>
                                </tr>
                                <!-- 탑승 유형 보시면 성인 몇명 소아 몇명 이런식으로 + 할 수 있게 만들어 놨더라고요 저도 알아보고
                                있으면 말씀 드릴게요!! -->
                                <tr>
                                    <td class="search_form_title">탑승인원</td>
                                </tr>
                                <tr>
                                    <td class="category" colspan="2">
                                        <select class='category_box' name="peoplenumber">
                                            <option value='' selected>성인 1명</option>
                                            <option value='seoul'>성인 2명</option>
                                            <option value='busan'>성인 3명</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="search_form_title">좌석</td>
                                </tr>
                                <tr>
                                    <td class="seat" colspan="2">
                                        <select class='seat_box' name="economyCharge">
                                            <option value='' selected>일반석</option>
                                            <option value='first'>퍼스트</option>
                                            <option value='prestige'>프레스티지</option>
                                        </select>
                                    </td>
                                </tr>
                            </table>
                        </form>
                        <div class="test">
                        <a href="ticket-go.html" button type="button" class="btn btn-primary btn-lg">
                          <img src="images/icon6.jpg">
                        </a>
                        </div>
                        </div>
                    </div>
                </div>
                </table>

                <div>
                    <div></div>
                    <div></div>
                    <div></div>
                    <div></div>
                </div>
            </section>


            <section class="reservation_form">
                <div class="reservation_box">
                    <span class="reservation_content1">
                      <img src="images/icon9.jpg">
                        <button>예약조회</button>
                    </span>
                    <span class="reservation_content2">
                      <img src="images/icon7.jpg">
                        <button>체크인</button>
                    </span>
                    <span class="reservation_content3">
                      <img src="images/icon8.jpg">
                        <button>항공편 현황</button>
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
                                <a href="#" onclick=abc(this) class="slider_info">
                                  <img class="img-fluid card-img-top" src="images/AMS-list-pc.jpg">
                                </a>
                    
                              </div>
                              <div class="col-xs-4 col-sm-4 col-md-4">
                                <a href="#" onclick=abc(this) class="slider_info">
                                  <img class="img-fluid card-img-top rounded-bottom" src="images/BKK-list-pc.jpg">
                                </a>
                    
                              </div>
                              <div class="col-xs-4 col-sm-4 col-md-4">
                                <a href="#" onclick=abc(this) class="slider_info">
                                  <img class="img-fluid card-img-top rounded-bottom" src="images/LAX-list-pc.jpg">
                                </a>
                    
                              </div>
                            </div>
                            <div class="carousel-item">
                              <div class="col-xs-4 col-sm-4 col-md-4">
                                <a href="#" onclick=abc(this) class="slider_info">
                                  <img class="img-fluid card-img-top" src="images/LHR-list-pc.jpg">
                                </a>
                    
                              </div>
                              <div class="col-xs-4 col-sm-4 col-md-4">
                                <a href="#" onclick=abc(this) class="slider_info">
                                  <img class="img-fluid card-img-top" src="images/MNL-list-pc.jpg">
                                </a>
                    
                              </div>
                              <div class="col-xs-4 col-sm-4 col-md-4">
                                <a href="#" onclick=abc(this) class="slider_info">
                                  <img class="img-fluid card-img-top" src="images/YVR-list-pc.jpg">
                                </a>
                    
                              </div>
                            </div>
                            <div class="carousel-item">
                              <div class="col-xs-4 col-sm-4 col-md-4">
                                <a href="#" onclick=abc(this) class="slider_info">
                                  <img class="img-fluid card-img-top" src="images/CDG-list-pc.jpg">
                                </a>
                    
                              </div>
                              <div class="col-xs-4 col-sm-4 col-md-4">
                                <a href="#" onclick=abc(this) class="slider_info">
                                  <img class="img-fluid card-img-top" src="images/JFK-list-pc.jpg">
                                </a>
                    
                              </div>
                              <div class="col-xs-4 col-sm-4 col-md-4">
                                <a href="#" onclick=abc(this) class="slider_info">
                                  <img class="img-fluid card-img-top" src="images/LAX-list-pc (1).jpg">
                                </a>
                    
                    
                              </div>
                            </div>
                          </div>
                    
                          <!-- Left and right controls -->
                          <a class="carousel-control-prev" href="#demo" data-slide="prev">
                            <span class="carousel-control-prev-icon sp"></span>
                          </a>
                          <a class="carousel-control-next" href="#demo" data-slide="next">
                            <span class="carousel-control-next-icon sp"></span>
                          </a>
                        </div>
                      </div>
                </div>
            </section>

        </main>
    </div>
    <!-- 메인박스 끝 -->

    <!-- 푸터시작 -->
    <footer class="imformation_form">
      <div class="footer-box">
        
        
        <div class="imformation_box">
          <div class="imformation_title"><span style="color: #00256c">&nbsp;&nbsp;&nbsp;(주) 대한항공</span>
          <div class="imformation_text1">
            &nbsp;&nbsp;&nbsp;대표 : 우기홍 외 1명 | 주소 : 서울특별시 강서구 하늘길 260 | 전화 : 1588-2001 / 02-2656-2001
          </div>
          <div class="imformation_text2">
            &nbsp;&nbsp;&nbsp;사업자등록번호 : 110-81-14794 | 통신판매업신고 : 강서 제 16-3010 | 개인정보보호책임자 : 여객사업본부장 이진호 전무
          </div>
          <div class="imformation_text3">
            &nbsp;&nbsp;&nbsp;© 1997-2021 KOREAN AIR
          </div>
        </div>
      </div>
          <span class="imformation-icon">
            <img src="images/icon10.jpg">
          </span>
    </div>
    </footer>
    <!-- 푸터 끝 -->
  </div>
</body>