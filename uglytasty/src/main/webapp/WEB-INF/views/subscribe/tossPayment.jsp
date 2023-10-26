<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제하기</title>
 <!-- Latest compiled and minified CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

  <!-- jQuery library -->
  <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>
  
  <!-- Popper JS -->
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
  
  <!-- Latest compiled JavaScript -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
  
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">
  <script src="https://js.tosspayments.com/v1/payment-widget"></script>
  <style>
  /* --------------------상단으로 이동하기 버튼-------------------- */
    .btn_gotop {
        display:none;
        position:fixed;
        bottom:30px;
        right:50px;
        z-index:999;
        cursor:pointer;
    }
    
  </style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>
<!-- 상단으로 이동하기 버튼 -->
    <div class="btn_gotop">
        <img width="50px" src="https://blog.kakaocdn.net/dn/s6jL5/btqHsbU8DSJ/yBeqQLZS4Kg866xEHCvA20/img.png" >
    </div>
    
    
    <div style="width:1000px; margin: auto;"> 
   
    <script>
       // 상단으로 이동하기 버튼
       $(window).scroll(function(){
           if ($(this).scrollTop() > 300){
               $('.btn_gotop').show();
           } else{
               $('.btn_gotop').hide();
           }
       });
       $('.btn_gotop').click(function(){
           $('html, body').animate({scrollTop:0},400);
           return false;
       });
   </script>
	<!-- 결제위젯, 이용약관 영역 -->
  <div id="payment-method"></div>
  <div id="agreement"></div>
  
      
  
  
  <!-- 결제하기 버튼 -->
  <button id="payment-button"  class="button is-rounded is-large is-fullwidth"  style="background-color: rgb(65, 75, 90); color: white; font-weight: bold;">결제하기</button>
  <script>
    const clientKey = "test_gck_docs_Ovk5rk1EwkEbP0W43n07xlzm"
    const customerKey = "vTqJAXQAhPNPJmnPK4uag" // 내 상점에서 고객을 구분하기 위해 발급한 고객의 고유 ID
    const button = document.getElementById("payment-button")

    // ------  결제위젯 초기화 ------ 
    // 비회원 결제에는 customerKey 대신 ANONYMOUS를 사용하세요.
    const paymentWidget = PaymentWidget(clientKey, customerKey) // 회원 결제
    // const paymentWidget = PaymentWidget(clientKey, PaymentWidget.ANONYMOUS) // 비회원 결제

    // ------  결제위젯 렌더링 ------ 
    // 결제수단 UI를 렌더링할 위치를 지정합니다. `#payment-method`와 같은 CSS 선택자와 결제 금액 객체를 추가하세요.
    // DOM이 생성된 이후에 렌더링 메서드를 호출하세요.
    // https://docs.tosspayments.com/reference/widget-sdk#renderpaymentmethods선택자-결제-금액-옵션
    paymentWidget.renderPaymentMethods(
      "#payment-method", 
      { value: ${price} },
      // 렌더링하고 싶은 멀티 결제 UI의 variantKey
      // https://docs.tosspayments.com/guides/payment-widget/admin#멀티-결제-ui
      { variantKey: "DEFAULT" } 
    )

  
    paymentWidget.renderAgreement(
      '#agreement',
      { variantKey: "AGREEMENT" } // 기본 이용약관 렌더링
    )
   
    button.addEventListener("click", function () {
      paymentWidget.requestPayment({
        orderId: "RYjy-8v6DtoS2BS44FSlh",            // 주문 ID(직접 만들어주세요)
        orderName: "못난이맛난이 박스 구독",                 // 주문명
        successUrl: "http://localhost:8008/uglytasty/success.su",  
        failUrl: "http://localhost:8008/uglytasty/fail.su",        
        
        
      })
    })
    
    
  </script>
<br><br><br>
	 </div>
  <jsp:include page="../common/footer.jsp"/>
</body>
</html>