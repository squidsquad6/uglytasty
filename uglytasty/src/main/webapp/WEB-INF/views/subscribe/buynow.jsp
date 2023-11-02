<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>정기구독하기</title>

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
        background-color: rgb(251, 246, 241);
        width: 25%;
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
    
    #modal-js-example .modal-card {
    width: 650px; /* 원하는 너비 설정 */
    max-height: 70vh; /* 원하는 최대 높이 설정 (뷰포트 높이의 70%) */
    overflow-y: auto; /* 내용이 모달을 벗어날 경우 스크롤 표시 */
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
  
        <div style="padding-top: 50px; padding-left: 15px;">
            <button class="button is-rounded"  style="background-color: #ff6742; color: white; font-weight: bold;">01</button>
            <span style="font-size: 26px; font-weight: bold;">박스 크기 선택</span>
        </div>
        <br><br>
          <form id="postForm" action="" method="post">
        <input type="hidden" id="boxSize" name="boxSize" value="0">
        <input type="hidden" id="cycle" name="cycle" value="0">
        <input type="hidden" id="hateVegi" name="hateVegi" value="">
        <input type="hidden" id="recipient" name = "recipient" value ="">
        <input type="hidden" id="phone" name="phone" value ="">
        <input type="hidden" id="address" name="address" value ="">
        <input type="hidden" id="detailAddress" name="detailAddress" value="">
        <input type="hidden" id="price" name="price" value="0">
        </form>
        
        <script>
        function postFormSubmit(){
        	
        	
        	 const boxSizeInput = document.getElementById('boxSize');
        	 const cycleInput = document.getElementById('cycle');
        	 const recipientInput = document.getElementById('recipient');
        	 const phoneInput = document.getElementById('phone');
        	 const addressInput = document.getElementById('address');
        	 const detailAddressInput = document.getElementById('detailAddress');
        	 const hateVegiInput = document.getElementById('hateVegi')
             const sample6AddressInput = document.getElementById('sample6_address');
        	 
             
        	 addressInput.value = sample6AddressInput.value;
             
        	 
        	    if (
        	            boxSizeInput.value === '0' ||
        	            cycleInput.value === '0' ||
        	            recipientInput.value === '' ||
        	            phoneInput.value === '' ||
        	            addressInput.value === '' ||
        	            detailAddressInput.value === ''
        	        ) {
        	            alert('모든 필수 정보를 입력해주세요.');
        	            return; 
        	        }
             
    		$("#postForm").attr("action", "payment.su").submit();

    		
    	}
        </script>
        
        
        
        <!-- 클릭하면 카드 테두리가 주황색으로 바뀌도록-->
        <div class="container">
            <div class="row">
              <div class="col-sm">
                <div id="standard-image" class="card" style="width: 10rem;  margin: 0 auto;">
                    <img src="resources/images/standardbox.png" class="card-img-top" alt="...">
                    <div class="card-body">
                      <p class="card-text" style="text-align: center; font-size: 18px; font-weight: bold;">스탠다드 박스</p>
                      <p class="card-text" style="text-align: center;">15000원/회차</p>
                    </div>
                  </div>
              </div>
              <div class="col-sm">
                <div id="jumbo-image" class="card" style="width: 10rem;  margin: 0 auto;">
                    <img src="resources/images/jumbobox.png" class="card-img-top" alt="...">
                    <div class="card-body">
                      <p class="card-text" style="text-align: center; font-size: 18px; font-weight: bold;">점보 박스</p>
                      <p class="card-text" style="text-align: center;">25000원/회차</p>
                    </div>
                  </div>
              </div>
             
            </div>
          </div>
          <div style="padding-left: 30px; padding-top: 15px; font-size: 14px;">
            <div id="standard-text"><i class="fa-solid fa-seedling fa-bounce"></i>스탠다드 박스는 1~2인 가구에 적합해요</div>
            <div id="standard-text"><i class="fa-solid fa-seedling fa-bounce"></i>양파 2개, 토마토 2개처럼 품목마다 조금씩 보내드려요</div>

           
             <div id="jumbo-text"><i class="fa-solid fa-seedling fa-bounce"></i>점보박스는 3~4인 가구에 적합해요</div>
            <div id="jumbo-text"><i class="fa-solid fa-seedling fa-bounce"></i>양파 4개, 토마토 5개처럼 품목마다 조금씩 보내드려요</div> 

         </div>
         
         
         <script>

			function toggleImageBorder(clickedImageId, otherImageId) {
			    var clickedImageDiv = document.getElementById(clickedImageId);
			    var otherImageDiv = document.getElementById(otherImageId);
			
			    clickedImageDiv.style.border = '2px solid #ff6742'; // 
			    otherImageDiv.style.border = 'none'; // 
			    if (clickedImageId == 'standard-image') {
			        document.getElementById('boxSize').value = 1; // 스탠다드 박스 선택
			        document.getElementById('price').value = 15000; // 스탠다드 박스의 가격
			    } else if (clickedImageId == 'jumbo-image') {
			        document.getElementById('boxSize').value = 2; // 점보 박스 선택
			        document.getElementById('price').value = 25000; // 점보 박스의 가격
			       
			    }
			}
			
			
			var standardImageDiv = document.getElementById('standard-image');
			standardImageDiv.addEventListener('click', function() {
			    toggleImageBorder('standard-image', 'jumbo-image');
			    
			});
			
			
			var jumboImageDiv = document.getElementById('jumbo-image');
			jumboImageDiv.addEventListener('click', function() {
			    toggleImageBorder('jumbo-image', 'standard-image');
			});
			</script>
			         
         <br>
         <div>
            <img src="resources/images/newbutton.svg" style="padding-left: 30px;">
            <span style="font-size:16px; font-weight: bold;">채소 품목 바꾸기</span>
         </div>
         <div style="font-size: 14px; padding-left: 30px;" >
            구출된 품목 중 원하는 구성으로 자유롭게 바꿀 수 있어요.
         </div>
         <br>
         <div>
          <img src="resources/images/newbutton.svg" style="padding-left: 30px;">
          <span style="font-size:16px; font-weight: bold;">레시피 페이퍼 제공</span>
       </div>
       

       <div style="font-size: 14px; padding-left: 30px;" >
        더 즐거운 채소 생활을 위해 레시피와 보관법을 함께 알려드려요.

       </div>
         
      

       <div style="padding-top: 50px; padding-left: 15px;">
        <button class="button is-rounded"  style="background-color: #ff6742; color: white; font-weight: bold;">02</button>
        <span style="font-size: 26px; font-weight: bold;">배송 주기 선택</span>
      </div>
      <br><br>
      <div>

        <div class="container">
          <div class="row justify-content-center">
              <div class="col-sm">
                  <button class="button is-outlined is-rounded is-large btn-light btn-lg btn-block" style="font-size: 18px; color: gray;" id="btn-1-week" >1주</button>
              </div>
              <div class="col-sm">
                  <button class="button is-outlined is-rounded is-large btn-light btn-lg btn-block"  style="font-size: 18px; color: gray;" id="btn-2-weeks">2주</button>
              </div>
              <div class="col-sm">
                  <button class="button is-outlined is-rounded is-large btn-light btn-lg btn-block" style="font-size: 18px; color: gray;"  id="btn-4-weeks">4주</button>
              </div>
          </div>
      </div>
      <div style="padding-left: 30px; padding-top: 15px; font-size: 14px;">
        <div><i class="fa-solid fa-lemon"></i>2주마다 받으시는걸 추천해요!</div>
        <div><i class="fa-solid fa-lemon"></i>언제든지 주기를 변경하실 수 있어요!</div>
     </div>
      </div>
      
      
      <script>
      
      function toggleBorder(buttonId) {
    	    const buttons = document.querySelectorAll('.button.is-outlined.is-rounded.is-large.btn-light.btn-lg.btn-block');
    	    
    	    buttons.forEach((button) => {
    	        if (button.id === buttonId) {
    	            button.style.border = '2px solid #ff6742'; // Add border to the clicked button
    	        } else {
    	            button.style.border = 'none'; // Remove border from other buttons
    	        }
    	    });
    	}

    	// Event listeners for each button
    	document.getElementById('btn-1-week').addEventListener('click', function () {
    	    toggleBorder('btn-1-week');
    	});

    	document.getElementById('btn-2-weeks').addEventListener('click', function () {
    	    toggleBorder('btn-2-weeks');
    	});

    	document.getElementById('btn-4-weeks').addEventListener('click', function () {
    	    toggleBorder('btn-4-weeks');
    	});
      
      </script>
      
      
<script>
    document.addEventListener('DOMContentLoaded', function () {
        const btn1Week = document.getElementById('btn-1-week');
        const btn2Weeks = document.getElementById('btn-2-weeks');
        const btn4Weeks = document.getElementById('btn-4-weeks');
        const cycleInput = document.getElementById('cycle');

        // 1주 클릭 시
        btn1Week.addEventListener('click', function () {
            cycleInput.value = 1;
            console.log(cycleInput.value);
        });

        // 2주 클릭 시
        btn2Weeks.addEventListener('click', function () {
            cycleInput.value = 2;
            console.log(cycleInput.value);
        });

        // 4주 클릭 시
        btn4Weeks.addEventListener('click', function () {
            cycleInput.value = 4;
            console.log(cycleInput.value);
        });
    });
</script>


      <div style="padding-top: 50px; padding-left: 15px;">
        <button class="button is-rounded "   style="background-color: #ff6742; color: white; font-weight: bold;">03</button>
        <span style="font-size: 26px; font-weight: bold;">비선호 품목 선택</span>
        
      
      </div>
      <div style="padding-top: 20px; padding-left: 20px; font-size: 15px; font-weight: 510; ">
        비선호 채소는 채소박스에서 미리 제외해드려요.
      </div>
      <div>
        <div style="text-align: center;">
          <img src="resources/images/exceptionvegi.svg" style="display: inline-block;">
        </div>
      </div>
      <br>
      <div>
        <button class="button is-outlined is-rounded is-large btn-light btn-lg btn-block js-modal-trigger" data-target="modal-js-example" style="font-size: 18px; color: gray;" >제외할 품목 선택하기</button>
      </div>

      <div style="padding-top: 50px; padding-left: 15px;">
        <button class="button is-rounded"  style="background-color: #ff6742; color: white; font-weight: bold;">04</button>
        <span style="font-size: 26px; font-weight: bold;">배송 정보 입력</span>
      </div>
      <div style="font-size: 14px; color: gray; padding-left: 20px; padding-top: 20px; text-align: center;">
      <div  style="padding-top: 10px; text-align: left; padding-left: 45px;">
        받는 사람
      </div>
      <div><input id="recipient2" class="input is-warning" type="text" placeholder="받는 사람" style="width: 80%; margin: 0 auto;"></div>
      <div style="padding-top: 10px; text-align: left; padding-left: 45px;">연락처</div>
      <div><input id="phone2" class="input is-warning" type="text" placeholder="연락처" style="width: 80%; margin: 0 auto;"></div>
      <div style="padding-top: 10px; text-align: left; padding-left: 45px;" >주소</div>
      <div>
      
      
		        <input type="text" name="sample6_postcode" id="sample6_postcode" class="input is-warning" type="text" placeholder="우편번호" style="width: 65%; margin: 0 auto;" disabled>
				<button class="button is-dark" onclick="sample6_execDaumPostcode()">검색</button><br>
				<input type="text" class="input is-warning" name="sample6_address" id="sample6_address" placeholder="주소" style="width: 80%; margin: 0 auto;" disabled><br>
				<input type="text" class="input is-warning" name="sample6_detailAddress" id="sample6_detailAddress" placeholder="상세주소" style="width: 80%; margin: 0 auto;">
				<input type="text"  class="input is-warning" name="sample6_extraAddress" id="sample6_extraAddress" placeholder="참고항목" style="width: 80%; margin: 0 auto;">
      
      
      <!--  
        <input id="sample6_address" class="input is-warning" type="text" placeholder="주소" style="width: 65%; margin: 0 auto;" disabled>
        <button class="button is-dark" onclick="sample6_execDaumPostcode()">검색</button>
        <input id="sample6_detailAddress" class="input is-warning" type="text" placeholder="상세주소" style="width: 80%; margin: 0 auto;">
        
        -->
      </div>
      <div style="padding-top: 10px; text-align: left; padding-left: 45px;">배송 옵션</div>
      <div><input class="input is-warning" type="text" placeholder="배송 옵션" style="width: 80%; margin: 0 auto;"></div>
      </div>

      <div style="padding-top: 50px; padding-left: 15px;">
        <a href="#" class="button is-rounded is-large is-fullwidth"  style="background-color: #ff6742; color: white; font-weight: bold; text-decoration: none;" onclick="postFormSubmit()">다음</a>
    </div>
<br><br><br><br>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("sample6_extraAddress").value = extraAddr;
                
                } else {
                    document.getElementById("sample6_extraAddress").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>





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


   

<div id="modal-js-example" class="modal">
  <div class="modal-background"></div>
  <div class="modal-card">
    <header class="modal-card-head" style="height: 60px;" >
      <p class="modal-card-title" style=" padding-top: 20px;"><i class="fa-solid fa-check"></i>&nbsp;제외할 품목 선택하기</p>
      <button class="delete" aria-label="close"></button>
    </header>
  <section class="modal-card-body">
  <table>
	<c:forEach var="vegetable" items="${list}" varStatus="loop">
	  <c:if test="${loop.index % 5 == 0}">
	    <tr>
	  </c:if>
	  <td>
	    <label class="checkbox">
	      <input type="checkbox" value="${vegetable.compName}" onclick="updateHateVegi()">
	      ${vegetable.compName}
	    </label>
	  </td>
	  <c:if test="${loop.index % 5 == 4 or loop.last}">
	    </tr>
	  </c:if>
	</c:forEach>
  </table>
</section>
    <footer class="modal-card-foot">
      <button class="button is-success">선택 완료</button>
      
    </footer>
  </div>
  
</div>

    </div>
   <jsp:include page="../common/footer.jsp"/> 
 
  <script>
    document.addEventListener('DOMContentLoaded', function () {
        const recipientInput = document.getElementById('recipient2');
        const phoneInput = document.getElementById('phone2');
        const addressInput = document.getElementById('sample6_address');
        const detailAddressInput = document.getElementById('sample6_detailAddress');
        const recipientHiddenInput = document.getElementById('recipient');
        const phoneHiddenInput = document.getElementById('phone');
        const addressHiddenInput = document.getElementById('address');
        const detailAddressHiddenInput = document.getElementById('detailAddress');

        // recipient2 입력값이 변경될 때 이벤트 핸들러 추가
        recipientInput.addEventListener('input', function () {
            recipientHiddenInput.value = recipientInput.value;
        });

        // phone2 입력값이 변경될 때 이벤트 핸들러 추가
        phoneInput.addEventListener('input', function () {
            phoneHiddenInput.value = phoneInput.value;
        });

        // sample6_address 입력값이 변경될 때 이벤트 핸들러 추가
        addressInput.addEventListener('input', function () {
            addressHiddenInput.value = addressInput.value;
            
        });

        // sample6_detailAddress 입력값이 변경될 때 이벤트 핸들러 추가
        detailAddressInput.addEventListener('input', function () {
            detailAddressHiddenInput.value = detailAddressInput.value;
        });
    });
</script>
   
   
   
    
    
    <script>
    function updateHateVegi() {
        const checkboxes = document.querySelectorAll('input[type="checkbox"]');
        const selectedVegetables = [];

        checkboxes.forEach((checkbox) => {
            if (checkbox.checked) {
                selectedVegetables.push(checkbox.value);
            }
        });

        const hateVegiInput = document.getElementById('hateVegi');
        hateVegiInput.value = selectedVegetables.join(',');
      
        
        
    }
    </script>
   
</body>
</html>