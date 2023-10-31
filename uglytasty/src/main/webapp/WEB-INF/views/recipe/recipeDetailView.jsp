<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	<style>

        /* ===== 세부페이지마다 공통적으로 유지할 style ===== */
        * { /* 헤더에 포함하기 */
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
        }

        .YRinnercontent table{
            margin: auto;
            width: 100%; /* 70%에서 수정*/
        }

        /* .YRinnercontent h2{
            text-align: center;
            font-weight: 700;
            color: rgb(58, 58, 58);
            text-align: center;
        } */

        /* input type=text 공용 스타일 */
        .input-text-style{
            width: 100%;
            border-style: solid;
            border-radius: 10px;
            height: 50px; /* 58px에서 수정*/
            /* margin-top: 20px;*/
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

        /* --------------------<<레시피 첫 단, 둘째 단, 셋째 단, 넷째 단>>---------------------- */
        #recipe_img_info, .recipe_ingredients_div, .recipe_content_div, .recipe_reply_div{
            width: 80%;
            margin: auto;
        }
        
        /* ------------------------레시피 첫 단 - 이미지----------------------- */
        .recipe_img{ /* 레시피 이미지 영역 */
            padding: 15px;
        }
        .recipe_img_wrap{ /* 레시피 이미지만 감싸는 div */
            border: 0 solid #e5e7eb;
            border-radius: 1px;
            width: 100%;
            height: 440px;
            margin: auto;
        }
        .recipe_img img{ /* 레시피 이미지 object */
            border-radius: 1px;
            object-position: center;
            object-fit: cover;
            /* object-fit: fill; 비율 보고 위에 거랑 이거 중에서 골라야 할듯*/
            width: 100%;
            height: 100%;
        }
        /* --------------------------레시피 첫 단 - 설명부------------------------- */
        .recipe_info{ /* 레시피 설명부 영역 전체*/
            position: relative; /* 설명부 전체 요소의 부모 div */
            padding: 20px;
            padding-left: 50px;
        }

         /* 레시피 제목 */
        .recipe_title h2{
            font-size: 26px;
            text-align: center;
            font-weight: 700;
            color: rgb(58, 58, 58);
            margin-bottom: 20px;
        }

         /* 난이도, 조리시간 */
        .difficulty_time{ /* wrap */
            font-size: 15px;
            margin-bottom: 10px;
            margin: auto;
        }
        .difficulty, .time{ /* each */
            display: inline-block;
            margin-left: 5px;
            margin-right: 5px;
        }
        .difficulty_time_option{ /* 둘 중 선택 */
            border-radius: 3px;
            background-color: #FF6741;
            padding: 2px;
            color: white;
            font-weight: 500;
        }
        .difficulty_time_option2{ /* 둘 중 선택 */
            border-radius: 3px;
            background-color: #f1f1f1;
            padding: 2px;
            color: #FF6741;
            font-weight: 500;
        }

        /* .recipe_exp{
           따로 스타일 지정하지 않음 
        } */


        /* 댓글 수, 좋아요 수, 좋아요 하트 */
        .recipe_reply_like_count{
            position: absolute; /* 부모 div(.recipe_info) 기준으로 이 div 고정 */
            bottom: 15px;
            width: 558px;
        }
        .recipe_reply_count, .recipe_like_count{
            display: inline-block;
            margin: 5px;
        }
        .like_heart{ /* 좋아요 버튼 */
            float: right;
            /* margin: 3px; */
            /* border: 1px solid; */
        }
        .like_heart img:hover {cursor: pointer;}
        .recipe_modify_delete{ /* 수정하기, 삭제 버튼 */
            float: right;
        }

        /* ------------------------------영역 나누기 회색 바----------------------------------- */
        .devide-gray-line{
            width: 100%;
            height: 14px;
            margin: auto;
            background-color: rgb(249 250 251);
        }

        h3{ /* 재료, 만드는법, 댓글 제목 */
            font-size: 22px;
            /* text-align: center; */
            font-weight: 700;
            color: rgb(58, 58, 58);
            display: inline-block;
            margin-bottom: 10px;
        }

        /* ------------------------------------<<재료>>----------------------------------------- */
        /* div: ingredients, seasoning */
        .ingredient_seasoning>div{
            /* border: 1px solid; */
            padding: 30px;
            padding-top: 0px;
        }
        .ingredient_category_title{
            font-size: 15px;
            margin-bottom: 7px;
            font-weight: 600;
            color: rgb(58, 58, 58);
        }
        .ingredients_content{ /* 주재료, 양념 내용*/
            border: 1px solid lightgray;
            border-radius: 2px;
            font-size: 14px;
        }
        .ingredient>span, .seasoning>span{
            border-radius: 0.125rem;
            padding: 5px;
            line-height: 24px;
            font-weight: 500;
            color: rgb(31 41 55);
            background-color: rgb(229 231 235);
            font-size:14px;
        }
        .quantity-value, .amount-value{
        	color: rgb(31 41 55);
        	font-weight: 500;
        	font-size:14px;
        }


        /* ----------------------------------<<만드는 법>>--------------------------------------- */
        .recipe_content{
            /* border: 1px solid; */
            border-radius: 10px;
            width: 100%;
            padding: 20px;
            background-color: rgb(255 246 238);
            font-size: 17px;
            line-height: 30px; /* 자간 간격 */
            color: rgb(58, 58, 58);
        }
        #recipe_servings{ /* N인분 기준 */
            border-radius: 100px;
            background-color: rgb(255 246 238);
            padding-top: 5px;
            padding-bottom: 5px;
            padding-right: 8px;
            padding-left: 8px;

            font-size: 14px;
            line-height: 1;
            color: #FF6741;
            font-weight: 600;
        }
        .recipe_content>pre {
		    margin: 0;
		    padding: 0;
		    border: none;
		    background: none;
		    font-size: inherit;
		    font-family: inherit;
		    line-height: inherit;
		    color: inherit;
		    text-align: inherit;
		    white-space: pre;
		}

        /* ------------------------------------<<댓글>>----------------------------------------- */
        .recipe_reply{
            border: 1px solid lightgray;
            width: 100%;
            height: 57.6px;
        }
        .reply-submit-btn{
            color: white;
            font-weight: 700;
            font-size: 18px;
            line-height: 1;
            margin-bottom: 20px;
            margin-top: 20px;
            background-color: rgb(81, 81, 81);
            border-radius: 10px;
            width: 80%;
            height: 48px;
            border: 0;
        }
        #reply_total{
            color: #FF6741;
            font-weight: 700;
            font-size: 22px;
        }
        /* replay-each: .reply_pic_wrap .reply_pic .reply_writer .reply_edit_delete>a .reply_content .reply_date*/
        .reply-each p{
            margin-bottom: 0px;
            width: 90%;
        }
        .reply_pic_wrap{
            object-fit: cover;
            position: relative;
            overflow: hidden;
            background-color: #e5e7eb;
            width: 50px;
            height: 50px;
        }
        .reply_pic{
            object-fit: cover;
            position: absolute;
            width: 65%;
            /* border: 1px solid; */
            margin: 20%;
        }
        .reply_writer{
            font-size: 17px;
            margin-bottom: 3px;
        }
        .reply_edit_delete>button{
            font-size: 12px;
            padding: 2px 4px;
        }
        .reply_content{
            margin-top: 10px;
            margin-bottom: 3px;
        }
        .reply_date{font-size: 13px;}

        
    </style>


</head>
<jsp:include page="../common/header.jsp"/>
<body>

	<div class="YRcontent">
        <br><br>

        <a class="btn btn-secondary" style="margin-right:15%; float:right;" href="list.re">뒤로가기</a>
        <div class="YRinnercontent">
            <br><br><br>

            <div id="recipe_img_info" class="row">


                <div class="recipe_img col-5">

                    <div class="recipe_img_wrap">
                        <img src="${ r.recipeChangeName }">
                    </div>
                    
                </div>

                <div class="recipe_info col-7">
                    <!-- recipe_info : 음식 제목, 음식 간단 설명, 난이도, 조리 시간 -->

                    <div class="recipe_title">
                        <h2>
                            ${ r.recipeTitle }
                        </h2>
                    </div>
                    <br>
                    
                    <div class="difficulty_time">
                                    
                        <div class="difficulty">
                            난이도&nbsp;
                            <span class="difficulty_time_option">${ r.difficulty }</span>
                        </div> 
                        <div class="time">
                            소요 시간&nbsp;
                            <span class="difficulty_time_option2">${ r.time }</span>
                        </div>

                        <div style="float: right; font-size: 16px; vertical-align: middle; color:rgb(81, 81, 81); margin-right: 15px;">
                            <b>${ r.recipeWriter }</b>
                        </div>

                    </div>
                    <div class="d-flex justify-content-end" style="margin: auto; width: 100%; margin-top: 7px; padding-right: 15px;">
                        <div style="font-size: 13px;">
                            ${ r.recipeDate }
                        </div>
                    </div>

                    
                    

                    <hr>

                    <div class="recipe_exp">
                    	<!-- 레시피 간단 설명 -->
                        ${ r.recipeExplanation }
                    </div>


                    <br>
                    
                    <div class="recipe_reply_like_count">
                        
                        <div class="recipe_reply_count">
                        	<!-- 원래는 댓글 개수였는데 조회수로 바꿔서 클래스명이 이상함 -->
                            조회수&nbsp;
                            <b>${ r.count }</b>
                        </div> 
                        <div class="recipe_like_count">
                            좋아요&nbsp;
                            <b id="like_count_recipe">${ likeCount }</b>
                        </div>

                        <!-- 작성자(관리자)일 경우 수정 삭제 버튼, 일반 유저는 좋아요 버튼 -->
                        <c:choose>
                        	<c:when test="${ loginMember.userId eq r.recipeWriter }">
                        		<div class="recipe_modify_delete">
		                            <a onclick="postFormSubmit(1);" class="btn btn-sm btn-success">수정</a>
		                            <a onclick="postFormSubmit(2);" class="btn btn-sm btn-danger">삭제</a>
		                        </div>
	                        </c:when>
	                        <c:otherwise>
		                        <div class="like_heart">
									 <c:choose>
			                        	<c:when test="${ ifUserLiked eq 'yes' }">
											 <img src="http://owzl.github.io/heart2.svg" id="like" onclick="sendLikeRequest();">
										</c:when>
										<c:otherwise>	 
											 <img src="http://owzl.github.io/heart1.svg" id="like" onclick="sendLikeRequest();">
										</c:otherwise>
									</c:choose>
		                        </div>
	                        </c:otherwise>
                        </c:choose>
                        
                        <form id="postForm" action="" method="post">
                        	<input type="hidden" name="rno" value="${ r.recipeNo }">
                        	<input type="hidden" name="filePath" value="${ r.recipeChangeName }">
                        </form>
                        
                        <script type="text/javascript">
                        	function postFormSubmit(num){
                        		if(num == 1){
                        			// 수정하기
                        			$("#postForm").attr("action", "updateForm.re").submit();
                        		}else{
                        			// 삭제하기
                        			$("#postForm").attr("action", "delete.re").submit();
                        		}
                        	}
                        </script>

                    </div>

                </div>

            </div>

            <br>
            <div class="devide-gray-line"></div>
            <br>


            <div class="recipe_ingredients_div">
                <h3>🥕 재료</h3> &nbsp; <span id="recipe_servings">${ i.servings }인분 기준</span> <!-- 인분도 변수임 -->
                <br><br>

                <div class="ingredient_seasoning row" style="margin: auto;">

                    <div class="col">
                        <div class="d-flex flex-column">
                            <div class="ingredient_category_title">주재료</div>
                            <div class="ingredients_content p-2">

                                <!-- 주재료 개수에 따라 반복 + ,를 기준으로 잘라서 넣기 -->
                                <c:forEach items="${i.ingredient.split(',')}" var="ingredient" varStatus="loop">
	                                <div class="ingredient d-flex justify-content-between">
	                                    <div class="ingredient p-2">
	                                    	<span class="ingredient-name">${ingredient}</span>
	                                    </div>
                                    
	                                    <div class="quantity p-2">
	                                    	<span class="quantity-value">${i.quantity.split(',')[loop.index]}</span>
	                                    </div>
	                                </div>
                                </c:forEach>
                                
                                
                            </div>
                        </div>
                    </div>

                    <div class="col">
                        <div class="d-flex flex-column">
                            <div class="ingredient_category_title">양념</div>
                            <div class="ingredients_content p-2">
                                
                                <!-- 양념 개수에 따라 반복 + ,를 기준으로 잘라서 넣기 -->
                                <c:forEach items="${i.seasoning.split(',')}" var="seasoning" varStatus="loop">
									<div class="seasoning d-flex justify-content-between">
										<div class="seasoning p-2">
											<span class="seasoning-name">${seasoning}</span>
										</div>
									
										<div class="amount p-2">
											<span class="amount-value">${i.amount.split(',')[loop.index]}</span>
										</div>
									</div>
								</c:forEach>

                            </div>
                        </div>
                    </div>

                </div>

            </div>

            <br>
            <div class="devide-gray-line"></div>
            <br>

            <div class="recipe_content_div">
                <h3>🍴 만드는 방법</h3>
                <br><br>

                <div class="recipe_content">
                    <pre>${ r.recipeContent }</pre>
                </div>

            </div>

            <br>
            <div class="devide-gray-line"></div>
            <br>

            <div class="recipe_reply_div">
                <h3>댓글</h3> &nbsp; <span id="reply_total">0</span>

                <!-- 댓글 작성 -->
                <table style="margin: auto;">
                    <tr>
                        
                        <c:choose>
	                        <c:when test="${ empty loginMember }">
	                        	<!-- 로그인 안 한 상태(readonly, disabled) -->
	                        	<td style="width: 90%;">
		                            <input type="text" class="input-text-style" id="" name="" placeholder="로그인 한 사용자만 이용 가능한 서비스입니다. 로그인 후 이용 바랍니다." style="width:99%" readonly>
		                        </td>
		                        <td>
		                            <button type="submit" class="btn btn-secondary reply-submit-btn" disabled>확인</button>
		                        </td>
	                        </c:when>
	                        <c:otherwise>
	                        	<!-- 로그인 한 상태 -->
	                        	<td style="width: 90%;">
		                            <input type="text" class="input-text-style" id="replyContent" name="replyContent" style="width:99%" placeholder="댓글을 입력하세요.">
		                        </td>
		                        <td>
		                            <button type="submit" class="btn btn-secondary reply-submit-btn" onclick="addReply();">확인</button>
		                        </td>
	                        </c:otherwise>
                        </c:choose>
                        
                    </tr>
                </table>

                <hr>


                <!-- 댓글 목록 -->
                <!-- 한 덩어리 시작-->
                <div id="reply_area"></div>    
                <!-- 한 덩어리 끝-->
                
                
                
                 
                <script>
                
                
                	<!-- 좋아요 - 여부 확인, 좋아요 하기, 좋아요 취소 -->
                	<!-- heart1:빈 하트/heart2:채워진 하트 -->
                	function sendLikeRequest(){
                		
                		var loginMember = "${loginMember}"; // 여기에 세션에서 가져온 loginMember 값을 할당

                		
                        //하트 클릭시
                        $.ajax({
                           url: "like.re",
                           type: "POST",
                           data: {
                               recipeNo: ${r.recipeNo}
                           },
                           success: function(result){
                        	   
                              var heartImage = document.getElementById("like");
                              
                           	   // 하트가 빈 상태일 때 	
                               if (heartImage.src.endsWith("heart1.svg")) {
                            	   
                            	   if(loginMember === ""){
                            		   alertify.alert("회원 전용 기능입니다. 로그인을 해주세요!"); // 로그인이 필요함을 알리는 메시지를 표시
                              	       return; // 함수 실행 종료
                            	   }else{
                            		   // 하트 채워
	                                   heartImage.src = "http://owzl.github.io/heart2.svg";
	                                   $("#like_count_recipe").text(parseInt($("#like_count_recipe").text()) + 1);
                            	   }
                               
                               // 하트가 채워진 상태일 때
                               } else {
                            	   // 하트 비워
                                   heartImage.src = "http://owzl.github.io/heart1.svg";
                                   $("#like_count_recipe").text(parseInt($("#like_count_recipe").text()) - 1);
                               }
                               
                                 
                            },error:function(){
                           		console.log("좋아요 ajax 실패!");
                        	}
                        })
                    }  
                
                
                	<!-- 댓글 작성 -->
                	function addReply(){
                		
                		if($("#replyContent").val().trim().length != 0){
							$.ajax({
								url:"rinsert.re",
								data:{
									refRecipeNo:${r.recipeNo},
									replyContent:$("#replyContent").val(),
									userId:'${loginMember.userId}'
								},success:function(status){

									if(status == "success"){
										
										// 댓글창 비우기
										$("#replyContent").val('');
										
										// 다시 리스트 불러오는 함수 호출
										selectReplyList();
										
									}
									
								}, error:function(){
									console.log("댓글 작성용 ajax 요청 실패!")
								}
							})                			
                			
                		}else{
                			alertify.alert("댓글 내용을 작성해주세요!")
                		}
                		
                	}
                
                
                	<!-- 해당 게시글 댓글 조회 -->
                	$(function(){
                		selectReplyList();
                	})
                	
                	function selectReplyList(){
                		$.ajax({
                			url: "rlist.re",
                			data:{rno:${r.recipeNo}},
                			success:function(list){
                				
                				console.log(list);
                				
                				let value="";
                				
                				for(let i in list){
                					
                					value += "<div class='reply-each'>"
	
			                			  +		"<div class='media p-1'>"
			                			  +			"<div class='reply_pic_wrap mr-3 rounded-circle'>"
			                			  +				"<img src='http://owzl.github.io/nani.png' class='reply_pic'>"
			                			  +			"</div>"
			
			                			  +			"<div class='media-body'>"
			                			  +				"<div>"
			                			  +					"<b class='reply_writer'>" +  list[i].userId  + "</b>";
			
								                			  if(list[i].userId === '${loginMember.userId}'){
								                					value += "<div id='reply_edit_delete' class='reply_edit_delete' style='float:right; margin-right: 15px;'>"
								                						   +	"<button class='btn btn-sm btn-success'>수정</button> &nbsp;"
								                						   +	"<button class='btn btn-sm btn-danger' onclick='deleteReply(" + list[i].replyNo +");'>삭제</button>"
								                						   +  "</div>";
								                				}
				                		  
			                		value +=			"</div>"
			                							
			                			  +				"<p class='reply_content'>"
			                			  +				    list[i].replyContent 
			                			  +				"</p>"
			
			                			  +				"<span class='reply_date' style='float:right;'>"
			                			  +					 list[i].replyDate 
			                			  +				"</span>"
			                			  +			"</div>"
			                			  +		"</div>"
			
			                			  +	"</div>"
			                			  +	"<hr>";
                					
                				}
                				
                				$("#reply_area").html(value);
                				
                				$("#reply_total").text(list.length);
                				
                			}, error:function(){
                				console.log("댓글 리스트 조회용 ajax 통신 실패!!!")
                			}
                		})
                	}
                	
                	<!-- 댓글 삭제 ajax -->
                	function deleteReply(num){
                		$.ajax({
                			url:'rdelete.re',
                			data:{
                				rplno: num
                				},
                				
                				success:function(data){
                					if(data == "success"){
                						
		                				alertify.alert("댓글이 삭제되었습니다!")
		                				
		                				selectReplyList();
		                				
                					}
                			},
                			
                			error:function(){
                				console.log("댓글 삭제용 ajax 통신 실패!!!")
                			}
                		})
                	}
                
                </script>


            </div>

            <br>
            <div class="devide-gray-line"></div>
            <br>

            <br><br>
        </div>

        <br><br>
    </div>

</body>

<jsp:include page="../common/footer.jsp"/>

</html>