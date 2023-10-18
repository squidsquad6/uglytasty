package com.kh.uglytasty.notice.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.uglytasty.common.model.vo.PageInfo;
import com.kh.uglytasty.notice.model.dao.NoticeDao;
import com.kh.uglytasty.notice.model.vo.Notice;

/** 
 * NoticeSeriviceImpl.java
 * @author ksy
 * @Date : 2023.10.18
 */
@Service
public class NoticeSeriviceImpl implements NoticeService {
	
	@Autowired
	private NoticeDao nDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	/**
	 * 공지사항 개수 조회 메소드
	 */
	@Override
	public int selectListCount() {
		return nDao.selectListCount(sqlSession);
	}

	
	
	/**
	 * 공지사항 목록 조회 메소드
	 */
	@Override
	public ArrayList<Notice> selectNoticeList(PageInfo pi) {
		return nDao.selectNoticeList(sqlSession, pi);
	}
	
	
	
	/**
	 * 공지사항 검색 목록 개수 조회 메소드
	 */
	@Override
	public int selectSearchListCount(HashMap<String, String> map) {
		return nDao.selectSearchListCount(sqlSession, map);
	}



	/**
	 * 공지사항 검색 목록 조회 메소드
	 */
	@Override
	public ArrayList<Notice> selectSearchList(HashMap<String, String> map, PageInfo pi) {
		return nDao.selectSearchList(sqlSession, map, pi);
	}



	



}
