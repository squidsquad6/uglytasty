<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>단품 관리</title>



<!-- jQuery library -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.6.4/dist/jquery.slim.min.js"></script>

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->


<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bulma@0.9.4/css/bulma.min.css">

<script src="https://kit.fontawesome.com/f1cf0537bc.js" crossorigin="anonymous"></script>

<style>
  th {
    text-align: center;
    padding-left: 10px;
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

<jsp:include page="../common/header.jsp"/>
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
 <div>
        <br><br><br>
        <div style="display: flex; justify-content: center;">
            <nav class="breadcrumb is-centered is-large has-background-white" aria-label="breadcrumbs" >
                <ul>
	                <li><a href="member.ad" style="color: #ff6741;">회원 관리</a></li>
	                <li><a href="order.ad" style="color: #ff6741;">주문 관리</a></li>
	                <li><a href="subscribe.ad" style="color: #ff6741;">구독 관리</a></li>
	                <li><a href="qa.ad" style="color: #ff6741;">1:1문의 관리</a></li>
	                <li><a href="product.ad" style="color: #ff6741;">단품 관리</a></li>
                </ul>
            </nav>
         </div>
	<br><br>
    <div class="container">
        <form action="excel.ad" method="get">
        <table class="table-container is-fullwidth is-hoverable">
          <thead class="thead-dark">
            <tr>
              <th>상품번호</th>
              <th>상품명</th>
              <th>가격</th>
                <th>할인율</th>
                <th>설명</th>
                <th>생산지</th>
                <th>생산일자</th>
                <th>재고량</th>
                <th>상품상태</th>
                <th>조회수</th>
                <th>작성일</th>
                <th>수정</th>
               
            </tr>
          </thead>
          
          <tbody>
           
      
          <c:forEach var="b" items="${list }" varStatus="loop">
            <tr>
              <td><input id="productNo${loop.index}" class="input" type="text" style="border:none" value="${b.productNo }" readonly></td>
              <td><input id="productName${loop.index }" class="input" type="text" style="border:none" value="${b.productName }"></td>
              <td><input id="price${loop.index }" class="input" type="text" style="border:none" value="${b.price }"></td>
                <td><input id="sale${loop.index }" class="input" type="text" style="border:none" value="${b.sale }"></td>
                <td><input id="explanation${loop.index }" class="input" type="text" style="border:none" value="${b.explanation }"></td>
                <td><input id="location${loop.index }" class="input" type="text" style="border:none" value="${b.location }"></td>
                <td><input id="productionDate${loop.index }" class="input" type="text" style="border:none" value="${b.productionDate }" readonly></td>
                <td><input id="stock${loop.index }" class="input" type="text" style="border:none" value="${b.stock }"></td>
                <td><input id="status${loop.index }" class="input" type="text" style="border:none" value="${b.status }"></td>
                <td><input id="count${loop.index }" class="input" type="text" style="border:none" value="${b.count }"></td>
                <td><input id="enrollDate${loop.index }" class="input" type="text" style="border:none" value="${b.enrollDate}"></td>
                <td style="text-align: center;"><button class="button is-success is-hovered is-small is-light" style="display: block; margin: 0 auto; margin-top: 5px;" onclick="updateProduct(${loop.index }); return false;">수정</button></td>
    
            </tr>
          </c:forEach>
             
                
              
          </tbody>
           
        </table>
        <button class="button is-success is-normal" type="submit" style="float:left;"><i class="fa-solid fa-download"></i>&nbsp;&nbsp;Excel 다운로드</button>
        
        </form>
        
          <div class="field is-grouped">
            <p class="control">
                <button class="button is-info is-normal" id="uploadButton">
                    <i class="fa-solid fa-arrow-up-from-bracket"></i>&nbsp;&nbsp;Excel&nbsp;&nbsp; 업로드&nbsp;&nbsp;
                </button>
            </p>
        </div>
       
        
       
        
        <script>
		 
		    var fileInput = $('<input type="file" id="fileInput" style="display: none" accept=".xlsx">');
		    
		   
		    $('body').append(fileInput);
		    
		    
		    $('#uploadButton').click(function() {
		        
		        fileInput.trigger('click');
		    });
		    
		 
		    fileInput.change(function() {
		   
		        if (this.files.length > 0) {
		            var file = this.files[0];
		            uploadFile(file);
		        }
		    });
		    
		    function uploadFile(file) {
		        var formData = new FormData();
		        formData.append('file', file);
		        
		        $.ajax({
		            url: 'uploadExcel.ad',
		            type: 'POST',
		            data: formData,
		            contentType: false,
		            processData: false,
		            success: function(response) {
		                console.log('Upload successful');
		                alert('Excel 파일 업로드 완료');
		                location.reload();
		            },
		            error: function() {
		                console.log('Upload failed');
		                alert('Excel 파일 업로드 실패');
		            }
		        });
		    }
		</script>
        
        
        
        
		<script>
		function updateProduct(index) {
		    var productNo = $('#productNo' + index).val();
		    var productName = $('#productName' + index).val();
		    var price = $('#price' + index).val();
		    var sale = $('#sale' + index).val();
		    var explanation = $('#explanation' + index).val();
		    var location = $('#location' + index).val();
		    var productionDate = $('#productionDate' + index).val();
		    var stock = $('#stock' + index).val();
		    var status = $('#status' + index).val();
		    var count = $('#count' + index).val();
		    var enrollDate = $('#enrollDate' + index).val();

		    $.ajax({
		      url: 'updateProduct.ad',
		      type: 'POST',
		      data: {
		        productNo: productNo,
		        productName: productName,
		        price: price,
		        sale: sale,
		        explanation: explanation,
		        location: location,
		        productionDate: productionDate,
		        stock: stock,
		        status: status,
		        count: count,
		        enrollDate: enrollDate
		      },
		      success: function(response) {
		        console.log('성공');
		        alert('상품 정보가 성공적으로 수정되었습니다.');
		      },
		      error: function() {
		        console.log('실패');
		      }
		    });
		    
		    return false;
		}
		</script>


      
    </div>
    <br><br><br><br><br><br>
    <jsp:include page="../common/footer.jsp"/>
    
</div>
</body>
</html>