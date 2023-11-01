package com.kh.uglytasty.product.model.service;


import java.util.ArrayList;

import com.kh.uglytasty.order.model.vo.Cart;
import com.kh.uglytasty.order.model.vo.Orders;
import com.kh.uglytasty.order.model.vo.OrdersDetail;
import com.kh.uglytasty.product.model.vo.Attachment;
import com.kh.uglytasty.product.model.vo.Product;
import com.kh.uglytasty.product.model.vo.Review;
import com.kh.uglytasty.recipe.model.vo.Recipe;

public interface ProductService {

	// 상품 리스트 조회용 서비스
	ArrayList<Product> selectProductList();

	// 상품 리스트 조회용 서비스 (다음에 만나요)
	ArrayList<Product> selectReadyList();

	// 상품 키워드 검색 리스트 조회용 서비스
	ArrayList<Product> selectSearchKeyword(String keyword);

	// 상품 키워드 검색 리스트 조회용 서비스 (다음에 만나요)
	ArrayList<Product> selectSearchKeywordReady(String keyword);

	// 상품 인기순 리스트 조회
	ArrayList<Product> selectPopularList();
	
	// 상품 가격낮은순 리스트 조회
	ArrayList<Product> selectLowerPriceList();
	
	
	
	
	// 상품 상세 조회용 서비스
	int increaseCount(int productNo);
	ArrayList<Product> selectDetailProduct(int productNo);
	String selectLastWord(String productName);
	ArrayList<Recipe> selectRelatedRecipe(String lastWord);

	// 상품 엑셀데이터 검색 조회용 서비스 (ajax)
	Product selectSearchProduct(int productNo);

	// 상품 등록 작성 서비스
	// (둘다 처음 등록시 product먼저 등록시켜 productNo 생기도록 해야함. 그래야 attachment 에서 productNo 가지고 첨파 등록할수있음)
	int insertProduct(Product p, ArrayList<Attachment> alist);
	int insertAttachment(Attachment at);

	
	// 상품 삭제 서비스
	// (DB : 둘 다  status=N / spring : 첨파 delete )
	int deleteProduct(int productNo, ArrayList<String> filepathList);
	int deleteAttachment(String filepath);

	
	// 상품 일시품절 서비스
	int readyProduct(int productNo);

	// 상품 재입고 서비스
	int yesProduct(int productNo);
	
	// 상품 수정_ 수정할 상품의 정보1 조회
	Product selectProduct(int productNo);
	
	// 상품 수정_ 수정할 상품의 첨부파일5 조회
	ArrayList<Attachment> selectAttachmentList(int productNo);
	
	// 상품 수정_ 수정할 상품의 정보1 update
	int updateProduct(Product p);
	
	// 상품 수정_ 수정할 상품의 첨파(기존) update
	int updateExistAttachment(ArrayList<Attachment> updateAtList);
	
	// 상품 수정_ 수정할 상품의 첨파(새로운) insert
	int insertAddAttachment(ArrayList<Attachment> insertAtList);
	
	
	
	
	
	
	// 장바구니 추가용 서비스 (ajax)
	int insertCart(Cart c);
	
	// 장바구니 리스트 조회용
	ArrayList<Cart> selectCartList(String userId);
	
	// 장바구니 담긴 상품 수
	int selectCartListCount(String userId);
	
	// 장바구나 수량 추가
	int updateAddQuantity(Cart c);
	
	// 장바구니 수량 빼기
	int updateMinusQuantity(Cart c);
	
	// 장바구니 선택삭제
	int deleteCartProduct(ArrayList<Cart> clist);
	
	
	
	// 장바구니에서 주문하기용_상품 조회
	ArrayList<Cart> orderCartProduct(ArrayList<Cart> clist);
	
	// 상세페이지에서 주문하기용_상품 조회
	Product selectOrderProductInfo(int productNo);
	
	
	
	//----------------------------------------- 결제 API 관련 서비스-----------------------------------------
	//----------------------------------------- (단품)
	
	
	// 단품 '주문 insert'
	int insertOrderProduct(Orders oPro);
	
	
	
	// 단품 => 긴주문번호 뒤에 붙여 담아갈 orders 객체 조회(order_no 등)
	Orders selectOrdersInfoFinal(String addressMain);
	
	// 단품 => 1) 주문코드번호 2:결제완료 업데이트
	int updateOrderCode(int orderNo);
	
	// 단품 => 3) 최종 주문 완료 화면에 줄 배송정보 조회
	Orders selectOrdersDelivery(int orderNo);
	
	// 단품 => 2_1) 주문한 OrdersDetail에서 productNo, quantity 조회
	OrdersDetail selectOrdersQuantityProductNo(int orderNo);
	
	// 단품 => 2_1) 상품재고량 stock에서 주문수량 quantity 빼기 
	int updateProductStock(OrdersDetail quantityProductNo);
	
	
	
	//----------------------------------------- (장바구니 상품)
	
	
	// 장바구니상품 '주문 insert'
	int insertOrderCart(Orders oCart, ArrayList<OrdersDetail> odList);
	
	
	
	// 장바구니상품 => toss 화면에서도 가지고 있을 orders 객체 조회(order_no)
	Orders selectOrdersDetailInfoFinal(String addressMain);
	
	/*장바구니상품 => 1) 주문코드번호 2:결제완료 업데이트		------------단품꺼 같이써 (updateOrderCode)*/
	/*장바구니상품 => 2) 최종 주문 완료 화면에 줄 배송정보 조회	------------단품꺼 같이써 (selectOrdersDelivery)*/
	
	/*장바구니상품 => 3)주문상세에서 주문한 상품번호 '조회' 후 장바구니 내역가서 삭제 */
	ArrayList<OrdersDetail> selectOrdersDetailPnoList(int orderNo);
	
	// userId 조회
	String selectUserId(int orderNo);
	
	/*장바구니상품 => 3)주문상세에서 주문한 상품번호 조회 후 장바구니 내역가서 '삭제' */
	int deleteCartAfterOrder(ArrayList<OrdersDetail> delList);
	
	/*4_1)*/
	ArrayList<OrdersDetail> selectOrdersDetailPnoQuanList(int orderNo);
	
	/*4_2)*/
	int updateProductStockCart(ArrayList<OrdersDetail> ordersDetailPnoQuanList);
	
	
	
	//-------------------------------댓글(후기review)-------------------------------
	
	// 후기댓글 리스트 조회용 서비스 (ajax)
	ArrayList<Review> selectReviewList(int productNo);

	// 후기댓글 작성용 서비스 (ajax)
	int insertReview(Review r);

	// 후기댓글 삭제용 서비스 (ajax)
	int deleteReview(Review r);

	
	
	// 장바구니 상품 중복 검사 (ajax)
	int selectAddCartDuplication(Cart c);

	
	
}