package com.kh.uglytasty.qa.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.uglytasty.common.model.vo.PageInfo;
import com.kh.uglytasty.qa.model.vo.QA;
/** 
 * QADao.java
 * @author ksy
 * @Date : 2023.10.18
 */
@Repository
public class QADao {
	
	/**
	 * 1:1 문의 목록 개수 조회 메소드
	 * @param sqlSession
	 * @return
	 */
	public int selectListCount(SqlSessionTemplate sqlSession, String userId) {
		return sqlSession.selectOne("qaMapper.selectListCount", userId);
	}
	
	/**
	 * 1:1 문의 목록 조회 메소드
	 * @param sqlSession
	 * @param userId
	 * @param pi
	 * @return
	 */
	public ArrayList<QA> selectQAList(SqlSessionTemplate sqlSession, String userId, PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();		
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		return (ArrayList)sqlSession.selectList("qaMapper.selectQAList", userId, rowBounds);
	}

	/**
	 * 1:1 문의 검색 목록 개수 조회 메소드
	 * @param sqlSession
	 * @param map
	 * @return
	 */
	public int selectSearchListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("qaMapper.selectSearchListCount", map);
	}

	/** 
	 * 1:1 문의 검색 목록 조회 메소드
	 * @param sqlSession
	 * @param map
	 * @param pi
	 * @return
	 */
	public ArrayList<QA> selectSearchQAList(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();		
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("qaMapper.selectSearchQAList", map, rowBounds);
	}

	/** 
	 * 1:1 문의 카테고리별 목록 개수 조회 메소드
	 * @param sqlSession
	 * @param userId
	 * @return
	 */
	public int ajaxSelectListCount(SqlSessionTemplate sqlSession,  HashMap<String, String> map) {
		return sqlSession.selectOne("qaMapper.ajaxSelectListCount", map);
	}

	/** 
	 * 1:1 문의 카테고리별 목록 조회 메소드
	 * @param sqlSession
	 * @param userId
	 * @param pi
	 * @return
	 */
	public ArrayList<QA> ajaxSelctQAList(SqlSessionTemplate sqlSession,  HashMap<String, String> map, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();		
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("qaMapper.ajaxSelctQAList", map);
	}

	/**
	 * 1:1 문의 상세 조회 메소드
	 * @param sqlSession
	 * @param qaNo
	 * @return
	 */
	public QA selectDetail(SqlSessionTemplate sqlSession, int qaNo) {
		return sqlSession.selectOne("qaMapper.selectDetail", qaNo);
	}

	/**
	 * 1:1 문의 등록 메소드
	 * @param sqlSession
	 * @param qa
	 * @return
	 */
	public int insertQA(SqlSessionTemplate sqlSession, QA qa) {
		return sqlSession.insert("qaMapper.insertQA", qa);
	}

	/**
	 * 1:1 문의 삭제 메소드
	 * @param sqlSession
	 * @param qaNo
	 * @return
	 */
	public int deleteQA(SqlSessionTemplate sqlSession, int qaNo) {
		return sqlSession.update("qaMapper.deleteQA", qaNo);
	}

	

}
