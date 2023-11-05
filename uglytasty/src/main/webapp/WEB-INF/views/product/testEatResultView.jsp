<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!-- 
	tester : 테스트 검사자
	
	Y가 4개 이상이었다면(과반수)	: inner(집밥형)
	Y가 3개 이하였다면			: outer(외식형)
 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>먹비티아이 검사 결과</title>
<style>
     div * {box-sizing: border-box;}

    .all {
        margin: auto;
        width: 1400px;
    }
    
    .homeBtn {
    	
    	padding: 15px 120px;
    
       
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
    .homeBtn:hover {
        filter: brightness(0.9);
        color: white;
        text-decoration: none;
    }
    
    
    
    .insertCardImg1{
        content:url(resources/images/집밥형1.png);
        width:500px;
    }
    .insertCardImg2{
        content:url(resources/images/외식형2.png);
        width:500px;
    }
    
    .testResult h2 {
    	font-weight: bold;
    }
    
    .testResult table {
    	border: 1px solid #ff6741;
    	border-radius: 10px;
    	width: 600px;
    	color: gray;
    }

	.testResult th {
    	padding-top: 15px;	
    	padding-left: 50px;
    	padding-right: 50px;
	}    
    .testResult td {
    	padding-left: 10px;
    	padding-bottom: 15px;
    	text-align: center;
    }
    
    
</style>

</head>
<body>
	
	<!-- 헤더 -->
    <jsp:include page="../common/header.jsp"/>

		
	<div class="all">
	
		<div align="center" class="testResult">
			<br><br><br><br>
			
	        <h3 align="left" style="padding-left: 350px;">📃 검사 결과</h3><br>
	     
			<!-- 검사 결과 -->
			<c:choose>
			    <c:when test="${ not empty inner }">
			        <label class="insertCardImg1"></label>
			        <h2>' 집밥형 '</h2>
			        <br><br>
					<table>
						<tr>
							<th>
								<p align="center">[ ${ tester } ] 님은 [ 집밥형 ] 입니다.</p><hr>
							</th>
						</tr>
						<tr>
							<td>
								<p>못난이맛난이 회원으로 제격인 유형</p>
								<p>집밥을 좋아하는 당신, 못난이 상품들로 더욱 다양한 요리들에 도전해보세요!</p>
							</td>
						</tr>
					</table>
			    </c:when>
			    <c:otherwise>
			        <label class="insertCardImg2"></label>
			        <h2>' 외식형 '</h2>
			        <br><br>
					<table>
						<tr>
							<th>
								<p align="center">[ ${ tester } ] 님은 [ 외식형 ] 입니다.</p><hr>
							</th>
						</tr>
						<tr>
							<td>
								<p>못난이맛난이 회원이 된다면 더욱 건강해질 유형</p>
								<p>외식을 좋아하는 당신, 못난이 상품들로 간단한 요리부터 시작해보세요!</p>
							</td>
						</tr>
					</table>
			    </c:otherwise>
			</c:choose>
			
			
			
			<br><br>
			<a href="test.eat" class="homeBtn">한번 더 ^^!</a>
			<a href="/uglytasty" class="homeBtn">홈으로</a>
		</div>
           

        <br><br><br><br><br><br><br>

		
		<!-- 푸더 -->
	    <jsp:include page="../common/footer.jsp"/>
		
		
	</div>
	
</body>
</html>