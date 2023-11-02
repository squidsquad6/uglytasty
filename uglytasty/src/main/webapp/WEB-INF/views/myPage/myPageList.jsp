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
        
        /*
        .YRinnercontent { 
            border: 3px solid lightgray;
            border-radius: 10px;
            width:90%;
            margin:auto;
            background-color:white;
        }*/
        

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

        /* ---------------------마이페이지 - 회원 (ㅇㅇ님 안녕하세요!)--------------------- */
        .mypage-member{
            /* border: 3px solid #FF6741; */
            border-radius: 10px;
            margin-bottom: 20px;
            background: rgb(255, 246, 238);
        }
        .mypage-member p{
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
        }
        .mypage_content{ /* 마이페이지 content */
            margin: auto;
            margin-top: 30px;
            margin-bottom: 100px;
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
            margin-top: 90px;
            margin-bottom: 60px;
        }
        .mypage_content h3{
            font-size: 30px;
            font-weight: 700;
            text-align: center;
        }

    </style>


</head>
	
<body>


	<!--<div class="YRContent">
        <br><br>

        <div class="YRinnercontent">
            <br><br>

            <div class="mypage-member row">
                <div class="col-sm-12">
                    <p><b id="mypage_member_name">차은우</b> 고객님 안녕하세요!</p>
                </div>
            </div>
            
            <br>-->
                
                <div class="mypage_menu_list d-flex flex-column mb-3" style="width: 100%;">

                    <div class="p-2">
                        <a href="myPageMemberInfo.me">
                            <div class="d-flex justify-content-between">
                                <div class="p-2">내 회원정보</div>
                                <div class="p-2"><img src="https://d3cpiew7rze14b.cloudfront.net/assets/svg/gray-600-chevron-right_5qBS9q-mc.svg"></div>
                            </div>
                        </a>
                    </div>
                    
                    <div class="p-2">
                        <a href="myPageUpdatePwdForm.me">
                            <div class="d-flex justify-content-between">
                                <div class="p-2">비밀번호 변경</div>
                                <div class="p-2"><img src="https://d3cpiew7rze14b.cloudfront.net/assets/svg/gray-600-chevron-right_5qBS9q-mc.svg"></div>
                            </div>
                        </a>
                    </div>

                    <div class="p-2">
                        <a href="#">
                            <div class="d-flex justify-content-between">
                                <div class="p-2">주문 및 배송 조회</div>
                                <div class="p-2"><img src="https://d3cpiew7rze14b.cloudfront.net/assets/svg/gray-600-chevron-right_5qBS9q-mc.svg"></div>
                            </div>
                        </a>
                    </div>

                    <div class="p-2">
                        <a href="myPageMyBoxForm.sub">
                            <div class="d-flex justify-content-between">
                                <div class="p-2">나의 못난이 박스</div>
                                <div class="p-2"><img src="https://d3cpiew7rze14b.cloudfront.net/assets/svg/gray-600-chevron-right_5qBS9q-mc.svg"></div>
                            </div>
                        </a>
                    </div>

                    <div class="p-2">
                        <a href="myPageLikedRecipeList.re">
                            <div class="d-flex justify-content-between">
                                <div class="p-2">찜한 레시피</div>
                                <div class="p-2"><img src="https://d3cpiew7rze14b.cloudfront.net/assets/svg/gray-600-chevron-right_5qBS9q-mc.svg"></div>
                            </div>
                        </a>
                    </div>

                    <div class="p-2">
                        <a href="#">
                            <div class="d-flex justify-content-between">
                                <div class="p-2">1:1 문의</div>
                                <div class="p-2"><img src="https://d3cpiew7rze14b.cloudfront.net/assets/svg/gray-600-chevron-right_5qBS9q-mc.svg"></div>
                            </div>
                        </a>
                    </div>

                    <div class="p-2">
                        <a href="logout.me">
                            <div class="d-flex justify-content-between">
                                <div class="p-2">로그아웃</div>
                                <div class="p-2"><img src="https://d3cpiew7rze14b.cloudfront.net/assets/svg/gray-600-chevron-right_5qBS9q-mc.svg"></div>
                            </div>
                        </a>
                    </div>

                </div>


    <!--        
            <br>
        </div>

        
    </div>-->

</body>
</html>