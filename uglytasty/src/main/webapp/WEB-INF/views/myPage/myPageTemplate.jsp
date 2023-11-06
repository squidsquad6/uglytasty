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

                        <h3>제목</h3>
                        <br><br>
                        
                    </div>

                </div>

            </div>
            
            
            <br>
        </div>

        
    </div>



</body>
</html>