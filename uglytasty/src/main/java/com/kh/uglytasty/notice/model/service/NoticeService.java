package com.kh.uglytasty.notice.model.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.kh.uglytasty.common.model.vo.PageInfo;
import com.kh.uglytasty.notice.model.vo.Notice;

public interface NoticeService {
	
	// 0. 공지사항 개수 조회(페이징)
	int selectListCount();
	
	// 1. 공지사항 조회
	ArrayList<Notice> selectNoticeList(PageInfo pi);
	
	// 2. 공지사항 검색 개수 조회(페이징)
	int selectSearchListCount(HashMap<String, String> map);
	
	// 3. 공지사항 검색
	ArrayList<Notice> selectSearchList(HashMap<String, String> map, PageInfo pi);

}
