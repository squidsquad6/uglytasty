package com.kh.uglytasty.product.model.service;


public interface ProductService {


import java.util.ArrayList;

import com.kh.uglytasty.product.model.vo.Attachment;
import com.kh.uglytasty.product.model.vo.Product;
import com.kh.uglytasty.product.model.vo.Review;
import com.kh.uglytasty.recipe.model.vo.Recipe;

public interface ProductService {

	// 상품 리스트 조회용 서비스
	ArrayList<Product> selectProductList();

	// 상품 키워드 검색 리스트 조회용 서비스
	// 방법2)@RequestParam 어노테이션 이용하는 방법
	// (input name="searchProductKey")
	ArrayList<Product> selectProductListKeyword(String searchProductKey);


	
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
	int DeleteProduct(int productNo);
	int DeleteAttachment(int productNo);



	// 후기댓글 리스트 조회용 서비스 (ajax)
	ArrayList<Review> selectReviewList(int productNo);

	// 후기댓글 작성용 서비스 (ajax)
	int insertReview(Review r);

	// 후기댓글 삭제용 서비스 (ajax)
	int deleteReview(int ReviewNo);



	// 레시피 리스트 조회용 서비스
	ArrayList<Recipe> selectProRecipeList();

	
	
	

}
