<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link rel="stylesheet" href="css/join.css" />
<title>회원가입</title>
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
						<a href="ticket.html">예매</a>
					</div>
					<div>
						<a href="check-in.html">체크인</a>
					</div>
					<div>
						<a href="travel.html">여행 정보</a>
					</div>
				</div>

				<div class="menu2">
					<div class="login">
						<a href="login.html">로그인</a>
					</div>
					<a href="ticket-check.html"> <img src="images/icon2.png" />
					</a>
				</div>
			</nav>
		</header>
		<!-- 헤더 부분 끝 -->
	</div>

<form action="/joincompletetest" method="post">
	<div class="container">
		<div class="contents">
			<div class="contents">
				<div class="contents_text">회원정보 입력</div>
				<!--대한 항공 홈페이지에는 아이콘이 들어가 있는데 이미지를 넣지를 못하고 이미지가 들어가는 부분에-->
				<!--이모티콘을 넣었습니다-->
				<div class="box1">
					<sapn class="icon_box"> <span> <img src="images/icon15.jpg"> <span class="steps__title">약관 동의</span>
					</span> <img src="images/icon14.jpg"> <span> <img src="images/icon16.jpg"> <span class="steps__title">회원정보 입력</span>
					</span> <img src="images/icon14.jpg"> <span> <img src="images/icon13.jpg"> <span class="steps__title">회원가입 완료</span>
					</span>
				</div>

			</div>
		</div>
			<!--여기서 부터 회원정보 입니다.-->
			<div class="text11">회원정보 입력</div>
			<div class="text12">
				온라인 회원으로 가입하시면 스카이패스 회원으로도 별도 가입됩니다.<br /> 온라인 회원 자격을 각각 유지하는 동안 회원의 개인정보는 별도의 개인정보처리시스템에 저장되어 관리 됩니다.<br /> 영문 이름은 여권상의 이름과 동일하게 입력해 주세요.<br /> [<a style="color: #e60000">*</a>는 필수 입력 사항입니다.]
			</div>


			<div class="registration_datail">
				<div class="from-text">회원정보 (필수)</div>
				<div>
					<div class="form">
						<label class="form-label">한글 성<a style="color: #e60000">*</a></label> <input type="text" class="form-control" name="firstname">
					</div>
				</div>

				<div>
					<div class="form">
						<label class="form-label">한글 이름<a style="color: #e60000">*</a></label> <input type="text" class="form-control" name="lastname">
					</div>
				</div>

				<div>
					<div class="form">
						<label class="form-label">영문 성<a style="color: #e60000">*</a></label> <input type="text" class="form-control" name="enfirstname">
					</div>
				</div>

				<div>
					<div class="form">
						<label class="form-label">영문 이름<a style="color: #e60000">*</a></label> <input type="text" class="form-control" name="enlastname">
					</div>
				</div>
				<!--중복확인 버튼을 flex로 해서 해야하는데 제가 하니깐 위에 텍스트들이 배치가 이상해서-->
				<!--그냥 버튼 태그를 위로 올렸더니 배치는 됩니다.-->
				<div class="form">
					<label class="form-label">아이디<a style="color: #e60000">*</a></label>
					<div class="form-text" style="color: #00256c">6~12자리 영문, 숫자로 입력</div>
					<input type="text" class="form-control" id="country" maxlength="12">
					<button type="button" class="btn btn-outline-primary">중복 확인</button>
				</div>

				<div>
					<div class="form">
						<label class="form-label">비밀번호<a style="color: #e60000">*</a></label>
						<div class="form-text" style="color: #00256c">영문+숫자+특수문자($@!%*#?&) 8자~20자 이내 입력 가능, 4자리 이상 동일 또는 연속된 숫자/문자열 입력 불가</div>
						<input type="password" class="form-control" name="password" maxlength="20">
					</div>
				</div>

				<div>
					<div class="form">
						<label class="form-label">비밀번호 확인<a style="color: #e60000">*</a></label> <input type="password" class="form-control" id="firstname" maxlength="20">
					</div>
				</div>

				<div class="form-birthday">
					<label class="form-label">생년월일 (YYYY.MM.DD.)<a style="color: #e60000">*</a></label> <input type="number" class="form-control" name="birthday">
				</div>

				<div class="form">
					<p>
					<div>
						성별<a style="color: #e60000">*</a>
					</div>

					<label for="male">남성</label> <input id="male" type="radio" value="남성" name="gender"> <label for="female">여성</label> <input id="female" type="radio" checked value="여성" name="gender">
					</p>
				</div>

				<div>
					<div class="form">
						<label class="form-label">이메일<a style="color: #e60000">*</a></label> <input type="email" class="form-control" name="email">
					</div>
				</div>

				<div>
					<div class="form">
						<label class="form-label">이메일 확인<a style="color: #e60000">*</a></label> <input type="email" class="form-control" id="firstname">
					</div>
				</div>

				<div>
					<div class="form">
						<label class="form-label">전화번호<a style="color: #e60000">*</a></label> <input type="tel" class="form-control" name="phonenumber" maxlength="11">
					</div>
				</div>

				<!--메인페이지 만든곳에서 가져왔습니다.-->
				<div class="form">
					<label class="form-label">국적</label> <input type="text" class="form-control" name="nationality" placeholder="대한민국" readonly>
					<div id="emailHelp" class="form-text">
						본 사이트는 한국에 거주하는 내국인을 위한 사이트로, <br />한국 거주 외국인 또는 해외거주 내국인은 국가/언어 설정을 변경하여 해당 사이트로 이동하시기 바랍니다.
					</div>
				</div>
			</div>

			<div class="confirm_table">

				<button type="submit" class="confirm_table_box1">취소</button> <button type="submit" class="confirm_table_box2">확인</button>
			</div>
	</div>
	</form>
</body>

<%@ include file="../layout/footer.jsp"%>