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
	
	@RequestMapping("enroll.no")
	public String goToEnrollForm() {
		
		return "notice/noticeEnrollForm";
	}
	
	@RequestMapping("delete.no")
	public String deleteNotice(@RequestParam("noticeNo") int noticeNo, Model model) {
		
		int result = nService.deleteNotice(noticeNo);
		if(result>0) {//성공 =>게시글 리스트페이지(list.bo url재요청)
			
			model.addAttribute("alertMsg", "성공적으로 삭제되었습니다.");
			return "redirect:list.no";
		}else {//실패=>에러 페이지 포워딩
			model.addAttribute("errorMsg", "게시글 삭제 실패!");
			
			return "common/errorPage";
		}
		
		
	}
	
	@RequestMapping("updateForm.no")
	public String updateNotice(@RequestParam("noticeNo") int noticeNo, @RequestParam("noticeTitle") String noticeTitle, @RequestParam("noticeContent") String noticeContent, @RequestParam("upfix") String upfix, Model model) {
		
		Notice n = nService.selectNotice(noticeNo);
		
		
		
		model.addAttribute("n" , n);
		
		return "notice/noticeUpdateForm";
		
		
	}
	
	@RequestMapping("update.no")
	public String noticeUpdate(String title, String content, String upfix, int noticeNo, Model model) {
		
		Notice n = nService.selectNotice(noticeNo);
		
		
		
		
		int result = nService.noticeUpdate(n);
		
		if(result>0) {//성공 =>게시글 리스트페이지(list.bo url재요청)
			
			model.addAttribute("alertMsg", "성공적으로 수정되었습니다.");
			return "redirect:list.no";
		}else {//실패=>에러 페이지 포워딩
			model.addAttribute("errorMsg", "게시글 수정 실패!");
			
			return "common/errorPage";
		}
	}
	
	@RequestMapping("insert.no")
	public String insertNotice(String title, String content,String upfix, Model model) {
		
	
		
		int result = nService.insertNotice(title, content, upfix);
		
		
		if(result>0) {//성공 =>게시글 리스트페이지(list.bo url재요청)
			
			model.addAttribute("alertMsg", "성공적으로 등록되었습니다.");
			return "redirect:list.no";
		}else {//실패=>에러 페이지 포워딩
			model.addAttribute("errorMsg", "게시글 등록 실패!");
			
			return "common/errorPage";
		}
		
		
	}

}










