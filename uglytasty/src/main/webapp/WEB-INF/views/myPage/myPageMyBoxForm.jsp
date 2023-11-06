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
            /* margin-bottom: 20px; */
            border-color: rgb(229, 231, 235);
            border-width: 1px;
            padding-left: 14px;
            padding-right: 14px;
        }
        .input-text-style::placeholder{ /* place holder 글자색 */
            color:#a0aec0;
        }
        .input-text-style:focus{ /* 텍스트박스 클릭했을 때 */
            /* background-color: rgb(255, 246, 238); 비선호 품목 출력란이라 스타일 삭제*/
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
            /* margin-bottom: 20px; */
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
        
        /* 구독 안 한 경우일 때 */
        /* 구독 안 한 회원 */
        #subscribe_x_img{
            margin:auto;
        }
        #subscribe_x_img img{
            width: 80%;
            margin-left: 10%;
            margin-right: 10%;
            margin-top: 50px;
        }
        #subscribe_x_img button{
            width: 80%;
            margin-left: 10%;
            margin-right: 10%;
            margin-top: 50px;
        }
        
        
        

        /* --------------------------------정보 작성 부분(박스 관리용으로 수정)------------------------------- */
        /* #mybox-wrap{
            border: 3px solid lightgray;
            border-radius: 10px;
            padding-top: 10px;
            padding-bottom: 50px;
            background-color: rgb(255, 246, 238);
        } */
        
        #mybox-table{
            width: 80%;
            margin:auto;
        }
        
        .mybox-option{ /* 설정 옵션들 제목*/
            font-size: 17px;
            font-weight: 600;
            color: rgb(58, 58, 58);
        }

        /* 비선호 품목 선택 버튼 */
        #dislike-btn{
            width: 100%;
            margin: auto;
            height: 47px;
        	background-color: rgb(240, 240, 240);
            border: none;
        	color: rgb(87, 87, 87);
        	font-weight: 700;
        	border-radius: 10px;
        	font-size: 17px;
            transition: 0.3s;
            margin-top: 10px;
            margin-bottom: 10px;
        }
        #dislike-btn:hover{
            background-color: rgb(233, 233, 233);
        }
        /* 비선호 품목 목록 */
        #dislike-wrap p{margin-bottom: 0px;}
        #dislike-list{margin-top: 5px;}

        
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
        
        /* -------------------------------박스 종류, 배송 주기, 비선호 품목 radio, checkbox 이미지화------------------------------------ */

        /* label{margin-bottom: 0; margin-top: 20px;} */

        /* 기본 radio 감추기 */
        input[type=radio] {
            display:none;
        }
        /* radio 이미지 설정 */
        input[type=radio] + label { 
            cursor: pointer; 
            padding-left: 40px; 
            background-repeat: no-repeat;
            background-image: url('https://d3cpiew7rze14b.cloudfront.net/assets/login/Group_4383__2__X6V1UNE92.svg" class="nonchecked-checkbox');
        }
        /* 체크되었을 때와 체크 안 되었을 때 이미지 변경 */
        input[type=radio]:checked + label {
            background-image: url('https://d3cpiew7rze14b.cloudfront.net/assets/login/Group_4383__1__bPxCkz28-.svg');
        }
        input[type=radio]:not(:checked) + label {
            background-image: url('https://d3cpiew7rze14b.cloudfront.net/assets/login/Group_4383__2__X6V1UNE92.svg');
        }

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
                    
                    
                    			<h3>나의 못난이 박스</h3>
		                        <br><br>
		
		                        <div id="mybox-wrap">
		                            <form action="myPageMyBoxUpdate.su" method="post" id="myBoxUpdateForm">
		                            
		                            	<input type="hidden" name="userId" value="${ loginMember.userId }">
		                            
		                                <table id="mybox-table">
		                                    <tr>
		                                        <td>
		                                            <!-- name값을 필드부의 변수명과 완벽히 일치하게 적어줘야 함*** -->
		                                            <div class="enrollform_input_label d-flex mb-1">
		                                                <div class="mybox-option mr-auto">박스 크기</div>
		                                            </div>
		                                            
		                                            <div class="d-flex">
		                                                <div class="p-2 flex-fill">
		                                                    <input type="radio" id="standard-box" name="boxSize" value="1">
		                                                    <label for="standard-box">스탠다드 박스</label>
		                                                </div>
		                                                <div class="p-2 flex-fill">
		                                                    <input type="radio" id="jumbo-box" name="boxSize" value="2">
		                                                    <label for="jumbo-box">점보 박스</label>
		                                                </div>
		                                                <!-- <input type="text" id="boxSize_value" value="${ loginMemSubscribInfo.boxSize }"> -->
		                                            </div> 
		                                            
		                                            <script>
		                                            
													    // loginMemSubscribInfo.boxSize에 "1" 또는 "2" 값이 들어 있다고 가정합니다.
													    var boxSizeValue = "${ loginMemSubscribInfo.boxSize }";
													
													    if (boxSizeValue === "1") {
													        document.getElementById("standard-box").checked = true;
													    } else if (boxSizeValue === "2") {
													        document.getElementById("jumbo-box").checked = true;
													    }
													</script>
		
		
		                                            <div style="height: 30px;">
		                                                <!-- 간격 div -->
		                                            </div>
		                                        </td>
		                                    </tr>
		                
		                                    <tr>
		                                        <td>
		                                            <div class="enrollform_input_label d-flex mb-1">
		                                                <div class="mybox-option mr-auto">배송 주기</div>
		                                            </div>
		                                            
		                                            <div class="d-flex">
		                                                <div class="p-2 flex-fill">
		                                                    <input type="radio" id="1week" name="term" value="1">
		                                                    <label for="1week">1주</label>
		                                                </div>
		                                                <div class="p-2 flex-fill">
		                                                    <input type="radio" id="2week" name="term" value="2">
		                                                    <label for="2week">2주</label>
		                                                </div>
		                                                <div class="p-2 flex-fill">
		                                                    <input type="radio" id="4week" name="term" value="4">
		                                                    <label for="4week">4주</label>
		                                                </div>
		                                                <!-- <input type="text" value="${ loginMemSubscribInfo.term }"> -->
		                                            </div>
		                                            
		                                            <script>
													    // loginMemSubscribInfo.term에 "1", "2", 또는 "3" 값이 들어 있다고 가정합니다.
													    var termValue = "${ loginMemSubscribInfo.term }";
													
													    var radioButtons = document.getElementsByName("term");
													
													    for (var i = 0; i < radioButtons.length; i++) {
													        if (radioButtons[i].value === termValue) {
													            radioButtons[i].checked = true;
													        }
													    }
													</script>
		                                            
		                                            
		
		                                            <div style="height: 30px;">
		                                                <!-- 간격 div -->
		                                            </div>
		                                        </td>
		                                    </tr>
		                
		                                    <tr>
		                                        <td>
		                                            <div class="enrollform_input_label d-flex mb-1">
		                                                <div class="mybox-option mr-auto">비선호 품목</div>
		                                            </div>
		                                            <div id="dislike-wrap" style="margin: auto; padding-left: 8px; padding-right: 8px;">
		                                                
		                                                <div id="dislike-list">
		                                                    <!-- <p style="color: #03c75a;">제외된 비선호 품목✏️</p> -->
		                                                    <input type="text" class="input-text-style" name="dislike" placeholder="비선호 품목 목록" value="${ loginMemSubscribInfo.dislike }">
		                                                </div>
		                                            </div>
		
		                                            <div style="height: 30px;">
		                                                <!-- 간격 div -->
		                                            </div>
		                                        </td>
		                                    </tr>
		                
		                                    <tr>
		                                        <td>
		                                            <div class="enrollform_input_label d-flex mb-1">
		                                                <div class="mybox-option smr-auto">기본 배송 정보</div>
		                                            </div>
		                                            <div style="padding-left: 8px; padding-right: 8px;">
		                                                <div class="d-flex" style="margin-bottom: 10px;">
		                                                    <!-- 기본주소 -->
		                                                    <div class="flex-fill" style=" width: 80%;">
		                                                        <input type="text" class="address_base" id="address" name="address" value="${ loginMemSubscribInfo.address }" placeholder="기본 주소를 입력해주세요" readonly required>
		                                                    </div>
		                                                    <div class="flex-fill">
		                                                        <!-- 주소 검색 버튼 -->
		                                                        <input type="button" class="search_confirm_btn" onclick="sample6_execDaumPostcode()" value="검색">
		                                                    </div>  
		                                                </div>
		                    
		                                                <!-- 상세 주소 -->
		                                                <input type="text" class="address_detail input-text-style" id="addressDetail" name="detailAddress" value="${ loginMemSubscribInfo.detailAddress }" placeholder="상세 주소를 입력해주세요" required>
		                                                <input type="hidden" id="sample6_postcode" value="우편번호">
		                                                <input type="hidden" id="sample6_extraAddress" value="참고항목">
		                                            </div>
		                
		                                            <div style="height: 30px;">
		                                                <!-- 간격 div -->
		                                            </div>
		
		                                        </td>
		                                    </tr>
		                                    
		                                    <tr>
		                                        <td>
		                                            <div class="d-flex">
		                                                <div class="mybox-option p-2 flex-fill">
		                                                    시작 날짜
		                                                    <input type="text" class="input-text-style" placeholder="시작 날짜" name="startDate" value="${ loginMemSubscribInfo.startDate }" readonly>
		                                                </div>
		                                                
		                                                <div class="mybox-option p-2 flex-fill">
		                                                    종료 날짜
		                                                    <input type="text" class="input-text-style" placeholder="종료 날짜" name="endDate" value="${ loginMemSubscribInfo.endDate }" readonly>
		                                                </div>
		                                                
		                                            </div>
		
		                                            <div style="height: 30px;">
		                                                <!-- 간격 div -->
		                                            </div>
		                                        </td>
		                                    </tr>
		                
		                                    <tr>
		                                        <td>
		                                            <button type="submit" class="submit-btn" style="margin-bottom: 10px; margin-top: 10px;">설정하기</button>
		                                            <a href="" style="color: rgb(58, 58, 58); display:block; text-align: center;" data-toggle="modal" data-target="#quitForm">
				                                        구독 취소를 원하세요?
				                                    </a>
		                                        </td>
		                                    </tr>
		                                        
		                                </table>
		                                
		
		                            </form>
		                        </div>	
                    </div>
                    
                    <!-- The Modal -->
					  <div class="modal fade" id="quitForm">
					    <div class="modal-dialog">
					      <div class="modal-content">
					      
					        <!-- Modal Header -->
					        <div class="modal-header">
					          <h4 class="modal-title">구독 취소</h4>
					          <button type="button" class="close" data-dismiss="modal">&times;</button>
					        </div>
					        
					        <!-- Modal body -->
					        <div class="modal-body" align="center" style="font-size:16px;">
					        	<b>
			                                   정말로 못난이 박스 구독을 취소하시겠습니까?<br>
			                   	</b>
			                   	<br>
			
			                   <form action="myPageUpdateSubscribeStatus.su" method="post">
			                       <input type="hidden" name="userId" value="${ loginMember.userId }">
			                       <button type="submit" class="btn btn-danger">취소하기</button>
			                   </form>
					        </div>
					        
					        
					      </div>
					    </div>
					  </div>

                </div>

            </div>
            
            <br>
        </div>

    </div>
    
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
                    document.getElementById("address").value = addr;
                    document.getElementById("address").value += extraAddr;
                    // 커서를 상세주소 필드로 이동한다.
                    document.getElementById("addressDetail").focus();
                }
            }).open();
        }
    	

	</script>

</body>
</html>