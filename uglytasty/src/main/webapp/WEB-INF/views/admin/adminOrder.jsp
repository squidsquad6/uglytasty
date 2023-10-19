<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>



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
</style>


</head>
<body>

<jsp:include page="../common/header.jsp"/>
 <div>
        <div style="padding-left:750px">
            <nav class="breadcrumb is-centered is-large has-background-white" aria-label="breadcrumbs">
                <ul>
                
                <li><a href="member.ad">회원 관리</a></li>
                <li><a href="order.ad">주문 관리</a></li>
                <li><a href="subscribe.ad">구독 관리</a></li>
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
                <th>주문수량</th>
                <th>주문일자</th>
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
                <td><input id="orderQuantity${loop.index }" class="input" type="text" style="border:none" value="${b.orderQuantity }"></td>
                <td><input id="orderDate${loop.index }" class="input" type="text" style="border:none" value="${b.orderDate }" readonly></td>
                <td><input id="totalPrice${loop.index }" class="input" type="text" style="border:none" value="${b.totalPrice }"></td>
                <td><button class="button is-success is-hovered is-small is-light"  onclick="updateOrder(${loop.index })">수정</button></td>
    
            </tr>
          </c:forEach>
             
                
              
          </tbody>
        </table>
		<script>
		function updateOrder(index) {
		    var orderNo = $('#orderNo' + index).val();
		    var productNo = $('#productNo' + index).val();
		    var userId = $('#userId'+index).val();
		    var orderCode = $('#orderCode' + index).val();
		    var orderQuantity = $('#orderQuantity' + index).val();
		    var orderDate = $('#orderDate' + index).val();
		    var totalPrice = $('#totalPrice' + index).val();

		    $.ajax({
		      url: 'updateOrder.ad',
		      type: 'POST',
		      data: {
		        orderNo: orderNo,
		        productNo: productNo,
		        orderCode: orderCode,
		        orderQuantity: orderQuantity,
		        orderDate: orderDate,
		        totalPrice: totalPrice,
		        userId: userId
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