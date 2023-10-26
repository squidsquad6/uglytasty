<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
  
  <script src="https://kit.fontawesome.com/f1cf0537bc.js" crossorigin="anonymous"></script>


<style>
    .wrap{
        
        width: 25%;
        height: 2000px;
        margin: 0 auto;
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
<div class="wrap">

        <div style="padding-top: 50px;">
       
            <span style="font-size: 26px; font-weight: bold;">결제 정보</span>
        </div>
        <div style="height: 24px;"></div>
        <div class="rounded" style="background-color: rgb(255, 246, 238); padding-top: 20px; padding-bottom: 20px; font-size: 16px; font-weight: bold; text-align: center;"><span id="firstDeliveryDate">첫 배송 예정일: </span></div>
        <br>
        <div style="display: flex; justify-content: space-between;">
            <p style="text-align: left; font-size: 16px;">상품 금액</p>
            <p style="text-align: right; font-size: 16px;">${price }원</p>
        </div>
        <div style="height: 16px;"></div>
        <div style="display: flex; justify-content: space-between;">
            <p style="text-align: left; font-size: 16px;">배송비</p>
            <p style="text-align: right; font-size: 16px;">3000원</p>
        </div>
        
        <div style="height: 16px;"></div>
        <div style="display: flex; justify-content: space-between; border-top: 1px solid #000;">
            <p style="text-align: left;  font-size: 18px; font-weight: bold;  ">결제 예정 금액</p>
            <% 
			    double price = Double.parseDouble(request.getAttribute("price").toString());
			    int totalPayment = (int) price + 3000;
			%>

            <p style="text-align: right; font-size: 18px; font-weight: bold; color: #ff6742;">매 회 <%= totalPayment %>원</p>
        </div>
        <div style="padding-top: 50px;">
          
            <span style="font-size: 26px; font-weight: bold;">결제 수단</span>
        </div>
        <div style="height: 24px;"></div>
        
        
        
        
        
        <div class="container">
            <!-- 누르면 각각 card2.png account2.png로 바뀌도록-->
            <div class="row justify-content-center">
                <div id="card-pay" class="col-sm" style=" text-align: center;">
                   <img src="resources/images/toss.png">
                </div>
           
               
            </div>
        </div>
        <div style="padding-top: 50px;">
            <a href="#" class="button is-rounded is-large is-fullwidth"  style="background-color: rgb(65, 75, 90); color: white; font-weight: bold;" onclick="postFormSubmit()">결제 진행하기</a>
        </div>
       
    </div>
     <jsp:include page="../common/footer.jsp"/>
     <form id="postForm" action="" method="post">
    	<input type="hidden" id="boxSize" name="boxSize" value="${boxSize }">
    	<input type="hidden" id="cycle" name="cycle" value="${cycle }">
    	<input type="hidden" id="address" name="address" value="${address }">
    	<input type="hidden" id="detailAddress" name="detailAddress" value="${detailAddress }">
    	<input type="hidden" id="recipient" name="recipient" value="${recipient }">
    	<input type="hidden" id="phone" name="phone" value="${phone }">
    	<input type="hidden" id="hateVegi" name="hateVegi" value="${hateVegi }">
    	<input type="hidden" id="userId" name="userId" value="${loginMember.userId }">
    	<input type="hidden" id="price" name="price" value="${price }">
    	
    	
    
    </form>
    
    <script>
    
    		document.getElementById("price").value = <%= totalPayment %>;
		</script>
    
    
    <script>
        function postFormSubmit(){
        	
        	
        	 const boxSizeInput = document.getElementById('boxSize');
        	 const cycleInput = document.getElementById('cycle');
        	 const recipientInput = document.getElementById('recipient');
        	 const phoneInput = document.getElementById('phone');
        	 const addressInput = document.getElementById('address');
        	 const detailAddressInput = document.getElementById('detailAddress');
        	 const hateVegiInput = document.getElementById('hateVegi')
        	 
        	  
             
    		$("#postForm").attr("action", "tossPayment.su").submit();

    		
    	}
        </script>
    
    

 <script>
        // Get the current date
        var currentDate = new Date();

        // Calculate the days until the next Friday (0: Sunday, 1: Monday, ..., 6: Saturday)
        var daysUntilFriday = (5 - currentDate.getDay() + 7) % 7;

        // Calculate the date of the next Friday
        var nextFriday = new Date(currentDate);
        nextFriday.setDate(currentDate.getDate() + daysUntilFriday);

        // Display the next Friday's date in Korean format
        var options = { year: 'numeric', month: 'long', day: 'numeric', weekday: 'long' };
        var dateOptions = { year: 'numeric', month: '2-digit', day: '2-digit' };
        var formattedDate = nextFriday.toLocaleDateString('ko-KR', options);

        document.getElementById('firstDeliveryDate').textContent += formattedDate;
    </script>

    
</body>
</html>