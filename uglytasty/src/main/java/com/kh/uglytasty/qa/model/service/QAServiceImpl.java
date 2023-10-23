package com.kh.uglytasty.qa.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.uglytasty.common.model.vo.PageInfo;
import com.kh.uglytasty.qa.model.dao.QADao;
import com.kh.uglytasty.qa.model.vo.QA;

import oracle.net.aso.q;
/** 
 * QAServiceImpl.java
 * @author ksy
 * @Date : 2023.10.18
 */
@Service
public class QAServiceImpl implements QAService {
	
	@Autowired
	private QADao qDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	/**
	 * 1:1 문의 목록 개수 조회 메소드
	 */
	@Override
	public int selectListCount(String userId) {
		return qDao.selectListCount(sqlSession, userId);
	}

	/**
	 * 1:1 문의 목록 조회 메소드
	 */
	@Override
	public ArrayList<QA> selectQAList(String userId, PageInfo pi) {
		return qDao.selectQAList(sqlSession, userId, pi);
	}

	/**
	 * 1:1 문의 검색 목록 개수 조회 메소드
	 */
	@Override
	public int selectSearchListCount(HashMap<String, String> map) {
		return qDao.selectSearchListCount(sqlSession, map);
	}

	/**
	 * 1:1 문의 검색 목록 조회 메소드
	 */
	@Override
	public ArrayList<QA> selectSearchQAList(HashMap<String, String> map, PageInfo pi) {
		return qDao.selectSearchQAList(sqlSession, map, pi);
	}

	/**
	 * 1:1 문의 카테고리별 목록 개수 조회 메소드
	 */
	@Override
	public int ajaxSelectListCount(HashMap<String, String> map) {
		return qDao.ajaxSelectListCount(sqlSession, map);
	}

	/**
	 * 1:1 문의 카테고리별 목록 조회 메소드
	 */
	@Override
	public ArrayList<QA> ajaxSelctQAList(HashMap<String, String> map, PageInfo pi) {
		return qDao.ajaxSelctQAList(sqlSession, map, pi);
	}

	/**
	 * 1:1 문의 상세 조회 메소드
	 */
	@Override
	public QA selectDetail(int qaNo) {
		return qDao.selectDetail(sqlSession, qaNo);
	}

	/**
	 * 1:1 문의 등록 메소드
	 */
	@Override
	public int insertQA(QA qa) {
		return qDao.insertQA(sqlSession, qa);
	}

	/**
	 * 1:1 문의 삭제 메소드
	 */
	@Override
	public int deleteQA(int qaNo) {
		return qDao.deleteQA(sqlSession, qaNo);
	}

	/**
	 * 1:1 문의 수정 메소드
	 */
	@Override
	public int updateQA(QA qa) {
		return qDao.updateQA(sqlSession, qa);
	}

}
