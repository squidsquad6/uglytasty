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
    .orderStatusCode {
    	color: #ff6741;
    	font-size: 12px;
    	padding-left: 10px;
    }
 	
 	
 	.mainBtn a {
 		color:white;
 		background-color : #ff6741;
 		border-radius : 10px;
 	}
 	
 	
 	    .modal-content {
    max-width: 600px; 
    margin: 0 auto; 
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
 		<br><br><br>
        <div style="display: flex; justify-content: center;">
            <nav class="breadcrumb is-centered is-large has-background-white" aria-label="breadcrumbs" >
                <ul>
	                <li><a href="member.ad" style="color: #ff6741;">회원 관리</a></li>
	                <li><a href="order.ad" style="color: #ff6741;">주문 관리</a></li>
	                <li><a href="subscribe.ad" style="color: #ff6741;">구독 관리</a></li>
	                <li><a href="qa.ad" style="color: #ff6741;">1:1문의 관리</a></li>
	                <li><a href="product.ad" style="color: #ff6741;">단품 관리</a></li>
                </ul>
            </nav>
         </div>
	<br><br>
    <div class="container">
       	<p class="orderStatusCode">주문상태코드 : [1:미결제 | 2:결제완료(주문번호) | 3:배송준비중(송장번호) | 4:배송중 | 5:배송완료]</p>
        <table class="table-container is-fullwidth is-hoverable">
          <thead class="thead-dark">
            <tr>
              	<th>주문번호</th>
              	<th>아이디</th>
              	<th>상품구성</th>
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
              <td><input id="productNo${loop.index }" class="input" type="text" style="border:none" value="${b.products }" readonly onclick="openProductContentModal(${loop.index} , '${b.products}')"></td>
 
                <td width="100px;">
                	 <select id="orderCode${loop.index}" class="input">
			            <option value="1" ${b.orderCode == 1 ? 'selected' : ''}>1</option>
			            <option value="2" ${b.orderCode == 2 ? 'selected' : ''}>2</option>
			            <option value="3" ${b.orderCode == 3 ? 'selected' : ''}>3</option>
			            <option value="4" ${b.orderCode == 4 ? 'selected' : ''}>4</option>
			            <option value="5" ${b.orderCode == 5 ? 'selected' : ''}>5</option>
			        </select>
                </td>
                
                <td width="120px;"><input id="orderDate${loop.index }" class="input" type="text" style="border:none" value="${b.orderDate }"></td>
                <td width="180px;"><input id="trackingNo${loop.index }" class="input" type="text" style="border:none" value="${b.trackingNo }"></td>
                <td><input id="addressMain${loop.index }" class="input" type="text" style="border:none" value="${b.addressMain }"></td>
                <td><input id="addressDetail${loop.index }" class="input" type="text" style="border:none" value="${b.addressDetail }"></td>
                <td><input id="receiver${loop.index }" class="input" type="text" style="border:none" value="${b.receiver }"></td>
                <td><input id="receiverPhone${loop.index }" class="input" type="text" style="border:none" value="${b.receiverPhone }"></td>
                <td><input id="deliveryMemo${loop.index }" class="input" type="text" style="border:none" value="${b.deliveryMemo }"></td>
                <td><input id="deliveryFee${loop.index }" class="input" type="text" style="border:none" value="${b.deliveryFee }"></td>
                <td><input id="totalPrice${loop.index }" class="input" type="text" style="border:none" value="${b.totalPrice }"></td>
                <td><button class="button is-success is-hovered is-small is-light" style="display: block; margin: 0 auto; margin-top: 5px;" onclick="updateOrder(${loop.index })">수정</button></td>
    
            </tr>
            
            <div id="productContentModal${loop.index}" class="modal">
			    <div class="modal-background"></div>
			    <div class="modal-content">
			        <textarea id="productContentDisplay${loop.index}" class="textarea" style="width: 100%; min-height: 150px;" readonly></textarea>
			        <button class="button is-danger" onclick="closeProductContentModal(${loop.index})">닫기</button>
			    </div>
			    <button class="modal-close is-large" aria-label="close" onclick="closeProductContentModal(${loop.index})"></button>
			</div>
            
            
          </c:forEach>
             
                
              
          </tbody>
        </table>
        
        <script>
		function openProductContentModal(index, productContent) {
			 $('#productContentDisplay' + index).val(productContent);
			  $('#productContentModal' + index).addClass('is-active');
		}
		
		function closeProductContentModal(index) {
		  $('#productContentModal' + index).removeClass('is-active');
		}
		</script>
        
        
        
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
			        location.reload();
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
            <c:choose>
                <c:when test="${p eq pi.currentPage}">
                    <a class="pagination-link is-current" href="order.ad?cpage=${p}">${p}</a>
                </c:when>
                <c:otherwise>
                    <a class="pagination-link" href="order.ad?cpage=${p}">${p}</a>
                </c:otherwise>
            </c:choose>
        	</li>
            </c:forEach>
              
             
            </ul>
          </nav>
          <br><br><br><br><br><br> 
    </div>
    <jsp:include page="../common/footer.jsp"/>
</div>
</body>
</html>