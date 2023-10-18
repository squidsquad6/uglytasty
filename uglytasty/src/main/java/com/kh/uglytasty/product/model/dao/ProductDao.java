package com.kh.uglytasty.product.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.uglytasty.product.model.vo.Attachment;
import com.kh.uglytasty.product.model.vo.Product;

@Repository
public class ProductDao {

	public ArrayList<Product> selectProductList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("productMapper.selectProductList");
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
	
	public int insertProduct(SqlSessionTemplate sqlSession, Product p) {
		return sqlSession.insert("productMapper.insertProduct", p);
	}
	
	/*
	public int selectPno(SqlSessionTemplate sqlSession, String pName) {
		return sqlSession.selectOne("productMapper.selectPno", pName);
	}
	*/
	
	public int insertAttachment(SqlSessionTemplate sqlSession, Attachment at){
		return sqlSession.insert("productMapper.insertAttachment", at);
	}
	
	
}
