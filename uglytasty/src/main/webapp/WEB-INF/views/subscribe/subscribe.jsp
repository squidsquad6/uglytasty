<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>못난이박스 구독</title>

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
         /* div{border: 1px solid red; box-sizing: border-box;} */

        .outer{
            width: 1400px;height: 2000px;margin: auto;
        }

        .intro{
            height: 20%;
        background-image: url('resources/images/subscribe_head.webp');
        display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: flex-start;
        }

        .intro div{
            display: flex;
        flex-direction: column;
        justify-content: center;
        align-items: flex-end;
        padding-left: 100px;
        padding-bottom: 15px;
       
        }

        .review{
            height: 20%;
            background-color: #fff7ed;
            text-align: center;
            font-weight: bold;
            font-size: 30px;
        }

        

        .info{
            height: 20%;
        }
        
        .recipe{
            height: 20%;
        }

        .info2{
            height: 20%;
        }

        .startButton{
            height: 20%;
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
<div class="outer">
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
  <br><br>
    <div class="intro">
        <div style="font-size: 20px; color:#ff6742;"><b>못나지만 맛난 친구!</b></div>
        <div style="font-size: 35px; font-weight: bolder;">
            합리적 가격, 선물같은 설렘
            <br>
            못난이맛난이 구독박스

        </div>
        <div>
        	<c:if test="${not empty loginMember }">
           	 <a href="buynow.su?userId=${loginMember.userId}" class="btn text-white" style="background-color: #ff6742; width: 200px; height: 50px; font-size: large; font-weight: bold; padding-top: 11px;" >시작하기</a>
            </c:if>
            <c:if test="${empty loginMember }">
           	 <a href="loginForm.me" class="btn text-white" style="background-color: #ff6742; width: 200px; height: 50px; font-size: large; font-weight: bold; padding-top: 11px;" >시작하기</a>
            </c:if>
        </div>
    </div>

    <div class="review">
        <div style="margin-top: 50px; padding-top: 30px;">맛있는 리뷰들을 확인하세요!</div>
        <br>
        
        <!--누르면 modal로 상세 내용 나오게할예정-->
        <div class="row">
            <div class="col-md-4">
                <img src="resources/images/review1.webp" style="height: 60%;">
            </div>
            <div class="col-md-4">
                <img src="resources/images/review2.webp" style="height: 60%;">
            </div>
            <div class="col-md-4">
                <img src="resources/images/review3.webp" style="height: 60%;">
            </div>
        </div>
        

    </div>
<br>
    <div class="info">
        <div style="padding-left: 50px;">
           
            <button class="button is-rounded"   style="background-color: #ff6742; color: white; font-weight: bold;">구독 정보</button>

        </div>
        <br>
        
        <div style="font-size: 30px; font-weight: bold;padding-left: 50px; padding-bottom: 30px; " >

            다양한 구독 플랜이 있어요!
        </div>
        
        <div class="row" style="padding-left: 50px; color: #ff6742; font-weight: bold;">
            <div class="col-sm-6">박스 크기 선택</div>
            <div class="col-sm-6">배송 주기 선택</div>
        </div>
        <div class="row" style="padding-left: 50px; color: #ff6742; font-weight: bold;">
            <div class="col-sm-6">

                <div class="row" style="margin-top: 20px;">
                    <div id="standard-image" class="col-sm-6" style="border: white;"><img  src="resources/images/standard.svg" style="height: 100%; width: 75%; "></div>
                    <div id="jumbo-image" class="col-sm-6"  style="border: white;"><img  src="resources/images/jumbo.svg" style="height: 100%; width: 75%;"></div>
                </div>

            </div>
            
           
            
            <div class="col-sm-6">
                <div class="row" style="margin-top: 20px;">
                    <div class="col-sm-4"  style=" border: white;"><img src="resources/images/week1.svg" style="height: 100%; width: 100%;"></div>
                    <div class="col-sm-4"  style=" border: white;"><img src="resources/images/week2.svg" style="height: 100%; width: 100%;"></div>
                    <div class="col-sm-4"  style="  border: white;"><img src="resources/images/week4.png" style="height: 100%; width: 100%;"></div>
                </div>
                <div style="margin-top:30px; font-size: large; color: rgb(58, 58, 58);">비선호 품목은 배송되는 주간의 다른 품목으로 대체해 보내드려요!</div>
            </div>
        </div>
    </div>
<br><br><br>
<br><br><br>


<!--  누르면 modal로 리스트 나오도록-->
    <div class="preview jumbotron rounded" style="text-align: center;">
        <div style="font-size: 30px; font-weight: bold;padding-left: 50px; padding-bottom: 30px; " >

            매주 구출되는 채소·과일 미리보기

        </div>
        <div style="padding-left: 40px;">
            <img src="resources/images/preview.webp">
        </div>
        <br>
        <div style="font-size: large; ">
            <ul>
                <li>
                    <i class="fa-solid fa-seedling fa-bounce"></i> 무농약·유기농 채소로 구성돼요.
                </li>
                <li>
                    <i class="fa-solid fa-seedling fa-bounce"></i>   사연을 가지고 있지만 가장 신선해요.
                </li>
                <li>
                    <i class="fa-solid fa-seedling fa-bounce"></i> 제철에 꼭 먹어야할 채소·과일이에요.
                </li>
            </ul>
            
        </div>
        <br>
        <div>
            <div>
                <button class="button js-modal-trigger" data-target="modal-js-example"   style="background-color: #ff6742; color: white; font-weight: bold; width: 30%;">품목 확인하기</button>
			   
            </div>

        </div>
    </div>
    <br><br><br>
    <br><br><br>
   


    <div class="recipe">
        <div style="padding-left: 50px;">
           
            <button class="button is-rounded"   style="background-color: #ff6742; color: white; font-weight: bold;">레시피 페이퍼</button>

        </div>
        <br>
        <div style="font-size: 30px; font-weight: bold;padding-left: 50px; padding-bottom: 30px; " >

            금요일 도착! 레시피와 맛있는 못난이들을 즐겨요!
        </div>
        <div style="padding-left: 50px;"><img src="resources/images/recipe.webp"></div>

    </div>

   <br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>

    <div class="startButton" style="text-align: center;">
        <div style="font-size: 30px; font-weight: bold;padding-left: 50px; padding-bottom: 30px; text-align: center; " >

            지금 바로 안심하고 구독하세요!
        </div>
        <div>
            <img src="resources/images/info.svg">
        </div>
        <br><br>
        <div>
        	<c:if test="${not empty loginMember }">
           	 <a href="buynow.su?userId=${loginMember.userId}" class="btn text-white"   style="background-color: #ff6742; color: white; font-weight: bold; width: 50%;">구독 하기</a>
			</c:if>
			<c:if test="${empty loginMember }">
				<a href="loginForm.me" class="btn text-white"   style="background-color: #ff6742; color: white; font-weight: bold; width: 50%;">구독 하기</a>
			</c:if>
        </div>
    </div>
    <br><br><br><br><br><br><br><br>
 <jsp:include page="../common/footer.jsp"/>
 <br>
</div>
 



<div id="modal-js-example" class="modal">
  <div class="modal-background"></div>

  <div class="modal-content">
    <div class="box">
      <img src="resources/images/vegetables_list_pc.webp">
      <!-- Your content -->
    </div>
  </div>

  <button class="modal-close is-large" aria-label="close"></button>
 
</div>


<script>
document.addEventListener('DOMContentLoaded', () => {
	  // Functions to open and close a modal
	  function openModal($el) {
	    $el.classList.add('is-active');
	  }

	  function closeModal($el) {
	    $el.classList.remove('is-active');
	  }

	  function closeAllModals() {
	    (document.querySelectorAll('.modal') || []).forEach(($modal) => {
	      closeModal($modal);
	    });
	  }

	  // Add a click event on buttons to open a specific modal
	  (document.querySelectorAll('.js-modal-trigger') || []).forEach(($trigger) => {
	    const modal = $trigger.dataset.target;
	    const $target = document.getElementById(modal);

	    $trigger.addEventListener('click', () => {
	      openModal($target);
	    });
	  });

	  // Add a click event on various child elements to close the parent modal
	  (document.querySelectorAll('.modal-background, .modal-close, .modal-card-head .delete, .modal-card-foot .button') || []).forEach(($close) => {
	    const $target = $close.closest('.modal');

	    $close.addEventListener('click', () => {
	      closeModal($target);
	    });
	  });

	  // Add a keyboard event to close all modals
	  document.addEventListener('keydown', (event) => {
	    if (event.code === 'Escape') {
	      closeAllModals();
	    }
	  });
	});
</script>


</body>
</html>