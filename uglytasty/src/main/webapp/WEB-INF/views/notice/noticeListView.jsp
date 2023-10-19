<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/remixicon@3.5.0/fonts/remixicon.css" rel="stylesheet">
<style>
    *, *:after, *:before {
        box-sizing: inherit;
    }
    select, input:focus{
        outline: none;
    }
    .notice-wrap h2{
        font-size: 35px;
        color: #000;
        font-weight: 600;
        padding: 20px 0;
        text-align: center;
    }
    .notice-wrap .sort{
        display: flex;
        justify-content: flex-end;
    }
    .notice-wrap .select-bx{
        border: 1px solid #ddd;
        padding: 15px 30px 15px 15px;
        -webkit-appearance:none; /* for chrome */
        appearance:none;
        background: url(resources/img/icon-arrow-down.svg)no-repeat 95% 50%/15px auto;
        background-size: 24px;
    }
    .notice-list{
        padding: 0;
    }
    .notice-list li{
        list-style: none;
    }
    .notice-list li:first-child .noticeTitle-bx{
        border-top: 1px solid #ddd;
    }
    .notice-list .noticeTitle-bx{
        padding: 15px 20px;
        display: flex;
        align-items: center;
        justify-content: space-between;
        border-bottom: 1px solid #ddd;
    }
    .notice-list .noticeTitle-bx:hover{
        cursor: pointer;
    }
    .notice-list .title{
        width: 90%;
    }
    .notice-list .title h5{
        line-height: 1.4;
        font-size: 18px;
        font-weight: 500;
        color: #333;
        margin: 0;
    }
    .notice-list .title span{
        font-size: 14px;
        line-height: 1.1;
        color: #999;
        font-weight: 400;
    }
    .notice-list .noticeTitle-bx i{
        color: #ddd;
        font-size: 24px;
    }
    .notice-list .noticeTitle-bx.active i{
        transform: rotate(180deg);
    }
    .notice-list .noticeContent-bx{
        display: none;
        padding: 20px;
        background-color: #fff;
    }
    .notice-list .noticeContent-bx p{
        font-size: 14px;
    }
    .notice-wrap .pagination{
        display: flex;
        justify-content: center;
        column-gap: 5px;
        padding: 20px 0;
    }
    .notice-wrap .pagination .link{
        display: flex;
        align-items: center;
        justify-content: center;
        width: 40px;
        height: 40px;
        background: #fff;
        color: #333;
        text-decoration: none;
    }
    .notice-wrap .pagination .link.on{
        background: #fbf728;
    }
    .notice-wrap .input{
        border: 1px solid #ddd;
        background: #fff;
        padding: 15px 20px;
        width: 100%;
    }
    .notice-wrap .search-wrap{
        display: flex;
        column-gap: 8px;
        justify-content: center;
        margin-top: 20px;
    }
    .notice-wrap .search-wrap .btn{
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 15px 20px;
        width: 80px;
        background: #fff;
        border: 1px solid #333;
        font-size: 14px;
        color: #222;
    }
    .notice-wrap .search-wrap .btn:hover{
        cursor: pointer;
    }
</style>
</head>
<body style='background-color: #f5f5f5;'>

	<jsp:include page="../common/header.jsp"/>
	
    <div class="notice-wrap" style="max-width: 1020px; margin: 0 auto; padding: 50px 0;">
        
        <h2>공지사항</h2>
        <br><br>
        <ul class="notice-list">
        	
        	<c:forEach var="n" items="${ list }">
        
	            <li>
	                <div class="noticeTitle-bx">
	                    <div class="title">
	                    
	                    	<c:choose>
	                    		<c:when test="${ n.upfix eq 'Y' }">
	                    			<h5 style="color:gray;">📌&nbsp;${ n.noticeTitle }</h5>
	                    		</c:when>
	                    		<c:otherwise>
	                    			<h5>${ n.noticeTitle }</h5>
	                    		</c:otherwise>
	                        </c:choose>
	                        <span>${ n.userName }</span>
	                    </div>
	                    <i class="ri-arrow-up-s-line"></i>
	                </div>
	                <div class="noticeContent-bx">
	                    <p>
	                        ${ n.noticeContent }
	                    </p>
	                </div>
	            </li>
            
            </c:forEach>
            
        </ul>
        
        <div class="pagination">
        	
	        <c:choose>
	        	<c:when test="${ empty condition }"> 
        			<!-- 검색조건 없을 때 페이징 이전버튼 -->
		      		<c:if test="${ pi.currentPage ne 1 }">
		         		<a href="list.no?cpage=${ pi.currentPage - 1 }" class="link prev"><i class="ri-arrow-left-s-line"></i></a>
		         	</c:if>
         		</c:when>
         		<c:otherwise>
         			<!--  검색조건 있을 때 페이징 이전버튼 -->
         			<c:if test="${ pi.currentPage ne 1 }">
		         		<a href="search.no?cpage=${ pi.currentPage - 1 }&condition=${ condition }&keyword=${ keyword }" class="link prev"><i class="ri-arrow-left-s-line"></i></a>
		         	</c:if>
         		</c:otherwise>
         	</c:choose> 
	            
	            
	            
        	<c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
        	
        		<c:choose>
        			<c:when test="${ empty condition }">
        				<!-- 검색조건 없을 때 페이징 현재바 -->
	        			<c:choose>
			            	<c:when test="${ pi.currentPage eq p }">
			            		<!-- 선택한 페이징 바 (컬러링) -->
			            		<a href="list.no?cpage=${ p }" class="link on">${ p }</a>
			            	</c:when>
			            	<c:otherwise>
			            		<!-- 선택하지 않은 페이징 바 -->
			            		<a href="list.no?cpage=${ p }" class="link">${ p }</a>
			            	</c:otherwise>
		            	</c:choose>
        			</c:when>
        			<c:otherwise>
        				<!-- 검색조건 있을 때 페이징 현재바 -->
        				<c:choose>
			            	<c:when test="${ pi.currentPage eq p }">
			            		<!-- 선택한 페이징 바 (컬러링) -->
			            		<a href="search.no?cpage=${ p }&condition=${ condition }&keyword=${ keyword }" class="link on">${ p }</a>
			            	</c:when>
			            	<c:otherwise>
			            		<!-- 선택하지 않은 페이징 바 -->
			            		<a href="search.no?cpage=${ p }&condition=${ condition }&keyword=${ keyword }" class="link">${ p }</a>
			            	</c:otherwise>
		            	</c:choose>
        			</c:otherwise>
	            </c:choose>
	            
            </c:forEach>
	           
	           
	       
	        <c:choose>
	        	<c:when test="${ empty condition }">
	        		<!-- 검색조건 없을 때 페이징 다음버튼 -->
		         	<c:if test="${ pi.currentPage ne pi.maxPage }">
		          		<a href="list.no?cpage=${ pi.currentPage + 1 }" class="link next"><i class="ri-arrow-right-s-line"></i></a>
		          	</c:if>
          		</c:when>
          		<c:otherwise>
          			<!-- 검색조건 있을 때 페이징 다음버튼 -->
          			<c:if test="${ pi.currentPage ne pi.maxPage }">
		          		<a href="search.no?cpage=${ pi.currentPage + 1 }&condition=${ condition }&keyword=${ keyword }" class="link next"><i class="ri-arrow-right-s-line"></i></a>
		          	</c:if>
          		</c:otherwise>
	        </c:choose>       
	            
	            

	            
	            
	            
        </div>
        
        
        <form action="search.no" id="searchForm">
            <div class="search-wrap">
                <select class="select-bx" name="condition">
                    <option value="total">제목+내용</option>
                    <option value="title">제목</option>
                    <option value="content">내용</option>
                </select>
                <input type="text" class="input" name="keyword" value="${ keyword }">
                <button type="submit" class="btn">검색</button>
            </div>
        </form>
        
        
    </div>
    <script>
        $(function(){
        	$("#searchForm option[value='${condition}']").attr("selected", true);
        	
            $(".notice-list li").click(function(){
                $(this).children(".noticeTitle-bx").toggleClass('active');
                $(this).children(".noticeContent-bx").slideToggle();
            });
            
            
           
        });
    </script>

</body>
</html>