package com.kh.uglytasty.product.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.uglytasty.order.model.vo.Cart;
import com.kh.uglytasty.order.model.vo.Orders;
import com.kh.uglytasty.order.model.vo.OrdersDetail;
import com.kh.uglytasty.product.model.dao.ProductDao;
import com.kh.uglytasty.product.model.vo.Attachment;
import com.kh.uglytasty.product.model.vo.Product;
import com.kh.uglytasty.product.model.vo.Review;
import com.kh.uglytasty.recipe.model.vo.Recipe;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductDao pDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	
	
	
	
	
	/*상품 리스트 조회 (기본 + 키워드검색)*/
	@Override
	public ArrayList<Product> selectProductList() {
		return pDao.selectProductList(sqlSession);
	}
	
	@Override
	public ArrayList<Product> selectReadyList() {
		return pDao.selectReadyList(sqlSession);
	}
	
	@Override
	public ArrayList<Product> selectSearchKeyword(String keyword) {
		return pDao.selectSearchKeyword(sqlSession, keyword);
	}
	
	@Override
	public ArrayList<Product> selectSearchKeywordReady(String keyword) {
		return pDao.selectSearchKeywordReady(sqlSession, keyword);
	}

	

	/*조회수 증가*/
	@Override
	public int increaseCount(int productNo) {
		return pDao.increaseCount(sqlSession, productNo);
	}

	/*상품 상세페이지*/
	@Override
	public ArrayList<Product> selectDetailProduct(int productNo) {
		return pDao.selectDetailProduct(sqlSession, productNo);
	}
	
	
	
	
	/*상품등록시 엑셀데이터 조회*/
	@Override
	public Product selectSearchProduct(int productNo) {
		return pDao.selectSearchProduct(sqlSession, productNo);
	}

	/*상품등록 순서1*/
	@Override
	public int insertProduct(Product p, ArrayList<Attachment> alist) {	// 정보1+첨부파일5
		
		int result1 = pDao.insertProduct(sqlSession, p);
		
		int result2 = 0;
		
		if(result1 > 0) { // 상품 정보 등록 성공
			
			for(int i=0; i<alist.size(); i++) {
				// *** 여기서 성공하면 밑 insertAttachment() 호출 ***
				result2 = insertAttachment(alist.get(i));
			}
		
		}
		int result = result1 * result2;
		return result; //1:성공, 0:실패
	}
	
	/*상품등록 순서2*/
	@Override
	public int insertAttachment(Attachment at) {
		return pDao.insertAttachment(sqlSession, at);
	}
	
	/*상품삭제 순서1*/
	@Override
	public int deleteProduct(int productNo, ArrayList<String> filePathList) {
		
		int result1 = pDao.deleteProduct(sqlSession, productNo);
		
		int result2 = 0;
		
		if(result1 > 0) {
			for(int i=0; i<filePathList.size(); i++) {
				// *** 여기서 성공하면 밑 deleteAttachment() 호출 / 매개변수로 하나씩 보내 ***
				result2 = deleteAttachment(filePathList.get(i));
			}
		}
		int result = result1 * result2;
		return result;
	}
	
	/*상품삭제 순서2*/
	@Override
	public int deleteAttachment(String filePath) {
		return pDao.deleteAttachment(sqlSession, filePath);
	}

	/*상품 일시품절*/
	@Override
	public int readyProduct(int productNo) {
		return pDao.readyProduct(sqlSession, productNo);
	}

	/*상품 재입고*/
	@Override
	public int yesProduct(int productNo) {
		return pDao.yesProduct(sqlSession, productNo);
	}
	
	/*상품 수정_ 수정할 상품의 정보1 조회*/
	@Override
	public Product selectProduct(int productNo) {
		return pDao.selectProduct(sqlSession, productNo);
	}
	
	/*상품 수정_ 수정할 상품의 첨부파일5 조회*/
	@Override
	public ArrayList<Attachment> selectAttachmentList(int productNo) {
		return pDao.selectAttachmentList(sqlSession, productNo);
	}

	/*상품 수정_ 수정할 상품의 정보1 update*/
	@Override
	public int updateProduct(Product p) {
		return pDao.updateProduct(sqlSession, p);
	}
	
	/*상품 수정_ 수정할 상품의 첨파(기존) update*/
	@Override
	public int updateExistAttachment(ArrayList<Attachment> updateAtList) {
		int result = 0;
		
		for(Attachment at : updateAtList) {
			result += pDao.updateExistAttachment(sqlSession, at); 
		}
		
		return result;
	}

	/*상품 수정_ 수정할 상품의 첨파(새로운) insert*/
	@Override
	public int insertAddAttachment(ArrayList<Attachment> insertAtList) {
		int result = 0;
		
		for(Attachment at : insertAtList) {
			result += pDao.insertAddAttachment(sqlSession, at);
		}
		
		return result;
	}

	
	
	/*장바구니 상품 추가*/
	@Override
	public int insertCart(Cart c) {
		return pDao.insertCart(sqlSession, c);
	}

	/*장바구니 리스트 조회*/
	@Override
	public ArrayList<Cart> selectCartList(String userId) {
		return pDao.selectCartList(sqlSession, userId);
	}
	
	/*장바구니 담긴 상품 수*/
	@Override
	public int selectCartListCount(String userId) {
		return pDao.selectCartListCount(sqlSession, userId);
	}
	
	/*장바구니 수량 추가*/
	@Override
	public int updateAddQuantity(Cart c) {
		return pDao.updateAddQuantity(sqlSession, c);
	}

	/*장바구니 수량 빼기*/
	@Override
	public int updateMinusQuantity(Cart c) {
		return pDao.updateMinusQuantity(sqlSession, c);
	}
	
	
	
	
	/*장바구니 선택삭제*/
	@Override
	public int deleteCartProduct(ArrayList<Cart> clist) {	// productNo 각각 담긴 Cart객체들 모음집
		
		int result = 0;
		
		for(Cart c : clist) {
				// *** 여기서 성공하면 밑 deleteCart() 호출 / 매개변수로 Cart객체 하나씩 보내 ***
			 	result += pDao.deleteCart(sqlSession, c);
		}
		
		return result;
	}
	
	/*장바구니에서 주문하기용_상품 조회*/
	@Override
	public ArrayList<Cart> orderCartProduct(ArrayList<Cart> clist) {
		
		ArrayList<Cart> clistOrder = new ArrayList<Cart>();
		
		for(Cart c : clist) {
			// *** 여기서 성공하면 orderCart() 호출 / 매개변수로 Cart객체 하나씩 보내 ***
			
			//ArrayList<Cart> resultCart = pDao.orderCart(sqlSession, c);
			//clistOrder.addAll(resultCart);
			
			Cart cartItem = pDao.orderCart(sqlSession, c);
			clistOrder.add(cartItem);
			
		}
	
		return clistOrder;
	}
	
	/*상세페이지에서 주문하기용_상품 조회*/
	@Override
	public Product selectOrderProductInfo(int productNo) {
		return pDao.selectOrderProductInfo(sqlSession, productNo);
	}

	
	
	
	//----------------------------------------- 결제 API 관련 서비스-----------------------------------------
	//----------------------------------------- (단품)
	
	
	/*단품 '주문 insert' | oPro에 (1)(2)에 필요한거 다 들어있음  */
	@Override
	public int insertOrderProduct(Orders oPro) {
		
		int result1 = pDao.insertOrderProduct(sqlSession, oPro);
		
		int result2 = 0;
		
		if(result1 > 0) { // (주문)넣고, (주문상세)넣기
			result2 = pDao.insertOrderDetailProduct(sqlSession, oPro);
		}
		
		int result = result1 * result2;
		
		return result; 

	}
	
	
	/*단품 => 긴주문번호 뒤에 붙여 담아갈 orders 객체 조회(order_no 등)*/
	@Override
	public Orders selectOrdersInfoFinal(String addressMain) {
		return pDao.selectOrdersInfoFinal(sqlSession, addressMain);
	}

	/*단품 => 1) 주문코드번호 2:결제완료 업데이트*/
	@Override
	public int updateOrderCode(int orderNo) {
		return pDao.updateOrderCode(sqlSession, orderNo);
	}

	/*단품 => 2) 최종 주문 완료 화면에 줄 배송정보 조회*/
	@Override
	public Orders selectOrdersDelivery(int orderNo) {
		return pDao.selectOrdersDelivery(sqlSession, orderNo);
	}

	
	
	//----------------------------------------- (장바구니 상품)
	
	
	/*장바구니상품 '주문 insert' | oPro는 (1)에 필요, odList는 (2)에 필요*/
	@Override
	public int insertOrderCart(Orders oCart, ArrayList<OrdersDetail> odList) {
		
		int result1 = pDao.insertOrderCart(sqlSession, oCart);
		
		int result2 = 0;

		if(result1 > 0) {
		
			for(OrdersDetail odCart : odList) {
				// *** 여기서 성공하면 밑 insertOrderDetailCart() 호출 / 매개변수로 OrdersDetail 객체 하나씩 보내 ***
			 	result2 += pDao.insertOrderDetailCart(sqlSession, odCart);
			}
			
		}
		
		int result = result1 * result2;

		return result;
	}

	
	/*장바구니상품 => 긴주문번호 뒤에 붙여 담아갈 orders 객체 조회(order_no 등)*/
	@Override
	public Orders selectOrdersDetailInfoFinal(String addressMain) {
		return pDao.selectOrdersDetailInfoFinal(sqlSession, addressMain);
	}

	
	/*장바구니상품 => 1) 주문코드번호 2:결제완료 업데이트			------------단품꺼 같이써 (updateOrderCode)*/
	/*장바구니상품 => 2) 최종 주문 완료 화면에 줄 배송정보 조회	------------단품꺼 같이써 (selectOrdersDelivery)*/

	/*장바구니상품 => 3)주문상세에서 주문한 상품번호 '조회' 후 장바구니 내역가서 삭제 */
	@Override
	public ArrayList<OrdersDetail> selectOrdersDetailPnoList(int orderNo) {
		return pDao.selectOrdersDetailPnoList(sqlSession, orderNo);
	}
	
	// userId 조회
	@Override
	public String selectUserId(int orderNo) {
		return pDao.selectUserId(sqlSession, orderNo);
	}

	/*장바구니상품 => 3)주문상세에서 주문한 상품번호 조회 후 장바구니 내역가서 '삭제' */
	@Override
	public int deleteCartAfterOrder(ArrayList<OrdersDetail> delList) {
		
		int result = 0;
		
		for(OrdersDetail newOD : delList) {
			// 객체 하나씩 계속 보내
		 	result += pDao.deleteCartAfterOrder(sqlSession, newOD);
		}
		
		return result;
	}


	
	
	
	
	
	
	
	
	

	/*후기댓글 관련.....3개*/
	@Override
	public ArrayList<Review> selectReviewList(int productNo) {
		return null;
	}

	@Override
	public int insertReview(Review r) {
		return 0;
	}

	@Override
	public int deleteReview(int ReviewNo) {
		return 0;
	}

	


	
	

	


	
	
	
	
	

}

	