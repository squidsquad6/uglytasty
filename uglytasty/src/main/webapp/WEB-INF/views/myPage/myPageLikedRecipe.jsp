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
        
        #recipe_list{ /* 리스트 덩어리 */
            width: 90%;
            margin: auto;
        }
        #recipe_search_result_count b{ /* 검색 결과(개수)*/
            color: #FF6741;
            font-size: 16px;
        }
        #recipe_list{ /* 리스트 덩어리 */
            width: 90%;
            margin: auto;
        }
        
        .card{
            margin-bottom: 50px;
            position: relative;
        }
        .card a>*{ /* 카드 전체를 덮고 있는 링크*/
            text-decoration: none;
            color: rgb(58, 58, 58);
        }
        .card a:hover{
        	text-decoration: none;
            color: rgb(58, 58, 58);
        }
        .card-img-div{ /* 카드 이미지만 감싸는 div */
            object-fit: cover;
            overflow: hidden;
        }
        .card-img-top{ /* 카드 사진 부분 */
            height: 270px;
            object-fit: cover;
            transition: transform 0.3s ease;
        }
        .card-body{ /* 카드 글 부분 */
            height: 130px;
            padding: 15px !important;/* 기본 설정 : 20px important 설정 안하면 변경해도 안 먹음*/
        }
        .card-body p{
            margin: 7px; /*기본 설정 : 16px*/
        }
        .card:hover .card-img-top {
            transform: scale(1.07); /* 호버되었을 때 이미지 확대 */
        }
        

        .difficulty_time{ /* 난이도, 조리시간 감싼 div*/
            font-size: 14px;
            margin-bottom: 10px;
            margin: auto;
            text-align: center;
        }
        .difficulty, .time{ /* 난이도, 조리시간 각각 div*/
            display: inline-block;
            margin-left: 5px;
            margin-right: 5px;
        }
        .difficulty_time_option{
            border-radius: 3px;
            background-color: #FF6741;
            padding: 2px;
            color: white;
            font-weight: 500;
        }
        .difficulty_time_option2{
            border-radius: 3px;
            background-color: #f1f1f1;
            padding: 2px;
            color: #FF6741;
            font-weight: 500;
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

                        <h3>찜한 레시피</h3>
                        <br><br>
                        
                        <div id="recipe_list">

				<!-- 
                <div id="recipe_search_result_count">
                    총 <b>${ listCount }</b>개의 레시피
                </div>
                <br> -->
                
                <div id="recipe_search_result_count">
				  총 
				  	<b>
				  		<!-- 
				  		<c:choose>
						    <c:when test="${not empty keyword}">
						      ${searchListCount}
						    </c:when>
						    <c:otherwise>
						      ${listCount}
						    </c:otherwise>
					  	</c:choose>
					  	 -->
					  	 ${likeListCount}
					</b>
				  개의 레시피
				</div>
				<br>


                <!-- 반응형 -->
                <div class="row">
                    
                    <c:forEach var="l" items="${ likeList }">
                    
                    	<input type="hidden" class="rno" value="${ l.recipeNo }">
	                    <div class="col-sm-4">
	                        <div class="card">
	                            <a href="detail.re?rno=${ l.recipeNo }" class="stretched-link">
	                                <div class="card-img-div">
	                                    <img class="card-img-top" src="${ l.recipeChangeName }" alt="Card image">
	                                </div>
	                                <div class="card-body">
	                                    <div class="difficulty_time">
	                                        
	                                        <div class="difficulty">
	                                            난이도&nbsp;
	                                            <span class="difficulty_time_option">${ l.difficulty }</span>
	                                        </div> 
	                                        <div class="time">
	                                            소요 시간&nbsp;
	                                            <span class="difficulty_time_option2">${ l.time }</span>
	                                        </div> 
	                                    </div>
	
	                                    <p class="recipe_title text-center">
	                                        <b>
	                                            ${ l.recipeTitle }
	                                        </b>
	                                    </p>
	
	                                    <div style="font-size: 14px;">조회수 <span style="color: #FF6741;">${ l.count }</span></div>
	                                </div>
	                            </a>
	                        </div>
	                    </div>
                    
                    </c:forEach>


                </div>
                
                
            </div>
                        
                        
                    </div>

                </div>

            </div>
            
            
            <br>
        </div>

        
    </div>



</body>
</html>