<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 
    loginMember = 회원정보..
   	plist = ArrayList<Product> + fileNo + refProductNo + originName + changeName + fileExp + fileLevel / status
 
 	rlist = (댓글리스트) reviewNo, refProductNo, userId, content, reviewDate
 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 부트스트랩에서 제공하고 있는 스타일 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<!-- 부트스트랩에서 제공하고 있는 스크립트 
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
-->


<style>
   div * {box-sizing: border-box;}

    .all {
        margin: auto;
        width: 1400px;
    }

    /* 관리자 버튼(뒤로가기, 수정하기, 일시품절, 삭제하기) */
    .adminBtn a {
        text-decoration: none;
        background-color: gray;
        padding: 12px 20px;
        color: white;
        border-radius: 5px;
        font-size: 12px;
    }
    .adminBtn a:hover {
        filter: brightness(0.8);
        text-decoration: none;
        color: white;
    }
    #btnUpdate, #btnReady, #btnDelete, #btnYes {
       color: white;
    }
    .adminBtn #btnUpdate:hover {
        filter: brightness(0.98);
        background-color: darkorange;
        color: white;
        cursor: pointer;
    }
    .adminBtn #btnReady:hover {
        filter: brightness(0.98);
        background-color: #ff6741;
        color: white;
        cursor: pointer;
    }
    .adminBtn #btnDelete:hover {
        filter: brightness(0.98);
        background-color: red;
        color: white;
        cursor: pointer;
    }
    .adminBtn #btnYes:hover {
        filter: brightness(0.98);
        background-color: #00c853;
        color: white;
        cursor: pointer;
    }

   /* 숨겨질버튼(모달)*/
   #modalButton {
      border: none;
      color: white;
      background-color: #dadada;
      background-color: white;
      
   }
   


    /* --------------------top주문상세란-------------------- */

    .item p {
        font-size: 18px;
        margin: 0;
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
        padding-left: 10px;
    }
    .item .salePrice {
        color: black;
        font-size: 18px;
        font-weight: bold;
        margin: 0px;
    }
    table tr {
        height: 30px;
    }
    
    .one1 {
    	font-size: 15px;
    	margin-left: 5px;
    }
    .one2 {
    	color: #ff6741;
    	font-weight: bold;
    	margin: 0px;
    	font-size: 18px;
    }

    .order_btn .cart{
        width: 260px;
        height: 50px;
        border: 1px solid #ff6741;
        border-radius: 5px;
        background-color: white;
        color: #ff6741;
        margin-top: 15px;
        margin-right: 5px;
        font-weight: bold;
        cursor: pointer;
    }
    .order_btn .cart:hover {
        border: 2px solid #ff6741;
    }
    .order_btn .order{
        width: 260px;
        height: 50px;
        border: 1px solid #ff6741;
        border-radius: 5px;
        background-color: #ff6741;
        color: white;
        margin-top: 15px;
        margin-left: 5px;
        font-weight: bold;
        cursor: pointer;
    }
    .order_btn .order:hover {
        filter: brightness(0.9);
    }
    
    /*일시품절 때 버튼 비활성화 스타일*/
    .order_btn .cart1{
        width: 260px;
        height: 50px;
        border: 1px solid gray;
        border-radius: 5px;
        background-color: white;
        color: gray;
        margin-top: 15px;
        margin-right: 5px;
        font-weight: bold;
    }

    .order_btn .order1{
        width: 260px;
        height: 50px;
        border: 1px solid gray;
        border-radius: 5px;
        background-color: gray;
        color: white;
        margin-top: 15px;
        margin-left: 5px;
        font-weight: bold;
    }
    
    .soldoutP {
    	font-size: 10px;
    	color: gray;
    	margin: 0px;
    }

	.soldout {
        position: relative;
    }
    
    .soldout::before{
        content: "";
        opacity: 0.5;
        position: absolute;
        top: 0px;
        left: 0px;
        right: 0px;
        bottom: 0px;
        background-color: #000;
    }

    .item {
        position: relative;
    }
    .soldout_text {
        position: absolute;
        color: white;
        top: 44%;
        left: 13%;
        transition: translate(-50%, -50%);
        font-size: 20px;
        text-align: center;
        border: 1px solid white;
        border-radius: 10px;
        width: 200px;
        height: 45px;
        line-height: 2.5;
    }
    
    /*여기까지 일시품절 스타일*/
	
   

    #amount {
        border: none;
        text-align: center;
        width: 35px;
    }
    #add, #minus {
        border: none;
        width: 27px;
        height: 27px;
        border-radius: 5px;
        background-color: white;
        border: 1px solid #ff6741;
        color: #ff6741;
        cursor: pointer;
    }
    #add:hover, #minus:hover {
        border: 2px solid #ff6741;
    }
    #sum {
        border: none;
        width: 370px;
        text-align: right;
        font-size: 18px;
        color: #ff6741;
        font-weight: bold;
		margin-right: 5px;
    }

    /* --------------------상품상세글-------------------- */

    .move button {
        width: 32.8%;
        height: 45px;
        padding-bottom: 15px;
        font-size: 16px;
        font-weight: bold;
        background-color: white;
        color: gray;
        border: none;
        border-bottom: 4px solid #dadada;
    }
    .move button:hover {
        color: rgb(68, 68, 68);
        border-bottom: 4px solid #ff6741;
        cursor: pointer;
    }

    hr {border: 1px solid #dadada;}

    .delivery h1 {
        margin-top: 50px;
        margin-bottom: 20px;
    }
    .delivery .delivery_day {
        height: 100px;
        background-color: #ff6741;
        color: white;
        font-weight: bold;
        text-align: center;
        line-height: 100px;
    }
    
    .productDetail h1 {   
        text-align: center;
        margin-top: 100px;
        color: #ff6741;
        margin-bottom: 20px;
    }
    .productItem {
        margin: 50px 0;
    }
    .productItem img {
        width: 90%;
    }
    .productItem p {
        width: 90%;
        font-size: 15px;
        text-align: left;
        line-height: 30px;
    }
    .productItem h2 {
        text-align: left;
        margin-bottom: 20px;
        width: 90%;
    }

    /* --------------------댓글-------------------- */
    .review {
        margin: 100px 150px;
    }
    .review h1 {
        color: #ff6741;
        text-align: left;
        
        margin-bottom: 20px;
    }
    .review .review_content {
        height: 45px;
        border: 1px solid #dadada;
        border-radius: 5px;
        margin-top: 4px;
        cursor: pointer;
    }
    .review .review_btn {
        width: 100%;
        height: 45px;
        border: none;
        border-radius: 5px;
        color: gray;
        cursor: pointer;
    }
    .review .review_btn:hover {
        background-color: #ff6741;
        color:white;
    }
    .rUpdate {
		border: none;
		width: 32px;
		height: 32px;
		font-size: 12px;
		border-radius: 5px;   
		color: white;
		background-color: darkorange;
    }
    .rDelete {
		border: none;
		width: 32px;
		height: 32px;
		font-size: 12px;
		border-radius: 5px;
		color: white;   
		background-color: red;
    }
    

    /* --------------------관련레시피-------------------- */
    #recipeAll {
        width: 80%;
    }
    #recipeAll h1 {
        color: #ff6741;
        text-align: left;
        margin-bottom: 20px;
    }
    .recipe {
        /* border: 1px solid red; */
        float: left;
        width: 23%;
        margin: 0 10px;
        margin-bottom: 100px;
        cursor: pointer;
    }
    .recipeImg {
        width: 150px;
    }
    .recipeImg:hover {
      filter: brightness(0.9);
    }
    .recipeInfo span {
    	margin: 0px 4px;
    }
    .recipe h4 {
        margin: 5px 0;
        font-size: 14px;
    }
    .recipe span {
        font-size: 13px;
       
    }
    .recipeStyle {
        color: #ff6741;
        font-weight: bold;
    }
    
    /* 푸터 영향받지 않도록 itemAll 에 넣은 스타일 */
    .clearfix::after {	
	    content: "";
	    display: table;
	    clear: both;
	}
    
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
   
    <!-- 헤더 -->
    <jsp:include page="../common/header.jsp"/>

    <!-- 상단으로 이동하기 버튼 -->
    <div class="btn_gotop">
        <img width="50px" src="https://blog.kakaocdn.net/dn/s6jL5/btqHsbU8DSJ/yBeqQLZS4Kg866xEHCvA20/img.png" >
    </div>
    
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

   

    <div class="all" align="center">

        <div class="container" style="width: 80%">


         <!--장바구니 담은 후 '모달' -->
         <div align="right" class="modalOuter">
                <button data-toggle="modal" data-target="#loginModal" id="modalButton">숨길버튼(모달)</button>
                <div class="modal fade" id="loginModal">
                    <div class="modal-dialog modal-sm">
                        <div class="modal-content">
                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 class="modal-title">🛒장바구니 담기 완료</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>
                      
                            <div class="modal-body">
                                <p>선택하신 상품이 장바구니에 담겼습니다.</p>
                            </div>
                            
                            <div align="center" class="modal-footer">
                            
                            	<form action="list.cart">
	                                <!-- 
	                                <a href="#" class="btn btn-secondary" data-dismiss="modal">쇼핑 계속하기</a>
	                                <a href="confirmForm.cart" class="btn btn-warning">장바구니 가기</a>
	                                 -->
	                                <input type="hidden" name="userId" value="${ loginMember.userId }">
                            		<input class="btn btn-secondary" data-dismiss="modal" value="쇼핑 계속하기" style="width:130px;">
                            		<input type="submit" class="btn btn-warning" value="장바구니 가기" style="width:130px; color:white;">
                            	</form>
                            	
                            </div>

                        </div>
                    </div>
                </div>
                <br clear="both">
         </div>

         <br><br>


         <!-- 관리자만 보이는 버튼 (테스트할때 귀찮으니까 맨 나중에걸라우)-->
         <c:if test="${ loginMember.userId eq 'admin' }">
         </c:if>
            <div class="adminBtn" align="right">
                <a id="btnBack" href="list.pro">뒤로가기</a>
                <a id="btnUpdate" onclick="postFormSubmit(1);">수정하기</a>
	                <c:if test="${ plist[0].status eq 'Y' }">
		                <a id="btnReady" onclick="postFormSubmit(2);">일시품절</a>
	                </c:if>
	                <c:if test="${ plist[0].status eq 'R' }">
		                <a id="btnYes" onclick="postFormSubmit(4);">재입고</a>
	                </c:if>
                <a id="btnDelete" onclick="postFormSubmit(3);">판매종료</a>
            </div>

            
            <form id="postForm" action="" method="post">
               <input type="hidden" name="productNo" value="${ plist[0].productNo }">
               
               <input type="hidden" name="filePath1" value="${ plist[0].changeName }">
               <input type="hidden" name="filePath2" value="${ plist[1].changeName }">
               <input type="hidden" name="filePath3" value="${ plist[2].changeName }">
               <input type="hidden" name="filePath4" value="${ plist[3].changeName }">
               <input type="hidden" name="filePath5" value="${ plist[4].changeName }">
            </form>
            
            <script>
               function postFormSubmit(num) {
                  if(num == 1){ // '수정하기(1)' 클릭
                     $("#postForm").attr("action", "updateForm.pro").submit();
                  }else if(num == 2){ // '일시품절(2)' 클릭
                     $("#postForm").attr("action", "ready.pro").submit();                        
                  }else if(num == 3) { // '판매종료(3)' 클릭
                     $("#postForm").attr("action", "delete.pro").submit();
                  }else if(num == 4){ // '재입고(4)' 클릭
                     $("#postForm").attr("action", "yes.pro").submit();
                  }
               }
            </script>
            
            
            

            <br><br><br>
         
            <div class="top clearfix item">

                <c:if test="${ plist[0].status eq 'Y' }">
	                <div style="float: left; text-align: center;">
	                    <img style="width: 480px; height: 480px;" src="${ plist[0].changeName }">
	                </div>
                </c:if>
                <c:if test="${ plist[0].status eq 'R' }">
	                <div class="itemImg soldout" style="float: left; text-align: center;">
	                    <img style="width: 480px; height: 480px;" src="${ plist[0].changeName }">
	                </div>
	                <div class="soldout_text">
	                    <p>다음에 다시 만나요!</p>
	                </div>
                </c:if>

                <div style="width: 50%; float: right;" >

                    <div class="form-group" style="text-align: left;">
                        <h2 id="product_title">${ plist[0].productName }</h2>
                        <h4 id="product_exp">${ plist[0].explanation }</h4>
                    </div>

                    <div class="item" style="text-align: left;">
                        <span class="sale">${ plist[0].sale }%</span>
                        <img src="https://d3cpiew7rze14b.cloudfront.net/assets/ustore/discount-arrow.svg">
                        <span class="originPrice">﻿<fmt:formatNumber value="${ plist[0].price }" pattern="#,###"/></span>
                        <span class="salePrice" id="salePrice"><fmt:formatNumber value="${ plist[0].salePrice }" pattern="#,###"/></span>
                        <span class="salePrice" >원</span>
                    </div>
                   

               
                    <br><hr>
                    
                    <form action="enrollForm.order" id="orderForm">
                        <div class="form-group" style="text-align: left;">
                            <table>
                                <tr>
                                    <th width="150px">생산지</th>
                                    <td>${ plist[0].location }</td>
                                </tr>
                                <tr>
                                    <th>생산 일자</th>
                                    <td>${ plist[0].productionDate }</td>
                                </tr>
                                <tr>
                                    <th>배송비</th>
                                    <td><fmt:formatNumber value="2500" pattern="#,###"/><span class="one1">원</span></td>
                                </tr>
                                <tr>
                                    <th>구매수량</th>
                                    <td>
                                        <input type="button" id="add" value=" + ">
                                        <input type="text" id="amount" value="1" name="quantity" readonly>	<!-- 주문하기 가져갈 것 -->
                                        <input type="button" id="minus" value=" - "><br>
                                    </td>
                                </tr>
                                <tr>
                                    <th style="padding-top: 25px; color:#ff6741;">총 결제 금액</th>
                                    <td style="padding-top: 25px; width:380px;" align="right">
                                        <span id="sum" readonly><fmt:formatNumber value="${ plist[0].salePrice }" pattern="#,###"/></span><span class="one2">원</span>
                                    </td>
                                </tr>
                            </table>
							<!-- 주문하기 가져갈 userId, productNo -->
                            <input type="hidden" name="userId" value="${ loginMember.userId }">
                            <input type="hidden" name="productNo" value="${ plist[0].productNo }">
                        </div>
                        
                        <br><hr>
                        
                        <div class="order_btn">
                            <div style="text-align: center;">
                            	<c:if test="${ plist[0].status eq 'Y' }">
	                                <button class="cart" type="button" id="cartButton" onclick="addCart();">장바구니</button>
	                                <button class="order" type="submit">주문하기</button>
				                </c:if>
                            	<c:if test="${ plist[0].status eq 'R' }">
                            		<p class="soldoutP" style="font-size: 12px;">[ 일시품절 ] 상품입니다. 재입고 후 주문 가능합니다.</p>
	                                <button class="cart1" type="button" id="cartButton" onclick="addCart();"  disabled="disabled">장바구니</button>
	                                <button class="order1" type="submit" disabled="disabled">주문하기</button>
				                </c:if>
                            </div>
                        </div>
  
                    </form>
                    
                </div>
            </div>

            <br><br><br><br>
            
            <div class="move" align="left">
                <button id="btn1">상세정보</button>
                <button id="btn2">후기</button>
                <button id="btn3">관련 레시피</button>
            </div>
            
            <!-- 상세정보(배송일정, 상세정보, 후기(댓글), 관련레시피) -->
            
            <div class="delivery" align="left">
                <h1>배송 일정</h1>
                <p class="delivery_day">발송 요일 : 월, 금 출고</p>
                <p>📦 주문 마감 시간 : 발송 전일 오후 5시</p>
                <p>📦 발송 요일이 공휴일일 경우 공휴일 다음날 출고</p>
                <hr>
                <p style="color: gray; font-size: 13px;">* 순차 출고 안내 : 공휴일 또는 연휴가 지나고 순차 출고됩니다. 조금만 기다려주세요!</p>
            </div>
            
            <div class="productDetail" >
                
                <h1>'${ plist[0].productName }'</h1>

                <div class="productItem">
                    <img src="${ plist[1].changeName }">    
                    <p>
                        ${ plist[1].fileExp }
                    </p>
                </div>
                <div class="productItem">
                    <img src="${ plist[2].changeName }">    
                    <p>
                       ${ plist[2].fileExp }
                    </p>
                </div>
                <div class="productItem">
                    <img src="${ plist[3].changeName }">    
                    <p>
                       ${ plist[3].fileExp }
                    </p>
                </div>
                <br><br>
                <div class="productItem">
                    <h2 style="color:gray;">📦 이렇게 보내드려요</h2>
                    <img src="${ plist[4].changeName }">    
                    <p>
                        • ${ plist[4].fileExp }
                    </p>
                </div>
                <br><br>
                <div class="productItem">
                    <h2 style="color:gray;">👨🏻‍🌾 이렇게 보관하세요</h2>
                    <img src="${ plist[0].changeName }">    
                    <p>
                        👨🏻‍🌾 수령 즉시 반드시 반나절 정도 그늘에 말려주신 다음 냉장 보관 해주세요. <br>
                        박스 내부의 습기는 배송중 생기는 온도차에 의해 자연스럽게 발생되는 것입니다. 수령 즉시 그늘진 곳에 12시간 정도 건조시켜주신 후 냉장 보관해주시면 됩니다. <br>
                        👨🏻‍🌾 상온에 보관하면 냉장 보관보다 싱싱함이 덜 해요. <br>
                        빠르게 소진 예정이라 상온 보관을 하신다면 2~3도 사이 그늘지고 서늘한 곳에 신문지 등을 덮어 보관해주세요.
                    </p>
                </div>

            </div>
   
        </div>


        
        <div class="review">
            <h1 id="reviewArea">상품 후기</h1>
            
        	<!-- 댓글 기능은 나중에 ajax 배우고 접목시킬예정! 우선은 화면구현만 해놓음 -->
            <table id="reviewArea" class="table" align="center" width="80%" style="padding-left: 20px;">
                <thead>
                    <tr>
                        <th colspan="2">
                            <textarea class="review_content" name="" id="content" cols="90" rows="2" style="resize:none; width:117%"></textarea>
                        </th>
                        <th style="vertical-align: middle">
                            <button class="review_btn" style="margin-left: 120px;" onclick="addReview();">등록하기</button>
                        </th>
                    </tr>
                </thead>
                <tbody>
                
                	<!-- 여기로 댓글 리스트 꽂힘 -->
                     
                </tbody>
            </table>
        </div>

		<script>
		
			$(function(){
				selectReviewList();
			})
			
			
			// 댓글 리스트 조회 ajax
			function selectReviewList() {  
				$.ajax({
					url:"rlist.pro",
					data:{
						productNo: ${ plist[0].productNo }
					},
					success:function(rlist){
						
						console.log(rlist);
						
						let value = "";
						for(let i in rlist) {
							value += "<tr>"
									+ "<td>" + rlist[i].userId + "</td>"
									+ "<th>" + rlist[i].content + "</th>"
									+ "<td width='100px;'>" + rlist[i].reviewDate + "</td>";
									
									if ('${loginMember.userId}' == 'admin' || '${loginMember.userId}' == rlist[i].userId) {
							    value += "<td><button class='rUpdate' onclick='upReview(" + rlist[i].reviewNo + ");'>✂</button></td>";
							    value += "<td><button class='rDelete' onclick='delReview(" + rlist[i].reviewNo + ");'>✖</button></td>";
							}
							value += "</tr>";
						}
						$("#reviewArea tbody").html(value);
					},
					error:function(){
						console.log("댓글 리스트 조회용 ajax 통신 실패!");
					}
					
				})
			}
			
			// 댓글 등록 ajax
			function addReview(){
				if($("#content").val().trim().length != 0) { // 공백 없는 유효한 댓글만 등록 가능
					
					$.ajax({
						url: "rinsert.pro",
						data: {
							refProductNo:${ plist[0].productNo },	// int형 뽑을때 {java el구문}
							userId:'${loginMember.userId}',			// String형 뽑을때 {java el구문} 
							content:$("#content").val(),			// jQuery 뽑을때 ()
						},
						success: function(status){
							if(status == "success"){
								console.log(status);
								
								selectReviewList();		// 댓글 리스트 재!!조회
								$("#content").val("");	// 등록 후 다시 비우기
							}
						},
						error: function(){
							console.log("댓글 작성용 ajax 요청 실패!")
						}
					})
					
				}else {
					alertify.alert("댓글 작성 후 등록해주세요! (공백 불가)");
				}
			}
			
			// 댓글 삭제 ajax
			function delReview(reviewNo) {
				$.ajax({
					url: "rdelete.pro",
					data:{
						reviewNo:reviewNo,
						refProductNo:${ plist[0].productNo }
					},
					success:function(status){
						console.log(status);
						
						selectReviewList();		// 댓글 리스트 재!!조회
					},
					error:function(){
						console.log("댓글 삭제용 ajax 요청 실패!");
					}
				})
			}
			
			// 댓글 수정 ajax
			/*
			function upReview(reviewNo) {
				$.ajax({
					url: "rupdate.pro",
					data: {
						reviewNo: reviewNo,
						refProdutNo:${ plist[0].productNo },
						content:$("#content").val()
					},
					success: function(){
						
					},
					error: function(){
						
					}
				})
			}
			*/
			
			

			
		</script>
	





        <!------------------------------ 관련 레시피 ----------------------------->
        <div id="recipeAll" class="clearfix">
        
            <h1>해당 상품 관련 레시피</h1>
        
            <div class="recipe" align="left">
                <div class="recipeImg">
                    <img width="255px" src="https://all-to-delicious.s3.ap-northeast-2.amazonaws.com/atd/a2dcorp.co.kr/earth/recipe/thumbnail/pc/20220123/b9742c9305db4cbcbfee12b8e1699937.jpg">
                </div>
                <div class="recipeInfo">
                	<span class="recipeStyle">난이도 : </span> 
                    <span>누구나</span>
                    <span>&nbsp; | &nbsp;</span>
                    <span class="recipeStyle">소요시간 : </span>
                    <span>15</span>
                    <span>분이내</span>
                    <h4 width="100%">간만 잘 맞추면 맛은 보장! 감자양파국</h4>
                </div>
            </div>
            <div class="recipe" align="left">
                <div class="recipeImg">
                    <img width="255px" src="https://all-to-delicious.s3.ap-northeast-2.amazonaws.com/atd/a2dcorp.co.kr/earth/recipe/thumbnail/pc/20220123/15a5a1c5cc1c407ea3d8fa1968b910dd.jpg">
                </div>
                <div class="recipeInfo">
                    <span class="recipeStyle">난이도 : </span> 
                    <span>누구나</span>
                    <span>&nbsp; | &nbsp;</span>
                    <span class="recipeStyle">소요시간 : </span>
                    <span>15</span>
                    <span>분이내</span>
                    <h4 width="100%">간만 잘 맞추면 맛은 보장! 감자양파국</h4>
                </div>
            </div>
            <div class="recipe" align="left">
                <div class="recipeImg">
                    <img width="255px" src="https://all-to-delicious.s3.ap-northeast-2.amazonaws.com/atd/a2dcorp.co.kr/earth/recipe/thumbnail/pc/20220203/131897533e5f42aa836b56513a26e631.jpg">
                </div>
                <div class="recipeInfo">
                    <span class="recipeStyle">난이도 : </span> 
                    <span>누구나</span>
                    <span>&nbsp; | &nbsp;</span>
                    <span class="recipeStyle">소요시간 : </span>
                    <span>15</span>
                    <span>분이내</span>
                    <h4>간만 잘 맞추면 맛은 보장! 감자양파국</h4>
                </div>
            </div>
            <div class="recipe" align="left">
                <div class="recipeImg">
                    <img width="255px" src="https://all-to-delicious.s3.ap-northeast-2.amazonaws.com/atd/a2dcorp.co.kr/earth/recipe/thumbnail/pc/20220123/c6f63529e4184603bfca715c94be002a.jpg">
                </div>
                <div class="recipeInfo">
                    <span class="recipeStyle">난이도 : </span> 
                    <span>누구나</span>
                    <span>&nbsp; | &nbsp;</span>
                    <span class="recipeStyle">소요시간 : </span>
                    <span>15</span>
                    <span>분이내</span>
                    <h4>간만 잘 맞추면 맛은 보장! 감자양파국</h4>
                </div>
            </div>
        </div>
        
     
            
    </div>
	


		     <script>
	             function addCart(){ // 장바구니 추가용 ajax
	          
	                $.ajax({
	                   url:"insert.cart",
	                   data:{
	                      userId:'${ loginMember.userId }',
	                      productNo:${ plist[0].productNo },
	                      quantity:$("#amount").val()
	                   },
	                   success:function(result){
	                      
	                      if(result == "success"){
	                         console.log(result);
	                         
	                         //모달버튼 눌리게
	                            $("#modalButton").click();   
	                         
	                      }
	                   
	                   },
	                   error:function(){
	                      console.log("장바구니 추가용 ajax 요청 실패!");
	                   }
	                })
	
	             }
	         </script>


	<script>
	    const add = document.getElementById("add");
	    const minus = document.getElementById("minus");
	    const amount = document.getElementById("amount");
	    const salePrice = document.getElementById("salePrice");
	
	    let amountVal = parseInt(amount.value);
	    let salePriceVal = parseInt(salePrice.innerText.replace(/,/g, '')); // ** salePrice에서 콤마 제거
	
	    updateTotalPrice();
	
	    // (+)
	    add.addEventListener('click', function () {
	        let max = ${ plist[0].stock }; // 해당 상품 재고량
	        if (amountVal < max) {
	            amountVal++;
	            updateTotalPrice();
	        }
	    });
	
	    // (-)
	    minus.addEventListener('click', function () {
	        if (amountVal > 1) {
	            amountVal--;
	            updateTotalPrice();
	        }
	    });
	
	    function updateTotalPrice() {
	        amount.value = amountVal;
	        const totalPrice = amountVal * salePriceVal;
	        sum.innerText = new Intl.NumberFormat('ko-KR').format(totalPrice); // 0,000
	    }
	</script>




    <script>
        // 후기(댓글)로 이동
        const btn2 = document.getElementById('btn2');
        const reviewArea = document.getElementById('reviewArea');
    
        btn2.addEventListener('click', () => {
            window.scrollBy({top: reviewArea.getBoundingClientRect().top, behavior: 'smooth'});
        });

        // 관련 레시피로 이동
        const btn3 = document.getElementById('btn3');
        const recipeAll = document.getElementById('recipeAll');
    
        btn3.addEventListener('click', () => {
            window.scrollBy({top: recipeAll.getBoundingClientRect().top, behavior: 'smooth'});
        });
    </script>
    
    
    
    
    <!-- 푸터 -->
    <jsp:include page="../common/footer.jsp"/>
    
   
</body>
</html>