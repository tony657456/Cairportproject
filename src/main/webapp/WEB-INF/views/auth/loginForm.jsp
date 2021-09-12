<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link rel="shortcut icon" href="/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="/css/login.css" />
</head>

<body>
<body id="LoginForm">
	<%@ include file="../layout/navbar.jsp"%>
</body>

<div class="big_box">
	<div class="back-box">
		<main class="main_box">
			<div class="container1">
				<div class="main-div">
					<form action="/auth/login" method="post">
						<div class="panel_login">
							<h2>로그인</h2>
						</div>
						<div class="panel_id">
							회원 아이디<a style="color: #e60000">*</a>
						</div>


						<div class="form">
							<input type="text" class="form-control" id="country" name="username" maxlength="12">
						</div>

						<div class="panel_password">
							비밀번호<a style="color: #e60000">*</a>
						</div>

						<div>
							<div class="form">
								<input type="password" class="form-control" id="firstname" name="password" maxlength="20">
							</div>
						</div>

						<div class="form-check">
							<input class="form-check-input" type="checkbox" value="" id="flexCheckDefault"> <label class="form-check-label" for="flexCheckDefault"> 아이디 저장 </label>

							<div class="login-text">
								<button type="submit" class="login-button">로그인</button>
							</div>
					</form>

				</div>
			</div>
			<div class="join-text">
				<a href="/auth/agreeForm" class="join-box" type="button">회원가입</a>
			</div>
		</main>
	</div>
</div>
</body>

<%@ include file="../layout/footer.jsp"%>