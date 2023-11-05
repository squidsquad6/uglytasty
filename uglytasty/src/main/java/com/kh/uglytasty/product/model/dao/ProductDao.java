package com.kh.uglytasty.product.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.uglytasty.order.model.vo.Cart;
import com.kh.uglytasty.order.model.vo.Orders;
import com.kh.uglytasty.order.model.vo.OrdersDetail;
import com.kh.uglytasty.product.model.vo.Attachment;
import com.kh.uglytasty.product.model.vo.Product;
import com.kh.uglytasty.product.model.vo.Review;
import com.kh.uglytasty.recipe.model.vo.Recipe;

@Repository
public class ProductDao {
	
	/*상품 리스트 조회 (기본 + 키워드검색)*/
	public ArrayList<Product> selectProductList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("productMapper.selectProductList");
	}
	
	public ArrayList<Product> selectReadyList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("productMapper.selectReadyList");
	}
	
	public ArrayList<Product> selectSearchKeyword(SqlSessionTemplate sqlSession, String keyword) {
		return (ArrayList)sqlSession.selectList("productMapper.selectSearchKeyword", keyword);
	}
	
	public ArrayList<Product> selectSearchKeywordReady(SqlSessionTemplate sqlSession, String keyword) {
		return (ArrayList)sqlSession.selectList("productMapper.selectSearchKeywordReady", keyword);
	}
	
	/*상품 인기순 리스트 조회*/
	public ArrayList<Product> selectPopularList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("productMapper.selectPopularList");
	}
	
	/*상품 가격낮은순 리스트 조회*/
	public ArrayList<Product> selectLowerPriceList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("productMapper.selectLowerPriceList");
	}
	
	
	
	/*조회수 증가*/
	public int increaseCount(SqlSessionTemplate sqlSession, int productNo) {
		return sqlSession.update("productMapper.increaseCount", productNo);
	}
	
	/*상품 상세페이지*/
	public ArrayList<Product> selectDetailProduct(SqlSessionTemplate sqlSession, int productNo) {
		return (ArrayList)sqlSession.selectList("productMapper.selectDetailProduct", productNo);
	}
	
	/*상품 마지막 단어*/
	public String selectLastWord(SqlSessionTemplate sqlSession, String productName) {
		return sqlSession.selectOne("productMapper.selectLastWord", productName);
	}
	
	/*관련레시피*/
	public ArrayList<Recipe> selectRelatedRecipe(SqlSessionTemplate sqlSession, String lastWord) {
		return (ArrayList)sqlSession.selectList("productMapper.selectRelatedRecipe", lastWord);
	}
	
	
	/*등록시 엑셀 상품 데이터 조회*/
	public Product selectSearchProduct(SqlSessionTemplate sqlSession, int productNo) {
		return sqlSession.selectOne("productMapper.selectSearchProduct", productNo);
	}
	
	
	
	/*상품 등록*/
	public int insertProduct(SqlSessionTemplate sqlSession, Product p) {
		return sqlSession.insert("productMapper.insertProduct", p);
	}
	
	public int insertAttachment(SqlSessionTemplate sqlSession, Attachment at){
		return sqlSession.insert("productMapper.insertAttachment", at);
	}
	
	
	
	/*상품 삭제*/
	public int deleteProduct(SqlSessionTemplate sqlSession, int productNo) {
		return sqlSession.update("productMapper.deleteProduct", productNo);
	}
	/* 첨부파일 찐 삭제 (일단 살려두는 걸로..)
	public int deleteAttachment(SqlSessionTemplate sqlSession, String filePath) {
		return sqlSession.delete("productMapper.deleteAttachment", filePath);
	}
	*/
	// 첨부파일 status(N)
	public int deleteAttachment(SqlSessionTemplate sqlSession, String filePath) {
		return sqlSession.update("productMapper.deleteAttachment", filePath);
	}

	
	/*상품 일시품절*/
	public int readyProduct(SqlSessionTemplate sqlSession, int productNo) {
		return sqlSession.update("productMapper.readyProduct", productNo);
	}
	
	/*상품 재입고*/
	public int yesProduct(SqlSessionTemplate sqlSession, int productNo) {
		return sqlSession.update("productMapper.yesProduct", productNo);
	}
	
	/*상품 수정_ 수정할 상품의 정보1 조회*/
	public Product selectProduct(SqlSessionTemplate sqlSession, int productNo) {
		return sqlSession.selectOne("productMapper.selectProduct", productNo);
	}
	
	/*상품 수정_ 수정할 상품의 첨부파일5 조회*/
	public ArrayList<Attachment> selectAttachmentList(SqlSessionTemplate sqlSession, int productNo) {
		return (ArrayList)sqlSession.selectList("productMapper.selectAttachmentList", productNo);
	}
	
	/*상품 수정_ 수정할 상품의 정보1 update*/
	public int updateProduct(SqlSessionTemplate sqlSession, Product p) {
		return sqlSession.update("productMapper.updateProduct", p);
	}
	
	/*상품 수정_ 수정할 상품의 첨파(기존) update*/
	public int updateExistAttachment(SqlSessionTemplate sqlSession, Attachment at) {
		return sqlSession.update("productMapper.updateExistAttachment", at);
	}
	
	/*상품 수정_ 수정할 상품의 첨파(새로운) insert*/
	public int insertAddAttachment(SqlSessionTemplate sqlSession, Attachment at) {
		return sqlSession.insert("productMapper.insertAddAttachment", at);
	}
	
	
	
	/*장바구니 추가*/
	public int insertCart(SqlSessionTemplate sqlSession, Cart c) {
		return sqlSession.insert("productMapper.insertCart", c);
	}
	
	/*장바구니 리스트 조회*/
	public ArrayList<Cart> selectCartList(SqlSessionTemplate sqlSession, String userId) {
		return (ArrayList)sqlSession.selectList("productMapper.selectCartList", userId);
	}
	
	/*장바구니 담긴 상품 수*/
	public int selectCartListCount(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("productMapper.selectCartListCount", userId);
	}
	
	/*장바구니 수량 추가*/
	public int updateAddQuantity(SqlSessionTemplate sqlSession, Cart c) {
		return sqlSession.update("productMapper.updateAddQuantity", c);
	}
	
	/*장바구니 수량 빼기*/
	public int updateMinusQuantity(SqlSessionTemplate sqlSession, Cart c) {
		return sqlSession.update("productMapper.updateMinusQuantity", c);
	}
	
	
	
	
	
	/*장바구니 선택삭제*/
	public int deleteCart(SqlSessionTemplate sqlSession, Cart c) {
		return sqlSession.delete("productMapper.deleteCart", c);
	}
	
	
	/*장바구니에서 주문하기용_상품 조회 (근데 왜 selectList? => file_level=1 로 조건걸어주니 selectOne 가넝!!)*/
	/*
	public ArrayList<Cart> orderCart(SqlSessionTemplate sqlSession, Cart c) {
		return (ArrayList)sqlSession.selectList("productMapper.orderCart", c);
	}
	*/
	public Cart orderCart(SqlSessionTemplate sqlSession, Cart c) {
		return sqlSession.selectOne("productMapper.orderCart", c);
	}
	
	
	/*상세페이지에서 주문하기용_상품 조회*/
	public Product selectOrderProductInfo(SqlSessionTemplate sqlSession, int productNo) {
		return sqlSession.selectOne("productMapper.selectOrderProductInfo", productNo);
	}
	
	
	
	//----------------------------------------- 결제 API 관련 서비스-----------------------------------------
	//----------------------------------------- (단품)
	
	
	/*단품 '주문 insert' (1. 주문)*/
	public int insertOrderProduct(SqlSessionTemplate sqlSession, Orders oPro) {
		return sqlSession.insert("productMapper.insertOrderProduct", oPro);
	}
	
	/*단품 '주문 insert' (2. 주문상세)*/
	public int insertOrderDetailProduct(SqlSessionTemplate sqlSession, Orders oPro) {
		return sqlSession.insert("productMapper.insertOrderDetailProduct", oPro);
	}
	

	
	/*단품 => 최종 주문서용 orders 객체 조회(order_no 등)*/
	public Orders selectOrdersInfoFinal(SqlSessionTemplate sqlSession, String addressMain) {
		return sqlSession.selectOne("productMapper.selectOrdersInfoFinal", addressMain);
	}
	
	/*단품 => 1) 주문코드번호 2:결제완료 업데이트*/
	public int updateOrderCode(SqlSessionTemplate sqlSession, int orderNo) {
		return sqlSession.update("productMapper.updateOrderCode", orderNo);
	}
	
	/*단품 => 2) 최종 주문 완료 화면에 줄 배송정보 조회*/
	public Orders selectOrdersDelivery(SqlSessionTemplate sqlSession, int orderNo) {
		return sqlSession.selectOne("productMapper.selectOrdersDelivery", orderNo);
	}
	
	/*단품 => 2_1) 주문한 OrdersDetail에서 productNo, quantity 조회*/
	public OrdersDetail selectOrdersQuantityProductNo(SqlSessionTemplate sqlSession, int orderNo) {
		return sqlSession.selectOne("productMapper.selectOrdersQuantityProductNo", orderNo);
	}
	
	/*단품 => 2_2) 상품재고량 stock에서 주문수량 quantity 빼기 */
	public int updateProductStock(SqlSessionTemplate sqlSession, OrdersDetail quantityProductNo) {
		return sqlSession.update("productMapper.updateProductStock", quantityProductNo);
	}
	
	//----------------------------------------- (장바구니 상품)
	
	
	/*장바구니상품 '주문 insert' (1. 주문)*/
	public int insertOrderCart(SqlSessionTemplate sqlSession, Orders oCart) {
		return sqlSession.insert("productMapper.insertOrderCart", oCart);
	}
	
	/*장바구니상품 '주문 insert' (2. 주문상세) - 객체 여러번 반복*/
	public int insertOrderDetailCart(SqlSessionTemplate sqlSession, OrdersDetail odCart) {
		return sqlSession.insert("productMapper.insertOrderDetailCart", odCart);
	}
	
	
	
	/*장바구니상품 => 최종 주문서용 orders 객체 조회(order_no 등)*/
	public Orders selectOrdersDetailInfoFinal(SqlSessionTemplate sqlSession, String addressMain) {
		return sqlSession.selectOne("productMapper.selectOrdersDetailInfoFinal", addressMain);
	}
	
	/*장바구니상품 => 1) 주문코드번호 2:결제완료 업데이트		------------단품꺼 같이써 (updateOrderCode)*/
	/*장바구니상품 => 2) 최종 주문 완료 화면에 줄 배송정보 조회	------------단품꺼 같이써 (selectOrdersDelivery)*/
	
	/*장바구니상품 => 3)주문상세에서 주문한 상품번호 '조회' 후 장바구니 내역가서 삭제 */
	public ArrayList<OrdersDetail> selectOrdersDetailPnoList(SqlSessionTemplate sqlSession, int orderNo) {
		return (ArrayList)sqlSession.selectList("productMapper.selectOrdersDetailPnoList", orderNo);
	}
	
	// userId 조회
	public String selectUserId(SqlSessionTemplate sqlSession, int orderNo) {
		return sqlSession.selectOne("productMapper.selectUserId", orderNo);
	}
	
	/*장바구니상품 => 3)주문상세에서 주문한 상품번호 조회 후 장바구니 내역가서 '삭제' - 객체 여러번 반복 */
	public int deleteCartAfterOrder(SqlSessionTemplate sqlSession, OrdersDetail newOD) {
		return sqlSession.delete("productMapper.deleteCartAfterOrder", newOD);
	}
	
	/*4_1)*/
	public ArrayList<OrdersDetail> selectOrdersDetailPnoQuanList(SqlSessionTemplate sqlSession, int orderNo) {
		return (ArrayList)sqlSession.selectList("productMapper.selectOrdersDetailPnoQuanList", orderNo);
	}
	
	/*4_2)*/
	public int updateProductStockCart(SqlSessionTemplate sqlSession, OrdersDetail newOD) {
		return sqlSession.update("productMapper.updateProductStockCart", newOD);
	}
	
	
	//-------------------------------댓글(후기review)-------------------------------
	
	/*후기댓글 리스트 조회*/
	public ArrayList<Review> selectReviewList(SqlSessionTemplate sqlSession, int productNo) {
		return (ArrayList)sqlSession.selectList("productMapper.selectReviewList", productNo);
	}
	
	/*후기댓글 작성*/
	public int insertReview(SqlSessionTemplate sqlSession, Review r) {
		return sqlSession.insert("productMapper.insertReview", r);
	}
	
	/*후기댓글 삭제*/
	public int deleteReview(SqlSessionTemplate sqlSession, Review r) {
		return sqlSession.update("productMapper.deleteReview", r);
	}
	
	
	/*장바구니 상품 중복 검사*/
	public int selectAddCartDuplication(SqlSessionTemplate sqlSession, Cart c) {
		return sqlSession.selectOne("productMapper.selectAddCartDuplication", c);
	}

	
	//-----------------------------마이페이지-----------------------------
	
	/** 마이페이지 주문 상품 조회 리스트
	 * @param sqlSession
	 * @return
	 */
	public ArrayList<Product> myPageSelectOrderList(SqlSessionTemplate sqlSession, String userId) {
		
		return (ArrayList)sqlSession.selectList("productMapper.myPageSelectOrderList", userId);
		
	}

	/** 마이페이지 주문 배송 관련 정보
	 * @param sqlSession
	 * @param orderNo
	 * @return
	 */
	public Orders myPageSelectOrderInfo(SqlSessionTemplate sqlSession, int orderNo) {
		
		return sqlSession.selectOne("productMapper.myPageSelectOrderInfo", orderNo);
	}
	
	
	
	
}