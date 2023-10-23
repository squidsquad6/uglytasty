package com.kh.uglytasty.qa.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.uglytasty.common.model.vo.PageInfo;
import com.kh.uglytasty.qa.model.vo.QA;

public interface QAService {

	// 0. 1:1 문의 개수 조회 (페이징)
	int selectListCount(String userId);
	
	// 1. 1:1 문의 목록 조회
	ArrayList<QA> selectQAList(String userId, PageInfo pi);
	
	// 2. 1:1 문의 검색 개수 조회 (페이징)
	int selectSearchListCount(HashMap<String, String> map);
	
	// 3. 1:1 문의 검색 조회
	ArrayList<QA> selectSearchQAList(HashMap<String, String> map, PageInfo pi);
	
	// 4. 1:1 문의 카테고리별 개수 조회 (페이징, ajax)
	int ajaxSelectListCount(HashMap<String, String> map);
	
	// 5. 1:1 문의 카테고리별 조회 (ajax)
	ArrayList<QA> ajaxSelctQAList(HashMap<String, String> map, PageInfo pi);
	
	// 6. 1:1 문의 상세 조회
	QA selectDetail(int qaNo);
	
	// 7. 1:1 문의 등록
	int insertQA(QA qa);
	
	// 8. 1:1 문의 삭제
	int deleteQA(int qaNo);
	
	// 9. 1:1 문의 수정
	int updateQA(QA qa);
	
	
}
