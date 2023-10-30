<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>      
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자주 묻는 질문</title>
<!-- /* 필수 삽입  */  -->

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
        background: url(./img/icon-arrow-down.svg)no-repeat 95% 50%/15px auto;
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
        display: flex;
        align-items: center;
        justify-content: space-between;
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
        /* display: none; */
        padding: 20px;
        background-color: #fff;
    }
    .board-list .answer-bx1{
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
        padding: 10px 25px;
        width: 80px;
        background: #fff;
        border: 1px solid #333;
        font-size: 14px;
        font-weight: bold;
        color: #222;
    }
    .qna-wrap .search-wrap .btn1{
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 10px 25px;
        width: 80px;
        border: 1px solid rgb(201, 201, 201);
        font-size: 14px;
        font-weight: bold;
        color: #222;
    }
    .qna-wrap .search-wrap .btn:hover{
        cursor: pointer;
    }

    .qna-wrap .search-wrap .btn1:hover{
        cursor: pointer;
    }
    
        .ri-question-answer-line>pre {
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
</style>
</head>
<body style="background-color: #f5f5f5;">
    <jsp:include page="../common/header.jsp"/>
    <div class="qna-wrap" style="max-width: 1020px; margin: 0 auto; padding: 50px 0;">
        <h2>1:1 문의</h2>
   		<input type="hidden" id="answerContent" value="${qa.answerContent }">
        <ul class="board-list">
            <li>
                <div class="question-bx">
                    <div class="title">
                    	<input type="hidden" id="qaNo" value="${qa.qaNo }">
                        <h5>🔒${ qa.qaTitle }</h5>
                        <span>${ qa.userId } | ${ qa.qaDate } </span>
                    </div>
                    <i class="ri-arrow-up-s-line"></i>
                </div>
                <div class="answer-bx">
                    <p>
                        <i class="ri-question-answer-line"></i>

                            <br>
                            <br>
                            <pre>
${ qa.qaContent }
                            </pre>
                            <br>
                            <br>

                    </p>
                </div>
            </li>

            <br>

            <!-- 답변 있는 경우-->
            <c:if test="${ not empty qa.answerContent }">
            <li>
                <div class="question-bx">
                    <div class="title">
                        <h5>[RE:]${ qa.qaTitle }</h5>
                        <span>${ qa.answerId } | ${ qa.answerDate }</span>
                    </div>
                    <i class="ri-arrow-down-s-line"></i>
                </div>
                <div class="answer-bx1">
                    <p>
                        <br>
                        <i class="ri-question-answer-fill"></i>

                        <br>
                        <br>

                        ${ qa.answerContent }

                        <br>
                        <br>

                        <br>
                    </p>
                </div>
            </li>
            </c:if>
            
          
        </ul>
       
        <form action="">
            <div class="search-wrap">
                <a type="button" class="btn1" href="list.qa">목록</a>
                <a type="button" class="btn1" onclick="deleteQA();">삭제</a>
                <a type="button" class="btn"  onclick="updateQA();">수정</a>
            </div>
        </form>
    </div>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        $(document).ready(function(){
            $(".board-list li").click(function(){
                $(this).children(".question-bx").toggleClass('active');
                $(this).children(".answer-bx").slideToggle();
                $(this).children(".answer-bx1").slideToggle();
            });
        });
        
    </script>
    <script>
    	function deleteQA(){
		    let delConfirm = confirm("삭제할까요?");
		    if(delConfirm){
		    	location.href="delete.qa?qaNo=" + $("#qaNo").val()
		    }
	    }
    	
    	function updateQA(){
    		let answerStatus = $("#answerContent").val();
    		console.log(answerStatus);
    		if(answerStatus == ''){
    			location.href= "updateForm.qa?qaNo=" + $("#qaNo").val();
    		}else{
    			alertify.alert("🔔알립니다!딸랑!🔔","답변이 등록된 게시글은 수정할 수 없습니다!");
    		}
    	}
    </script>
    <jsp:include page="../common/footer.jsp"/>
</body>
</html>