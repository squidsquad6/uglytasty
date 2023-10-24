package com.kh.uglytasty.product.model.service;


import java.util.ArrayList;

import com.kh.uglytasty.order.model.vo.Cart;
import com.kh.uglytasty.order.model.vo.Orders;
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

	
	
	
	// 상품 상세 조회용 서비스
	int increaseCount(int productNo);
	ArrayList<Product> selectDetailProduct(int productNo);

	// 상품 엑셀데이터 검색 조회용 서비스 (ajax)
	Product selectSearchProduct(int productNo);

	// 상품 등록 작성 서비스
	// (둘다 처음 등록시 product먼저 등록시켜 productNo 생기도록 해야함. 그래야 attachment 에서 productNo 가지고 첨파 등록할수있음)
	int insertProduct(Product p, ArrayList<Attachment> alist);
	int insertAttachment(Attachment at);

	// 상품 수정용 서비스
	int updateProduct(Product p);
	ArrayList<Attachment> updateAttachment(int productNo);

	// 상품 삭제용 서비스
	// (DB : 둘 다  status=N / spring : 첨파 delete )
	int deleteProduct(int productNo, ArrayList<String> filepathList);
	int deleteAttachment(String filepath);
	
	// 상품 소진용 서비스
	int readyProduct(int productNo);

	
	
	
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
	
	
	
	
	
	// 후기댓글 리스트 조회용 서비스 (ajax)
	ArrayList<Review> selectReviewList(int productNo);

	// 후기댓글 작성용 서비스 (ajax)
	int insertReview(Review r);

	// 후기댓글 삭제용 서비스 (ajax)
	int deleteReview(int ReviewNo);



	// 레시피 리스트 조회용 서비스
	ArrayList<Recipe> selectProRecipeList();

	
	
}
