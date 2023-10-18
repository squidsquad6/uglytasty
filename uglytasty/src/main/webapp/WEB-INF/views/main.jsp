<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
   

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
    div * {box-sizing: border-box;}

    .all {
        margin: auto;
        width: 1400px;
        
    }

    /*----------------------------- 사진슬라이드 ------------------------------*/

    /*GLOBALS*/
    * {
        margin: 0;
        padding: 0;
        list-style: none;
    }

    #slider-wrap {
        width: 100%;
        height: 500px;
        position: relative;
        overflow: hidden;
    }

    #slider-wrap ul#slider {
        height: 100%;
        position: absolute;
        top: 0;
        left: 0;
    }

    #slider-wrap ul#slider li {
        float: left;
        position: relative;
        width: 600px;
        height: 500px;
    }

    #slider-wrap ul#slider li>div {
        position: absolute;
        top: 20px;
        left: 35px;
    }

    #slider-wrap ul#slider li>div h3 {
        font-size: 36px;
        text-transform: uppercase;
    }

    #slider-wrap ul#slider li>div span {
        font-size: 21px;
    }

    #slider-wrap ul#slider li img {
        display: block;
        width: 100%;
        height: 100%;
    }

    /*btns*/
    .slider-btns {
        position: absolute;
        width: 50px;
        height: 60px;
        top: 50%;
        margin-top: -25px;
        line-height: 57px;
        text-align: center;
        cursor: pointer;
        background: rgba(0, 0, 0, 0.1);
        z-index: 100;
        -webkit-user-select: none;
        -moz-user-select: none;
        -khtml-user-select: none;
        -ms-user-select: none;
        -webkit-transition: all 0.1s ease;
        -o-transition: all 0.1s ease;
        transition: all 0.1s ease;
    }

    .slider-btns:hover {
        background: rgba(0, 0, 0, 0.3);
    }

    #next {
        right: -50px;
        border-radius: 7px 0px 0px 7px;
        color: #eee;
    }

    #previous {
        left: -50px;
        border-radius: 0px 7px 7px 7px;
        color: #eee;
    }

    #slider-wrap.active #next {
        right: 0px;
    }

    #slider-wrap.active #previous {
        left: 0px;
    }

    /*bar*/
    #slider-pagination-wrap {
        min-width: 20px;
        margin-top: 450px;
        margin-left: auto;
        margin-right: auto;
        height: 15px;
        position: relative;
        text-align: center;
    }

    #slider-pagination-wrap ul {
        width: 100%;
    }

    #slider-pagination-wrap ul li {
        margin: 0 4px;
        display: inline-block;
        width: 5px;
        height: 5px;
        border-radius: 50%;
        background: #fff;
        opacity: 0.5;
        position: relative;
        top: 0;
    }

    #slider-pagination-wrap ul li.active {
        width: 12px;
        height: 12px;
        top: 3px;
        opacity: 1;
        -webkit-box-shadow: rgba(0, 0, 0, 0.1) 1px 1px 0px;
        box-shadow: rgba(0, 0, 0, 0.1) 1px 1px 0px;
    }

    /*ANIMATION*/
    #slider-wrap ul,
    #slider-pagination-wrap ul li {
        -webkit-transition: all 0.3s cubic-bezier(1, .01, .32, 1);
        -o-transition: all 0.3s cubic-bezier(1, .01, .32, 1);
        transition: all 0.3s cubic-bezier(1, .01, .32, 1);
    }

    /*-------------------------------------*/

    .content_0 {
        border-bottom: 1px solid #ff6741;
        width: 100%;
        padding-top: 80px;
        padding-bottom: 80px;
    }

    .content_0 h1 {
        font-size: 35px;
        color: #ff6741;
    }
    .content_0 p {
        font-size: 20px;
        margin-top: 50px;
        line-height: 1.5;
        color: #ff6741;
    }
    .content_0 img {
        width: 100%;
        margin-top: 50px;
    }


    .content_1 {
        border-bottom: 1px solid #ff6741;
        width: 100%;
        padding-top: 80px;
        padding-bottom: 80px;
    }
    .content_1 h1 {
        width: 50%;
        text-align: left;
        font-size: 38px;
        color: #ff6741;
        font-weight: bold;
        float: left;
    }
    .content_1 p {
        width: 50%;
        text-align: center;
        font-size: 20px;
        padding: 18px;
        line-height: 1.5;
        color: #ff6741;
        /* border: 1px solid blue; */
        margin-left: 50%;
    }
    .content_1 img {
        width: 100%;
        margin-top: 70px;
    }


    .content_2 {
        width: 100%;
        padding-top: 80px;
        padding-bottom: 80px;
    }

    .content_2 h1 {
        font-size: 45px;
        color: gray;
        font-weight: bold;
    }
    .content_2 p, table {
        font-size: 20px;
        margin-top: 50px;
        margin-bottom: 70px;
        line-height: 1.5;
        color: gray;
        font-weight: bold;
    }
    .content_2 a {
        padding: 25px 200px;
        border-radius: 10px;
        font-size: 20px;
        background-color: gray;
        color: white;
        text-decoration: none;
        font-weight: bold;
    }
    .content_2 a:hover {
        background-color: rgb(66, 66, 66);
        color: white;
    }
    
    /* --------------------상단으로 이동하기 버튼-------------------- */
    .btn_gotop {
        display:none;
        position:fixed;
        bottom:30px;
        right:50px;
        z-index:999;
        cursor:pointer;
    }
    
</style>

</head>
<body>

	<!-- 헤더 -->
	<jsp:include page="common/header.jsp"/>
	
	
	<!-- 상단으로 이동하기 버튼 -->
    <div class="btn_gotop">
        <img width="50px" src="https://blog.kakaocdn.net/dn/s6jL5/btqHsbU8DSJ/yBeqQLZS4Kg866xEHCvA20/img.png" >
    </div>
    
    <script>
	 	// 상단으로 이동하기 버튼
	    $(window).scroll(function(){
	        if ($(this).scrollTop() > 300){
	            $('.btn_gotop').show();
	        } else{
	            $('.btn_gotop').hide();
	        }
	    });
	    $('.btn_gotop').click(function(){
	        $('html, body').animate({scrollTop:0},400);
	        return false;
	    });
	</script>
	    

	
	<div class="all">

		<br><br><br>

        <!-- 사진슬라이드 -->
        <div id="slider-wrap">
            <ul id="slider">
                <li>
                    <div>
                        <h3></h3>
                        <span></span>
                    </div>
                    <img src="resources/images/banner_1.png">
                </li>
        
                <li>
                    <div>
                        <h3></h3>
                        <span></span>
                    </div>
                    <img src="http://www.fspace.co.kr/image/banner_1.png">
                </li>
        
                <li>
                    <div>
                        <h3></h3>
                        <span></span>
                    </div>
                    <img src="http://www.fspace.co.kr/image/banner_2.png">
                </li>
        
                <li>
                    <div>
                        <h3></h3>
                        <span></span>
                    </div>
                    <img src="http://www.fspace.co.kr/image/banner_3.png">
                </li>
        
                <li>
                    <div>
                        <h3></h3>
                        <span></span>
                    </div>
                    <img src="resources/images/banner_5.png">
                </li>
            </ul>
        
            <div class="slider-btns" id="next"><span>▶</span></div>
            <div class="slider-btns" id="previous"><span>◀</span></div>
        
            <div id="slider-pagination-wrap">
                <ul>
                </ul>
            </div>
        </div>

        <script>
            //slide-wrap
            var slideWrapper = document.getElementById('slider-wrap');
            //current slideIndexition
            var slideIndex = 0;
            //items
            var slides = document.querySelectorAll('#slider-wrap ul li');
            //number of slides
            var totalSlides = slides.length;
            //get the slide width
            var sliderWidth = slideWrapper.clientWidth;
            //set width of items
            slides.forEach(function (element) {
                element.style.width = sliderWidth + 'px';
            })
            //set width to be 'x' times the number of slides
            var slider = document.querySelector('#slider-wrap ul#slider');
            slider.style.width = sliderWidth * totalSlides + 'px';

            // next, prev
            var nextBtn = document.getElementById('next');
            var prevBtn = document.getElementById('previous');
            nextBtn.addEventListener('click', function () {
                plusSlides(1);
            });
            prevBtn.addEventListener('click', function () {
                plusSlides(-1);
            });

            // hover
            slideWrapper.addEventListener('mouseover', function () {
                this.classList.add('active');
                clearInterval(autoSlider);
            });
            slideWrapper.addEventListener('mouseleave', function () {
                this.classList.remove('active');
                autoSlider = setInterval(function () {
                    plusSlides(1);
                }, 3000);
            });


            function plusSlides(n) {
                showSlides(slideIndex += n);
            }

            function currentSlides(n) {
                showSlides(slideIndex = n);
            }

            function showSlides(n) {
                slideIndex = n;
                if (slideIndex == -1) {
                    slideIndex = totalSlides - 1;
                } else if (slideIndex === totalSlides) {
                    slideIndex = 0;
                }

                slider.style.left = -(sliderWidth * slideIndex) + 'px';
                pagination();
            }

            //pagination
            slides.forEach(function () {
                var li = document.createElement('li');
                document.querySelector('#slider-pagination-wrap ul').appendChild(li);
            })

            function pagination() {
                var dots = document.querySelectorAll('#slider-pagination-wrap ul li');
                dots.forEach(function (element) {
                    element.classList.remove('active');
                });
                dots[slideIndex].classList.add('active');
            }

            pagination();
            var autoSlider = setInterval(function () {
                plusSlides(1);
            }, 3000);
        </script>


        <div align="center" class="content_0">
            <h1>이런 농산물을 다룹니다</h1>
            <p>
                못난이맛난이는 산지의 문제를 해결하고 산지와 소비자를 더 가깝게 연결하고자 합니다.
                <br><br>
                긴급하게 판로가 필요한 농산묿터 친환경 생산 철학을 지지하며 자란 농산물까지,<br>
                기존의 시장 기준과 관행을 깨고 못난이맛난이만의 소싱 원칙으로 새로운 유통 체계를 만들어갑니다.
            </p>
            <img src="https://d3cpiew7rze14b.cloudfront.net/assets/mission/sourcing-slider/pc0.png">
        </div>

        <div align="center" class="content_1">
            <h1>원칙 1)<br>남김없는 생산이 가능하도록</h1>
            <p>
                농산물을 크기와 모양으로 구분짓지 않습니다. 구출이 필요한 농산물을 발굴합니다. 판로가 필요한 생산자와 함께합니다.
            </p>
            <img src="resources/images/content1.png">
        </div>
        <div align="center" class="content_1">
            <h1>원칙 2)<br>지속가능한 농법이 확산될 수 있도록</h1>
            <p>
                화학 농약, 제초제, 살충제를 사용하지 않는 친환경 인증 농산품의 판로 개척을 우선합니다. 무농약, 유기농 농법으로는 수확량 보전이 어려운 농산물은 제초제, 농약 살포 횟수, 사용 비료 성분이 보다 친환경적인 과정을 통해 재배된 것을 우선합니다.
            </p>
        </div>
        <div align="center" class="content_1">
            <h1>원칙 3)<br>생산자와 소비자가 서로 지지하며<br> 믿을 수 있도록</h1>
            <p>
                모든 파트너쉽은 현장 방문을 통해 기준에 적합한지 확인하고, 직접 먹어본 뒤에 이루어집니다. 산지 또한 생산 환경과 과정을 투명하게 공개하는 것을 원칙으로 합니다.
                고객의 의견을 산지에 산지의 이야기를 고객에게 전하며 산지는 개선을, 소비자는 응원을 통해 신뢰의 연결 고리를 만듭니다.
            </p>
        </div>

        <div align="center" class="content_2">
            <h1>생산자님이신가요?</h1>
            <p>
                구출이 필요한 농산물이 있다면 아래 링크를 통해 남겨주세요!<br>
                빠른 시일 내에 연락드리겠습니다.
            </p>
            <table>
                <tr>
                    <th width="150px">월-목요일</th>
                    <td>09:00 ~ 18:00 (점심시간 12:00 ~ 13:00)</td>
                </tr>
                <tr>
                    <th>금요일</th>
                    <td>11:00 ~ 18:00 (점심시간 12:00 ~ 13:00)</td>
                </tr>
                <tr>
                    <th style="color:#ff6741;">주말·공휴일</th>
                    <td style="color:#ff6741;">휴무</td>
                </tr>
            </table>
            <a href="https://forms.gle/HmrLFY3DbtQYG9266">못난이 납품 문의하기</a>
        </div>
        
		<br><br><br>

    </div>
	
	<jsp:include page="common/footer.jsp"/>


</body>
</html>