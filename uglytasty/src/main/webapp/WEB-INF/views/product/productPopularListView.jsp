<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 
	plist : productNo, productName, price, sale, explantion, location, productionDate, stock, count, enrollDate, fileLevel / salePrice
 -->
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 인기순 리스트</title>
<style>
	div * {box-sizing: border-box;}

    .all {
        margin: auto;
        width: 1400px;
    }

    .search input {
        width: 950px;
        height: 50px;
        border-radius: 6px;
        border: 1px solid lightgray;
    }
    .search button {
        width: 150px;
        height: 50px;
        background-color: #ff6741;
        color: white;
        border: none;
        margin: 30px 0;
        border-radius: 6px;
        cursor: pointer;
    }
    .search button:hover {
        filter: brightness(0.9);
    }

    .orderby {
        margin-left: 150px;
        float: left;
    }
    .orderby a {
        font-size: 15px;
        color: #ff6741;
        text-decoration: none;
        font-weight: bold;
    }
    .enrollBtn a {
        text-decoration: none;
        background-color: gray;
        padding: 15px 20px;
        color: white;
        border-radius: 5px;
        margin-right: 150px;
    }
    .enrollBtn a:hover {
        filter: brightness(0.9);
        text-decoration: none;
        color: white;
    }

    .listAll {
        margin-left: 150px;
        cursor: pointer;
    }
    .item {
        float: left;
        width: 30%;
        height: 480px;
        /* border: 1px solid red; */
    }
   
    .itemImg img {
        width: 360px;
        height: 350px;
    }
    .itemImg:hover {
      filter: brightness(0.9);
    }
    .item .itemInfo {
        margin-top: 20px;
        margin-bottom: 50px;
    }
    .item p {
        font-size: 18px;
        margin: 0;
    }
    .item .sale {
        color: #ff6741;
        font-size: 18px;
        font-weight: bold;
        margin: 0px;
    }
    .item .originPrice {
        text-decoration: line-through;
        color: gray;
        font-size: 18px;
        font-weight: bold;
        padding-left: 10px;
    }
    .item .salePrice {
        color: black;
        font-size: 18px;
        font-weight: bold;
        margin: 0px;
    }

    .soldout {
        position: relative;
    }
    .soldout::before{
        content: "";
        opacity: 0.5;
        position: absolute;
        top: 0px;
        left: 0px;
        right: 15px;
        bottom: 0px;
        background-color: #000;
    }

    .item {
        position: relative;
    }
    .soldout_text {
        position: absolute;
        color: white;
        top: 33%;
        left: 22%;
        transition: translate(-50%, -50%);
        font-size: 20px;
        text-align: center;
        border: 1px solid white;
        border-radius: 10px;
        width: 200px;
        height: 45px;
        line-height: 2.5;
    }
    
    /* 푸터 영향받지 않도록 itemAll 에 넣은 스타일 */
    .clearfix::after {	
	    content: "";
	    display: table;
	    clear: both;
	}
	
	
	
	/*가격낮은순*/
	.toptext {
		margin: 50px 0px;
	}
	.popularProduct {
		color: gray;
		font-size: 20px;
		font-weight: bold;
	}
	.ddaum {
		color: #ff6741;
		font-size: 30px;
		font-weight: bold;
	}
	.point {
		color: #ff6741;
		font-size: 20px;
		font-weight: bold;
	}
    
    
</style>

</head>
<body>

	<!-- 헤더자리 -->
	<jsp:include page="../common/header.jsp"/>

	<div class="all">
		
		<br><br>
		
		<!-- 상품(키워드) 검색 -->
        <form action="searchKeyword.pro">
            <div align="center" class="search">
                <input type="text" name="keyword" value="" placeholder="검색할 못난이(상품)를 입력해주세요" id="searchInput">
                <button type="submit" id="searchBtn">검색</button>
            </div>
        </form>

        <br><br>
        <div class="orderby" align="left">
            <a href="list.pro">전체</a>&nbsp;&nbsp;|&nbsp;
            <a href="list.pro">최신순</a>&nbsp;&nbsp;|&nbsp;
            <a href="popularlist.pro">인기순</a>&nbsp;&nbsp;|&nbsp;
            <a href="lowerpricelist.pro">가격낮은순</a>
        </div>
        <div class="enrollBtn" align="right">
            <!-- 관리자만 보이는 버튼 -->
            <c:if test="${ loginMember.userId eq 'admin' }">
	            <a href="enrollForm.pro">등록하기</a>
            </c:if>
        </div>
        <br><br>

        <div class="listAll clearfix">
        
        	<div align="center" style="padding-right:100px;" class="toptext">
	        	<span class="ddaum">👍</span>
    	    	<span class="popularProduct">가장 <span class="point">인기있는<span class="popularProduct"> 못난이 순으로 살펴보세요</span>
        		<span class="ddaum">👍</span>
        	</div>
            
            
            <!-- 상품 더미 (나중에 지울거) -->
            <div class="item">
                <div class="itemImg">
                    <img src="https://d3cpiew7rze14b.cloudfront.net/photos/ee4313ab-eb2f-4c43-9e00-dda69b237b9b.jpeg?w=360">
                </div>
                <div class="itemInfo">
                    <p>친환경 상주 곶감, 반건시 선물용/식속형</p>
                    <span class="sale">44%</span>
                    <img src="https://d3cpiew7rze14b.cloudfront.net/assets/ustore/discount-arrow.svg">
                    <span class="originPrice">38,000</span>
                    <span class="salePrice">21,000</span>
                    <span class="salePrice">원</span>
                </div>
            </div>
            <div class="item">
                <div class="itemImg soldout">
                    <img src="https://all-to-delicious.s3.ap-northeast-2.amazonaws.com/atd/a2dcorp.co.kr/admin/product/detail/product_image/7ab0a37e5aec4fa2bfc1e9260be824e9.png">
                </div>
                <div class="soldout_text">
                    <p>다음에 다시 만나요!</p>
                </div>
                <div class="itemInfo">
                    <p>친환경 상주 곶감, 반건시 선물용/식속형</p>
                    <span class="sale">44%</span>
                    <img src="https://d3cpiew7rze14b.cloudfront.net/assets/ustore/discount-arrow.svg">
                    <span class="originPrice">38,000</span>
                    <span class="salePrice">21,000</span>
                    <span class="salePrice">원</span>
                </div>
            </div>
            
            
            
            
			<!-- (status='Y') plist 상품들 촤락 -->	
			<c:forEach var="p" items="${plist}">
			    <div class="item">
			        <div class="itemImg">
			            <img src="${p.changeName}">
			            <!-- hidden : 내가 클릭한 게시글 번호 가져오기 위해 -->
			            <input type="hidden" value="${p.productNo}">
			        </div>
			        <div class="itemInfo">
			            <p>${p.productName}</p>
			            <span class="sale">${p.sale}</span><span class="sale">%</span>
			            <img src="https://d3cpiew7rze14b.cloudfront.net/assets/ustore/discount-arrow.svg">
			            <span class="originPrice"><fmt:formatNumber value="${p.price}" pattern="#,###"/></span>
			            <span class="salePrice" id="calculationResult_${p.productNo}"><fmt:formatNumber value="${ p.salePrice }" pattern="#,###"/></span>
			            <span class="salePrice">원</span>
			        </div>
			    </div>
			</c:forEach>
	
			  
			<!-- 키워드 검색 후 리스트 keylist 상품들 촤락 -->
			<c:choose>
				<c:when test="${ not empty keylist }">
					
					<c:forEach var="k" items="${keylist}">
					    <div class="item">
					        <div class="itemImg">
					            <img src="${k.changeName}">
					            <!-- hidden : 내가 클릭한 게시글 번호 가져오기 위해 -->
					            <input type="hidden" value="${k.productNo}">
					        </div>
					        <div class="itemInfo">
					            <p>${k.productName}</p>
					            <span class="sale">${k.sale}</span><span class="sale">%</span>
					            <img src="https://d3cpiew7rze14b.cloudfront.net/assets/ustore/discount-arrow.svg">
					            <span class="originPrice">${k.price}</span>
					            <span class="salePrice" id="calculationResult_${k.productNo}">${ k.salePrice }</span>
					            <span class="salePrice">원</span>
					        </div>
					    </div>
					</c:forEach>
		            
				</c:when>
				<c:otherwise>
					<p></p>
				</c:otherwise>			
			</c:choose>
			
		
			
			
            
            
            
            <!-- 해당 게시물 눌루하면 상세페이지로.. -->
            <script>
            	$(function(){
            		$(".item").click(function(){
            			location.href = 'detail.pro?pno=' + $(this).find("input").val();
            		})
            	})
            </script>
            
        
        </div>
        
        
    </div>

	<br><br><br><br><br><br><br><br>

	<!-- 푸터 -->
    <jsp:include page="../common/footer.jsp"/>




</body>
</html>