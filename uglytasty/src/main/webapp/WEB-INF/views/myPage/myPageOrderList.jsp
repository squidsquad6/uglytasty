<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 
	orderList : orderNo, userId, productNo, productName, explanation, price, sale, salePrice, quantity, totalPrice, changeName, fileLevel
 -->


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
        .orderProductImg {
            float: left;
        }

        .orderProductInfo {
            /* float: left; */
            padding-left: 170px;
        }

        .item .sale {
            color: #ff6741;
            font-size: 16px;
            font-weight: bold;
            margin: 0px;
        }
        .item .originPrice {
            text-decoration: line-through;
            color: gray;
            font-size: 16px;
            font-weight: bold;
            padding-right: 15px;
            padding-left: 15px;
            margin: 0px;
        }
        .item .salePrice {
            color: black;
            font-size: 16px;
            font-weight: bold;
            margin: 0px;
        }

        .chong {
            color: black;
            margin: 0px;
            font-size: 16px;
        }
        .chongPrice {
            font-size: 16px;
            margin: 0px;
            color: black;
            font-weight: bold;
        }
        .one {
            color: black;
            margin: 0px;
            font-size: 16px;
        }

        /* ----mine---- */
        .order_wrap_each p {
            margin-top: 0px;
            margin-bottom: 0px;
        }
        #eachProductPrice{
            margin-top: 100px;
        }
        
        .orderProduct{
        	margin-left:15px;
        	margin-right:15px;
        }
		*>a{text-decoration:none;}        
        

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
                
                <div class="col-sm-3">
                    <jsp:include page="myPageList.jsp"/>
                </div>

                <div class="col-sm-9">
                    <!-- 페이지 -->
                    <div class="mypage_content">

                        <h3>주문 내역</h3>
                        <br><br>
                        
                        <c:set var="currentOrderNo" value="-1" />
						<c:forEach var="p" items="${orderList}">
						
						    <c:choose>
						        <c:when test="${p.orderNo != currentOrderNo}">
						            <!-- 새 주문 그룹 시작 -->
						            <c:set var="currentOrderNo" value="${p.orderNo}" />
						            <hr>
						            <div class="d-flex flex-row-reverse">
						                <p style="margin:0px; margin-right:20px; color:#ff6741;">
						                	주문번호 <a href="myPageOrderDetail.or?orderNo=${ p.orderNo }" style=" text-decoration:none; color:#ff6741;">9a6hV9B4kXJ8QtWS9RCqa${p.orderNo} </a>
						                </p>
						            </div>
						        </c:when>
						    </c:choose>
						    
						    <div class="order_wrap_each">
						        <!-- 제품 정보 표시 부분을 여기에 추가하세요 -->
						        <div class="d-flex flex-column">
	                                <!-- 한 덩어리 반복 -->
	                                <div class="orderProduct">
	                                    <div class="p-2">
                                            <div class="d-flex">
                                            
                                                <div class="p-2">
                                                    <div class="order_product_pic">
                                                        <!-- 상품사진 -->
                                                        <img style="width: 150px; height: 150px;" src="${ p.changeName }">
                                                    </div>
                                                </div>
                                                
                                                <div class="p-3 flex-grow-1">
                                                    <h4>${ p.productName }</h4>
                                                    <p style="color: gray; font-weight:400;">${ p.explanation }</p>
                                                    <div class="item">
	                                                    <span class="sale">${ p.sale }%</span>
	                                                    <img src="https://d3cpiew7rze14b.cloudfront.net/assets/ustore/discount-arrow.svg">
	                                                    <span class="originPrice">﻿<fmt:formatNumber value="${ p.price }" pattern="#,###"/></span>
	                                                    <span class="salePrice" id="salePrice"><fmt:formatNumber value="${ p.salePrice }" pattern="#,###"/></span>
	                                                    <span class="salePrice">원</span>
                                                    </div>
                                                    <p style="color: black; font-weight:500;">구매수량&nbsp;&nbsp;:&nbsp;&nbsp;
                                                    <span style="font-weight:bold; color:black;"><input style="width:20px; border:none; font-weight:bold; font-size:18px;" name="quantity" value="${ p.quantity }"></span>개</p>      
                                                </div>

                                                <div class="p-2">
                                                    <div id="eachProductPrice">
                                                        <span class="chongPrice"><fmt:formatNumber value="${ p.salePrice * p.quantity}" pattern="#,###"/>&nbsp;</span><span class="one">원</span>	
                                                    </div>
                                                </div>

                                            </div>
	                                    </div>
	                                </div>
                            	</div>
						    </div>
	                      
						</c:forEach>

                 	</div>

        	     </div>
                        
             </div>

    	</div>

    </div>
            
    <br><br><br><br><br><br>
          
          
 	<!-- 푸터 -->
    <jsp:include page="../common/footer.jsp"/>



</body>
</html>