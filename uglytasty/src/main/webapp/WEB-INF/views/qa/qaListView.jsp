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
   .qna-wrap h2{
       font-size: 35px;
       color: #000;
       font-weight: 600;
       padding: 20px 0;
       text-align: center;
   }
   .qna-wrap .sort{
       display: flex;
       justify-content: flex-end;
   }
   .qna-wrap .select-bx{
       border: 1px solid #ddd;
       padding: 15px 30px 15px 15px;
       -webkit-appearance:none; /* for chrome */
       -moz-appearance:none; /*for firefox*/
       appearance:none;
       background: url(resources/img/icon-arrow-down.svg)no-repeat 95% 50%/15px auto;
       background-size: 24px;
   }
   .board-list{
       padding: 0;
   }
   .board-list li{
       list-style: none;
   }
   .board-list li:first-child .question-bx{
       border-top: 1px solid #ddd;
   }
   .board-list .question-bx{
       padding: 15px 20px;
       align-items: center;
       border-bottom: 1px solid #ddd;
   }
   .board-list .question-bx:hover{
       cursor: pointer;
   }
   .board-list .title{
       width: 90%;
   }
   .board-list .title h5{
       line-height: 1.4;
       font-size: 18px;
       font-weight: 500;
       color: #333;
       margin: 0;
   }
   .board-list .title span{
       font-size: 14px;
       line-height: 1.1;
       color: #999;
       font-weight: 400;
   }
   .board-list .question-bx i{
       color: #ddd;
       font-size: 24px;
   }
   .board-list .question-bx.active i{
       transform: rotate(180deg);
   }
   .board-list .answer-bx{
       display: none;
       padding: 20px;
       background-color: #fff;
   }
   .board-list .answer-bx p{
       font-size: 14px;
   }
   .qna-wrap .pagination{
       display: flex;
       justify-content: center;
       column-gap: 5px;
       padding: 20px 0;
   }
   .qna-wrap .pagination .link{
       display: flex;
       align-items: center;
       justify-content: center;
       width: 40px;
       height: 40px;
       background: #fff;
       color: #333;
       text-decoration: none;
   }
   .qna-wrap .pagination .link.on{
       background: #fbf728;
   }
   .qna-wrap .input{
       border: 1px solid #ddd;
       background: #fff;
       padding: 15px 20px;
       width: 100%;
   }
   .qna-wrap .search-wrap{
       display: flex;
       column-gap: 8px;
       justify-content: center;
       margin-top: 20px;
   }
   .qna-wrap .search-wrap .btn{
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
   .qna-wrap .search-wrap .btn:hover{
       cursor: pointer;
   }
   .small {
       background-color: #ffd900;
       font-size: 0.6rem;
       padding: 2px;
   }
</style>
</head>
<body style="background-color: #f5f5f5;">

	<jsp:include page="../common/header.jsp"/>
	
    <div class="qna-wrap" style="max-width: 1020px; margin: 0 auto; padding: 50px 0;">
        <h2>1:1 문의</h2>
        <div class="sort">
            <select class="select-bx" id="categoryBox" onchange="selectQaList();">
                <option value="0">전체</option>
                <option value="1">상품문의</option>
                <option value="2">배송문의</option>
                <option value="3">주문/취소문의</option>
                <option value="4">반품/교환문의</option>
                <option value="5">주문/결제</option>
                <option value="6">정기구독문의</option>
                <option value="7">쿠폰/적립금</option>
                <option value="8">회원정보관련</option>
                <option value="9">기타문의</option>
            </select>
        </div>
        <br>
        <div class="sort" style="color:gray;">* 카테고리를 선택하면 카테고리별 게시글을 한꺼번에 확인 할 수 있어요!</div>
        
        
        <script>
        	function selectQaList(){
        		$.ajax({
        			url:"ajaxList.qa",
        			data:{categoryNo:$("#categoryBox").val()},
        			success:function(data){
        					$(".board-list").empty();
	        				if(data.length != 0){
	        					let value = "";
	        					for(let q in data){
	        						value += "<li>"
	        								+ "<div class='question-bx'>"
	        								+ "<div class='title'>"
	        								+ "<h5>🔒비밀글 입니다. <small class='small'>NEW</small></h5>"
	        								+ "<span>" + data[q].qaCategory + "|" + data[q].userId + "|" + data[q].qaDate +  "</span>"
	        								+ "</div>"
	        								+ "</div>"
	        								+ "</li>";
	        					}
        						$(".board-list").append(value);
        						$(".pagination").empty();
        				}else{
        					let value = "<div class='question-bx'>"
								+ "<div class='title'>"
								+ "작성된 게시글이 없습니다."
								+ "</div>"
								+ "</div>";
        					$(".board-list").append(value);
        					$(".pagination").empty();
        				}
        				console.log(data);
        			}, error:function(){
        				
        			}
        		})
        	}
        </script>
        
        <br>
        <ul class="board-list">
        
        	<c:choose>
        		<c:when test="${ empty list }">
        			<!-- 작성된 게시글이 없을 경우-->
	                <div class="question-bx" align="center">
	                    <div class="title" align="center">
	                       작성된 게시글이 없습니다.
	                    </div>
	                </div>
        		</c:when>
        		<c:otherwise>
        			<c:forEach var="q" items="${ list }">
            		<li>
        				<!-- 작성된 게시글이 있을 경우-->
		                <div class="question-bx">
		                    <div class="title">
		                        <h5>🔒비밀글 입니다. <small class="small">NEW</small></h5>
		                        <span>${ q.qaCategory } | ${ q.userId } | ${ q.qaDate }</span>
		                    </div>
		                </div>
            		</li>
        			</c:forEach>
        		
        		</c:otherwise>
        	</c:choose>
           
        </ul>
        <div class="pagination">
            <c:choose>
	        	<c:when test="${ empty condition }"> 
        			<!-- 검색조건 없을 때 페이징 이전버튼 -->
		      		<c:if test="${ pi.currentPage ne 1 }">
		         		<a href="list.qa?cpage=${ pi.currentPage - 1 }" class="link prev"><i class="ri-arrow-left-s-line"></i></a>
		         	</c:if>
         		</c:when>
         		<c:otherwise>
         			<!--  검색조건 있을 때 페이징 이전버튼 -->
         			<c:if test="${ pi.currentPage ne 1 }">
		         		<a href="search.qa?cpage=${ pi.currentPage - 1 }&condition=${ condition }&keyword=${ keyword }" class="link prev"><i class="ri-arrow-left-s-line"></i></a>
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
			            		<a href="list.qa?cpage=${ p }" class="link on">${ p }</a>
			            	</c:when>
			            	<c:otherwise>
			            		<!-- 선택하지 않은 페이징 바 -->
			            		<a href="list.qa?cpage=${ p }" class="link">${ p }</a>
			            	</c:otherwise>
		            	</c:choose>
        			</c:when>
        			<c:otherwise>
        				<!-- 검색조건 있을 때 페이징 현재바 -->
        				<c:choose>
			            	<c:when test="${ pi.currentPage eq p }">
			            		<!-- 선택한 페이징 바 (컬러링) -->
			            		<a href="search.qa?cpage=${ p }&condition=${ condition }&keyword=${ keyword }" class="link on">${ p }</a>
			            	</c:when>
			            	<c:otherwise>
			            		<!-- 선택하지 않은 페이징 바 -->
			            		<a href="search.qa?cpage=${ p }&condition=${ condition }&keyword=${ keyword }" class="link">${ p }</a>
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
        
        
        <form action="search.qa" id="searchForm">
            <div class="search-wrap">
                <select class="select-bx" name="period">
                    <option value="all">전체</option>
                    <option value="week">일주일</option>
                    <option value="month">한달</option>
                </select>
                <select class="select-bx" name="condition">
                    <option value="all">제목+내용</option>
                    <option value="title">제목</option>
                    <option value="content">내용</option>
                </select>
                <input type="text" class="input" name="keyword" value="${ keyword }">
                <button type="submit" class="btn">검색</button>
            </div>
        </form>
    </div>
    
    <script>
        $(document).ready(function(){
            $(".board-list li").click(function(){
                $(this).children(".question-bx").toggleClass('active');
                $(this).children(".answer-bx").slideToggle();
            });
            
            $("#searchForm option[value='${period}']").attr("selected", true);
            $("#searchForm option[value='${condition}']").attr("selected", true);
        });
    </script>
</body>
	
</html>