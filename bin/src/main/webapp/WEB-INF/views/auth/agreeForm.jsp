<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="css/agree.css" />
</head>

<body id="LoginForm">
	<div class="container">
		<!-- 헤더 부분 시작 -->
		<header>
			<nav>
				<div class="logo">
					<a href="mainForm.html"> <img src="images/logo--koreanair-pc.png" /> <img src="images/logo--skyteam-pc.png" />
					</a>
				</div>

				<div class="menu">
					<div>
						<a href="#">예매</a>
					</div>
					<div>
						<a href="#">조회</a>
					</div>
					<div>
						<a href="#">체크인</a>
					</div>
					<div>
						<a href="#">현황</a>
					</div>
				</div>

				<div class="menu2">
					<div class="login">
						<a href="login.html">로그인</a>
					</div>
					<img src="images/icon2.png" />
				</div>
			</nav>
		</header>
		<!-- 헤더 부분 끝 -->
	</div>

	<!--메인 시작-->
	<div class="main_box_table">
		<main class="main_box">
			<div class="container">
				<div class="contents">
					<div class="contents_text">회원가입</div>
					<!--대한 항공 홈페이지에는 아이콘이 들어가 있는데 이미지를 넣지를 못하고 이미지가 들어가는 부분에-->
					<!--이모티콘을 넣었습니다-->
					<div class="box1">
						<sapn class="icon_box"> <span> <img src="images/icon11.jpg"> <span class="steps__title">약관 동의</span>
						</span> <img src="images/icon14.jpg"> <span> <img src="images/icon12.jpg"> <span class="steps__title">회원정보 입력</span>
						</span> <img src="images/icon14.jpg"> <span> <img src="images/icon13.jpg"> <span class="steps__title">회원가입 완료</span>
						</span>
					</div>

				</div>

				<div class="text-box">
					<div class="contents_text">약관동의</div>
					<div class="p">약관 및 개인정보 수집 이용에 동의 해주세요</div>

					<div class="registration_table">
						<div class="registration_box">
							<div class="date_all">
							
								<div class="form_button">
									<input name="check" class="form-check-input" type="checkbox" value="" onclick="all()"> <label class="form-check-label" for="flexCheckDefault"> 전체동의 </label>
								</div>
								
								
								<div class="form_button">
									<input name="check" class="form-check-input" type="checkbox" value="" id="chk1"> <label class="form-check-label" for="flexCheckDefault"> 필수 및 선택 약관에 모두 동의 합니다. </label>
								</div>
							</div>
						</div>
					</div>

					<div class="registration_table">
						<div class="registration_box">
							<div class="date_all">
								<div class="form_button">
									<input class="form-check-input" type="checkbox" value="" id="chk2"> <label class="form-check-label" for="flexCheckDefault"> [필수] 이용약관 </label>
									<button type="button" class="look_button">보기</button>
								</div>
							</div>
						</div>
					</div>

					<div class="registration_table">
						<div class="registration_box">
							<div class="date_all">
								<div class="form_button">
									<input class="form-check-input" type="checkbox" value="" id="chk3"> <label class="form-check-label" for="flexCheckDefault"> [필수] 개인정보 수집 및 이용 동의 </label>
									<button type="button" class="look_button">보기</button>
								</div>
							</div>
						</div>
					</div>

					<div class="registration_table">
						<div class="registration_box">
							<div class="date_all">
								<div class="form_button">
									<input class="form-check-input" type="checkbox" value="" id="chk4"> <label class="form-check-label" for="flexCheckDefault"> [필수] 개인정보 국외 이전에 대한 동의 </label>
									<button type="button" class="look_button">보기</button>
								</div>
							</div>
						</div>
					</div>

					<div class="registration_table">
						<div class="registration_box">
							<div class="date_all">
								<div class="form_button">
									<input class="form-check-input" type="checkbox" value="" id="chk5"> <label class="form-check-label" for="flexCheckDefault"> [선택] 개인정보 제3자 제공동의 </label>
									<button type="button" class="look_button">보기</button>
								</div>
							</div>
						</div>
					</div>

					<div class="registration_table">
						<div class="registration_box">
							<div class="date_all">
								<div class="form_button">
									<input class="form-check-input" type="checkbox" value="" id="chk6"> <label class="form-check-label" for="flexCheckDefault"> [선택] 마케팅 광고 활용 동의 </label>
									<button type="button" class="look_button">보기</button>
								</div>
							</div>
						</div>
					</div>
					<div class="confirm_table">

						<a href="mainForm.html" type="button" class="confirm_table_box1">취소</a> <input type="button" value="확인" class="confirm_table_box2" onClick="chk()" />
					</div>
				</div>
			</div>

			<script>
  				function chk() {

					let chk1 = document.querySelector("#chk1").checked;
					let chk2 = document.querySelector("#chk2").checked;
					let chk3 = document.querySelector("#chk3").checked;
					let chk4 = document.querySelector("#chk4").checked;
					let chk5 = document.querySelector("#chk5").checked;
					let chk6 = document.querySelector("#chk6").checked;
					
					if(chk1 == false) alert("모든 항목란에 체크해주세요");
	 				else if(chk2 == false) alert("모든 항목란에 체크해주세요");
					else if(chk3 == false) alert("모든 항목란에 체크해주세요");
					else if(chk4 == false) alert("모든 항목란에 체크해주세요");
					else if(chk5 == false) alert("모든 항목란에 체크해주세요");
					else if(chk6 == false) alert("모든 항목란에 체크해주세요");
					else {
						location.href = "/joinForm";
					}
  				}
				
				
/*     		document.querySelectorAll(".form-check-input").forEach((c)=>{
						
	 			c.addEventListener("click", ()=>{
				console.log("클릭됨");
					});
				});  */
				
/*  			function all() {
 					
   				let chk = document.querySelectorAll(".form-check-input").forEach((c)=>{					
 					c.checked = chk.checked
				}); 
 			}; */
				
			</script>


			<%@ include file="../layout/footer.jsp"%>