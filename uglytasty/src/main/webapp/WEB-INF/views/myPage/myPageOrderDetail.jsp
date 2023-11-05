<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<style>

        * { /* 헤더에 포함하기 */
            box-sizing:border-box;
            font-family: 'Pretendard';
        }

        .YRcontent {
            width:1400px;
            margin:auto;
        }
        
        .YRinnercontent { /* 공통 큰 메뉴 content 영역 - 레시피 영역 */
            /*border: 3px solid lightgray;*/
            border-radius: 10px;
            width:85%;
            margin:auto;
            background-color:white;
        }

        /* .YRinnercontent table{
            margin: auto;
            width: 60%;
        } */

        /* .YRinnercontent h2{
            text-align: center;
            font-weight: 700;
            color: rgb(58, 58, 58);
        } */

        /* input type=text 공용 스타일 */
        .input-text-style{
            width: 100%;
            border-style: solid;
            border-radius: 10px;
            height: 58px;
            /* margin-bottom: 20px; */
            border-color: rgb(229, 231, 235);
            border-width: 1px;
            padding-left: 14px;
            padding-right: 14px;
        }
        .input-text-style::placeholder{ /* place holder 글자색 */
            color:#a0aec0;
        }
        .input-text-style:focus{ /* 텍스트박스 클릭했을 때 */
            background-color: rgb(255, 246, 238);
            border-color: rgb(229, 231, 235);
            outline: none;
        }

        /* 주황 submit 버튼 공통 스타일 */
        /* 로그인 버튼 스타일 */
        .submit-btn{
            color: white;
            font-weight: 700;
            font-size: 18px;
            line-height: 1;
            margin-bottom: 20px;
            background-color: #FF6741;
            border-radius: 10px;
            width: 100%;
            height: 56px;
            border: 0;
        }

        /* -------------------------------마이페이지------------------------------------ */
        #mypage-all{ /* 마이페이지 전체 덩어리 */
            width: 90%;
            margin: auto;
        }
        #mypage-member{ /* 마이페이지 전체 덩어리 */
            width: 90%;
            margin: auto;
        }
        /* ---------------------------마이페이지 - 회원 환영 메시지------------------------------ */
        #mypage-member{
            /* border: 3px solid #FF6741; */
            border-radius: 10px;
            margin-bottom: 20px;
            background: rgb(255, 246, 238);
        }
        #mypage-member p{
            font-size: 22px;
            margin: 20px;
            vertical-align: middle;
            text-align: center;
        }
        #mypage_member_name{
            font-size: 24px;
            color: #FF6741;
        }

        /* ---------------------------마이페이지 - list------------------------------ */

        .mypage_menu_list{  /* 마이페이지 menu_list */
            margin-top: 120px;
            margin-bottom: 10px;
            height: 700px;
            /* border: 1px solid; */
        }
        
        .mypage_menu_list a{
            text-decoration: none;
            color: rgb(58, 58, 58);
            display: block;
            width: 100%;
            font-weight: 700;
            font-size: 18px;
        }

        /* ---------------------------마이페이지 - content------------------------------ */
        .mypage_content{ /* 마이페이지 content */
            margin: auto;
            margin-top: 60px;
            margin-bottom: 60px;
        }
        
        .mypage_content h3{
            font-size: 30px;
            font-weight: 700;
            text-align: center;
        }
        
        /* -------------- 주문 내역 ------------- */
        /* .order_wrap_each{
            width: 100%;
            height: 150px;
            border-radius: 20px;
            background-color: rgb(236, 236, 236);
            padding: 25px;
        }

        .order_product_pic{
            width: 90px;
            height: 90px;
        } */

        /* 수쟌 스타일 */

        hr{
            margin-left: 0;
            border: 10px solid #f2f2f2;
            margin: 50px 0;
        }
        #order input {
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
            margin: 0px;
        }
        .item .originPrice {
            text-decoration: line-through;
            color: gray;
            font-size: 18px;
            font-weight: bold;
            padding-right: 15px;
            padding-left: 15px;
            margin: 0px;
        }
        .item .salePrice {
            color: black;
            font-size: 18px;
            font-weight: bold;
            margin: 0px;
        }

        #total, #fee {
            padding-bottom: 10px;
        }

        #paymentInfo {
            font-size: 18px;
            width: 100%;
        }
        
        #paymentInfo input {
            border: none;
            width: 140px;
        }

        #totalPrice td {
            color: #ff6741;
            font-weight: bold;
            font-size: 22px;
        }
        #totalPrice #totalPrice {
            color: #ff6741;
            font-weight: bold;
            font-size: 22px;
            /* padding-left: 54px; */
            width: 100%;

        }
    
        .accountBtn {
            
            padding: 15px 300px;
        
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
        .accountBtn:hover {
            filter: brightness(0.9);
            color: white;
            text-decoration: none;
        }
        .chong {
            color: black;
            margin: 0px;
            font-size: 18px;
        }
        .chongPrice {
            font-size: 18px;
            margin: 0px;
            color: black;
            font-weight: bold;
        }
        .one {
            color: black;
            margin: 0px;
            font-size: 18px;
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

        /* ----mine---- */
        #all_orderInfo_wrap{
            margin-left: 40px;
            margin-right: 40px;
        }
        .deliveryInfo_title{
            font-size: 17px;
            color: #FF6741;
            font-weight: 500;
        }

        .order_wrap_each p {
            margin-top: 0px;
            margin-bottom: 0px;
        }
        #eachProductPrice{
            margin-top: 100px;
        }

    </style>


</head>
	<jsp:include page="../common/header.jsp"/>
<body>


	<div class="YRContent">
        <br><br>

        <div class="YRinnercontent">
            <br><br>

            <div id="mypage-member" class= "row">
                <div class="col-sm-12">
                    <p><b id="mypage_member_name">${ loginMember.userName }</b> 고객님 안녕하세요!</p>
                </div>
            </div>
            
            <br>
            
            <div id="mypage-all" class="row">
                
                <div class="col-sm-3" style="border: 1px solid red;">

                    
                    <jsp:include page="myPageList.jsp"/>


                </div>

                <div class="col-sm-9" style="border: 1px solid blue;">
                    <!-- 페이지 -->
                    
                    <div class="mypage_content">

                        <h3>상세 주문 내역</h3>
                        <br><br>

                            <div id="all_orderInfo_wrap">

                                <h4>📄 배송 정보</h4><br>
                    
                                <div id="deliveryInfo_wrap">
                                    <div class="d-flex">
                                        <div class="p-2" style="width: 150px;">
                                            <span class="deliveryInfo_title">
                                                받는 사람
                                            </span>
                                        </div>
                                        <div class="p-2 flex-grow-1">
                                            <span>
                                                ${ orderInfo.receiver }
                                            </span>
                                        </div>
                                    </div>
        
                                    <div class="d-flex">
                                        <div class="p-2" style="width: 150px;">
                                            <span class="deliveryInfo_title">
                                                휴대폰 번호
                                            </span>
                                        </div>
                                        <div class="p-2 flex-grow-1">
                                            <span>
                                                ${ orderInfo.receiverPhone }
                                            </span>
                                        </div>
                                    </div>

                                    <div class="d-flex">
                                        <div class="p-2" style="width: 150px;">
                                            <span class="deliveryInfo_title">
                                                주문 날짜
                                            </span>
                                        </div>
                                        <div class="p-2 flex-grow-1">
                                            <span>
                                                ${ orderInfo.orderDate }
                                            </span>
                                        </div>
                                    </div>
        
                                    <div class="d-flex">
                                        <div class="p-2" style="width: 150px;">
                                            <span class="deliveryInfo_title">
                                                주소
                                            </span>
                                        </div>
                                        <div class="p-2 flex-grow-1">
                                            <span>
                                                ${ orderInfo.addressMain } ${ orderInfo.addressDetail }
                                            </span>
                                        </div>
                                    </div>
        
                                    <div class="d-flex">
                                        <div class="p-2" style="width: 150px;">
                                            <span class="deliveryInfo_title">
                                                배송 요청사항
                                            </span>
                                        </div>
                                        <div class="p-2 flex-grow-1">
                                            <span>
                                                ${ orderInfo.deliveryMemo }
                                            </span>
                                        </div>
                                    </div>
                                </div>
                                

                                <hr><br>

                                
                                <!-- hidden -->
                                <input type="hidden" name="userId" value="${ loginMember.userId }">
                                
                                
                                <h4>🥕 주문 상품</h4><br>
                                <div class="d-flex flex-column">
                                
                                	<c:forEach var="o" items="${ orderList }">
                                		<c:choose>
                                			<c:when test="${o.orderNo == orderInfo.orderNo }">
		                                    <!-- 한 덩어리 반복 -->
		                                    <div class="orderProduct">
		    
		                                        <div class="p-2">
		    
		                                            <div class="d-flex">
		    
		                                                <div class="p-2">
		                                                    <div class="order_product_pic">
		                                                        <!-- 상품사진 -->
		                                                        <img style="width: 130px; height: 130px;" src="${ o.changeName }">
		                                                    </div>
		                                                </div>
		                                                
		    
		                                                <div class="p-3 flex-grow-1">
		                                                    <h4>${ o.productName }</h4>
		                                                    <p style="color: gray; font-weight:400;">${ o.explanation }</p>
		                                                    <div class="item">
		                                                    <span class="sale">${ o.sale }%</span>
			                                                    <img src="https://d3cpiew7rze14b.cloudfront.net/assets/ustore/discount-arrow.svg">
			                                                    <span class="originPrice">﻿<fmt:formatNumber value="${ o.price }" pattern="#,###"/></span>
			                                                    <span class="salePrice" id="salePrice"><fmt:formatNumber value="${ o.salePrice }" pattern="#,###"/></span>
			                                                    <span class="salePrice">원</span>
		                                                    </div>
		                                                    <p style="color: black; font-weight:500;">구매수량&nbsp;&nbsp;:&nbsp;&nbsp;
		                                                    <span style="font-weight:bold; color:black;"><input style="width:20px; border:none; font-weight:bold; font-size:18px;" name="quantity" value="${ o.quantity }"></span>개</p>      
		                                                </div>
		    
		                                                <div class="p-2">
		                                                    <div id="eachProductPrice">
		                                                        <span class="chong">총&nbsp;:&nbsp;&nbsp;</span>
		                                                        <span class="chongPrice"><fmt:formatNumber value="${ o.salePrice }" pattern="#,###"/>&nbsp;</span><span class="one">원</span>	
		                                                    </div>
		                                                </div>
		    
		                                            </div>
		                                            
		    
		                                        </div>
		                                    </div>
		                                    </c:when>
	                                    </c:choose>
                                    </c:forEach>
    
                                </div>
                                
                                <hr><br>
                    
                                <h4>📄 결제 정보</h4><br>
                                <table id="paymentInfo">
                                    <tr>
                                        <td>내가 담은 금액</td>
                                            <td align="right" id="total">
                                            <c:set var="totalOrderPrice" value="0" />
                                            <fmt:formatNumber value="${orderInfo.totalPrice}" pattern="#,###"/>&nbsp;원
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>배송비</td>
                                        <td align="right" id="fee"><fmt:formatNumber value="2500" pattern="#,###"/>&nbsp;원</td>
                                    </tr>
                                    <tr id="totalPrice" style="width: 100%;">
                                        <td style="padding-top:40px; width:100%;">총 결제 금액</td>
                                        <td style="padding-top:40px;">
                                        
                                            <fmt:formatNumber value="${orderInfo.totalPrice + 2500}" pattern="#,###"/>&nbsp;원
                                            <p style="font-size: 10px; color: #ff6741; font-weight:400;">(+ 배송비 포함)</p>
                                            
                                        </td>
                                    </tr>
                                </table>
                                
                                
                            </div>    

                        
                    </div>

                    

                </div>

            </div>
            
            
            <br>
        </div>

        
    </div>



</body>
</html>