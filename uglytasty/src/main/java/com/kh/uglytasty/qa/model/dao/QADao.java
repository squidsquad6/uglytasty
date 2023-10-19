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

	public int selectSearchListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("qaMapper.selectSearchListCount", map);
	}

	public ArrayList<QA> selectSearchQAList(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();		
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("qaMapper.selectSearchQAList", map, rowBounds);
	}

}
