package com.kh.uglytasty.product.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.uglytasty.order.model.vo.Cart;
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

	/*일시품절*/
	@Override
	public int readyProduct(int productNo) {
		return pDao.readyProduct(sqlSession, productNo);
	}

	
	
	
	
	@Override
	public int updateProduct(Product p) {
		return 0;
	}

	@Override
	public ArrayList<Attachment> updateAttachment(int productNo) {
		return null;
	}

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

	@Override
	public ArrayList<Recipe> selectProRecipeList() {
		return null;
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

	
	/*장바구니 선택삭제 1)*/
	@Override
	public int deleteCartProduct(ArrayList<Cart> clist) {	// productNo 각각 담긴 Cart객체들 모음집
		
		int result = 0;
		
		for(Cart c : clist) {
				// *** 여기서 성공하면 밑 deleteCart() 호출 / 매개변수로 Cart객체 하나씩 보내 ***
			 	result += pDao.deleteCart(sqlSession, c);
			}
		System.out.println("s의 result : " + result);
		
		return result;
	}

	/*

	@Override
	public int deleteCart(Cart c) {
		return pDao.deleteCart(sqlSession, c);
	}
*/

	

	
	

}

	