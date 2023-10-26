<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>1:1 문의 관리</title>


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
  
    .modal-content {
    max-width: 600px; /* Adjust the width as needed */
    margin: 0 auto; /* Center the modal horizontally */
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
        <div style="padding-left:550px">
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
              <th>글번호</th>
              <th>카테고리</th>
              <th>아이디</th>
                <th>답변자</th>
                <th>질문제목</th>
                <th>질문내용</th>
                <th>답변내용</th>
                <th>문의상태</th>
                <th>답변상태</th>
                <th>문의작성일</th>
                <th>답변작성일</th>
               
            </tr>
          </thead>
          <tbody>
          <c:forEach var="b" items="${list }" varStatus="loop">
            <tr>
              <td><input id="qaNo${loop.index}" class="input" type="text" style="border:none" value="${b.qaNo }" readonly></td>
              <td><input id="qaCategory${loop.index}" class="input" type="text" style="border:none" value="${b.qaCategory }" readonly></td>
              <td><input id="userId${loop.index }" class="input" type="text" style="border:none" value="${b.userId }" readonly></td>
              <td><input id="answerId${loop.index }" class="input" type="text" style="border:none" value="${b.answerId }" readonly></td>
                <td><input id="qaTitle${loop.index }" class="input" type="text" style="border:none" value="${b.qaTitle}" readonly></td>
                <td><input id="qaContent${loop.index }" class="input" type="text" style="border:none" value="${b.qaContent }" readonly onclick="openQAContentModal(${loop.index})"></td>
                <td><input id="answerContent${loop.index }" class="input" type="text" style="border:none" value="${b.answerContent }" readonly onclick="openAnswerContentModal(${loop.index })"></td>
                <td><input id="qaStatus${loop.index }" class="input" type="text" style="border:none" value="${b.qaStatus }"></td>
                <td><input id="answerStatus${loop.index }" class="input" type="text" style="border:none" value="${b.answerStatus }"></td>
                <td><input id="qaDate${loop.index }" class="input" type="text" style="border:none" value="${b.qaDate }" readonly></td>
                <td><input id="answerDate${loop.index }" class="input" type="text" style="border:none" value="${b.answerDate }" readonly></td>
                <td><button class="button is-success is-hovered is-small is-light"  onclick="updateQA(${loop.index })">수정</button></td>
    
            </tr>
            <div id="answerContentModal${loop.index}" class="modal">
    <div class="modal-background"></div>
    <div class="modal-content">
        <textarea id="editedAnswerContent${loop.index }" class="textarea" style="width: 100%; min-height: 150px;"></textarea>
        <button class="button is-success" onclick="updateAnswerContent(${loop.index })">저장</button>
        <button class="button is-danger" onclick="closeAnswerContentModal(${loop.index })">취소</button>
    </div>
    <button class="modal-close is-large" aria-label="close" onclick="closeAnswerContentModal(${loop.index })"></button>
</div>

  <div id="qaContentModal${loop.index}" class="modal">
    <div class="modal-background"></div>
    <div class="modal-content">
      <textarea id="qaContentDisplay${loop.index}" class="textarea" style="width: 100%; min-height: 150px;" readonly></textarea>
      <button class="button is-danger" onclick="closeQAContentModal(${loop.index})">닫기</button>
    </div>
    <button class="modal-close is-large" aria-label="close" onclick="closeQAContentModal(${loop.index})"></button>
  </div>
          </c:forEach>
             
                
              
          </tbody>
        </table>
		<script>
		function updateQA(index) {
		    var qaNo = $('#qaNo' + index).val(); 
		    var userId = $('#userId' + index).val();
		    var answerId = $('#answerId' + index).val();
		    var qaTitle = $('#qaTitle' + index).val();
		    var qaContent = $('#qaContent' + index).val();
		    var answerContent = $('#answerContent' + index).val();
		    var qaStatus = $('#qaStatus' + index).val();
		    var answerStatus = $('#answerStatus' + index).val();
		    var qaDate = $('#qaDate' + index).val();
		    var answerDate = $('#answerDate' + index).val();

		    
		    $.ajax({
		        url: 'updateQA.ad',
		        type: 'POST',
		        data: {
		            qaNo: qaNo,
		            userId: userId,
		            answerId: answerId,
		            qaTitle: qaTitle,
		            qaContent: qaContent,
		            answerContent: answerContent,
		            qaStatus: qaStatus,
		            answerStatus: answerStatus,
		            qaDate: qaDate,
		            answerDate: answerDate,
		        },
		        success: function(response) {
		            console.log('Success');
		            alert('1:1 문의 정보가 성공적으로 수정되었습니다.');
		        },
		        error: function() {
		            console.log('Error');
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
          	<a class="pagination-previous" href="qa.ad?cpage=${pi.currentPage-1 }">이전</a>
          </c:otherwise>
          </c:choose>
          
          
          <c:choose>
            <c:when test="${pi.currentPage eq pi.maxPage }">
            <a class="pagination-next is-disabled">다음</a>
            </c:when>
            <c:otherwise>
             <a class="pagination-next" href="qa.ad?cpage=${pi.currentPage + 1 }">다음</a>	
            </c:otherwise>
           </c:choose>
            
            <ul class="pagination-list">
            <c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
            <li>
            <c:choose>
                <c:when test="${p eq pi.currentPage}">
                    <a class="pagination-link is-current" href="qa.ad?cpage=${p}">${p}</a>
                </c:when>
                <c:otherwise>
                    <a class="pagination-link" href="qa.ad?cpage=${p}">${p}</a>
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


<script>
function openAnswerContentModal(index) {
	
    var answerContent = $('#answerContent' + index).val();
    $('#editedAnswerContent' + index).val(answerContent);
    $('#answerContentModal' + index).addClass('is-active');
}


function closeAnswerContentModal(index) {
    $('#answerContentModal' + index).removeClass('is-active');
}


function updateAnswerContent(index) {
    var editedAnswerContent = $('#editedAnswerContent' + index).val();
    $('#answerContent' + index).val(editedAnswerContent);
    closeAnswerContentModal(index);
    

}
</script>

<script>
function openQAContentModal(index) {
  var qaContent = $('#qaContent' + index).val();
  $('#qaContentDisplay' + index).val(qaContent);
  $('#qaContentModal' + index).addClass('is-active');
}

function closeQAContentModal(index) {
  $('#qaContentModal' + index).removeClass('is-active');
}
</script>

</body>
</html>