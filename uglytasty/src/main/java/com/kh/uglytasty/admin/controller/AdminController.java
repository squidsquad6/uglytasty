package com.kh.uglytasty.admin.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.uglytasty.admin.model.service.AdminServiceImpl;
import com.kh.uglytasty.common.model.vo.PageInfo;
import com.kh.uglytasty.common.template.Pagination;
import com.kh.uglytasty.member.model.vo.Member;
import com.kh.uglytasty.order.model.vo.Orders;
import com.kh.uglytasty.subscribe.model.vo.Subscribe;

@Controller
public class AdminController {

	@Autowired
	private AdminServiceImpl aService;
	
	@RequestMapping("order.ad")
	public String selectOrderList(@RequestParam(value="cpage", defaultValue = "1") int currentPage,Model model) {
		
		int listCount = aService.selectOrderListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		
		ArrayList<Orders> list =   aService.selectOrderList(pi);
		
		System.out.println(list);
		
		model.addAttribute("list", list).addAttribute("pi",pi);
		
		
		return "admin/adminOrder";
	}
	
	@RequestMapping("member.ad")
	public String selectMemberList(@RequestParam(value="cpage", defaultValue = "1") int currentPage,Model model) {
		int listCount = aService.selectMemberListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		
		ArrayList<Member> list =   aService.selectMemberList(pi);
		
		
		
		model.addAttribute("list", list).addAttribute("pi",pi);
	
		return "admin/admin";
	}
	
	@RequestMapping("subscribe.ad")
	public String selectSubscribeList(@RequestParam(value="cpage", defaultValue = "1") int currentPage,Model model) {
		int listCount = aService.selectSubscribeCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		
		ArrayList<Subscribe> list =   aService.selectSubscribeList(pi);
		
		
		
		model.addAttribute("list", list).addAttribute("pi",pi);
		
		return "admin/adminSubscribe";
	}
	
	@ResponseBody
	@RequestMapping(value="updateMember.ad", produces="application/json; charset=UTF-8")
	public String updateAdminMember(String userId,String userPwd,String userName, String phone, String email, String addressBase, String addressDetail, String status, String subscribe, String provider, String accessToken, String refreshToken) {
		
		Member b = new Member(userId, userPwd, userName, email, phone, addressBase, addressDetail, status, subscribe, provider, accessToken, refreshToken);
		
		System.out.println(b);
		
		int result = aService.updateAdminMember(b);
		
		
		
		return new Gson().toJson(b);
		
		
	}
	
	@ResponseBody
	@RequestMapping(value= "updateOrder.ad", produces="application/json; charset=UTF-8")
	public String updateAdminOrder(int orderNo,String userId, int productNo, int orderCode, String orderDate, String trackingNo, String addressMain, String addressDetail, String receiver, String receiverPhone, String deliveryMemo, int deliveryFee, int totalPrice) {
		
		Orders b = new Orders(orderNo, userId, productNo, orderDate, orderCode, trackingNo, addressMain, addressDetail, receiver, receiverPhone, deliveryMemo, deliveryFee, totalPrice);
		
		System.out.println(b);
		
		int result = aService.updateAdminOrder(b);
		
		return new Gson().toJson(b);
		
	}
	
	@ResponseBody
	@RequestMapping(value="updateSubscribe.ad", produces="application/json; charset=UTF-8")
	public String updateAdminSubscribe(String userId, String startDate, String endDate, String boxSize, String term, String status, String dislike, String address, String detailAddress) {
		
		Subscribe b = new Subscribe(userId, startDate, endDate, boxSize, term, status, dislike, address, detailAddress);
		
		int result = aService.updateAdminSubscribe(b);
		
		return new Gson().toJson(b);
		
	}
	
	
	
	
}
