<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>못난이맛난이 마이페이지</title>

	<style>

        * { /* 헤더에 포함하기 */
            box-sizing:border-box;
            font-family: 'Pretendard';
        }

        .YRcontent {
            width:1400px;
            margin:auto;
        }
        
        .YRinnercontent { /* 공통 큰 메뉴 content 영역 - 레시피 영역 */
            /*border: 3px solid lightgray;*/
            border-radius: 10px;
            width:85%;
            margin:auto;
            background-color:white;
        }

        /* .YRinnercontent table{
            margin: auto;
            width: 60%;
        } */

        /* .YRinnercontent h2{
            text-align: center;
            font-weight: 700;
            color: rgb(58, 58, 58);
        } */

        /* input type=text 공용 스타일 */
        .input-text-style{
            width: 100%;
            border-style: solid;
            border-radius: 10px;
            height: 58px;
            margin-bottom: 20px;
            border-color: rgb(229, 231, 235);
            border-width: 1px;
            padding-left: 14px;
            padding-right: 14px;
        }
        .input-text-style::placeholder{ /* place holder 글자색 */
            color:#a0aec0;
        }
        .input-text-style:focus{ /* 텍스트박스 클릭했을 때 */
            background-color: rgb(255, 246, 238);
            border-color: rgb(229, 231, 235);
            outline: none;
        }

        /* 주황 submit 버튼 공통 스타일 */
        /* 로그인 버튼 스타일 */
        .submit-btn{
            color: white;
            font-weight: 700;
            font-size: 18px;
            line-height: 1;
            margin-bottom: 20px;
            background-color: #FF6741;
            border-radius: 10px;
            width: 100%;
            height: 56px;
            border: 0;
        }

        /* -------------------------------마이페이지------------------------------------ */
        #mypage-all{ /* 마이페이지 전체 덩어리 */
            width: 90%;
            margin: auto;
        }
        #mypage-member{ /* 마이페이지 전체 덩어리 */
            width: 90%;
            margin: auto;
        }
        /* ---------------------------마이페이지 - 회원 환영 메시지------------------------------ */
        #mypage-member{
            /* border: 3px solid #FF6741; */
            border-radius: 10px;
            margin-bottom: 20px;
            background: rgb(255, 246, 238);
        }
        #mypage-member p{
            font-size: 22px;
            margin: 20px;
            vertical-align: middle;
            text-align: center;
        }
        #mypage_member_name{
            font-size: 24px;
            color: #FF6741;
        }

        /* ---------------------------마이페이지 - list------------------------------ */

        .mypage_menu_list{  /* 마이페이지 menu_list */
            margin-top: 120px;
            margin-bottom: 10px;
            height: 700px;
            /* border: 1px solid; */
        }
        
        .mypage_menu_list a{
            text-decoration: none;
            color: rgb(58, 58, 58);
            display: block;
            width: 100%;
            font-weight: 700;
            font-size: 18px;
        }

        /* ---------------------------마이페이지 - content------------------------------ */
        .mypage_content{ /* 마이페이지 content */
            margin: auto;
            margin-top: 60px;
            margin-bottom: 60px;
        }
        
        .mypage_content h3{
            font-size: 30px;
            font-weight: 700;
            text-align: center;
        }
        
        /* --------------------------------정보 작성 부분------------------------------- */
        .enrollform_input_label{
            /*margin-top: 20px;*/
        }
        .input_label_msg span{ /* 유효성 검사 문구*/
            align-items: center;
            justify-content: center;
            color: #F14C4C;
            vertical-align: middle;
        }
        
        .address_base{ /*기본 주소*/
            width: 98%;
            margin-right: 2%;
            border-style: solid;
            border-radius: 10px;
            height: 58px;
            border-color: rgb(229, 231, 235);
            border-width: 1px;
            padding-left: 14px;
            padding-right: 14px;
        }
        .address_base::placeholder{color: #a0aec0;}
        .search_confirm_btn{ /* 주소 찾기, 인증 버튼 */
            color: white;
            font-weight: 700;
            font-size: 16px;
            background-color: rgb(81, 81, 81);
            border-radius: 10px;
            width: 100%;
            height: 58px;
            border: 0;
        }
        
        /* -------------------------------약관 동의------------------------------------ */

        /* label{margin-bottom: 0; margin-top: 20px;} */

        /* 기본 체크박스 감추기 */
        input[type=checkbox] {
            display:none;
        }
        /* 체크박스 이미지 설정 */
        input[type=checkbox] + label { 
            cursor: pointer; 
            padding-left: 40px; 
            background-repeat: no-repeat;
            background-image: url('https://d3cpiew7rze14b.cloudfront.net/assets/login/Group_4383__2__X6V1UNE92.svg" class="nonchecked-checkbox');
        }
        /* 체크되었을 때와 체크 안 되었을 때 이미지 변경 */
        input[type=checkbox]:checked + label {
            background-image: url('https://d3cpiew7rze14b.cloudfront.net/assets/login/Group_4383__1__bPxCkz28-.svg');
        }
        input[type=checkbox]:not(:checked) + label {
            background-image: url('https://d3cpiew7rze14b.cloudfront.net/assets/login/Group_4383__2__X6V1UNE92.svg');
        }

        .member-enroll-terms{margin-bottom: 5px;}
        .member-enroll-terms img{cursor: pointer;}
        .member-enroll-terms span{padding-left: 10px;}

    </style>


</head>
	<jsp:include page="../common/header.jsp"/>
<body>


	<div class="YRContent">
        <br><br>

        <div class="YRinnercontent">
            <br><br>

            <div id="mypage-member" class= "row">
                <div class="col-sm-12">
                    <p><b id="mypage_member_name">${ loginMember.userName }</b> 고객님 안녕하세요!</p>
                </div>
            </div>
            
            <br>
            
            <div id="mypage-all" class="row">
                
                <div class="col-sm-3">

                    
                    <jsp:include page="myPageList.jsp"/>


                </div>

                <div class="col-sm-9">
                    <!-- 페이지 -->
                    
                    <div class="mypage_content">

                        <h3>회원정보 수정</h3>
                        <br><br>

                        <form action="update.me" method="post" id="updateForm">

                            <!-- id, name 설정 까먹지말기!!! -->
                            <table style="width: 80%; margin:auto;">
	                            <tr>
			                        <td>
			                            <!-- name값을 필드부의 변수명과 완벽히 일치하게 적어줘야 함*** -->
			                            <div class="enrollform_input_label d-flex mb-1">
			                                <div class="mr-auto">아이디</div>
			                                <div id="idCheckmsg" class="input_label_msg">
			                                    <!-- 
			                                    <img src="https://d3cpiew7rze14b.cloudfront.net/assets/mypage/Creator/Frame_4747__1__8eHPfbDeF.svg" alt="">
			                                    <span>아이디 형식이 올바르지 않습니다.</span>
			                                     -->
			                                </div>
			                            </div>
			                            <input type="text" class="input-text-style" id="userId" name="userId" value="${ loginMember.userId }" placeholder="아이디를 입력해주세요" readonly>
			                        </td>
			                    </tr>
			
			                    <tr>
			                        <td>
			                            <div class="enrollform_input_label d-flex mb-1">
			                                <div class="mr-auto">이름</div>
			                                <div  id="nameCheckmsg" class="input_label_msg">
			                                    <!-- <img src="https://d3cpiew7rze14b.cloudfront.net/assets/mypage/Creator/Frame_4747__1__8eHPfbDeF.svg" alt=""> -->
			                                    <!-- <span>이름은 2자 이상 입력해주세요.</span> -->
			                                </div>
			                            </div>
			                            <input type="text" class="input-text-style" id="userName" name="userName" value="${ loginMember.userName }" placeholder="이름를 입력해주세요" required>
			                        </td>
			                    </tr>
			
			                    <tr>
			                        <td>
			                            <div class="enrollform_input_label d-flex mb-1">
			                                <div class="mr-auto">이메일</div>
			                                <div id="emailCheckmsg" class="input_label_msg">
			                                    <!-- <img src="https://d3cpiew7rze14b.cloudfront.net/assets/mypage/Creator/Frame_4747__1__8eHPfbDeF.svg" alt=""> -->
			                                    <!-- <span>이메일 형식이 올바르지 않습니다.</span> -->
			                                </div>
			                            </div>
			                            <div class="d-flex" style="margin-bottom: 10px;">
			                                <div class="flex-fill" style=" width: 80%; margin-right: 2%;">
			                                    <input type="email" class="input-text-style" id="email" name="email" value="${ loginMember.email }" style="margin-bottom:0px;" placeholder="이메일 주소를 입력해주세요" required>
			                                </div>
			                                <div class="flex-fill">
			                                    <input type="button" class="search_confirm_btn" id="mail-Check-btn" value="인증하기">
			                                </div>
			                            </div>
			                            <div>
								        	<div class="flex-fill">
								                <input type="text" class="input-text-style" id="certification" placeholder="인증 번호를 입력해주세요">
								            </div>
								        </div>
			                        </td>
			                    </tr>
			
			                    <tr>
			                        <td>
			                            <div class="enrollform_input_label d-flex mb-1">
			                                <div class="mr-auto">휴대폰 번호</div>
			                                <div id="phoneCheckmsg" class="input_label_msg">
			                                    <!-- <img src="https://d3cpiew7rze14b.cloudfront.net/assets/mypage/Creator/Frame_4747__1__8eHPfbDeF.svg" alt=""> -->
			                                    <!-- <span>휴대폰 번호 형식이 올바르지 않습니다.</span> -->
			                                </div>
			                            </div>
			                            <input type="text" class="input-text-style" id="phone" name="phone" value="${ loginMember.phone }" placeholder="휴대폰 번호를 입력해주세요" required>
			                        </td>
			                    </tr>
			
			                    <tr>
			                        <td>
			                            <div class="enrollform_input_label d-flex mb-1">
			                                <div class="mr-auto">주소</div>
			                                <div class="input_label_msg"></div>
			                            </div>
			                            <div class="d-flex" style="margin-bottom: 10px;">
			                                <!-- 기본주소 -->
			                                <div class="flex-fill" style=" width: 80%;">
			                                    <input type="text" class="address_base" id="addressBase" name="addressBase" value="${ loginMember.addressBase }" placeholder="기본 주소를 입력해주세요" readonly required>
			                                </div>
			                                <div class="flex-fill">
			                                    <!-- 주소 검색 버튼 -->
			                                    <input type="button" class="search_confirm_btn" onclick="sample6_execDaumPostcode()" value="검색">
			                                </div>  
			                            </div>
			
			                            <!-- 상세 주소 -->
			                            <input type="text" class="address_detail input-text-style" id="addressDetail" name="addressDetail" value="${ loginMember.addressDetail }"  placeholder="상세 주소를 입력해주세요" style="margin-bottom: 50px;" required>
			                            <input type="hidden" id="sample6_postcode" value="우편번호">
			                            <input type="hidden" id="sample6_extraAddress" value="참고항목">
			
			                        </td>
			                    </tr>
			                    
			                    <tr>
			                        <td>
	                                    <button type="submit" id="update_mem_btn" class="submit-btn" disabled>수정하기</button>
	                                    <a href="deleteForm.me" style="color: rgb(58, 58, 58); display:block; text-align: center;">
	                                        회원 탈퇴를 원하세요?
	                                    </a>
	                                </td>
			                    </tr>

                                
                            </table>
            
            
                        </form>
                        
                    </div>

                </div>

            </div>
            
            
            <br>
        </div>

        
    </div>
    
    	<script>

			
			
			$('#mail-Check-btn').click(function(){
				const email = $('#email').val();
				const checkInput =$('#certification');
				
				$.ajax({
					type:'post',
					url : '<c:url value ="/mailCheck?email="/>'+email,
					success : function (data) {
						console.log("data : " +  data);-
						checkInput.attr('disabled',false);
						code =data;
						alert('인증번호가 전송되었습니다.')
					}		
				})
			})
			
		
			$(document).ready(function() {
		   
		    const $certificationInput = $("#certification");
		    const $updateButton = $("#update_mem_btn");
		
		    $certificationInput.on("input", function() {
		      
		        if ($certificationInput.val() === code) {
		          
		            $updateButton.prop("disabled", false);
		        } else {
		           
		            $updateButton.prop("disabled", true);
		        }
		    });
		});
			
			
			</script>
		
		<script>
		$(document).ready(function() {
		    // 이메일 필드에 대한 값을 가져옵니다.
		    const emailValue = '${email}';
		
		    // 회원가입 버튼을 가져옵니다.
		    const $updateButton = $("#update_mem_btn");
		
		    // 이메일 값이 null이 아닌 경우, 회원가입 버튼을 활성화합니다.
		    if (!emailValue || emailValue.trim() === '') {
		        $updateButton.prop("disabled", true);
		    } else {
		        $updateButton.prop("disabled", false);
		    }
		});
		</script>
    
    <!-- 카카오 주소 조회 API -->
    <!--
    <input type="text" id="sample6_postcode" placeholder="우편번호">
    <input type="button" onclick="sample6_execDaumPostcode()" value="우편번호 찾기"><br>
    <input type="text" id="address_base" id="sample6_address" placeholder="주소"><br>
    <input type="text" id="address_detail" id="sample6_detailAddress" placeholder="상세주소">
    <input type="text" id="sample6_extraAddress" placeholder="참고항목">
    -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
    	// 카카오 주소 조회 API
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
                    document.getElementById("addressBase").value = addr;
                    document.getElementById("addressBase").value += extraAddr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("addressDetail").focus();
                }
            }).open();
        }
    	
    	
        $(document).ready(function() {
            $('#idCheckmsg').hide();
        });
    	
        
    	// 아이디 중복 체크(ajax)
        $(function(){
    		// 아이디를 입력하는 input 요소객체를 변수에 먼저 담아두기
    		
    		const $idInput = $("#updateForm input[name=userId]");
    		
    		$idInput.keyup(function(){
    			//console.log($idInput.val());
    			
    			// 우선 최소 5글자 이상으로 입력되어 있을 때만 ajax 요청해서 중복체크 하도록
    			if($idInput.val().length >= 5){
    				
    				$.ajax({
						url:"idCheck.me",
						data:{checkId : $idInput.val()},
						success:function(result){
							
							if(result == "NNNNN"){ // 사용 불가능
								// => 빨간색 메세지 (사용불가능) 출력
								$("#idCheckmsg").show();
								$("#idCheckmsg").css("color","#F14C4C").html('<img src="https://d3cpiew7rze14b.cloudfront.net/assets/mypage/Creator/Frame_4747__1__8eHPfbDeF.svg" alt=""> <span>중복된 아이디가 존재합니다. 다시 입력해주세요.</span>');
								
								// => 버튼 비활성
								$("#updateForm :submit").attr("disabled", true);
								
							}else{ // 사용 가능
								$("#idCheckmsg").show();
								$("#idCheckmsg").css("color","#03c75a").text("😉 멋진 아이디네요!");
								
								// 버튼 disabled 속성 지우기 => 버튼 활성화
								$("#updateForm :submit").attr("disabled", false);
							}
							
						}, error:function(){
							console.log("아이디 중복체크용 ajax 통신 실패");							
						}
    				})
    				
    			}else{ // 5글자 미만일 경우 => 버튼 비활성화, 메시지 숨기기
    				// .hide() : div를 숨기는 함수
    				$("#idCheckmsg").hide();
    				// type:을 생략 가능 //submit type의 속성attr "disabled"를 true로 변경 
    				$("#updateForm :submit").attr("disabled", true);
    				
    			}
    		})
    	})
    	
    	// 제약 조건

	</script>

</body>
</html>