<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link rel="shortcut icon" href="/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="images/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="/css/join-end.css" />
<title>회원가입 완료</title>
</head>

<body>
<body id="LoginForm">
<%@ include file="../layout/navbar.jsp"%>

	<!-- 메인 화면 시작 -->
	<main>

		<div class="container">
			<div class="text-box">
				<div class="title-text">회원가입 완료</div>
				<div class="text1">회원가입이 완료되었습니다.</div>
				<div class="text2">확인을 누르면 메인 화면으로 돌아갑니다.</div>
			</div>
			<div class="confirm_table">

				<a href="/auth/loginForm" type="button" class="confirm_table_box2">확인</a>
			</div>
	</main>
</body>

<!-- 푸터시작 -->
<%@ include file="../layout/footer.jsp"%>
<!-- 푸터 끝 -->