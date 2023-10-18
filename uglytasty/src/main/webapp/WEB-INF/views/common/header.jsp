<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script> 

    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- 공통 폰트 -->
    <link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/static/pretendard.css" />
    
    <style>

        /* ===== 세부페이지마다 공통적으로 유지할 style ===== */
        * {
            box-sizing:border-box;
            font-family: 'Pretendard';
            padding: 0;
            margin: 0;
            vertical-align: middle;
        }

        .YRcontent {
            width:1400px;
            margin:auto;
        }

        #header{
            /* border: 1px solid gray; */
            margin: auto;
            width: 80%; /* 퍼센트로 할지 px로 고정할지 고민*/
            height:60px;
            padding: 12px;
            align-items: center;
            background-color: transparent;
        }

        
        #header_menulist a:hover {
            color: #ff6741;
            padding-bottom: 10px;
            border-bottom: 3px solid #ff6741;
        }


        /* ================ 로고 이미지 + 메뉴 리스트 =============== */

        #header_logoimg_menulist{
            /* border: 1px solid red; */
        }

        /* -------------------- 로고 이미지 --------------------- */
        #header_logoimg{
            /* border: 1px solid orange; */
        }
        #header_logoimg img{
            width: 200px;
        }

        /* -------------------- 메뉴 리스트 --------------------- */
        #header_menulist{
            /* border: 1px solid yellowgreen; */
            padding: 5px;
        }
        
        #header_menulist a{
            padding-left: 22px;
            padding-right: 22px;
            text-decoration: none;
            color: rgb(58, 58, 58);
        }
        #header_menulist span{ /* 메뉴(글씨) */
            font-size: 15px;
        }

        /* =============== 로그인 + 장바구니 + 마이페이지 + 로그아웃 ============ */

        #header_login_cart_mypage_logout{
            /* border: 1px solid blue; */
        }

        /*------------- 로그인 전 ---------------*/
        #login_btn{
            text-decoration: none;
            color: rgb(31 41 55);
            border: 1px solid rgb(31 41 55);
            width: 57px;
            height: 30px;
            font-size: 14px;
            font-weight: 600;
            border-radius: 9999px;
            background-color: transparent;
        }

        /* ------------- 로그인 후 --------------- */
        #after_login a{ /*메뉴들이 버튼으로 바뀌면 수정될 스타일*/
            text-decoration: none;
            color: rgb(58, 58, 58);
        }
        #after_login span{
            font-size: 14px;
            padding: 5px;
        }


    </style>
    
</head>
<body>

	<c:if test="${ not empty alertMsg }">
		<script>
			alertify.alert("${ alertMsg }");
		</script>
		<c:remove var="alertMsg" scope="session"/>
	</c:if>

	
	<div class="YRcontent">

        <br>
        <div id="header" class="d-flex p-3">

            <div id="header_logoimg_menulist" class="mr-auto">
                <!-- 로고이미지랑 메뉴리스트 -->
                <div class="d-flex">

                    <div id="header_logoimg" class="flex-fill">
                        <!-- 로고이미지 -->
                        <a href="메인으로" style="margin-right: 25px;">
                            <img src="http://owzl.github.io/uglytasty_logoimg.png" alt="">
                        </a>
                    </div>

                    <div class="d-flex flex-wrap align-content-center flex-fill">
                        <!-- 메뉴리스트 -->
                        <div id="header_menulist" class="d-flex">
                            <div class="header_eachmenu flex-fill">
                                <a href="#"><span>못난이 박스</span></a>
                            </div>
                            <div class="header_eachmenu flex-fill">
                                <a href="#"><span>못난이 단품</span></a>
                            </div>
                            <div class="header_eachmenu flex-fill">
                                <a href="#"><span>맛난이 레시피</span></a>
                            </div>
                            <div class="header_eachmenu flex-fill">
                                <a href="list.no"><span>공지사항</span></a>
                            </div>
                            <div class="header_eachmenu flex-fill">
                                <a href="#"><span>관리자 페이지</span></a>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
            
            <div id="header_login_cart_mypage_logout" class="p-2">
                <!-- 로그인 장바구니 마이페이지 로그아웃 -->

                <c:choose>
                    <c:when test="${ empty loginMember }">
                        <!-- 로그인 전 -->
                        <button id="login_btn" onclick = "location.href = 'loginForm.me'">로그인</button>
                    </c:when>
                    <c:otherwise>
                        <!-- 로그인 후 -->
                        <div id="after_login" class="d-inline-flex">  
                            <div class="">
                                <a href="#"><span>장바구니</span></a>
                            </div>
                            <div class="">
                                <a href=""><span>마이페이지</span></a>
                            </div>
                            <div class="">
                                <a href="logout.me"><span>로그아웃</span></a>
                            </div>
                        </div>
                    </c:otherwise>
                </c:choose>

            </div>
        </div>

    </div>    

</body>
</html>