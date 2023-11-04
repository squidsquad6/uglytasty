<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>먹비티아이 검사</title>
<style>
     div * {box-sizing: border-box;}

    .all {
        margin: auto;
        width: 1400px;
    }
 
    hr{
        width: 700px;
        margin-left: 0;
        border: 10px solid #f2f2f2;
        margin: 50px 0;
    }
    #testForm input {
        width: 700px;
        height: 45px;
        border: 1px solid #dadada;
        border-radius: 10px;
    }
   

    #testForm p {
        color: #ff6741;
        font-size: 16px;
        font-weight: bold;
    }
    
    #testerName {
    	padding-left: 10px;
    	color: gray;
    }
	
	
   
	
	 /*먹비티*/
    .foodCard{
        margin-left: 0%;
    }
    
    
    .insertCardImg1{
        content:url(resources/images/밥.png);
        width:300px;
        border-radius: 10px;
        margin-right: 20px;
    }
    .insertCardImg2{
        content:url(resources/images/빵.png);
        width:300px;
        border-radius: 10px;
        margin-right: 20px;
    }
    .insertCardImg3{
        content:url(resources/images/김치찌개.png);
        width:300px;
        border-radius: 10px;
        margin-right: 20px;
    }
    .insertCardImg4{
        content:url(resources/images/짬뽕.png);
        width:300px;
        border-radius: 10px;
        margin-right: 20px;
    }
    .insertCardImg5{
        content:url(resources/images/백숙.png);
        width:300px;
        border-radius: 10px;
        margin-right: 20px;
    }
    .insertCardImg6{
        content:url(resources/images/치킨.png);
        width:300px;
        border-radius: 10px;
        margin-right: 20px;
    }
    .insertCardImg7{
        content:url(resources/images/샐러드.png);
        width:300px;
        border-radius: 10px;
        margin-right: 20px;
    }
    .insertCardImg8{
        content:url(resources/images/나쵸.png);
        width:300px;
        border-radius: 10px;
        margin-right: 20px;
    }
    .insertCardImg9{
        content:url(resources/images/김치볶음밥.png);
        width:300px;
        border-radius: 10px;
        margin-right: 20px;
    }
    .insertCardImg10{
        content:url(resources/images/카츠동.png);
        width:300px;
        border-radius: 10px;
        margin-right: 20px;
    }
    .insertCardImg11{
        content:url(resources/images/부침개.png);
        width:300px;
        border-radius: 10px;
        margin-right: 20px;
    }
    .insertCardImg12{
        content:url(resources/images/피자.png);
        width:300px;
        border-radius: 10px;
        margin-right: 20px;
    }
    .insertCardImg13{
        content:url(resources/images/잡채.png);
        width:300px;
        border-radius: 10px;
        margin-right: 20px;
    }
    .insertCardImg14{
        content:url(resources/images/팟타이.png);
        width:300px;
        border-radius: 10px;
        margin-right: 20px;
    }



	/* radio버튼 숨기고, img랑 엮고, 누르면 아웃라인 표시되도록*/
   [type=radio] { 
        position: absolute;
        opacity: 0;
        width: 0;
        height: 0;
    }
    [type=radio] + label {
        cursor: pointer;
    }
    [type=radio]:checked + label {
        outline: 3px solid #ff6741;
        border-radius: 40px;
    }
    
    
    .finishBtn {
    	padding: 15px 200px;
    
        width: 710px;
        height: 70px;
        border: 1px solid #ff6741;
        border-radius: 5px;
        background-color: #ff6741;
        color: white;
        margin-top: 30px;
        margin-bottom: 50px;
        font-weight: bold;
        font-size: 18px;
        cursor: pointer;
    }
    .finishBtn:hover {
        filter: brightness(0.9);
        color: white;
        text-decoration: none;
    }
    
    .vs {
    	font-size: 50px;
    	font-weight: 200px;
    	color: gray;
    	padding-left: 10px;
    	padding-right: 10px;
    }


</style>

</head>

<body>

	<!-- 헤더 -->
    <jsp:include page="../common/header.jsp"/>
    

	<div class="all" align="center">
		<br><br><br><br>
		<!-- 
        <h2 style="font-weight:bold;">주문확인 및 결제</h2><br>
         -->
        <img src="https://m2.yes-us.co.kr/images/tit.gif">
        <br><br><br><hr><br><br>

        <form id="testForm" action="testResult.eat">
			
			<br><br>
            <h3 style="padding-right:480px;">😋 먹비티아이 검사자</h3><br>
			<!-- 
            <p>먹비티아이 검사자</p>
            <p style="font-size:10px;"></p><p style="font-weight: 400; font-size:10px;">* 기본적으로 회원의 정보를 넣어두었습니다. 받는사람 변경 시 다시 입력해주세요.</p>
             -->
            
            <c:choose>
				<c:when test="${ not empty loginMember }">
		            <input type="text" id="testerName" name="tester" placeholder="성함을 입력해주세요." value="${ loginMember.userName }" readonly> <br><br><br><br>
				</c:when>
				<c:otherwise>
		            <input type="text" id="testerName" name="tester" placeholder="성함을 입력해주세요." value=""> <br><br><br><br>
				</c:otherwise>            
            </c:choose>
            

            <br>
            <h3 style="padding-right:480px;">🔎 신나게 골라보세요!</h3><br>
            <div class="foodCard">
                <input type="radio" name="one" value="Y" id="1"><label for="1" class="insertCardImg1"></label><span class="vs">vs</span>
                <input type="radio" name="one" value="N" id="2"><label for="2" class="insertCardImg2"></label><br><br>
                <input type="radio" name="two" value="Y" id="3"><label for="3" class="insertCardImg3"></label><span class="vs">vs</span>
                <input type="radio" name="two" value="N" id="4"><label for="4" class="insertCardImg4"></label><br><br>
                <input type="radio" name="three" value="Y" id="5"><label for="5" class="insertCardImg5"></label><span class="vs">vs</span>
                <input type="radio" name="three" value="N" id="6"><label for="6" class="insertCardImg6"></label><br><br>
                <input type="radio" name="four" value="Y" id="7"><label for="7" class="insertCardImg7"></label><span class="vs">vs</span>
                <input type="radio" name="four" value="N" id="8"><label for="8" class="insertCardImg8"></label><br><br>
                <input type="radio" name="five" value="Y" id="9"><label for="9" class="insertCardImg9"></label><span class="vs">vs</span>
                <input type="radio" name="five" value="N" id="10"><label for="10" class="insertCardImg10"></label><br><br>
                <input type="radio" name="six" value="Y" id="11"><label for="11" class="insertCardImg11"></label><span class="vs">vs</span>
                <input type="radio" name="six" value="N" id="12"><label for="12" class="insertCardImg12"></label><br><br>
                <input type="radio" name="seven" value="Y" id="13"><label for="13" class="insertCardImg13"></label><span class="vs">vs</span>
                <input type="radio" name="seven" value="N" id="14"><label for="14" class="insertCardImg14"></label><br><br>
            </div>

        	<button type="submit" class="finishBtn">두구! 두구! 확인하러가기</button>
        	
        </form>
        
        <br><br><br><br><br><br><br>
        
    </div>







	<!-- 푸더 -->
    <jsp:include page="../common/footer.jsp"/>


</body>
</html>