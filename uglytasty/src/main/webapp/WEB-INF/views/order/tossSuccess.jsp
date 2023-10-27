<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 
	oDelivery : orderNo, userId, orderDate, trackingNo, addressMain, addressDetail, receiver, receiverPhone, deliveryMemo, totalPrice
				(맵퍼 : id="selectOrdersDelivery")
 -->
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
    div * {box-sizing: border-box;}

    .all {
        margin: auto;
        width: 1400px;
    }
    .orderDetail {
        width: 70%;
    }
    .orderDetail span {
        font-size: 15px;
    }
    .orderDetail #orderNo {
        color: #ff6741;
        font-weight: bold;
        font-size: 15px;
        cursor: pointer;
    }
    .orderDetail #paymentKey {
        color: #ff6741;
        font-weight: bold;
        font-size: 15px;
        cursor: pointer;
    }
    .orderDetail img {
        margin: 50px 0 20px 0;
    }


    .orderDetail #continueBtn1 {
        text-decoration: none;
        background-color: white;
        border: 1px solid #ff6741;
        padding: 20px 165px;
        color: #ff6741;
        font-size: 18px;
        font-weight: bold;
        border-radius: 10px;
        cursor: pointer;
    }
    .orderDetail #continueBtn1:hover {
        border: 2px solid #ff6741;
    }
    .orderDetail #continueBtn2 {
        text-decoration: none;
        background-color: #ff6741;
        padding: 20px 155px;
        color: white;
        font-size: 18px;
        font-weight: bold;
        border-radius: 10px;
        cursor: pointer;
    }
    .orderDetail #continueBtn2:hover {
        filter: brightness(0.9);
    }


    hr {
        width: 80%;
        border: 1px solid #f2f2f2;
    }
    .nemo {
        background-color: #f2f2f2;
        width: 80%;
        height: 15px;
    }
    #orderTable th {
        height: 30px;
        text-align: left;
        color: gray;
    }
    .orderDetail #totalPrice {
        color: #ff6741;
        font-size: 20px;
        font-weight: bold;
    }
</style>


</head>
<body>
	<!-- 
 	  <h5 id="paymentKey"></h5>
      <h5 id="orderId"></h5>
      <h5 id="amount"></h5>
      
      paymentKey : (결제번호)키값
      orderId : 주문번호
      amount : 결제금액
	 -->

	<!-- 결제API 완료 후 (orderCode = 2:결제완료) update치고 넘어온 화면 -->
	
	<!-- 헤더자리 -->
	<jsp:include page="../common/header.jsp"/>



	<div class="all" align="center">

		<br><br><br>
        <div class="orderDetail">
            <h1>결제완료</h1><br>
            <hr>
            <img src="resources/images/paprika.png">
            <h3>주문이 완료되었습니다.</h3>
       
            <span>주문번호 : </span>
            <a id="orderNo"></a><br>
            
            <span>결제번호 : </span>
            <a id="paymentKey"></a>
            
           
            
            <br><br><br><br><br><div class="nemo"></div><br>

            <h4 align="left" style="padding-left: 23%;">배송정보</h4>
            <hr><br>
            <table id="orderTable" width="520px">
                <tr>
                    <th>주문일</th>
                    <td>${ oDelivery.orderDate }</td>
                </tr>
                <tr>
                    <th width="150px">받는 분</th>
                    <td>${ oDelivery.receiver }</td>
                </tr>
                <tr>
                    <th>휴대폰 번호</th>
                    <td>${ oDelivery.receiverPhone }</td>
                </tr>
                <tr>
                    <th>배송지</th>
                    <td>${ oDelivery.addressMain }</td>
                </tr>
                <tr>
                    <th>배송 요청사항</th>
                    <td>${ oDelivery.deliveryMemo }</td>
                </tr>
            </table>

            <br><br><div class="nemo"></div><br><br>

            <table id="accountTable">
                <tr>
                    <td width="84.5%">
                        <h4>결제수단</h4>
                    </td>
                    <td>
                        <p align="right">토스페이</p>
             
                    </td>
                </tr>
                <tr>
                    <td>
                        <h4>결제금액</h4>
                    </td>
                    <td>
                        <span id="totalPrice"><fmt:formatNumber value="${ oDelivery.totalPrice }" pattern="#,###" /></span><span class="totalPrice">원</span>
                    </td>
                </tr>
            </table>

            <br><br><br>
            <a href="/uglytasty" id="continueBtn1">홈으로</a>
            <a href="list.pro" id="continueBtn2">계속 쇼핑하기</a>

        </div>



        <br><br><br><br><br>

    </div>
	
	
	<script>
		const urlParams = new URLSearchParams(window.location.search);
		document.getElementById("paymentKey").textContent = urlParams.get("paymentKey");
		document.getElementById("orderNo").textContent = urlParams.get("orderId");
		//document.getElementById("totalPrice").textContent = urlParams.get("amount");
	</script>
	
	
	
</body>
</html>