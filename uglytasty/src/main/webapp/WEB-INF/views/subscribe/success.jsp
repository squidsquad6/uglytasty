<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.outer{
            width: 1300px;height: 2000px; margin: 0 auto;
             display: flex;
    flex-direction: column;
    align-items: center; /* Center horizontally */
            
        }

</style>
</head>
<body>
<jsp:include page="../common/header.jsp"/>

<div class="outer">
<br><br>
 <section>
      <h1>구매 완료</h1>
      <br>
      <hr>
      <h3>못난이맛난이 박스 구독</h3>
      <h5 id="paymentKey"></h5>
      <h5 id="orderId"></h5>
      <h5 id="amount"></h5>
      <hr>
    </section>
    <br>
    <div>
    	<a href="loginForm.me" class="btn text-white"   style="background-color: #ff6742; color: white; font-weight: bold; width: 200%;">메인화면으로</a>
    </div>
    <script>
    function sendAjaxRequest() {
        const loginMemberId = "${loginMember.userId}";
        console.log(loginMemberId);
        const queryParams = new URLSearchParams();
        queryParams.append('userId', loginMemberId);

        const xhr = new XMLHttpRequest();
        xhr.open('GET', 'statusY.su?' + queryParams.toString(), true);

        xhr.onreadystatechange = function () {
          if (xhr.readyState === 4 && xhr.status === 200) {
            // Handle the response if needed
          }
        };

        xhr.send();
      }

      // Call the function when the page loads
      document.addEventListener('DOMContentLoaded', function () {
        sendAjaxRequest();
      });

    
    
    
      const queryParams = new URLSearchParams(window.location.search);

      
      
      console.log("paymentKey", queryParams.get("paymentKey"));
      console.log("orderId", queryParams.get("orderId"));
      console.log("amount:", queryParams.get("amount"));
      
      document.getElementById("paymentKey").textContent = "결제번호 : "+queryParams.get("paymentKey");
      document.getElementById("orderId").textContent = "주문번호 : "+queryParams.get("orderId");
      document.getElementById("amount").textContent = "결제금액 : "+queryParams.get("amount")+"원";
    </script>
    
    </div>
</body>
</html>