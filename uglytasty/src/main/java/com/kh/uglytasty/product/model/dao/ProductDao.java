package com.kh.uglytasty.product.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.uglytasty.order.model.vo.Cart;
import com.kh.uglytasty.product.model.vo.Attachment;
import com.kh.uglytasty.product.model.vo.Product;

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
	
	
	
	
	public int increaseCount(SqlSessionTemplate sqlSession, int productNo) {
		return sqlSession.update("productMapper.increaseCount", productNo);
	}
	
	public ArrayList<Product> selectDetailProduct(SqlSessionTemplate sqlSession, int productNo) {
		return (ArrayList)sqlSession.selectList("productMapper.selectDetailProduct", productNo);
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
	
	public int deleteAttachment(SqlSessionTemplate sqlSession, String filePath) {
		return sqlSession.delete("productMapper.deleteAttachment", filePath);
	}
	
	/*상품 소진*/
	public int readyProduct(SqlSessionTemplate sqlSession, int productNo) {
		return sqlSession.update("productMapper.readyProduct", productNo);
	}
	
	
	/*장바구니 추가*/
	public int insertCart(SqlSessionTemplate sqlSession, Cart c) {
		return sqlSession.insert("productMapper.insertCart", c);
	}
	
	/*장바구니 리스트 조회*/
	public ArrayList<Cart> selectCartList(SqlSessionTemplate sqlSession, String userId, int productNo) {
		return (ArrayList)sqlSession.selectList("productMapper.selectCartList", userId);
	}
	
	/*장바구니 담긴 상품 수*/
	public int selectCartListCount(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("productMapper.selectCartListCount", userId);
	}
	
	
	
	
}
