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
	
}
