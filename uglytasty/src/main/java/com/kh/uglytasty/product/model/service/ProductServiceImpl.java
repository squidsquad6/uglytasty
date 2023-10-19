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
	
	
	
	
	@Override
	public ArrayList<Product> selectProductList() {
		return pDao.selectProductList(sqlSession);
	}

	@Override
	public ArrayList<Product> selectProductListKeyword(String searchProductKey) {
		return null;
	}

	@Override
	public int increaseCount(int productNo) {
		return pDao.increaseCount(sqlSession, productNo);
	}

	@Override
	public ArrayList<Product> selectDetailProduct(int productNo) {
		return pDao.selectDetailProduct(sqlSession, productNo);
	}

	@Override
	public Product selectSearchProduct(int productNo) {
		return pDao.selectSearchProduct(sqlSession, productNo);
	}

	/**/
	@Override
	public int insertProduct(Product p, ArrayList<Attachment> alist) {	// 정보1+첨부파일5
		
		int result1 = pDao.insertProduct(sqlSession, p);
		
		//int pno = pDao.selectPno(sqlSession, p.getProductName());
		
		int result2 = 0;
		
		if(result1 > 0) { // 상품 정보 등록 성공
			
			for(int i=0; i<alist.size(); i++) {
				//alist.get(i).setRefProductNo(pno); // pno까지 추가
				result2 = insertAttachment(alist.get(i));
			}
		
		}
		int result = result1 * result2;
		return result; //1:성공, 0:실패
	}
	
	/**/
	@Override
	public int insertAttachment(Attachment at) {
		return pDao.insertAttachment(sqlSession, at);
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
	public int DeleteProduct(int productNo) {
		return 0;
	}

	@Override
	public int DeleteAttachment(int productNo) {
		return 0;
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

	@Override
	public int insertCart(Cart c) {
		return pDao.insertCart(sqlSession, c);
	}

	

}
