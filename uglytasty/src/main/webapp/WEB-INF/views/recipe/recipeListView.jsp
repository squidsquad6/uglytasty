<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>못난이맛난이 레시피</title>

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
        
        .YRinnercontent { /* 공통 큰 메뉴 content 영역 - 레시피 영역 */
            /* border: 3px solid lightgray; */
            border-radius: 10px;
            width:90%;
            margin:auto;
            background-color:white;
            display: block;
        }

        /* .YRinnercontent table{
            margin: auto;
            width: 70%;
        } */

        .YRinnercontent h2{ /* 공통 큰 메뉴 content 영역 제목 */
            text-align: center;
            font-weight: 700;
            color: rgb(58, 58, 58);;
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
        /* 검색 버튼 스타일 */
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
            margin-top: 20px;
        }
        
        /* 레시피 작성하기 버튼 */
        #recipe_enroll_btn{
        	float:right;
        	width:250px;
            height: 47px;
        	background-color: rgb(240, 240, 240);
            border: none;
        	color: rgb(87, 87, 87);
        	font-weight: 700;
        	border-radius: 10px;
        	font-size: 17px;
            margin-bottom: 30px;
            transition: 0.3s;
        }
        #recipe_enroll_btn:hover{
            background-color: rgb(233, 233, 233);
        }

        /* ----------------------------------검색창------------------------------------- */
        
        /* 검색창 테이블 */
        #search-recipe table{ 
            margin: auto;
            width: 70%;
        }

        /* ----------------------------------------------------------------------------- */

        /* 리스트 위에 필터들(난이도 , 시간 / 최신순, 조회순) 모음 테이블 */
        #recipe_all{ 
            width: 90%;
            margin: auto;
            /* border: 1px solid red; */
        }

        /* ---------------------------------셀렉트 박스------------------------------------ */
        #selectbox-recipe{
            width: 100%;
        }
        #selectbox-recipe select{
            width: 45%;
            height: 40px;
            float: left;
            border-radius: 5px;
            background-color: rgb(105, 114, 129);
            border-color: rgb(105, 114, 129);
            color: white;
            font-size: 16px;
            font-weight: 600;
            border: none;
            text-align: center;
        }

        /* --------------------------------최신순, 조회순----------------------------------- */
        #recipe_desc{
            float: right;
            padding-right: 10px;
            margin-top: 23px;
        }
        #recipe_desc a{
            text-decoration: none;
            color: rgb(58, 58, 58);
        }
        #recipe_desc a:hover{
        color: #FF6741;
        }
        

        /* ----------------------------------레시피 리스트------------------------------------- */
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

	<div class="YRcontent">
        <br><br>

        <div class="YRinnercontent">
        

            <br>
            <h2>맛난이 레시피</h2>
            <br><br>

			<form action="search.re" id="recipeSearchForm">
	            <div id="search-recipe">
	
	                <table>
	                    <tr>
	                        <td>
	                            <input type="text" class="input-text-style" name="keyword" value="${ keyword }" placeholder="요리나 재료를 검색해보세요!" style="width:99%">
	                        </td>
	                        <td>
	                            <button type="submit" class="submit-btn">검색</button>
	                        </td>
	                    </tr>
	                </table>
	
	                <br><br>
	            </div>
            </form>


            <table id="recipe_all">
            
            	<tr>
            		<td colspan="2">
            			<c:choose>
	            			<c:when test="${ not empty loginMember }">
					        	<!-- 로그인 O -->
					        	<div>
					                <button onclick = "location.href = 'enrollForm.re'" id="recipe_enroll_btn">레시피 작성하기</button>
					            </div>
							</c:when>
							<c:otherwise>
								<!-- 로그인 X -->
								<div>
					                <button onclick = "pleaseLoginForEnrollment()" id="recipe_enroll_btn">레시피 작성하기</button>
					            </div>
							</c:otherwise>
						</c:choose>
            		</td>
            	</tr>
            
                <tr>
                    <td>
                        <!-- 난이도, 조리 시간 셀렉트 박스 -->
                        <div id="selectbox-recipe">
                            
                            <select name="" id="difficulty_select" style="margin-right: 5px;">
                                <option value="">난이도 선택</option>
                                <option value="누구나">누구나</option>
                                <option value="초급">초급</option>
                                <option value="중급">중급</option>
                                <option value="고급">고급</option>
                            </select>

                            <select name="" id="time_select">
                                <option value="">조리 시간 선택</option>
                                <option value="5분 이내">5분 이내</option>
                                <option value="10분 이내">10분 이내</option>
                                <option value="15분 이내">15분 이내</option>
                                <option value="20분 이내">20분 이내</option>
                                <option value="30분 이내">30분 이내</option>
                                <option value="60분 이내">60분 이내</option>
                                <option value="90분 이내">90분 이내</option>
                            </select>

                        </div>
                    </td>
                    <td>
                        <div id="recipe_desc">
                            <a href="list.re">최신순</a> | <a href="listViewDesc.re">조회순</a>
                        </div>
                    </td>
                </tr>

                
            </table>
            <br>

            <div id="recipe_list">

				<!-- 
                <div id="recipe_search_result_count">
                    총 <b>${ listCount }</b>개의 레시피
                </div>
                <br> -->
                
                <div id="recipe_search_result_count">
				  총 
				  	<b>
				  		<c:choose>
						    <c:when test="${not empty keyword}">
						      ${searchListCount}
						    </c:when>
						    <c:otherwise>
						      ${listCount}
						    </c:otherwise>
					  	</c:choose>
					</b>
				  개의 레시피
				</div>
				<br>


                <!-- 반응형 -->
                <div class="row">
                    
                    <c:forEach var="r" items="${ list }">
                    
                    	<input type="hidden" class="rno" value="${ r.recipeNo }">
	                    <div class="col-sm-3">
	                        <div class="card">
	                            <a href="detail.re?rno=${ r.recipeNo }" class="stretched-link">
	                                <div class="card-img-div">
	                                    <img class="card-img-top" src="${ r.recipeChangeName }" alt="Card image">
	                                </div>
	                                <div class="card-body">
	                                    <div class="difficulty_time">
	                                        
	                                        <div class="difficulty">
	                                            난이도&nbsp;
	                                            <span class="difficulty_time_option">${ r.difficulty }</span>
	                                        </div> 
	                                        <div class="time">
	                                            소요 시간&nbsp;
	                                            <span class="difficulty_time_option2">${ r.time }</span>
	                                        </div> 
	                                    </div>
	
	                                    <p class="recipe_title text-center">
	                                        <b>
	                                            ${ r.recipeTitle }
	                                        </b>
	                                    </p>
	
	                                    <div style="font-size: 14px;">조회수 <span style="color: #FF6741;">${ r.count }</span></div>
	                                </div>
	                            </a>
	                        </div>
	                    </div>
                    
                    </c:forEach>


                </div>
                
                
            </div>

        </div>

    </div>
    
    <script>
    
	    function pleaseLoginForEnrollment() {
	        alertify.alert("🥗레시피를 작성하려면 로그인 해주세요🥘");
	    }
	    
    </script>
    
</body>

<jsp:include page="../common/footer.jsp" />

</html>