package com.kh.uglytasty.qa.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
	
	@RequestMapping("detail.qa")
	public String selectDetail(int qaNo, Model model) {
		
		QA qa = qService.selectDetail(qaNo);
		model.addAttribute("qa", qa);
		
		return "qa/qaDetailView";
		
	}
	

}
















