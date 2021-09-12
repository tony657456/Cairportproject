<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div class="container">
	<!-- 헤더 부분 시작 -->
	<header>
		<nav>
			<div class="logo">
				<a href="/"> <img src="/images/logo--koreanair-pc.png" > <img src="/images/logo--skyteam-pc.png" >
				</a>
			</div>

			<div class="menu">
				<div>
					<a href="/ticketForm">예매</a>
				</div>
				<div>
					<a href="/user/checkin/${sessionScope.principal.id}">체크인</a>
				</div>
				<div>
					<a href="/travelForm">여행 정보</a>
				</div>
			</div>

			<div class="menu2">

				<c:choose>
				<c:when test="${empty sessionScope.principal}">
				<div class="login">
					<a href="/auth/loginForm">로그인</a>
				</div>
				</c:when>
				<c:otherwise>
				<div class="login">
					<a href="/user/logout">로그아웃</a>
				</div>
				</c:otherwise>
				</c:choose>		
				<a href="/user/ticketcheck/${sessionScope.principal.id}"> <img src="/images/icon2.png" />
				</a>
			</div>
		</nav>
	</header>
	<!-- 헤더 부분 끝 -->
</div>