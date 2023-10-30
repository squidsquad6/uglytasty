<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>footer</title>

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
        }

        .YRcontent {
            width:1400px;
            margin:auto;
        }

        #footer_wrap{ /* 위아래 패딩용 wrap */
            width: 1400px;
            /* height: 350px; */
            background-color: rgb(252 250 244);
            padding-top: 40px;
            padding-bottom: 40px;
        }

        #footer{
            padding-left: 20px;
            padding-right: 20px;
            margin-left: 35px;
            margin-right: 35px;
            align-items: center;
            justify-content: center;
        }

        #footer_hr{
            border-color: rgb(183 142 104);
            margin-top: 32px;
            margin-bottom: 32px;
            opacity: .2;
        }

        /* hr 기분 윗부분 */
        #customer_service h4{
            color: rgb(31 41 55);
            font-size: 18px;
            font-weight: 700;
        }
        #customer_service span{
            font-size: 18px;
            font-weight: 700;
            color: rgb(183 142 104);
        }

        .customer_service_day{
            width: 102px;
            font-size: 14px;
            font-weight: 500;
        }
        .customer_service_time{font-size: 14px;}


        .qa_notice_btn{
            width: 168px;
            height: 74px;
            border-radius: 0.123rem;
            border: 0.8px solid;
        }
        .qa_notice_btn p{
            font-weight: 600;
            font-size: .875rem;
            line-height: 1.25rem;
            margin: 0;
        }
        #qa_btn{
            background-color: rgb(65 75 90);
            color: white;
            border-color: rgb(65 75 90);
        }
        #notice_btn{
            border-color: rgb(65 75 90);
            color: rgb(65 75 90);
            background-color: white;
        }

        /* hr 기준 아랫부분 */
        .ft_under_hr_p{
            font-size: 13px;
            margin-bottom: 1.5rem;
            line-height: 180%;
            color: rgb(103, 110, 123);
        }
        .ft_under_hr_p p{margin-bottom: 0px;}
        .ft_under_hr_p a{
            text-decoration: none;
            color: rgb(183 142 104);
            font-weight: 700;
        }

        #ft_under_hr_terms_copyright a,span{
            text-decoration: none;
            font-size: 13px;
            color: rgb(103, 110, 123);
            margin-right: 16px;
        }
        #ft_under_hr_terms_copyright a{
            font-weight: 700;
        }

    </style>
    
</head>
<body>

	<div class="YRcontent">

        <div id="footer_wrap">

            <div id="footer">

                <!--윗층-->
                <div class="d-flex"> 
                    <!--  고객센터 정보 -->
                    <div id="customer_service" class="p-2 mr-auto">
                        <h4>
                            못난이맛난이 고객센터
                            <span>02.2023.0918</span>
                        </h4>

                        <div class="d-flex">
                            <div class="customer_service_day">월-목요일</div>
                            <div class="customer_service_time flex-grow-1">11:00 ~ 18:00 (점심시간 12:00 ~ 13:00)</div>
                        </div>
                        <div class="d-flex">
                            <div class="customer_service_day">금요일</div>
                            <div class="customer_service_time flex-grow-1">09:00 ~ 18:00 (점심시간 12:00 ~ 13:00)</div>
                        </div>
                        <div class="d-flex">
                            <div class="customer_service_day">토·일·공휴일</div>
                            <div class="customer_service_time flex-grow-1">휴무</div>
                        </div>

                    </div>
                    
                    <!-- 1:1문의, 공지사항 버튼 -->
                    <div class="p-2">
                        <div class="container">
                            <div class="d-inline-flex text-white">  
                                <div class="p-2">
                                    <button id="qa_btn" class="qa_notice_btn"><p>문의하기</p></button>
                                </div>

                                <div class="p-2 ">
                                    <button id="notice_btn" class="qa_notice_btn"><p>공지사항</p></button>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                </div>

                <hr id="footer_hr">

                <!-- 아랫층 -->

                <!-- 흑백 로고 이미지 -->
                <img src="http://owzl.github.io/uglytasty_logobw.png" style="width: 170px; margin-bottom: 14px;">

                <div class="ft_under_hr_p">
                    <p>상호명 : 주식회사 B급탈출 &nbsp;|&nbsp; 대표 : 정유리 &nbsp;|&nbsp; 사업자등록번호 : 123-45-67890 &nbsp;|&nbsp; 소재지 : 서울특별시 강남구 테헤란로14길 6 남도빌딩 3층 H</p>
                    <p>통신판매업 신고번호 : 2023-서울남부-0918 &nbsp;|&nbsp; <a href="#">제휴 및 납품 문의 : bgrade@uglytasty.co.kr</a> &nbsp;|&nbsp; <a href="#">농산물 납품 및 긴급구출 제보 : bgrade@uglytasty.co.kr</a></p>
                </div>

                <div id="ft_under_hr_terms_copyright">
                    <div class="d-inline-flex">  
                        <div>
                            <a href="https://fantastic-interest-ad9.notion.site/b411aeb9565e40099503c3b8e9cd33a4" target="_blank">서비스 이용약관</a>
                        </div>
                        <div>
                            <a href="https://fantastic-interest-ad9.notion.site/1f2cdaba7c014ee8b53e76bb1d1e31cb" target="_blank">개인정보 처리방침</a>
                        </div>
                        <div>
                            <span>Copyright ⓒ 2023 주식회사 B급탈출 All rights reserved.</span>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

	<script>
	  document.getElementById("qa_btn").addEventListener("click", function () {
	    // Redirect to the 1:1 문의 (qa) page
	    window.location.href = "list.qa";
	  });
	
	  document.getElementById("notice_btn").addEventListener("click", function () {
	    // Redirect to the 공지사항 (notice) page
	    window.location.href = "list.no";
	  });
	</script>


</body>
</html>