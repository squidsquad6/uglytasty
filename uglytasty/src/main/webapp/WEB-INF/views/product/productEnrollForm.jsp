<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>


 <style>
     div * {box-sizing: border-box;}

    .all {
        margin: auto;
        width: 1400px;
        font-size: 13px;
    }
    
 
    .selectProductInfo {
    	margin-left : 400px;
    }
    
    #productSearch {
    	margin-top: 50px;
    }

    #productSearch #searchInput {
        width: 415px;
        height: 35px;
        border: 1px solid #dadada;
        border-radius: 5px;
    }
    #productSearch #searchBtn {
        width: 80px;
        height: 35px;
        background-color: #ff6741;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        padding-left:0px;
    }
    #productSearch #searchBtn:hover {
        filter: brightness(0.9);
    }

    #productSearch th {
        width: 100px;
        height: 30px;
        text-align: left;
    }
    #productSearch input {
        width: 500px;
        height: 35px;
        color: gray;
        border: 1px solid #dadada;
        border-radius: 5px;
        
    }
    #productSearch h3 {
        text-align: left;
        color: #ff6741;
    }

    /* 첨부파일 등록 */
    .insertAttachment {
        margin-left: 400px;
    }

    .insertAttachment th {
        width: 100px;
        text-align: left;
    }

    .insertAttachment .fileLevel {
        width: 72px;
        height: 25px;
        border: 1px solid #dadada;
        border-radius: 5px;

    }
    .insertAttachment .explanation {
        border: 1px solid #dadada;
        border-radius: 5px;
    }
    .productEnrollBtn {
        width: 630px;
        height: 50px;
        background-color: #ff6741;
        border: none;
        border-radius: 10px;
        color: white;
        font-weight: bold;
        font-size: 15px;
        cursor: pointer;
        margin-top: 50px;
        margin-bottom: 70px;
    }
    .productEnrollBtn:hover {
        filter: brightness(0.9);
    }
    .blank {
        color: white;
    }

	
	/*입력란 왼쪽에 딱 붙지 않도록*/
	input {
		padding-left: 10px;
		font-size:14px;
	}
	.upfile {
		padding-left: 0px;
		line-height: 27px;
	}
	
	/*주소API*/
	#sample6_address {
		float:left;
	}
	#address_btn {
		padding-left: 0px;
		background-color: #ff6741;
        color: white;
        border: none;
    }
 	#address_btn:hover {
        filter: brightness(0.9);
    }
    
</style>

</head>
<body>

	<!-- 헤더자리 -->
	<jsp:include page="../common/header.jsp"/>
	
	
	<div class="all">
		
        <!-- ----------------------------------------등록할 상품 관련 정보-------------------------------------- -->
        <form action="insert.pro" method="post" id="productSearch" enctype="multipart/form-data">

            <!-- hidden : productNo 챙겨가기 -->

            <table class="selectProductInfo" style="width: 600px;">
                <thead>
                    <tr>
                        <th colspan="2" style="height: 100px;"><h3>🔎 등록할 상품 번호 조회</h3></th>
                    </tr>
                    <tr>
                    	<td colspan="2"><p style="color:#ff6741;">※ 엑셀로 등록한 상품의 첨부파일 등록을 원하시면 해당 상품번호 조회 후 파일을 등록해주세요!</p></td>
                    </tr>
                    <tr>
                        <th>
                            <label for="product_no">상품 번호</label>
                        </th>
                        <td>
                            <input type="text" id="searchInput">
                            <input type="button" id="searchBtn" value="조회">
                        </td>
                    </tr>
                </thead>
                <tbody>

                    <tr>
                        <th colspan="2" style="height: 140px; padding-top: 50px;"><h3>📄 상품 관련 정보</h3></th>
                    </tr>

                    <tr>
                        <th>상품명</th>
                        <td><input type="text" id="productName" name="productName" value=""></td>
                    </tr>
                    <tr>
                        <th>상품 부제목</th>
                        <td><input type="text" id="explanation" name="explanation" value=""></td>
                    </tr>
                    <tr>
                        <th>생산지</th>
                        <td>
                        	<input type="text" id="sample6_address" name="location" value="" style="width:83%;" readonly>
                        	<input type="button" id="address_btn" onclick="sample6_execDaumPostcode()" value="검색"  style="width:17%;color:white;">
                        </td>
                    </tr>
                    <tr>
                        <th>생산 일자</th>
                        <td><input type="date" id="productionDate" name="productionDate" value=""></td>
                    </tr>
                    <tr>
                        <th>재고량</th>
                        <td><input type="number" id="stock" name="stock" value=""></td>
                    </tr>
                    <tr>
                        <th>할인율</th>
                        <td><input type="number" id="sale" name="sale" value="" placeholder="예) 20% 이면 '20' 입력"></td>
                    </tr>
                    <tr>
                        <th>상품 가격</th>
                        <td><input type="number" id="price" name="price" value=""></td>
                    </tr>
                </tbody>

            </table>
      

			<script>
				$(function(){
					$("#searchBtn").click(function(){
						$.ajax({
							url:"search.pro",
							data:{
								productNo:$("#searchInput").val()
							},
							success:function(pdata){
								
								console.log(pdata);
								
								$("#productName").val(pdata.productName);
								$("#explanation").val(pdata.explanation);
								$("#sample6_address").val(pdata.location);
								$("#productionDate").val(pdata.productionDate);
								$("#stock").val(pdata.stock);
								$("#sale").val(pdata.sale);
								$("#price").val(pdata.price);
								
							},
							error:function(){
								console.log("상품 조회용 ajax 요청 실패!");
							}
						})
					})
				})
				
			
			</script>
	
	
	
	        <br><br><br>

        
            <!-- ---------------------------------------- 첨부파일 등록 -------------------------------------- -->    
            <table class="insertAttachment">
                
                <tr>
                    <th colspan="2" align="left" style="height: 100px; color: #ff6741;"><h3>📂 상품 첨부파일</h3></th>
                </tr>


                <!-- 첨부파일 여러개 첨부시, name 값 동일하게 -->
                <!-- 첨부파일 등록 칸 5개 -->
                <c:forEach var="num" begin="1" end="5">
	                <tr>
	                    <th>파일 레벨</th>
	                    <td>
	                        <input class="fileLevel" type="number" name="fileLevel${num}" value="${num}" readonly>
	                    </td>
	                </tr>
	                <tr>
	                    <th>첨부파일</th>
	                    <td>
	                        <input class="upfile" type="file" name="upfile">
	                    </td>
	                </tr>
	                <tr>
	                    <th>내용</th>
	                    <th>
	                        <textarea class="explanation" name="fileExp${num}" rows="5" cols="72" style="resize:none;"></textarea>
	                    </th>
	                </tr>
	                <tr><th colspan="2" class="blank">[빈칸]</th></tr>
             	</c:forEach>

            </table>

            
			<br>

            <div align="center">
                <button type="submit" class="productEnrollBtn">등록하기</button>
            </div>
	
        </form>
        
        <br>
    </div>
    
    
    <!-- 주소 API -->
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <script>
	    function sample6_execDaumPostcode() {
	        new daum.Postcode({
	            oncomplete: function(data) {
	               
	                var addr = ''; // 주소 변수
	                var extraAddr = ''; // 참고항목 변수
	
	                //사용자가 선택한 '주소 타입'에 따라 해당 주소 값을 가져온다.
	                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
	                    addr = data.roadAddress;
	                } else { // 사용자가 지번 주소를 선택했을 경우(J)
	                    addr = data.jibunAddress;
	                }
	
	                // 사용자가 선택한 주소가 '도로명 타입'일때 참고항목을 조합한다.
	                if(data.userSelectedType === 'R'){
	                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
	                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
	                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
	                        extraAddr += data.bname;
	                    }
	                    // 건물명이 있고, 공동주택일 경우 추가한다.
	                    if(data.buildingName !== '' && data.apartment === 'Y'){
	                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
	                    }
	                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
	                    if(extraAddr !== ''){
	                        extraAddr = ' (' + extraAddr + ')';
	                    }
	                   
	                } 
	
	                document.getElementById("sample6_address").value = addr;
	                // 커서를 상세주소 필드로 이동한다.
	                //document.getElementById("sample6_detailAddress").focus();
	            }
	        }).open();
	    }
    </script>
    
		
	<!-- 푸터 -->
    <jsp:include page="../common/footer.jsp"/>



</body>
</html>