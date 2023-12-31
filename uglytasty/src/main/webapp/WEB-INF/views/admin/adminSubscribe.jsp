<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>구독 관리</title>

<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

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
       
        <table class="table-container is-fullwidth is-hoverable">
          <thead class="thead-dark">
            <tr>
              <th>아이디</th>
              <th>시작날짜</th>
              <th>종료날짜</th>
              <th>박스사이즈</th>
              <th>주기</th>
              <th>구독여부</th>
              <th>제외품목</th>
              <th>주소</th>
              <th>상세주소</th>
              <th>수정</th>
                
            </tr>
          </thead>
          <tbody>
          <c:forEach var="b" items="${list }" varStatus="loop">
            <tr>
            
              <td><input id="userId${loop.index }" class="input" type="text" style="border:none" value="${b.userId }" readonly></td>
              <td><input id="startDate${loop.index }" class="input" type="text" style="border:none" value="${b.startDate }"></td>
              <td><input id="endDate${loop.index }" class="input" type="text" style="border:none" value="${b.endDate }"></td>
                <td><input id="boxSize${loop.index }" class="input" type="text" style="border:none" value="${b.boxSize }"></td>
                <td><input id="term${loop.index }" class="input" type="text" style="border:none" value="${b.term }"></td>
                <td><input id="status${loop.index }" class="input" type="text" style="border:none" value="${b.status }"></td>
                <td><input id="dislike${loop.index }" class="input" type="text" style="border:none" value="${b.dislike }"></td>
                <td><input id="address${loop.index }" class="input" type="text" style="border:none" value="${b.address }"></td>
                <td><input id="detailAddress${loop.index }" class="input" type="text" style="border:none" value="${b.detailAddress }"></td>
                <td><button class="button is-success is-hovered is-small is-light" style="display: block; margin: 0 auto; margin-top: 5px;" onclick="updateSubscribe('${loop.index}')">수정</button></td>
               
            </tr>
            </c:forEach>
           

             
                
              
          </tbody>
        </table>

			<script>
			function updateSubscribe(index) {
			    var userId = $('#userId' + index).val();
			    var startDate = $('#startDate' + index).val();
			    var endDate = $('#endDate' + index).val();
			    var boxSize = $('#boxSize' + index).val();
			    var term = $('#term' + index).val();
			    var status = $('#status' + index).val();
			    var dislike = $('#dislike' + index).val();
			    var address = $('#address' + index).val();
			    var detailAddress = $('#detailAddress' + index).val();

			    $.ajax({
			      url: 'updateSubscribe.ad',
			      type: 'POST',
			      data: {
			        userId: userId,
			        startDate: startDate,
			        endDate: endDate,
			        boxSize: boxSize,
			        term: term,
			        status: status,
			        dislike: dislike,
			        address: address,
			        detailAddress: detailAddress
			      },
			      success: function(response) {
			        console.log('성공');
			        alert('수정이 성공적으로 완료되었습니다.');
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
          	<a class="pagination-previous" href="subscribe.ad?cpage=${pi.currentPage-1 }">이전</a>
          </c:otherwise>
          </c:choose>
          
          
          <c:choose>
            <c:when test="${pi.currentPage eq pi.maxPage }">
            <a class="pagination-next is-disabled">다음</a>
            </c:when>
            <c:otherwise>
             <a class="pagination-next is-disabled" href="subscribe.ad?cpage=${pi.currentPage + 1 }">다음</a>	
            </c:otherwise>
           </c:choose>
            
            <ul class="pagination-list">
            <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
            <li>
            <c:choose>
                <c:when test="${p eq pi.currentPage}">
                    <a class="pagination-link is-current" href="subscribe.ad?cpage=${p}">${p}</a>
                </c:when>
                <c:otherwise>
                    <a class="pagination-link" href="subscribe.ad?cpage=${p}">${p}</a>
                </c:otherwise>
            </c:choose>
        	</li>
            
            
            </c:forEach>
              
             
            </ul>
          </nav>
    </div>
    <br><br><br><br><br><br>
    <jsp:include page="../common/footer.jsp"/>
</div>
</body>
</html>