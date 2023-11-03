package com.kh.uglytasty.qa.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kh.uglytasty.common.model.vo.PageInfo;
import com.kh.uglytasty.common.template.Pagination;
import com.kh.uglytasty.member.model.vo.Member;
import com.kh.uglytasty.qa.model.service.QAServiceImpl;
import com.kh.uglytasty.qa.model.vo.QA;

/** 
 * QAController.java
 * @author ksy
 * @Date : 2023.10.18
 */
@Controller
public class QAController {
	
	@Autowired
	private QAServiceImpl qService;
	
	/**
	 * 1:1 문의 목록 조회 메소드
	 * @param currentPage
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("list.qa")
	public String selectQAList(@RequestParam(value="cpage", defaultValue = "1") int currentPage, 
								HttpSession session, Model model) {
		
		String userId = ((Member)(session.getAttribute("loginMember"))).getUserId();

		int listCount = qService.selectListCount(userId);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		
		ArrayList<QA> list = qService.selectQAList(userId, pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "qa/qaListView";
	}
	
	
	/**
	 * 1:1 문의 검색 목록 조회 서비스
	 * @param currentPage
	 * @param period
	 * @param condition
	 * @param keyword
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("search.qa")
	public String selectSearchList(@RequestParam(value="cpage", defaultValue = "1") int currentPage,
									String period, String condition, String keyword,
								HttpSession session, Model model) {
		
		String userId = ((Member)(session.getAttribute("loginMember"))).getUserId();
		
		
		HashMap<String, String> map = new HashMap<>();
		map.put("period", period);
		map.put("condition", condition);
		map.put("keyword", keyword);
		map.put("userId", userId);
		
		
		int listCount = qService.selectSearchListCount(map);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		
		System.out.println(listCount);
		
		ArrayList<QA> list = qService.selectSearchQAList(map, pi);
		
		model.addAttribute("period", period);
		model.addAttribute("condition", condition);
		model.addAttribute("keyword", keyword);
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "qa/qaListView";
		
		
	}
	
	/**
	 * 1:1 문의 카테고리별 목록 조회 (ajax)
	 * @param currentPage
	 * @param session
	 * @param categoryNo
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="ajaxList.qa", produces="application/json; charset=UTF-8")
	public String ajaxSelectList(@RequestParam(value="cpage", defaultValue = "1") int currentPage, 
								  HttpSession session, String categoryNo) {
		
		String userId = ((Member)(session.getAttribute("loginMember"))).getUserId();
		
		HashMap<String, String> map = new HashMap<>();
		map.put("userId", userId);
		map.put("categoryNo", categoryNo);
		
		int listCount = qService.ajaxSelectListCount(map);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		
		ArrayList<QA> list = qService.ajaxSelctQAList(map, pi);
		
		return new Gson().toJson(list);
	}
	

	/**
	 * 1:1 문의 상세 조회 메소드
	 * @param qaNo
	 * @param model
	 * @return
	 */
	@RequestMapping("detail.qa")
	public String selectDetail(int qaNo, Model model) {
		
		QA qa = qService.selectDetail(qaNo);
		model.addAttribute("qa", qa);
		
		return "qa/qaDetailView";
		
	}
	
	/**
	 * 1:1 문의 게시글 등록폼 조회 메소드
	 * @return
	 */
	@RequestMapping("enrollForm.qa")
	public String enrllForm() {
		return "qa/qaEnrollForm";
	}
	
	/**
	 * 1:1 문의 게시글 등록 메소드
	 * @param qa
	 * @param sesion
	 * @param model
	 * @return
	 */
	@RequestMapping("insert.qa")
	public String insertQA(QA qa, HttpSession sesion, Model model) {
		
		int result = qService.insertQA(qa);
		if(result > 0) {
			// 게시글 등록 성공
			sesion.setAttribute("alertMsg", "1:1 문의가 성공적으로 등록 되었습니다!");
			return "redirect:list.qa";
		}else {
			// 게시글 등록 실패
			model.addAttribute("errorMsg", "1:1 문의 등록에 실패하였습니다!");
			return "common/errorPage";
			
		}
		
	}
	
	/**
	 * 1:1 문의 게시글 삭제
	 * @param qaNo
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("delete.qa")
	public String deleteQA(int qaNo, HttpSession session, Model model) {
		
		int result = qService.deleteQA(qaNo);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "1:1 문의가 성공적으로 삭제됐습니다!");
			return "redirect:list.qa";
		}else {
			model.addAttribute("errorMsg", "1:1 문의 삭제에 실패하였습니다!");
			return "common/errorPage";
		}
	}
	
	/**
	 * 1:1 문의 수정폼 조회 메소드
	 * @param qaNo
	 * @param model
	 * @return
	 */
	@RequestMapping("updateForm.qa")
	public String updateForm(int qaNo, Model model) {
		QA qa = qService.selectDetail(qaNo);
		model.addAttribute("qa", qa);
		return "qa/qaUpdateForm";
	}
	
	
	@RequestMapping("update.qa")
	public String updateQA(QA qa, Model model) {
		int result = qService.updateQA(qa);
		System.out.println(result);
		if(result > 0) {
			QA newQA = qService.selectDetail(qa.getQaNo());
			model.addAttribute("qa", newQA);
			return "redirect:/detail.qa?qaNo=" + qa.getQaNo();
		}else {
			model.addAttribute("errorMsg", "1:1 문의 수정에 실패하였습니다!");
			return "common/errorPage";
		}
	}
	
	
	// ========================= 마이페이지 =========================
	
	@RequestMapping("myPageQAList.qa")
	public String myPageQAList(@RequestParam(value="cpage", defaultValue = "1") int currentPage, 
			HttpSession session, Model model) {
		
		String userId = ((Member)(session.getAttribute("loginMember"))).getUserId();

		int listCount = qService.selectListCount(userId);
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);
		
		ArrayList<QA> list = qService.selectQAList(userId, pi);
		
		model.addAttribute("list", list);
		model.addAttribute("pi", pi);
		
		return "myPage/myPageQAList";
		
	}
	

	
	

}
















