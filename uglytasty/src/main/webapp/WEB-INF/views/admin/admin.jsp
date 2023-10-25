<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 관리</title>

 

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
        <div style="padding-left:650px">
            <nav class="breadcrumb is-centered is-large has-background-white" aria-label="breadcrumbs">
                <ul>
                
                <li><a href="member.ad">회원 관리</a></li>
                <li><a href="order.ad">주문 관리</a></li>
                <li><a href="subscribe.ad">구독 관리</a></li>
                <li><a href="qa.ad">1:1문의 관리</a></li>
                 <li><a href="product.ad">단품 관리</a></li>
                </ul>
            </nav>
         </div>
<br>
    <div class="container">
       
        <table class="table-container is-fullwidth is-hoverable">
          <thead class="thead-dark">
            <tr>
              <th>아이디</th>
              <th>비밀번호</th>
              <th>회원이름</th>
              <th>이메일</th>
                <th>전화번호</th>
                <th>주소</th>
                <th>상세주소</th>
                <th>상태</th>
                <th>구독여부</th>
                <!--  
                <th>소셜로그인</th>
                <th>엑세스토큰</th>
                <th>리프레쉬토큰</th>
                -->
                <th>수정</th>
            </tr>
          </thead>
          <tbody>
            <c:forEach var="b" items="${list }" varStatus="loop">
            <tr>
                <td><input id="userId${loop.index}" name="userId${loop.index}" class="input" type="text" style="border:none" value="${b.userId}" readonly></td>
		        <td><input id="userPwd${loop.index}" class="input" type="text" style="border:none" value="${b.userPwd}"></td>
		        <td><input id="userName${loop.index}" class="input" type="text" style="border:none" value="${b.userName}"></td>
		        <td><input id="email${loop.index}" class="input" type="text" style="border:none" value="${b.email}"></td>
		        <td><input id="phone${loop.index}" class="input" type="text" style="border:none" value="${b.phone}"></td>
		        <td><input id="addressBase${loop.index}" class="input" type="text" style="border:none" value="${b.addressBase}"></td>
		        <td><input id="addressDetail${loop.index}" class="input" type="text" style="border:none" value="${b.addressDetail}"></td>
		        <td><input id="status${loop.index}" class="input" type="text" style="border:none" value="${b.status}"></td>
		        <td><input id="subscribe${loop.index}" class="input" type="text" style="border:none" value="${b.subscribe}"></td>
		        
		        <!--  
		        <td><input id="provider${loop.index}" class="input" type="text" style="border:none" value="${b.provider}"></td>
		        <td><input id="accessToken${loop.index}" class="input" type="text" style="border:none" value="${b.accessToken}"></td>
		        <td><input id="refreshToken${loop.index}" class="input" type="text" style="border:none" value="${b.refreshToken}"></td>
		        -->
                
                <td>
                <button class="button is-success is-hovered is-small is-light"
              onclick="updateUser(${loop.index})">수정</button>
              </td>
           
            </tr>
            </c:forEach>
            

             
                
              
          </tbody>
        </table>

		<script>
		function updateUser(index) {
			 
			
			
			
			var userId = $('#userId' + index + '').val();
			
			  var userPwd = $('#userPwd' + index).val();
			  var userName = $('#userName' + index).val();
			  var email = $('#email' + index ).val();
			  var phone = $('#phone' + index ).val();
			  var addressBase = $('#addressBase' + index).val();
			  var addressDetail = $('#addressDetail' + index).val();
			  var status = $('#status' + index).val();
			  var subscribe = $('#subscribe' + index) .val();
			  var provider = $('#provider' + index ).val();
			  var accessToken = $('#accessToken' + index  ).val();
			  var refreshToken = $('#refreshToken' + index ).val();
			
			
			  $.ajax({
			    url: 'updateMember.ad',
			    type: 'POST',
			    data: {
			    	userId:userId
			       ,userPwd:userPwd
			       ,userName: userName
			       ,phone:phone
			       ,email:email
			       ,addressBase:addressBase
			       ,addressDetail:addressDetail
			       ,status:status
			       ,subscribe:subscribe
			       ,provider:provider
			       ,accessToken:accessToken
			       ,refreshToken:refreshToken
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
          	<a class="pagination-previous" href="member.ad?cpage=${pi.currentPage-1 }">이전</a>
          </c:otherwise>
          </c:choose>
          
          
          <c:choose>
            <c:when test="${pi.currentPage eq pi.maxPage }">
            <a class="pagination-next is-disabled">다음</a>
            </c:when>
            <c:otherwise>
             <a class="pagination-next is-disabled" href="member.ad?cpage=${pi.currentPage + 1 }">다음</a>	
            </c:otherwise>
           </c:choose>
            
            <ul class="pagination-list">
            <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
            <li>
                <a class="pagination-link" href="member.ad?cpage=${p }">${p }</a>
              </li>
            </c:forEach>
              
             
            </ul>
          </nav>
    </div>
</div>
</body>
</html>