<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 
	loginMember = 회원정보..
	quantity : quantity
	p : productNo, productName, explanation, price, sale / changeName, fileLevel / quantity / 
		salePrice
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
        margin-left: 25%;
    }
    hr{
        width: 700px;
        margin-left: 0;
        border: 10px solid #f2f2f2;
        margin: 50px 0;
    }
    #order input {
        width: 700px;
        height: 45px;
        border: 1px solid #dadada;
        border-radius: 10px;
    }
    #order #address_btn {
        width: 100px;
        height: 45px;
        border: none;
        border-radius: 10px;
        background-color: #ff6741;
        color: white;
        font-weight: bold;
        font-size: 15px;
        cursor: pointer;
    }

    #order p {
        color: #ff6741;
        font-size: 16px;
        font-weight: bold;
    }
	
	#receiverName, #receiverPhone, #sample6_address, #sample6_detailAddress, #select_request {
		padding-left: 10px;
		font-size:14px;
	}
	
    .all select {
        width: 700px;
        height: 45px;
        padding: .8em .5em;
        border: 1px solid #dadada;
        border-radius: 8px;
        font-family: inherit;
        background: url('https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Ft1.daumcdn.net%2Fcfile%2Ftistory%2F99761B495C84AA8716') no-repeat 95% 50%;
        -webkit-appearance: none;
        -moz-appearance: none;
        appearance: none;
    }
    select::-ms-expand {
        display: none;
    }

    
    .orderProductImg {
        float: left;
    }

    .orderProductInfo {
        /* float: left; */
        padding-left: 170px;
    }


	.item .sale {
        color: #ff6741;
        font-size: 18px;
        font-weight: bold;
    }
    .item .originPrice {
        text-decoration: line-through;
        color: gray;
        font-size: 18px;
        font-weight: bold;
        padding-right: 10px;
    }
    .item .salePrice {
        color: black;
        font-size: 18px;
        font-weight: bold;
    }

	#total, #fee {
		padding-bottom: 10px;
	}

    #paymentInfo input {
        border: none;
        width: 140px;
    }

    #totalPrice td {
        color: #ff6741;
        font-weight: bold;
        font-size: 18px;
    }
    #totalPrice #totalPrice {
        color: #ff6741;
        font-weight: bold;
        font-size: 18px;
        padding-left: 75px;
    }
   
    #accountBtn {
        width: 700px;
        height: 70px;
        border: 1px solid #ff6741;
        border-radius: 5px;
        background-color: #ff6741;
        color: white;
        margin-top: 30px;
        margin-bottom: 50px;
        font-weight: bold;
        font-size: 18px;
        cursor: pointer;
    }
    #accountBtn:hover {
        filter: brightness(0.9);
    }

    /*결제수단*/
    .paymentOuter{
        margin-left: 20%;
    }
    .insertCardImg{
        content:url(resources/images/toss.png);
        width:150px;
        border-radius: 10px;
        margin-right: 20px;
    }

   [type=radio] { 
        position: absolute;
        opacity: 0;
        width: 0;
        height: 0;
    }

    [type=radio] + label {
        cursor: pointer;
    }
    [type=radio]:checked + label {
        outline: 3px solid #2a79ff;
        border-radius: 22px;
    }

</style>

</head>
<body>

	<!-- 헤더 -->
    <jsp:include page="../common/header.jsp"/>
    

	<div class="all">
		<br><br><br>
        <h2 style="font-weight:bold;">주문확인 및 결제</h2>
        
        <hr>

        <form id="order" action="">
			
			<br><br>
            <h3>📄 배송 정보</h3><br>

            <p>받는 사람</p>
            <p style="font-size:10px;"></p><p style="font-weight: 400; font-size:10px;">* 기본적으로 회원의 정보를 넣어두었습니다. 받는사람 변경 시 다시 입력해주세요.</p>
            <input type="text" id="receiverName" name="" placeholder="성함을 입력해주세요." value="${ loginMember.userName }"> <br><br>
            
            <p>휴대폰 번호</p>
            <input type="text" id="receiverPhone" name="" placeholder="(-) 포함하여 입력해주세요." value="${ loginMember.phone }"> <br><br>
           
            <p>주소</p>
            <input type="text" id="sample6_address" name="" placeholder="주소를 검색하세요." style="width: 595px; margin-bottom: 5px;">
            <input type="button" id="address_btn" onclick="sample6_execDaumPostcode()" value="검색"><br>
            <input type="text" id="sample6_detailAddress" name="" placeholder="상세주소를 입력해주세요."> <br><br>

            <p>배송 요청사항</p>
            <select id="select_request">
                    <option value="">선택 안함</option>
                    <option value="">부재 시 전화 또는 문자 주세요.</option>
                    <option value="">부재 시 문 앞에 놓아주세요.</option>
                    <option value="">부재 시 경비실에 맡겨주세요.</option>
                    <option value="">배송 전 연락 바랍니다.</option>
                    <option value="">배송 시 파손에 주의해 주세요.</option>
            </select> <br><br>

            <br><hr><br>

            <h3>🥕주문 상품</h3><br>
            <div class="orderProduct">
                <div class="orderProductImg">
                    <img style="width: 150px; height: 150px;" src="${ p.changeName }">
                </div>
                <div class="orderProductInfo">
                	
                    <h3>${ p.productName }</h3>
                    <p style="color: gray; font-weight:400;">${ p.explanation }</p>
                    <div class="item" style="text-align: left;">
                        <span class="sale">${p.sale }%</span>
                        <span class="originPrice">﻿<fmt:formatNumber value="${ p.price }" pattern="#,###"/></span>
                        <span class="salePrice" id="salePrice"><fmt:formatNumber value="${ p.salePrice }" pattern="#,###"/></span>
                        <span class="salePrice" >원</span>
                    </div>
                 
                    <p style="color: black; font-weight:500; margin-top:10px;">구매수량&nbsp;&nbsp;:&nbsp;&nbsp;
                    <span style="font-weight:bold; color:#ff6741;">${ quantity }</span>개</p>
                </div>
            </div>

            <br><hr><br>

            <h3>📄 결제 정보</h3><br>
            <table id="paymentInfo">
                <!-- 불러올 값 -->
                <tr>
                    <td>내가 담은 금액</td>
                    <td align="right" id="total"><fmt:formatNumber value="${ p.salePrice * quantity }" pattern="#,###"/>&nbsp;원</td>	<!-- 계산할부분 -->
                </tr>
                <tr>
                    <td>배송비</td>
                    <td align="right" id="fee"><fmt:formatNumber value="2500" pattern="#,###"/>&nbsp;원</td>
                </tr>
                <!-- 넘길 값 -->
                <tr id="totalPrice">
                    <td style="padding-top:40px; width:500px;">총 결제 금액</td>
                    <td style="padding-top:40px;">
                    
                    	<fmt:formatNumber var="totalPriceFormat" value="${ (p.salePrice * quantity) + 2500 }" pattern="#,###" />	 <!-- 계산할부분 -->
						<input type="text" id="totalPrice" name="" value="<c:out value='${totalPriceFormat}' />" />원
                    	
                    	<p align="right" style="font-size: 10px; color: #ff6741; font-weight:400;">(+ 배송비 가 포함되어 있습니다.)</p>
                    	<!-- 
                    	<input type="text" id="totalPrice" name="" value="20500" >원
                    	 -->
                    </td>
                </tr>
            </table>

			<br><hr><br>
            <h3>💳 결제 수단</h3><br>
            <div class="paymentOuter">
                <input type="radio" name="payment" value="" id="card"><label for="card" class="insertCardImg"></label></input>
            </div>
            <br>
            <!-- 버튼 누르면 결제API 뜨도록 -->
            <button type="submit" id="accountBtn">바로 구매하기</button>
        </form>
    </div>



	<!-- 주소 API -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
	    function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	               
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	                //사용자가 선택한 '주소 타입'에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 사용자가 선택한 주소가 '도로명 타입'일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                   
	                } 
	
	                document.getElementById("sample6_address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                document.getElementById("sample6_detailAddress").focus();
	            }
	        }).open();
	    }
    </script>



</body>
</html>