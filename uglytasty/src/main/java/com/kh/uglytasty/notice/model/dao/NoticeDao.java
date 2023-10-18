package com.kh.uglytasty.notice.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.uglytasty.common.model.vo.PageInfo;
import com.kh.uglytasty.notice.model.vo.Notice;

/** 
 * NoticeDao.java
 * @author ksy
 * @Date : 2023.10.18
 */
@Repository
public class NoticeDao {
	
	/**
	 * 공지사항 총 개수 조회 메소드
	 * @param sqlsession
	 * @return
	 */
	public int selectListCount(SqlSessionTemplate sqlsession) {
		return sqlsession.selectOne("noticeMapper.selectListCount");
	}
	
	/**
	 * 공지사항 목록 조회 메소드
	 * @param sqlSession
	 * @param pi
	 * @return
	 */
	public ArrayList<Notice> selectNoticeList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();		
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("noticeMapper.selectNoticeList", null, rowBounds);
	}
	
	/**
	 * 공지사항 검색 목록 개수 조회 메소드
	 * @param sqlSession
	 * @param map
	 * @return
	 */
	public int selectSearchListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		return sqlSession.selectOne("noticeMapper.selectSearchListCount", map);
		
	}

	public ArrayList<Notice> selectSearchList(SqlSessionTemplate sqlSession, HashMap<String, String> map, PageInfo pi) {
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		int limit = pi.getBoardLimit();		
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("noticeMapper.selectSearchList", map, rowBounds);
	}

}
