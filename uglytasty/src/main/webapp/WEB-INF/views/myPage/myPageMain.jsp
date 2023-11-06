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
                    
                    
                    			<br><br>
								<h3>안심하고 구독하세요!</h3>
		                        <br>
		                        <div id="subscribe_x_img">
		                            <img src="https://d3cpiew7rze14b.cloudfront.net/assets/manual/Frame+5072.svg?w=1024">
		                            <br>
		                            <button onclick = "location.href = 'subscribe.su'" type="button" class="submit-btn">못난이 구출하러 가기</button>
		                        </div>	
                    		
                    
                    </div>
                    

                </div>

            </div>
            
            <br>
        </div>

    </div>
    
    

</body>
</html>