<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문 관리</title>



<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->


<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">

<script src="https://kit.fontawesome.com/f1cf0537bc.js" crossorigin="anonymous"></script>

<style>
  th {
    text-align: center;
    padding-left: 10px;
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
 <div>
        <div style="padding-left:650px">
            <nav class="breadcrumb is-centered is-large has-background-white" aria-label="breadcrumbs">
                <ul>
                
                <li><a href="member.ad">회원 관리</a></li>
                <li><a href="order.ad">주문 관리</a></li>
                <li><a href="subscribe.ad">구독 관리</a></li>
                <li><a href="qa.ad">1:1문의 관리</a></li>
                </ul>
            </nav>
         </div>
<br>
    <div class="container">
       
        <table class="table-container is-fullwidth is-hoverable">
          <thead class="thead-dark">
            <tr>
              <th>주문번호</th>
              <th>아이디</th>
              <th>상품번호</th>
                <th>주문상태코드</th>
                <th>주문일자</th>
                <th>송장번호</th>
                <th>주소</th>
                <th>상세주소</th>
                <th>받는사람</th>
                <th>연락처</th>
                <th>요청사항</th>
                <th>배송비</th>
                <th>총 주문 금액</th>
                <th>수정</th>
               
            </tr>
          </thead>
          <tbody>
          <c:forEach var="b" items="${list }" varStatus="loop">
            <tr>
              <td><input id="orderNo${loop.index}" class="input" type="text" style="border:none" value="${b.orderNo }" readonly></td>
              <td><input id="userId${loop.index }" class="input" type="text" style="border:none" value="${b.userId }" readonly></td>
              <td><input id="productNo${loop.index }" class="input" type="text" style="border:none" value="${b.productNo }"></td>
                <td><input id="orderCode${loop.index }" class="input" type="text" style="border:none" value="${b.orderCode }"></td>
                <td><input id="orderDate${loop.index }" class="input" type="text" style="border:none" value="${b.orderDate }"></td>
                <td><input id="trackingNo${loop.index }" class="input" type="text" style="border:none" value="${b.trackingNo }"></td>
                <td><input id="addressMain${loop.index }" class="input" type="text" style="border:none" value="${b.addressMain }"></td>
                <td><input id="addressDetail${loop.index }" class="input" type="text" style="border:none" value="${b.addressDetail }"></td>
                <td><input id="receiver${loop.index }" class="input" type="text" style="border:none" value="${b.receiver }"></td>
                <td><input id="receiverPhone${loop.index }" class="input" type="text" style="border:none" value="${b.receiverPhone }"></td>
                <td><input id="deliveryMemo${loop.index }" class="input" type="text" style="border:none" value="${b.deliveryMemo }"></td>
                <td><input id="deliveryFee${loop.index }" class="input" type="text" style="border:none" value="${b.deliveryFee }"></td>
                <td><input id="totalPrice${loop.index }" class="input" type="text" style="border:none" value="${b.totalPrice }"></td>
                <td><button class="button is-success is-hovered is-small is-light"  onclick="updateOrder(${loop.index })">수정</button></td>
    
            </tr>
          </c:forEach>
             
                
              
          </tbody>
        </table>
		<script>
			function updateOrder(index) {
			    var orderNo = $('#orderNo' + index).val();
			    var userId = $('#userId' + index).val();
			    var productNo = $('#productNo' + index).val();
			    var orderCode = $('#orderCode' + index).val();
			    var orderDate = $('#orderDate' + index).val();
			    var trackingNo = $('#trackingNo' + index).val();
			    var addressMain = $('#addressMain' + index).val();
			    var addressDetail = $('#addressDetail' + index).val();
			    var receiver = $('#receiver' + index).val();
			    var receiverPhone = $('#receiverPhone' + index).val();
			    var deliveryMemo = $('#deliveryMemo' + index).val();
			    var deliveryFee = $('#deliveryFee' + index).val();
			    var totalPrice = $('#totalPrice' + index).val();
			
			    $.ajax({
			      url: 'updateOrder.ad',
			      type: 'POST',
			      data: {
			        orderNo: orderNo,
			        userId: userId,
			        productNo: productNo,
			        orderCode: orderCode,
			        orderDate: orderDate,
			        trackingNo: trackingNo,
			        addressMain: addressMain,
			        addressDetail: addressDetail,
			        receiver: receiver,
			        receiverPhone: receiverPhone,
			        deliveryMemo: deliveryMemo,
			        deliveryFee: deliveryFee,
			        totalPrice: totalPrice,
			      },
			      success: function(response) {
			        console.log('성공');
			        alert('주문 정보가 성공적으로 수정되었습니다.');
			      },
			      error: function() {
			        console.log('실패');
			      }
			    });
			  }
		</script>


       <nav class="pagination is-centered" role="navigation" aria-label="pagination">
            
         
          
          <c:choose>
           <c:when test="${pi.currentPage eq 1 }">
            <a class="pagination-previous is-disabled" >이전</a>
          </c:when>
          <c:otherwise>
          	<a class="pagination-previous" href="order.ad?cpage=${pi.currentPage-1 }">이전</a>
          </c:otherwise>
          </c:choose>
          
          
          <c:choose>
            <c:when test="${pi.currentPage eq pi.maxPage }">
            <a class="pagination-next is-disabled">다음</a>
            </c:when>
            <c:otherwise>
             <a class="pagination-next" href="order.ad?cpage=${pi.currentPage + 1 }">다음</a>	
            </c:otherwise>
           </c:choose>
            
            <ul class="pagination-list">
            <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
            <li>
                <a class="pagination-link" href="order.ad?cpage=${p }">${p }</a>
              </li>
            </c:forEach>
              
             
            </ul>
          </nav>
    </div>
</div>
</body>
</html>