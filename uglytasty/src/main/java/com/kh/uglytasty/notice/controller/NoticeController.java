package com.kh.uglytasty.notice.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.uglytasty.common.model.vo.PageInfo;
import com.kh.uglytasty.common.template.Pagination;
import com.kh.uglytasty.notice.model.service.NoticeSeriviceImpl;
import com.kh.uglytasty.notice.model.vo.Notice;

/** 
 * NoticeController.java
 * @author ksy
 * @Date : 2023.10.18
 */
@Controller
public class NoticeController {
	
	@Autowired
	private NoticeSeriviceImpl nService;
	
	
	
	/**
	 * 공지사항 목록 조회 메소드
	 * @param currentPage
	 * @param model
	 * @return
	 */
	@RequestMapping("list.no")
	public String selectNoticeList(@RequestParam(value="cpage", defaultValue = "1") int currentPage, Model model) {
		
		int listCount = nService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 6);
		
		
		ArrayList<Notice> list = nService.selectNoticeList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list",list);
		
		return "notice/noticeListView";
	}
	
	@RequestMapping("search.no")
	public String selectSearchList(@RequestParam(value="cpage", defaultValue = "1") int currentPage, String condition, String keyword, Model model ) {
		
		// 페이징 처리를 위한 공지사항 검색목록 개수 조회
		HashMap<String, String> map = new HashMap<>();
		map.put("condition", condition);
		map.put("keyword", keyword);
		
		int listCount = nService.selectSearchListCount(map);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 6);
		
		
		ArrayList<Notice> list = nService.selectSearchList(map, pi);
		
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "notice/noticeListView";
		
		
	}

}










