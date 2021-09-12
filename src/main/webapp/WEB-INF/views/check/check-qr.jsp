<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../layout/header.jsp"%>
<link rel="shortcut icon" href="/images/favicon.ico" type="image/x-icon">
<link rel="icon" href="/images/favicon.ico" type="image/x-icon">
<link rel="stylesheet" href="/css/check-qr.css" />
<title>체크인</title>
</head>
<body>
<body id="QrForm">
	<%@ include file="../layout/navbar.jsp"%>

<body>
	<div class="container">
	
		<div>
			<div class="plan-input-box">
			<div class="plan-people">가는 편</div>
			<img src="/images/qr.png">
		</div>
		</div>
		
		<div>
			<div class="plan-input-box">
			<div class="plan-people">오는 편</div>
			<img src="/images/qr2.png">
		</div>
		</div>
		
		<div class="confirm_table">
			<button type="button" class="confirm_table_box1" id="checkcancel" onclick="CheckCancel()">취소</button>
			<button class="confirm_table_box2" value="Print" onclick="window.print()">프린트하기</button>
		</div>
	</div>
</body>

<script>
	function CheckCancel() {
		location.href="/user/checkin/${sessionScope.principal.id}";
	}
</script>

<%@ include file="../layout/footer.jsp"%>


