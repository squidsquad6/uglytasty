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

        .YRinnercontent h2{
            text-align: center;
            font-weight: 700;
            color: rgb(58, 58, 58);
            text-align: center;
        }

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
            /* border: 1px solid; */
        }
        /* ------------------------레시피 첫 단 - 이미지----------------------- */
        .recipe_img{ /* 레시피 이미지 영역 */
            padding: 15px;
        }
        .recipe_img_wrap{ /* 레시피 이미지만 감싸는 div */
            border: 1px solid #e5e7eb; /* 수정/삭제에서는 테두리 있게 */
            border-radius: 1px;
            width: 100%;
            height: 440px;
            margin: auto;
            background-color: rgb(255, 246, 238);;
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
            width: 85%;
            /* border: 1px solid; */
        }
        .recipe_reply_count, .recipe_like_count{
            display: inline-block;
            margin-left: 5px;
            margin-right: 5px;
        }
        .like_heart{
            float: right;
            margin-bottom: 5px;
            /* border: 1px solid; */
        }
        .like_heart img:hover {cursor: pointer;}

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
        .ingredients_content>div:hover{ /* 주재료, 양념 입력해서 추가된 div*/
            border: 2px solid #FF6741;
            border-radius: 5px;
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

        /* 재료, 양념 추가 필드 */
        .add_ingredient_seasoning_input_text{
            display: inline-block;
            border-style: solid;
            border-radius: 10px;
            height: 40px;
            padding-left: 14px;
            padding-right: 14px;
            border-color: rgb(229, 231, 235);
            border-width: 1px;
            width: 41%;
            margin-top:15px;
        }
        .input-text-style::placeholder{ /* place holder 글자색 */
            color:#a0aec0;
        }
        .input-text-style:focus{ /* 텍스트박스 클릭했을 때 */
            background-color: rgb(255, 246, 238);
            border-color: rgb(229, 231, 235);
            outline: none;
        }
        .add_ingredient_seasoning_btn{
            color: white;
            display: inline-block;
            font-weight: 500;
            font-size: 15px;
            line-height: 1;
            background-color: #FF6741;
            border-radius: 10px;
            height: 40px;
            border: 0;
            margin-top: 15px;
            width: 15%;
        }
        .add_ingredient_seasoning_cancel{
            background: none;
            border: none;
            font-size: 20px;
            float: right;
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

        /* 수정/삭제용 연습 */
        .recipe_exp textarea{ /* 레시피 간단 설명 */
            display: block;
            width: 100%;
            height: 290px;
            resize: none;
            padding: 15px;
        }
        
        .recipe_content textarea{
            width: 100%;
            height: 400px;
            background-color: transparent;
            border: 0px;
        }
        
        #recipe_content_area>textarea{ /* 레시피 제목 작성 textarea로 변경 */
			height: 50px;
			resize: none;
        }
        


    </style>

</head>

<jsp:include page="../common/header.jsp"/>

<body>
	<br>

	<div class="YRcontent">
        <br><br>

        <div class="YRinnercontent">
            <div style="width: 80%; margin:auto;">
				<input type="button" class="btn btn-secondary" style="margin-bottom:40px; margin-left:90%;" onclick="javascript:history.go(-1);" value="뒤로가기">
            </div>
            <h2>레시피 작성하기</h2>
            <br><br><br>
            
            <form id="enrollForm" method="post" action="insert.re" enctype="multipart/form-data">
                <div id="recipe_img_info" class="row">

                    <div class="recipe_img col-5">

                        <input type="file" name="upfile" id="upfile" required>
                        <div class="recipe_img_wrap">
                            <!-- 이미지 미리보기 하고싶어 -->
                            <img id="previewImage" src="" alt="">
                        </div>
                        
                    </div>

                    <div class="recipe_info col-7">
                        <!-- recipe_info : 음식 제목, 음식 간단 설명, 난이도, 조리 시간, 레시피 작성자(hidden), -->

                        <div class="recipe_title">
                            레시피 제목
                            <!-- <input type="text" id="recipeTitle" name="recipeTitle" class="input-text-style" placeholder="레시피 제목을 입력해주세요"> -->
                            <textarea id="recipeTitle" name="recipeTitle" class="input-text-style" placeholder="레시피 제목을 입력해주세요" style="padding:15px; overflow: hidden;"></textarea>
                        </div>
                        <br>

                        <div class="difficulty_time">
                                        
                            <div class="difficulty">
                                난이도&nbsp;
                                <select name="difficulty" id="difficulty">
                                    <option value="누구나">누구나</option>
                                    <option value="초급">초급</option>
                                    <option value="중급">중급</option>
                                    <option value="고급">고급</option>
                                </select>
                            </div> 
                            <div class="time">
                                소요 시간&nbsp;
                                <select name="time" id="time">
                                    <option value="5분">5분</option>
                                    <option value="10분">10분</option>
                                    <option value="15분">15분</option>
                                    <option value="20분">20분</option>
                                    <option value="30분">30분</option>
                                    <option value="60분">60분</option>
                                    <option value="90분">90분</option>
                                </select>
                            </div>

                        </div>
                        

                        <hr>

                        <div class="recipe_exp">
                            간단 설명
                            <textarea name="recipeExplanation" id="recipeExplanation" class="input-text-style" placeholder="음식에 대한 간단한 설명을 작성해주세요"></textarea>
                        </div>
                        
                        <input type="hidden" name="recipeWriter" id="recipeWriter" value=${ loginMember.userId }>


                    </div>

                </div>

                <br>
                <div class="devide-gray-line"></div>
                <br>


                <div class="recipe_ingredients_div">
                    <h3>🥕 재료</h3> &nbsp;
                    <input type="text" name="servings" class="input-text-style" style="width: 7%; height: 25px;" required>
                    <span id="recipe_servings">
                        인분 기준
                    </span> <!-- 인분도 변수임, 나중에 여력이 되면 작성할 때 입력한 인분값을 기본값으로 설정하고 +- 버튼 추가해서 재료 수량 바뀌는거 해보기 -->

                    <br><br>

                    <div class="ingredient_seasoning row" style="margin: auto;">

                        <div class="col">
                            <div class="d-flex flex-column">
                                <div class="ingredient_category_title">
                                    주재료
                                    <input id="add_ingredient_btn" style="float: right; width: 30px; height: 30px;" class="btn btn-sm btn-secondary" type="button" value="+">
                                </div>
                                <div id="ingredients_content" class="ingredients_content p-2">

                                    <!-- 주재료 개수에 따라 반복하고 ,를 기준으로 잘라서 넣기 -->
                                    <div class="ingredient d-flex justify-content-between"></div>
                                    
                                </div>
                                
                                <input type="hidden" id="ingredientsInput" name="ingredient" value="">
								<input type="hidden" id="quantitiesInput" name="quantity" value="">

                                <div id="inputFields" style="display: none;">

                                    <div>
                                        <input type="text" id="ingredientName" class="add_ingredient_seasoning_input_text" placeholder="재료 입력">
                                        <input type="text" id="ingredientQuantity" class="add_ingredient_seasoning_input_text" placeholder="재료량 입력">   
                                        <input id="addIngredient" class="add_ingredient_seasoning_btn" type="button" value="추가">
                                    </div>
                                        
                                    <div class="d-flex flex-row-reverse" style="width: 444px;">
                                        <input class="add_ingredient_seasoning_cancel" id="cancelAdd" type="button" value="×">
                                    </div>

                                </div>
                                
                            </div>
                            
                        </div>
                        
                        

                        <div class="col">
                            <div class="d-flex flex-column">
                                <div class="ingredient_category_title">
                                    양념
                                    <input id="add_seasoning_btn" style="float: right; width: 30px; height: 30px;" class="btn btn-sm btn-secondary" type="button" value="+">
                                </div>

                                <div id="ingredients_content2" class="ingredients_content p-2">
                                    
                                    <!-- 양념 개수에 따라 반복 + ,를 기준으로 잘라서 넣기 -->
                                    <div class="seasoning d-flex justify-content-between"></div>

                                </div>
                                
                                <input type="hidden" id="seasoningsInput" name="seasoning" value="">
								<input type="hidden" id="amountsInput" name="amount" value="">
                                

                                <div id="inputFields2" style="display: none;">

                                    <div>
                                        <input type="text" id="seasoningName" class="add_ingredient_seasoning_input_text" placeholder="양념 입력">
                                        <input type="text" id="seasoningQuantity" class="add_ingredient_seasoning_input_text" placeholder="재료량 입력">   
                                        <input id="addSeasoning" class="add_ingredient_seasoning_btn" type="button" value="추가">
                                    </div>
                                        
                                    <div class="d-flex flex-row-reverse" style="width: 444px;">
                                        <input class="add_ingredient_seasoning_cancel" id="cancelAdd2" type="button" value="×">   
                                    </div>

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
                        <textarea wrap="hard" name="recipeContent" id="recipe_content_area" class="input-text-style" placeholder="만드는 방법을 순차적으로 작성해주세요"></textarea>
                    </div>

                </div>

                <br>
                <div class="devide-gray-line"></div>
                <br>
                
                <div style="width: 80%; margin:auto;">
                	<input type="submit" class="submit-btn" value="작성하기">
                </div>

            </form>
            
            <br><br>
        </div>

        <br><br>
    </div>

    <script>
    
    const fileInput = document.getElementById("upfile");
    const previewImage = document.getElementById("previewImage");

    fileInput.addEventListener("change", function () {
        if (this.files && this.files[0]) {
            const reader = new FileReader();
            reader.onload = function (e) {
                previewImage.src = e.target.result;
            };
            reader.readAsDataURL(this.files[0]);
        } else {
            previewImage.src = ""; // 파일 선택이 취소된 경우 미리보기 이미지 초기화
        }
    });


        <!-- 주재료 추가하기 -->
        document.getElementById("add_ingredient_btn").addEventListener("click", function () {
            // 주재료 추가창 열기
            document.getElementById("inputFields").style.display = "block";
        });

        
        document.getElementById("addIngredient").addEventListener("click", function () {
        	
        	
            // 사용자가 입력한 주재료 이름, 주재료 수량 값 가져오기
            var ingredientName = document.getElementById("ingredientName").value;
            var ingredientQuantity = document.getElementById("ingredientQuantity").value;
            
            // 주재료 이름, 주재료 수량 입력칸이 모두 비어있을 시 주재료 추가창 닫기
            if (!ingredientName && !ingredientQuantity) {
                // Hide the input fields
                document.getElementById("inputFields").style.display = "none";
                return;
            }

         	// 주재료 이름, 주재료 수량 입력칸 중 하나가 비어있을 시 주재료 추가창 닫기
            document.getElementById("inputFields").style.display = "none";

            // 추가된 주재료 div 만들기(주재료 이름, 주재료 수량 모두 묶는 flex div)
            var newIngredient = document.createElement("div");
            newIngredient.className = "ingredient d-flex justify-content-between";

            // 왼쪽(주재료 이름 ingredient) 칸 만들고 입력한 값 넣어주기
            var leftContent = document.createElement("div");
            leftContent.className = "ingredient p-2";
            var ingredientNameElement = document.createElement("span");
            ingredientNameElement.className = "ingredient-name"; // 동적으로 생성된 span에 클래스명 부여(재료 이름)
            ingredientNameElement.textContent = ingredientName || "New Ingredient";
            leftContent.appendChild(ingredientNameElement);

            // 오른쪽(주재료 수량 ingredient quantity) 칸 만들고 입력한 값 넣어주기
            var rightContent = document.createElement("div");
            rightContent.className = "quantity p-2";
            var ingredientQuantityElement = document.createElement("span");
            ingredientQuantityElement.className = "quantity-value"; // 동적으로 생성된 span에 클래스명 부여(재료 수량)
            ingredientQuantityElement.textContent = ingredientQuantity || "1";
            rightContent.appendChild(ingredientQuantityElement);
            

            // 만든 왼쪽, 오른쪽 칸을 ingredient div에 넣어주기
            newIngredient.appendChild(leftContent);
            newIngredient.appendChild(rightContent);

            // "ingredients_content" container 아래에 ingredient div 넣어주기
            var ingredientsContent = document.querySelector("#ingredients_content");
            ingredientsContent.appendChild(newIngredient);

            // 추가되면 인풋박스 안의 글자 사라지게
            document.getElementById("ingredientName").value = "";
            document.getElementById("ingredientQuantity").value = "";
            
            <!---------추가한 요소를 한 문자열로 -------->
         	// 모든 주재료와 수량 요소를 선택
            var ingredientNameElements = document.querySelectorAll(".ingredient .ingredient-name");
            var quantityValueElements = document.querySelectorAll(".quantity .quantity-value");

            // 배열로 주재료 및 수량 값을 저장할 변수 선언
            var ingredients = [];
            var quantities = [];

            // 모든 주재료 요소에서 값을 추출하여 배열에 저장
            ingredientNameElements.forEach(function (ingredientElement) {
                var ingredient = ingredientElement.textContent.trim();
                ingredients.push(ingredient);
            });

            // 모든 수량 요소에서 값을 추출하여 배열에 저장
            quantityValueElements.forEach(function (quantityElement) {
                var quantity = quantityElement.textContent.trim();
                quantities.push(quantity);
            });

            // 주재료와 수량 배열을 합쳐서 출력
            var combinedIngredients = ingredients.join(",");
            var combinedQuantities = quantities.join(",");

            console.log("주재료:", combinedIngredients);
            console.log("수량:", combinedQuantities);
            
            // <input> 요소에 값을 설정
            document.getElementById("ingredientsInput").value = combinedIngredients;
            document.getElementById("quantitiesInput").value = combinedQuantities;

            
        });
        

        // x 표시 누르면 입력창 없어지게
        document.getElementById("cancelAdd").addEventListener("click", function () {
            // Hide the input fields
            document.getElementById("inputFields").style.display = "none";
        });

        // 추가한 재료 div 누르면 해당 div가 사라지게
        $(document).ready(function() {
            // Add a click event handler to all elements with the class "ingredient"
            $("#ingredients_content").on("click", ".ingredient", function() {
                $(this).remove();
            });
        });
        
        
        //================================


        <!-- 양념 추가하기 -->
        document.getElementById("add_seasoning_btn").addEventListener("click", function () {
        	// 양념 추가창 열기
            document.getElementById("inputFields2").style.display = "block";
        });

        document.getElementById("addSeasoning").addEventListener("click", function () {
        	// 사용자가 입력한 양념 이름, 양념 수량 값 가져오기
            var seasoningName = document.getElementById("seasoningName").value;
            var seasoningQuantity = document.getElementById("seasoningQuantity").value;

         	// 양념 이름, 양념 수량 입력칸이 모두 비어있을 시 양념 추가창 닫기
            if (!seasoningName && !seasoningQuantity) {
                // Hide the input fields
                document.getElementById("inputFields2").style.display = "none";
                return;
            }

         	// 양념 이름, 양념 수량 입력칸 중 하나가 비어있을 시 양념 추가창 닫기
            document.getElementById("inputFields2").style.display = "none";

            // 추가된 양념 div 만들기(양념 이름, 양념 수량 모두 묶는 flex div)
            var newSeasoning = document.createElement("div");
            newSeasoning.className = "seasoning d-flex justify-content-between";

         	// 왼쪽(양념 이름 seasoning) 칸 만들고 입력한 값 넣어주기
            var leftContent = document.createElement("div");
            leftContent.className = "seasoning p-2";
            var seasoningNameElement = document.createElement("span");
            seasoningNameElement.className = "seasoning-name";
            seasoningNameElement.textContent = seasoningName || "New Seasoning";
            leftContent.appendChild(seasoningNameElement);

         	// 오른쪽(양념 수량 amount) 칸 만들고 입력한 값 넣어주기
            var rightContent = document.createElement("div");
            rightContent.className = "amount p-2";
            var seasoningQuantityElement = document.createElement("span");
            seasoningQuantityElement.className = "amount-value";
            seasoningQuantityElement.textContent = seasoningQuantity || "1";
            rightContent.appendChild(seasoningQuantityElement);

         	// 만든 왼쪽, 오른쪽 칸을 seasoning div에 넣어주기
            newSeasoning.appendChild(leftContent);
            newSeasoning.appendChild(rightContent);

            // "ingredients_content2" container 아래에 seasoning div 넣어주기
            var ingredientsContent = document.querySelector("#ingredients_content2");
            ingredientsContent.appendChild(newSeasoning);

            // 추가되면 인풋박스 안의 글자 사라지게
            document.getElementById("seasoningName").value = "";
            document.getElementById("seasoningQuantity").value = "";
            
            
          	<!---------추가한 요소를 한 문자열로 -------->
         	// 모든 양념 및 양념 수량 요소를 선택
            var seasoningNameElements = document.querySelectorAll(".seasoning .seasoning-name");
            var amountValueElements = document.querySelectorAll(".amount .amount-value");

            // 배열로 양념 및 양념 수량 값을 저장할 변수 선언
            var seasonings = [];
            var amounts = [];

            // 모든 양념 요소에서 값을 추출하여 배열에 저장
            seasoningNameElements.forEach(function (seasoningElement) {
                var seasoning = seasoningElement.textContent.trim();
                seasonings.push(seasoning);
            });

            // 모든 양념 수량 요소에서 값을 추출하여 배열에 저장
            amountValueElements.forEach(function (amountElement) {
                var amount = amountElement.textContent.trim();
                amounts.push(amount);
            });

            // 양념과 양념 수량 배열을 합쳐서 출력
            var combinedSeasonings = seasonings.join(",");
            var combinedAmounts = amounts.join(",");

            console.log("양념:", combinedSeasonings);
            console.log("양념 수량:", combinedAmounts);
            
         	// <input> 요소에 값을 설정
            document.getElementById("seasoningsInput").value = combinedSeasonings;
            document.getElementById("amountsInput").value = combinedAmounts;

            
        });
        

        // x표시 누르면 인풋창 사라지게
        document.getElementById("cancelAdd2").addEventListener("click", function () {
            // Hide the input fields
            document.getElementById("inputFields2").style.display = "none";
        });

        //추가한 재료 div 누르면 해당 div가 사라지게
        $(document).ready(function() {
            // Add a click event handler to all elements with the class "seasoning" in the "ingredients_content2" container
            $("#ingredients_content2").on("click", ".seasoning", function() {
                $(this).remove();
            });
        });

        

        
    </script>

</body>

<jsp:include page="../common/footer.jsp"/>

</html>