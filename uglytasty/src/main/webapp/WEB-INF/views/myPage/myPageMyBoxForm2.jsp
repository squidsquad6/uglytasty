<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
                
                <div class="col-sm-3" style="border: 1px solid red;">

                    
                    <jsp:include page="myPageList.jsp"/>


                </div>

                <div class="col-sm-9" style="border: 1px solid blue;">
                    <!-- 페이지 -->
                    
                    <div class="mypage_content">

                        <h3>나의 못난이 박스</h3>
                        <br><br>

                        <div id="mybox-wrap">
                            <form action="#" method="" id="">
                            
                                <table id="mybox-table">
                                    <tr>
                                        <td>
                                            <!-- name값을 필드부의 변수명과 완벽히 일치하게 적어줘야 함*** -->
                                            <div class="enrollform_input_label d-flex mb-1">
                                                <div class="mybox-option mr-auto">박스 크기</div>
                                            </div>
                                            <div class="d-flex">
                                                <div class="p-2 flex-fill">
                                                    <input type="radio" id="standard-box" name="box-size">
                                                    <label for="standard-box">스탠다드 박스</label>
                                                </div>
                                                <div class="p-2 flex-fill">
                                                    <input type="radio" id="jumbo-box" name="box-size">
                                                    <label for="jumbo-box">점보 박스</label>
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
                                                <div class="mybox-option mr-auto">배송 주기</div>
                                            </div>
                                            <div class="d-flex">
                                                <div class="p-2 flex-fill">
                                                    <input type="radio" id="1week" name="term">
                                                    <label for="1week">1주</label>
                                                </div>
                                                <div class="p-2 flex-fill">
                                                    <input type="radio" id="2week" name="term">
                                                    <label for="2week">2주</label>
                                                </div>
                                                <div class="p-2 flex-fill">
                                                    <input type="radio" id="4week" name="term">
                                                    <label for="4week">4주</label>
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
                                                <div class="mybox-option mr-auto">비선호 품목</div>
                                            </div>
                                            <div id="dislike-wrap" style="margin: auto; width: 90%;">
                                                <div>
                                                    <!-- 모달창 띄우는 버튼-->
                                                    <input type="button" id="dislike-btn" value="제외할 품목 선택하기" data-toggle="modal" data-target="#dislike">

                                                    <div class="container">
                                                    
                                                        <!-- The Modal -->
                                                        <div class="modal fade" id="dislike">
                                                        <div class="modal-dialog modal-lg">
                                                            <div class="modal-content">
                                                            
                                                            <!-- Modal Header -->
                                                            <div class="modal-header">
                                                                <h4 class="modal-title">제외할 품목 고르기</h4>
                                                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                            </div>
                                                            
                                                            <!-- Modal body -->
                                                            <div class="modal-body">
                                                                <table>
                                                                    <div class="container-fluid">
                                                                        <div class="row">

                                                                            <!-- 6개*2 -->
                                                                            <div class="col-sm-2">
                                                                                <input type="checkbox" id="carrot" name="dislike">
                                                                                <label for="carrot">당근</label>
                                                                            </div>

                                                                            <div class="col-sm-2">
                                                                                <input type="checkbox" id="onion" name="dislike">
                                                                                <label for="onion">양파</label>      
                                                                            </div>

                                                                            <div class="col-sm-2">
                                                                                <input type="checkbox" id="parsley" name="dislike">
                                                                                <label for="parsley">파슬리</label> 
                                                                            </div>

                                                                            <div class="col-sm-2">
                                                                                <input type="checkbox" id="apple" name="dislike">
                                                                                <label for="apple">사과</label> 
                                                                            </div>

                                                                            <div class="col-sm-2">
                                                                                <input type="checkbox" id="carrot" name="dislike">
                                                                                <label for="carrot">당근</label>
                                                                            </div>

                                                                            <div class="col-sm-2">
                                                                                <input type="checkbox" id="carrot" name="dislike">
                                                                                <label for="carrot">당근</label>
                                                                            </div>
                                                                            
                                                                            <div class="col-sm-2">
                                                                                <input type="checkbox" id="carrot" name="dislike">
                                                                                <label for="carrot">당근</label>
                                                                            </div>

                                                                        </div>

                                                                        
                                                                    </div>
                                                                </table>
                                                            </div>
                                                            
                                                            <!-- Modal footer -->
                                                            <div class="modal-footer">
                                                                <button type="button" class="btn btn-success" data-dismiss="modal">선택 완료</button>
                                                            </div>
                                                            
                                                            </div>
                                                        </div>
                                                        </div>
                                                        
                                                    </div>

                                                </div>
                                                <div id="dislike-list">
                                                    <p style="color: #03c75a;">제외된 비선호 품목✏️</p>
                                                    <input type="text-area" class="input-text-style" placeholder="비선호 품목 목록">
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
                                                        <input type="text" class="address_base" id="addressBase" name="addressBase" value="" placeholder="기본 주소를 입력해주세요" readonly required>
                                                    </div>
                                                    <div class="flex-fill">
                                                        <!-- 주소 검색 버튼 -->
                                                        <input type="button" class="search_confirm_btn" onclick="sample6_execDaumPostcode()" value="검색">
                                                    </div>  
                                                </div>
                    
                                                <!-- 상세 주소 -->
                                                <input type="text" class="address_detail input-text-style" id="addressDetail" name="addressDetail" value="" placeholder="상세 주소를 입력해주세요" required>
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
                                                    <!-- <input type="date"> -->
                                                    <input type="text" class="input-text-style" placeholder="시작 날짜" readonly>
                                                </div>
                                                
                                                <div class="mybox-option p-2 flex-fill">
                                                    종료 날짜
                                                    <!-- <input type="date"> -->
                                                    <input type="text" class="input-text-style" placeholder="종료 날짜" readonly>
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
                                        </td>
                                    </tr>
                                        
                                </table>

                            </form>
                        </div>    
                    </div>

                </div>

            </div>
            
            <br>
        </div>

    </div>

</body>
</html>