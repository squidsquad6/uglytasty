<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!-- 
	cartlist : 회원아이디, 상품번호, 담은수량(quantity) / 상품명, 재고수량(stock), 가격, 할인율 / sale_price / change_name, file_level
	
	cartListCount : 장바구니 담긴 상품 수
 -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니 리스트</title>
<style>
    div * {box-sizing: border-box;}

    .all {
        margin: auto;
        width: 1400px;
        margin-left: 18%;
    }
    hr{
        width: 1000px;
        margin-left: 0;
        border: 1px solid #f2f2f2;
        margin: 20px 0;
    }
    .allselect {
        color: gray;
        font-size: 16px;
        font-weight: 400;
        padding-left: 18px;
    }
    h1 {
        color: black;
        font-size: 30px;
    }

    /*-------------------상품 수량------------------*/
    #amount {
        border: none;
        text-align: center;
        width: 35px;
    }
    #add, #minus {
        border: none;
        width: 27px;
        height: 27px;
        border-radius: 5px;
        background-color: white;
        border: 1px solid #ff6741;
        color: #ff6741;
        cursor: pointer;
    }
    #add:hover, #minus:hover {
        border: 2px solid #ff6741;
    }
    #sum {
        border: none;
        width: 370px;
        text-align: right;
        padding-right: 5px;
        font-size: 18px;
        color: #ff6741;
        font-weight: bold;
    }

   

    #productInfo th {
        color: gray;
        font-size: 15px;
        padding: 15px 0px;
      
    }

    #productInfo td {
        color: gray;
        font-size: 15px;
        padding: 0 15px;
        font-weight: 400;
    }


    #finalPrice td {
        color: #ff6741;
        font-weight: bold;
        font-size: 18px;
    }
    #finalPrice #totalPrice {
        /* width: 100px; */
        color: #ff6741;
        font-weight: bold;
        font-size: 25px;
        padding-left: 100px;
        text-align: right;
        border: none;
    }
   
    #orderButton {
        width: 1000px;
        height: 60px;
        border: 1px solid #ff6741;
        border-radius: 5px;
        background-color: #ff6741;
        color: white;
        margin-top: 30px;
        margin-bottom: 50px;
        font-weight: bold;
        font-size: 18px;
        cursor: pointer;
    }
    #orderButton:hover {
        filter: brightness(0.9);
    }

    input[type=checkbox] {
        zoom: 1.8;
    }

</style>

</head>
<body>

	<!-- 헤더 -->
    <jsp:include page="../common/header.jsp"/>

	<div class="all">
        <br><br><br>
        
        <form id="order" action="">
            <br><br>
            <h2>🛒 장바구니에 담긴 상품 리스트</h2>
            
            <br><br>

            <span style="font-size: 20px; font-weight: bold; padding-left: 20px;">담긴 상품</span>
            <span style="font-size: 20px; font-weight: bold; color: #ff6741;">${ cartListCount }</span><br><br>

            <br>
            
            
            <div class="allselect">
                <input type="checkbox" name="1" onclick='selectAll(this)'><span> 전체 선택</span>
            </div>
            
            <hr>

            <table id="productInfo">
                <tr>
                    <th></th>
                    <th style="padding-left: 30px;">상품 사진</th>
                    <th style="padding-left: 135px; width:300px;">상품명</th>
                    <th style="padding-left: 51px;">수량</th>
                    <th style="padding-left: 15px;">판매가</th>
                    <th style="padding-left: 15px;">할인</th>
                    <th style="padding-left: 15px;">배송비</th>
                    <th style="padding-left: 120px;">소계</th>
                </tr>
           
				<!-- forEach 구문에서 <tr id="1,2,.."> 추가시키기 위해 숫자가 필요할 때 set -->
				<c:set var="rowCounter" value="1" scope="page"/>

				<c:forEach var="c" items="${cartlist}">			
				    <tr id="<c:out value="${rowCounter}" />">
				        <td><input type="checkbox" name="rowCheck" value="${ c.productNo }"></td>
	                    <td>
	                        <a href="detail.pro?pno=${ c.productNo }">
	                            <img style="width: 100px; height: 100px;" src="${ c.changeName }">
	                        </a>
	                    </td>
	                    <td>${ c.productName }</td>
	                    <td>             
	                        <!--(+)(-)버튼 : 재고량에 따른 분기처리하기-->
	                        <input type="hidden" id="sell_price" name="sell_price" value="${ c.salePrice }">
	                        <input type="button" id="add" value=" + " name="add" onclick="addQuantity('${c.productNo}')">
	                        <input type="text" id="amount" name="amount" value="${ c.quantity }" readonly>
	                        <input type="button" id="minus" value=" - " name="minus" onclick="minusQuantity('${c.productNo}')"><br>
	                    </td>
	                    <td style="text-decoration: line-through;"><fmt:formatNumber value="${ c.price }" pattern="#,###"/></td>
	                    <td>${ c.sale }%</td>
	                    <td class="delivery"><fmt:formatNumber value="2500" pattern="#,###"/></td>
	                    <td>
	                        <!--소계 여기로 value -->
	                        <input type="text" id="sum" name="sum" style="width: 120px;" readonly>원 <br>
	                        <p align="right" style="font-size: 10px; color: #ff6741;">(배송비 포함 전)</p>
	                    </td>
				    </tr>
				    <c:set var="rowCounter" value="${rowCounter + 1}" scope="page"/>
				</c:forEach>
            </table>


            <hr>
			<input type="button" value="선택삭제" class="btn btn-outline-danger" onclick="deleteCheck();" style="margin-left:15px;">
			<br><br><br><br>
			
			
            <h2>💳 결제 정보</h2><br>
            <table id="paymentInfo">
                
                <!-- 넘길 값 -->
                <tr id="finalPrice">
                    <td width="500" style="font-size:20px;">총 결제 금액</td><span></span>
                    <td><input type="text" id="totalPrice" name="" value="" class="comma">원</td>
                </tr>
                <tr>
                    <td></td>
                    <td align="right" style="font-size: 10px; color: #ff6741;">(총 상품금액 + 배송비 가 포함되어 있습니다.)</td>
                </tr>
            </table>
    
            <br><br>
            
            <!--  <button type="submit" id="orderButton" class="btn btn-outline-danger" >주문하기</button>-->
            <input type="button" id="orderButton" value="주문하기" class="btn btn-outline-danger" onclick="submitOrderForm();">
        
        </form>
        
        <br><br><br><br>
    </div>
    
    
     <!--checkBox 전체선택 / 전체해제-->
    <script>
        function selectAll(selectAll)  {
            const checkboxes = document.getElementsByName('rowCheck');
            
            checkboxes.forEach((cBox) => {
            cBox.checked = selectAll.checked; // <= true false
            })
        }
    </script>
    
    <script>
        function deleteCheck() {
     
            var deleteArr = [];
            $("input[name='rowCheck']:checked").each(function() {
                //console.log($(this).val());
                deleteArr.push($(this).val()); // 선택한 체크박스의 productNo
            });
            console.log(deleteArr);
            //console.log(deleteArr[0]);
            //console.log(deleteArr[1]);
    
            if (deleteArr.length == 0) {
                alert("삭제하실 상품을 선택해주세요.");
            } else {
               
                $.ajax({
                    url: "delete.cart",
                    traditional: true,
                    data: {
                        userId:'${ loginMember.userId }',
                        productNo: deleteArr //배열로 넘긴다
                    },
                    success: function(result) {
                        if(result == "success"){
                            
                            console.log(result);
                            // 성공 후 새로고침
                            document.location.reload();
                         }
                    },
                    error: function() {
                        console.log("장바구니 상품 삭제 ajax 요청 실패!");
                    }
                });
            
            }

        }
    </script>
    
    
   
	
    <!-- (위) '주문하기 submitOrderForm()' 클릭 시, 폼을 서버로 제출하는 함수 호출 -->
    
    <form action="order.cart" id="orderForm" method="post">
        <!-- 선택된 상품의 productNo를 전달할 hidden input 추가 -->
        <input type="hidden" name="userId" value="${loginMember.userId}">
        <input type="hidden" name="productNo" id="selectedProductNos" value="">
        <!-- 여기에 체크된 productNo 모두 담겨있음 -->
    </form>

 
    <script>
        function submitOrderForm() {
            var ArrProductNo = [];

            // 선택된 체크박스에서 productNo를 추출하여 배열에 추가
            $("input[name='rowCheck']:checked").each(function() {
            	ArrProductNo.push($(this).val());
            });

            if (ArrProductNo.length === 0) {
                alert("주문하실 상품을 선택해주세요.");
            } else {
                // 선택된 상품의 productNo를 hidden input에 설정
                document.getElementById("selectedProductNos").value = ArrProductNo.join(",");

                // 폼을 제출하여 "order.cart" 컨트롤러로 이동
                document.getElementById("orderForm").submit();
            }
        }       
    </script>
    
    
    
    
    <!-- +/- 변화에 따른 DB update -->
    <script>
    	function addQuantity(productNo) {
    		
    		$.ajax({
    			url:"updateAdd.quan",
    			data:{
    				userId:'${ loginMember.userId }',
    				pno: productNo
    			},
    			success:function(result){
    				if(result == "success"){
    					
                        console.log(result);
                        
                     }
    			},
    			error:function(){
    				console.log("장바구니 수량 추가용 ajax 요청 실패!");
    			}
    			
    		})

    	}	
    </script>
    <script>
    	function minusQuantity(productNo) {
    		
    		$.ajax({
    			url:"updateMinus.quan",
    			data:{
    				userId:'${ loginMember.userId }',
    				pno: productNo
    			},
    			success:function(result){
    				if(result == "success"){
    					
                        console.log(result);
                        
                     }
    			},
    			error:function(){
    				console.log("장바구니 수량 빼기용 ajax 요청 실패!");
    			}
    			
    		})

    	}	
    </script>
    
    
    
    
    
    
    <!-- (cartlist.length) 만큼 for문 돌려서 수량 +/- 변화에 따른 sum 값 변화 + 총 반영한 totalPrice 찍힘 -->
    <script>
    
    	// *** javaScript 에서는 jsp의 '달러중괄호' 를 바로 사용할 수 없어서 'var cartlist = []' 를 선언해두고 사용해야 함 ***
	    var cartlist = [
	        <c:forEach var="cartItem" items="${cartlist}" varStatus="status">
	            {
	                productName: '<c:out value="${cartItem.productName}"/>',
	                stock: '<c:out value="${cartItem.stock}"/>',
	                salePrice: <c:out value="${cartItem.salePrice}"/>,
	                quantity: <c:out value="${cartItem.quantity}"/>,
	                price: <c:out value="${cartItem.price}"/>,
	                sale: <c:out value="${cartItem.sale}"/>,
	                changeName: '<c:out value="${cartItem.changeName}"/>'
	            }<c:if test="${!status.last}">,</c:if>
	        </c:forEach>
	    ];
    
    
        // 초기 totalPrice 계산
        let calculatedValue = 2500; // 애초에 배송비 넣고 시작

        for (let i = 1; i <= cartlist.length; i++) {
            const row = document.getElementById(i);
            const sellPrice = row.querySelector("input[name='sell_price']");
            const sum = row.querySelector("input[name='sum']");

            let priceVal = parseInt(sellPrice.value);
            let amountVal = parseInt(row.querySelector("input[name='amount']").value);
           

            // 초기값 설정
            sum.value = (priceVal * amountVal).toLocaleString("ko-KR");
 
            calculatedValue += priceVal * amountVal;
            
        }

        const totalPriceElement = document.getElementById('totalPrice');
        totalPriceElement.value = calculatedValue.toLocaleString("ko-KR"); 	// 값을 input 요소의 value에 설정

        // (+) 또는 (-) 버튼 클릭 시 totalPrice 업데이트
        for (let i = 1; i <= cartlist.length; i++) {
            const row = document.getElementById(i);
            const sellPrice = row.querySelector("input[name='sell_price']");
            const add = row.querySelector("input[name='add']");
            const minus = row.querySelector("input[name='minus']");
            const amount = row.querySelector("input[name='amount']");
            const sum = row.querySelector("input[name='sum']");
			
            // (+)
            /*
            if (add) {
                add.addEventListener('click', function () {
                    let amountVal = parseInt(amount.value);
                    let priceVal = parseInt(sellPrice.value);
                    amountVal++;
                    sum.value = amountVal * priceVal;
                    amount.value = amountVal;
                    updateTotalPrice();
                });
            }
            */
            
            // *** 재고수량(stack)에 따른 '+' max값 걸기 + 버튼 비활성화
            if (add) {
                add.addEventListener('click', function () {
	                let amountVal = parseInt(amount.value);
	                let priceVal = parseInt(sellPrice.value);
                	
	                let max = cartlist[i-1].stock;
                	if(amountVal < max) {
	                    amountVal++;
	                    sum.value = (amountVal * priceVal).toLocaleString("ko-KR");
	                    amount.value = amountVal;
	                    updateTotalPrice();
                	}
                	
                	if (amountVal >= max) {
                        add.disabled = true; // 수량이 재고를 초과하면 "+" 버튼 비활성화
                    }
                	minus.disabled = false; // "-" 버튼 활성화
                });
            }


			// (-)
            if (minus) {
                minus.addEventListener('click', function () {
                    let amountVal = parseInt(amount.value);
                    let priceVal = parseInt(sellPrice.value);
                    if (amountVal > 1) {
                        amountVal--;
                        sum.value = (amountVal * priceVal).toLocaleString("ko-KR");
                        amount.value = amountVal;
                        updateTotalPrice();
                    } else {
                        amountVal = 1;
                    }
                    if (amountVal < cartlist[i - 1].stock) {
                        add.disabled = false; // 수량이 재고 미만이면 "+" 버튼을 다시 활성화
                    }
                    if (amountVal = 1) {
                    	minus.disabled = false; // 수량이 1일 경우 더이상 "-" 버튼 못누르도록 비활성화
                    }
                });
            }
        }

        function updateTotalPrice() {
            let calculatedValue = 0;

            for (let i = 1; i <= cartlist.length; i++) {
                const priceElement = document.getElementById(i).querySelector("input[name='sum']");
                const price = parseInt(priceElement.value.replace(/,/g, ''));

                calculatedValue += price;
            }
			
            // 총액에 배송비 추가(아.. 일단 보류)
            /* 
            const deliveryValue = $(".delivery").text();
		
            const delivery = parseInt(deliveryValue);
            calculatedValue += delivery;
            
            
            $(".delivery").each(function() {
                var del = parseInt($(this).text().replace(/,/g, ''));
                $(this).text(del.toLocaleString('ko-KR'));
                
                calculatedValue += del;
            });
            */

            
			
            const totalPriceElement = document.getElementById('totalPrice');
			
            totalPriceElement.value = calculatedValue.toLocaleString("ko-KR");
        }
    </script>

   

	<!-- 푸더 -->
    <jsp:include page="../common/footer.jsp"/>

 


</body>
</html>