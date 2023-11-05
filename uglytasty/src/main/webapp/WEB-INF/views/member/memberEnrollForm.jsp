<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<!-- jQuery 라이브러리 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<!-- 부트스트랩에서 제공하고 있는 스타일 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- 공통 폰트 -->
    <link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/static/pretendard.css" />

    <style>



        /* ===== 세부페이지마다 공통적으로 유지할 style ===== */
        * {
            box-sizing:border-box;
            font-family: 'Pretendard';
        }

        .YRcontent {
            width:1400px;
            margin:auto;
        }
        
        .YRinnercontent { /* 공통 큰 메뉴 content 영역 - 회원가입 영역 */
            /* 테두리는 나중에 보고 없앨지 말지 선택 */
            border: 3px solid lightgray;
            border-radius: 10px;
            width:80%;
            margin:auto;
            padding:5% 10%;
            background-color:white;
            display: block;
        }

        .YRinnercontent table{ /* 공통 큰 메뉴 content 영역 테이블 */
            margin: auto;
            width: 70%;
        }

        .YRinnercontent h2{ /* 공통 큰 메뉴 content 영역 제목 */
            text-align: center;
            font-weight: 700;
            color: rgb(58, 58, 58);
        }

        /* input type=text 공용 스타일 */
        .input-text-style{
            width: 100%;
            border-style: solid;
            border-radius: 10px;
            height: 58px;
            /* margin-top: 20px; -> label에 대신 margin-top 줬음*/
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
            margin-top: 20px; /* 약관 칸 때문에 이번만 넣음*/
        }

        /* --------------------------------sns 간편 가입----------------------------------- */
        .input_label_msg{
            font-size: 0.875rem;
        }

        .sns-enroll-link{ /* sns 링크 div 공통 속성 */
            border-radius: 10px;
            text-align: center;
            line-height: 70px;
        }

        .sns-enroll-link a{ /* sns 링크들 공통 속성 */
            display: block;
            text-decoration: none;
        }

        /* sns로 회원가입 */
        #sns_enroll_all{
            margin: auto;
            width: 60%;
            text-align: center;
            padding: 30px;
            /* border: 1px solid; */
        }

        #sns_enroll_all>div{
            display: inline-block;
            width: 70px;
            height: 70px;
            box-shadow: 1px 1px 1px 1px rgb(229, 231, 235);
            margin-right: 5px;
        }

        #sns_enroll_google{
            border-radius: 10px;
            background-color: white;
        }
        #sns_enroll_google img{width: 35px; height: 35px;}
        
        #sns_enroll_naver{
            border-radius: 10px;
            background-color: #03c75a;
        }
        #sns_enroll_naver img{
            width: 60px;
            height: 60px;
            margin: 5px;
        }

        #sns_enroll_kakao{
            border-radius: 10px;
            background-color: rgb(246,226,75);
        }
        /* --------------------------------정보 작성 부분------------------------------- */
        .enrollform_input_label{
            margin-top: 20px;
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

	<div class="YRcontent">
        <br><br>

        <div class="YRinnercontent">

            <br>
            <h2>회원가입</h2>
            <br><br>

            <div id="sns_enroll_all">
                <p>SNS 간편 가입</p>

                <div id="sns_enroll_google" class="sns-enroll-link">
                    <a href="https://accounts.google.com/o/oauth2/v2/auth?scope=https://www.googleapis.com/auth/userinfo.profile&response_type=code&redirect_uri=http://localhost:8008/uglytasty/oauth2&client_id=1043154405366-qnhdnm1nk8h9oka0up0crde72jfffvtq.apps.googleusercontent.com">
                        <img src="https://owzl.github.io/btn_google.svg">
                    </a>
                </div>    

                <div id="sns_enroll_naver" class="sns-enroll-link">
                    <a href="javascript:void(0);" onclick="loginWithNaver()">
                        <img src="http://owzl.github.io/enroll-btn-naver.png">
                    </a>
                </div>

                <div id="sns_enroll_kakao" class="sns-enroll-link">
                    <a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=e1fdaf851d387ba402c8d1d3a1f2b21d&redirect_uri=http://localhost:8008/uglytasty/oauth2/kakao">
                        <img src="https://d3cpiew7rze14b.cloudfront.net/assets/app/kakao_icon.svg" style="width: 30px;">
                    </a>
                </div>
            </div>
		<script>
				function loginWithNaver() {
				   
				    $.ajax({
				        type: "GET",
				        url: "generateState.me",
				        success: function(state) {
				           
				            var clientId = "qx5GJFsGBjihBcvVb7EK";
				            var redirectUri = "http://localhost:8008/uglytasty/oauth2/naver"; 
				
				           
				            var naverLoginUrl = "https://nid.naver.com/oauth2.0/authorize"
				                + "?client_id=" + clientId
				                + "&response_type=code"
				                + "&redirect_uri=" + redirectUri
				                + "&state=" + state;
				
				            
				            window.location.href = naverLoginUrl;
				        }
				    });
				}
		</script>
            <br>
            <hr>
            <br>

            <form action="/uglytasty/insert.me" method="post" id="enrollForm">

                <!-- id, name 설정 까먹지말기!!! -->
                <table>
                    <tr>
					    <td>
					        <tr>
							    <td>
							        <c:choose>
							            <c:when test="${empty userPwd and empty userId}">
							                <div class="enrollform_input_label d-flex mb-1">
							                    <div class="mr-auto">아이디</div>
							                    <div id="idCheckmsg" class="input_label_msg">
							                        <!-- 
							                        <img src="https://d3cpiew7rze14b.cloudfront.net/assets/mypage/Creator/Frame_4747__1__8eHPfbDeF.svg" alt="">
							                        <span>아이디 형식이 올바르지 않습니다.</span>
							                        -->
							                    </div>
							                </div>
							                <input type="text" class="input-text-style" id="userId" name="userId" placeholder="아이디를 입력해주세요" required>
							            </c:when>
							            <c:otherwise>
							                <input type="hidden" id="userId" name="userId" value="${userId}">
							            </c:otherwise>
							        </c:choose>
							    </td>
							</tr>
							<tr>
							    <td>
							        <c:choose>
							            <c:when test="${empty userPwd and empty userId}">
							                <div class="enrollform_input_label d-flex mb-1">
							                    <div class="mr-auto">비밀번호</div>
							                    <div id="pwdCheckmsg" class="input_label_msg">
							                        <!-- <img src="https://d3cpiew7rze14b.cloudfront.net/assets/mypage/Creator/Frame_4747__1__8eHPfbDeF.svg" alt=""> -->
							                        <!-- <span>비밀번호를 6자리 이상 입력해주세요.</span> -->
							                    </div>
							                </div>
							                <input type="password" class="input-text-style" id="userPwd" name="userPwd" placeholder="비밀번호를 입력해주세요" required>
							            </c:when>
							            <c:otherwise>
							                <input type="hidden" id="userPwd" name="userPwd" value="${userPwd}">
							            </c:otherwise>
							        </c:choose>
							    </td>
							</tr>

                    <tr>
                        <td>
							<c:choose>
							    <c:when test="${empty userName}">
							        <div class="enrollform_input_label d-flex mb-1">
							            <div class="mr-auto">이름</div>
							            <div  id="nameCheckmsg" class="input_label_msg">
							                <!-- <img src="https://d3cpiew7rze14b.cloudfront.net/assets/mypage/Creator/Frame_4747__1__8eHPfbDeF.svg" alt=""> -->
							                <!-- <span>이름은 2자 이상 입력해주세요.</span> -->
							            </div>
							        </div>
							        <input type="text" class="input-text-style" id="userName" name="userName" placeholder="이름을 입력해주세요" required>
							    </c:when>
							    <c:otherwise>
							        <input type="hidden" id="userName" name="userName" value="${userName}">
							    </c:otherwise>
							</c:choose>
                        </td>
                    </tr>

                    <tr>
                        <td>
                          <c:choose>
						    <c:when test="${empty email}">
						        <div class="enrollform_input_label d-flex mb-1">
						            <div class="mr-auto">이메일</div>
						            <div id="emailCheckmsg" class="input_label_msg">
						                <!-- <img src="https://d3cpiew7rze14b.cloudfront.net/assets/mypage/Creator/Frame_4747__1__8eHPfbDeF.svg" alt=""> -->
						                <!-- <span>이메일 형식이 올바르지 않습니다.</span> -->
						            </div>
						        </div>
						        <div class="d-flex" style="margin-bottom: 10px;">
						            <div class="flex-fill" style="width: 80%; margin-right: 2%;">
						                <input type="email" class="input-text-style" id="email" name="email" placeholder="이메일 주소를 입력해주세요" required>
						            </div>
						            
						            <div class="flex-fill">
						                <input type="button" class="search_confirm_btn" id="mail-Check-btn" value="인증하기">
						            </div>
						        </div>
						        <div class="d-flex" >
						        	<div class="flex-fill">
						                <input type="text" class="input-text-style" id="certification" placeholder="인증번호를 입력해주세요">
						            </div>
						        </div>
						        
						    </c:when>
						    <c:otherwise>
						        <input type="hidden" id="email" name="email" value="${email}">
						    </c:otherwise>
						</c:choose>
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
                            <input type="text" class="input-text-style" id="phone" name="phone" placeholder="휴대폰 번호를 입력해주세요" required
							    <c:if test="${not empty phone}">
							        value="${phone}" readonly
							    </c:if>
							>
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
                                    <input type="text" class="address_base" id="addressBase" name="addressBase" placeholder="기본 주소를 입력해주세요" readonly required>
                                </div>
                                <div class="flex-fill">
                                    <!-- 주소 검색 버튼 -->
                                    <input type="button" class="search_confirm_btn" onclick="sample6_execDaumPostcode()" value="검색">
                                </div>  
                            </div>

                            <!-- 상세 주소 -->
                            <input type="text" class="address_detail input-text-style" id="addressDetail" name="addressDetail" placeholder="상세 주소를 입력해주세요" style="margin-bottom: 50px;" required>
                            <input type="hidden" id="sample6_postcode" value="우편번호">
                            <input type="hidden" id="sample6_extraAddress" value="참고항목">

                        </td>
                    </tr>


                    <!-- 약관 동의 파트 -->
                    <tr>
                        <td>
                            <div class="checkbox_group">
                                <div class="member-enroll-terms">
                                    <input type="checkbox" id="check_all">
                                    <label for="check_all"><b>전체 동의</b></label>
                                </div>
                                <div class="member-enroll-terms">
                                    <input type="checkbox" id="check_1" class="normal">    
                                    <label for="check_1">[필수] 서비스 이용 약관 동의</label>
                                    <span>
                                        <a href="https://fantastic-interest-ad9.notion.site/b411aeb9565e40099503c3b8e9cd33a4" target="_blank" style="float: right;">
                                            <img src="https://d3cpiew7rze14b.cloudfront.net/assets/login/Vector_5__2__VJAtYkNSt.svg">
                                        </a>
                                    </span>
                                </div>
                                <div class="member-enroll-terms">
                                    <input type="checkbox" id="check_2" class="normal">
                                    <label for="check_2">[필수] 개인정보 수집 및 이용에 동의</label>
                                    <span>
                                        <a href="https://fantastic-interest-ad9.notion.site/1f2cdaba7c014ee8b53e76bb1d1e31cb" target="_blank" style="float: right;">
                                            <img src="https://d3cpiew7rze14b.cloudfront.net/assets/login/Vector_5__2__VJAtYkNSt.svg">
                                        </a>
                                    </span>
                                </div>
                                <div class="member-enroll-terms">
                                    <input type="checkbox" id="check_3" class="normal">
                                    <label for="check_3">[선택] 긴급할인 등 정보·혜택 수신 동의</label>
                                </div>
                            </div>
                        </td>
                    </tr>

                    <tr>
                        <td>
                            <button type="submit" id="enroll_mem_btn" class="submit-btn" disabled="disabled">회원가입</button>
                        </td>
                    </tr>


                </table>

            </form>

        </div>


    </div>
    

	<script>
	
			// 이메일 인증 관련
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
		    const $enrollButton = $("#enroll_mem_btn");
		
		    $certificationInput.on("input", function() {
		      
		        if ($certificationInput.val() === code) {
		          
		            $enrollButton.prop("disabled", false);
		        } else {
		           
		            $enrollButton.prop("disabled", true);
		        }
		    });
		});
	
	
	</script>

	<script>
	$(document).ready(function() {
	    // 이메일 필드에 대한 값을 가져옵니다.
	    const emailValue = '${email}';
	
	    // 회원가입 버튼을 가져옵니다.
	    const $enrollButton = $("#enroll_mem_btn");
	
	    // 이메일 값이 null이 아닌 경우, 회원가입 버튼을 활성화합니다.
	    if (emailValue !== 'null') {
	        $enrollButton.prop("disabled", false);
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
    		
    		// input 요소에 id를 주고 그 아이디를 "#~" 이렇게 적으면 간단하지만 아래는 일부러 좀 복잡하게
    		const $idInput = $("#enrollForm input[name=userId]");
    		
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
								$("#enrollForm :submit").attr("disabled", true);
								
							}else{ // 사용 가능
								$("#idCheckmsg").show();
								$("#idCheckmsg").css("color","#03c75a").text("😉 멋진 아이디네요!");
								
								// 버튼 disabled 속성 지우기 => 버튼 활성화
								$("#enrollForm :submit").attr("disabled", false);
							}
							
						}, error:function(){
							console.log("아이디 중복체크용 ajax 통신 실패");							
						}
    				})
    				
    			}else{ // 5글자 미만일 경우 => 버튼 비활성화, 메시지 숨기기
    				// .hide() : div를 숨기는 함수
    				$("#idCheckmsg").hide();
    				// type:을 생략 가능 //submit type의 속성attr "disabled"를 true로 변경 
    				$("#enrollForm :submit").attr("disabled", true);
    				
    			}
    		})
    	})
    	
    	
       	// 약관 동의 체크 박스 관련
   	 	// 체크박스 전체 선택
   	    $(".checkbox_group").on("click", "#check_all", function () {
   	        $(this).parents(".checkbox_group").find('input').prop("checked", $(this).is(":checked"));
   	    });
   	
   	    // 체크박스 개별 선택
   	    $(".checkbox_group").on("click", ".normal", function() {
   	        var is_checked = true;
   	
   	        $(".checkbox_group .normal").each(function(){
   	            is_checked = is_checked && $(this).is(":checked");
   	        });
   	
   	        $("#check_all").prop("checked", is_checked);
   	    });
   	    
   	    
	   	
   		
   		
        
    </script>


</body>

</body>
</html>