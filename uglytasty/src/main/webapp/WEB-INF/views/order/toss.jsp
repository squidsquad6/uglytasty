<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- 
	
	(단품)
	
	userId
	totalPrice : toss에 결제할 총액 알려줌
	
	oFinal : orderNo, userId, orderDate, trackingNo, addressMain, addressDetail, receiver, receiverPhone, deliveryMemo, totalPrice
			(맵퍼 : id="selectOrdersInfoFinal")
 -->
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>(단품)결제API</title>

<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
<script src="https://js.tosspayments.com/v1/payment-widget"></script>

</head>
<body>
	
	<!-- 헤더자리 -->
	<jsp:include page="../common/header.jsp"/>
	
	
	
	
	<!-- 주문 insert 후 => 주문내역 select 후 model에 박고 => toss.jsp로 옴-->
	<!-- select : userId, totalPrice -->
	

	<script>
	    // ------ 클라이언트 키로 객체 초기화 ------
	    var clientKey = 'test_ck_D5GePWvyJnrK0W0k6q8gLzN97Eoq'
	    var tossPayments = TossPayments(clientKey)
	
	    // ------ 결제창 띄우기 ------
	    tossPayments.requestPayment('카드', { // 결제수단 파라미터 (카드, 계좌이체, 가상계좌, 휴대폰 등)
	      // 결제 정보 파라미터
	      // 더 많은 결제 정보 파라미터는 결제창 Javascript SDK에서 확인하세요.
	      // https://docs.tosspayments.com/reference/js-sdk
	      amount: "${totalPrice}", // 결제 금액
	      orderId: '9a6hV9B4kXJ8QtWS9RCqa'+'${oFinal.orderNo}', // (사실, 주문번호) 주문 ID(주문 ID는 상점에서 직접 만들어주세요.) // '9a6hV9B4kXJ8QtWS9RCqa'
	      orderName: '못난이맛난이 상품 결제 완료', // 주문명
	      customerName: '김토스', // 구매자 이름
	      successUrl: "http://localhost:8008/uglytasty/success.pro?",  // 결제에 성공하면 이동하는 페이지(직접 만들어주세요)
	      failUrl: "http://localhost:8008/uglytasty/fail.pro",        // 결제에 실패하면 이동하는 페이지(직접 만들어주세요)
	       
	    })
	    // ------결제창을 띄울 수 없는 에러 처리 ------
	    // 메서드 실행에 실패해서 reject 된 에러를 처리하는 블록입니다.
	    // 결제창에서 발생할 수 있는 에러를 확인하세요. 
	    // https://docs.tosspayments.com/reference/error-codes#결제창공통-sdk-에러
	    .catch(function (error) {
	      if (error.code === 'USER_CANCEL') {
	        // 결제 고객이 결제창을 닫았을 때 에러 처리
	      } else if (error.code === 'INVALID_CARD_COMPANY') {
	        // 유효하지 않은 카드 코드에 대한 에러 처리
	      }
	    });
  	</script>

	



</body>
</html>