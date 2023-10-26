<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결제 성공</title>
<style>
.outer{
            width: 1300px;height: 2000px; margin: 0 auto;
             display: flex;
    flex-direction: column;
    align-items: center; 
    margin:auto;
    text-align:center;
            
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
    
     .orderDetail {
            width: 70%;
        }
        .orderDetail span {
            font-size: 15px;
        }
        .orderDetail #orderId {
            color: #ff6741;
            font-weight: bold;
            font-size: 15px;
            text-align:left;
            
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
            padding: 20px 120px;
            color: #ff6741;
            font-size: 15px;
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
            padding: 20px 100px;
            color: white;
            font-size: 15px;
            font-weight: bold;
            border-radius: 10px;
            cursor: pointer;
        }
        .orderDetail #continueBtn2:hover {
            filter: brightness(0.9);
        }


        hr {
            width: 100%;
            border: 1px solid #f2f2f2;
        }
        .nemo {
            background-color: #f2f2f2;
            width: 100%;
            height: 15px;
        }
        #orderTable th {
            height: 30px;
            text-align: left;
            color: gray;
        }
        .orderDetail .totalPrice {
            color: #ff6741;
            font-size: 20px;
            font-weight: bold;
        }
    

</style>
</head>
<body>
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
<div class="outer">
<br><br>

 <div class="orderDetail">
            <h1>주문완료</h1>
            <hr>
            <img src="resources/images/paprika.png">
            <h2>주문이 완료되었습니다.</h2>
            <span>주문번호 : </span>
            <span id="orderId"></span><br>
            <span>결제번호 : </span>
            <span id="paymentKey"></span>
            
            
           
            
            <br><br><br><br><br><div class="nemo"></div><br>

            <h2 align="left" style="padding-left: 23%;">구독정보</h2>
            <hr><br>
            <div style="padding-left: 23%;">
            <table id="orderTable" width="520px" style="text-align:left;">
            
                <tr>
                    <th width="150px">종료 날짜</th>
                    <td id="endDateCell"></td>
                </tr>
                <tr>
                    <th>제외품목</th>
                    <td id="dislikeCell"></td>
                </tr>
                <tr>
                    <th>주소</th>
                     <td id="addressCell"></td>
                </tr>
            </table>
            </div>

            <br><br><div class="nemo"></div>
			<br>
            <table id="accountTable">
                <tr>
                    <td width="85%">
                        <h2>결제수단</h2>
                    </td>
                    <td>
                        <h4 align="right">토스</h4>
                        <!-- <img src="./card2.png"> -->
                    </td>
                </tr>
                <tr>
                    <td>
                        <h2>결제금액</h2>
                    </td>
                    <td>
                        <span id="amount" class="totalPrice"></span>
                    </td>
                </tr>
            </table>

            <br><br><br>
    <div style="margin:auto; text-align:center;">
    	<a href="/uglytasty" class="btn text-white"   style="background-color: #ff6742; color: white; font-weight: bold; width: 50%;">메인화면으로</a>
    </div>

        </div>









 
    <br>

    <script>
    function sendAjaxRequest() {
        const loginMemberId = "${loginMember.userId}";
        
        const queryParams = new URLSearchParams();
        queryParams.append('userId', loginMemberId);

        const xhr = new XMLHttpRequest();
        xhr.open('GET', 'statusY.su?' + queryParams.toString(), true);

        xhr.onreadystatechange = function () {
  	      if (xhr.readyState === 4 && xhr.status === 200) {
  	        const response = xhr.responseText;
  	        
  	        
  	      const responseData = JSON.parse(response);

          
          const endDate = responseData.endDate;
          const dislike = responseData.dislike;
          const address = responseData.address;
          const detailAddress = responseData.detailAddress;

         
          document.getElementById("endDateCell").textContent = endDate;
          document.getElementById("dislikeCell").textContent = dislike;
          document.getElementById("addressCell").textContent = address + " " + detailAddress;
  	        
  	        
  	      }else{
  	    	  console.log("에러");
  	      }
  	    };

        xhr.send();
      }

     
      document.addEventListener('DOMContentLoaded', function () {
        sendAjaxRequest();
      });

    
    
    
      const queryParams = new URLSearchParams(window.location.search);

      
      
     
      
      document.getElementById("paymentKey").textContent = queryParams.get("paymentKey");
      document.getElementById("orderId").textContent = queryParams.get("orderId");
      document.getElementById("amount").textContent = queryParams.get("amount")+"원";
    </script>
    
   
    
    
    <jsp:include page="../common/footer.jsp"/>
    </div>
</body>
</html>