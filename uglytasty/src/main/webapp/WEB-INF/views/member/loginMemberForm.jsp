<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

	<!-- jQuery 라이브러리 -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
	<!-- 부트스트랩에서 제공하고 있는 스타일 -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
	<!-- 부트스트랩에서 제공하고 있는 스크립트 -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <!-- 공통 폰트 -->
    <link rel="stylesheet" as="style" crossorigin href="https://cdn.jsdelivr.net/gh/orioncactus/pretendard@v1.3.8/dist/web/static/pretendard.css" />

    <style>

        /* ===== 세부페이지마다 공통적으로 유지할 style ===== */
        * {
            box-sizing:border-box;
            font-family: 'Pretendard';
        }

        .YRcontent {
            width:80%;
            margin:auto;
        }
        
        .YRinnercontent { /* 공통 큰 메뉴 content 영역 - 로그인 영역 */
            /* 테두리는 나중에 보고 없앨지 말지 선택 */
            border: 3px solid lightgray;
            border-radius: 10px;
            width:80%;
            margin:auto;
            padding:5% 10%;
            background-color:white;
            display: block;
        }

        .YRinnercontent table{ /* 공통 큰 메뉴 content 영역 테이블 - 로그인 테이블 */
            margin: auto;
            width: 60%;
        }

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
            margin-top: 20px;
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
        /* 로그인 버튼 스타일 */
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
        }

        /* ------------------------------------------------------------------- */


        /* 아이디 찾기, 비밀번호 찾기 */
        #link_find_id_and_pwd{ /* 두 링크 묶음 영역 */
            float: right;
            font-size: 14px;
            margin-bottom: 20px;
        }

        #link_find_id_and_pwd a{ /* 링크 각각에 적용되는 스타일 */
            text-decoration: none;
            padding-left: 5px;
            padding-right: 5px;
            color: rgb(58, 58, 58);
        }

        /* 회원가입 */
        #link_enrollform{
            text-align: center;
            font-size: 15px;
            color: rgb(58, 58, 58);
            margin-bottom: 25px;
        }

        #link_enrollform a{ /* 회원가입 링크*/
            color: #FF6741;
            font-weight: 700;
            text-decoration: none;
        }

        /* ------------------------------------------------------------------- */

        /* sns 로그인 링크 */
        .sns-login-link{ /* sns 링크 div 공통 속성 */
            border-radius: 10px;
            width: 100%;
            height: 56px;
            text-align: center;
            line-height: 56px;
            margin-bottom: 10px;
            font-weight: 700;
        }

        .sns-login-link a{ /* sns 링크들 공통 속성 */
            display: block;
            text-decoration: none;
        }

        /* sns 링크 개별 */
        #sns_login_google{
            background-color: white;
            /* border: 2px solid rgb(229, 231, 235); */
            box-shadow: 1px 1px 1px 1px rgb(229, 231, 235);
        }
        #sns_login_google a{color: rgb(58, 58, 58);}
        
        #sns_login_naver{
            background-color: #03c75a;
            box-shadow: 1px 1px 1px 1px rgb(229, 231, 235);
        }
        #sns_login_naver a{color: white;}

        #sns_login_kakao{
            background-color: rgb(246,226,75);
            box-shadow: 1px 1px 1px 1px rgb(229, 231, 235);
        }
        #sns_login_kakao a{color: #3A1D1D;}

        /* .sns-login-logo{display: inline-block;} */


        
    </style>


</head>
	<jsp:include page="../common/header.jsp"/>
<body>

	<div class="YRcontent">
        <br><br>

        <div class="YRinnercontent">    
        
            <br>
            <h2>로그인</h2>
            <br>
 
            <form action="login.me" method="post">

                <table>
                    <tr>
                        <td>
                            <input type="text" class="input-text-style" id="userId" name="userId" placeholder="아이디를 입력해주세요" required>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input type="password" class="input-text-style" id="userPwd" name="userPwd" placeholder="비밀번호를 입력해주세요" required>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div id="link_find_id_and_pwd">
                                <a href="#">아이디 찾기</a>
                                <a href="#">비밀번호 찾기</a>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <button type="submit" class="submit-btn">로그인</button>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div id="link_enrollform">
                                아직 회원이 아니신가요? &nbsp;<a href="enrollForm.me">회원가입</a>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="sns-login-link" id="sns_login_google">
                                <a href="
                              	 https://accounts.google.com/o/oauth2/v2/auth?scope=https://www.googleapis.com/auth/userinfo.profile&response_type=code&redirect_uri=http://localhost:8008/uglytasty/oauth2&client_id=1043154405366-qnhdnm1nk8h9oka0up0crde72jfffvtq.apps.googleusercontent.com">
                                    <img src="https://owzl.github.io/btn_google.svg" width="22px" height="22px">
                                    &nbsp;
                                    구글로 로그인 하기
                                </a>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="sns-login-link" id="sns_login_naver">
                                 <a href="javascript:void(0);" onclick="loginWithNaver()">
                                    <img src="https://owzl.github.io/btn_naver.svg" width="40px">
                                    네이버로 로그인 하기
                                </a>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <div class="sns-login-link" id="sns_login_kakao">
                                <a href="https://kauth.kakao.com/oauth/authorize?response_type=code&client_id=e1fdaf851d387ba402c8d1d3a1f2b21d&redirect_uri=http://localhost:8008/uglytasty/oauth2/kakao">
                                    &nbsp;
                                    <img src="https://d3cpiew7rze14b.cloudfront.net/assets/app/kakao_icon.svg">
                                    &nbsp;
                                    카카오로 로그인 하기
                                </a>
                            </div>
                        </td>
                    </tr>
                    

                </table>

                

            </form>
 
        </div>
        <br><br>
    </div>
    
    <script>
		function loginWithNaver() {
		   
		    $.ajax({
		        type: "GET",
		        url: "generateState.me",
		        success: function(state) {
		           
		            var clientId = "qx5GJFsGBjihBcvVb7EK";
		            var redirectUri = "http://localhost:8008/uglytasty/oauth2/naver"; 
		
		           
		            var naverLoginUrl = "https://nid.naver.com/oauth2.0/authorize"
		                + "?client_id=" + clientId
		                + "&response_type=code"
		                + "&redirect_uri=" + redirectUri
		                + "&state=" + state;
		
		            
		            window.location.href = naverLoginUrl;
		        }
		    });
		}
		</script>
    
    
</body>

</body>
</html>