package com.kh.uglytasty.subscribe.controller;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.uglytasty.subscribe.model.service.SubscribeServiceImpl;
import com.kh.uglytasty.subscribe.model.vo.SubComp;
import com.kh.uglytasty.subscribe.model.vo.Subscribe;

@Controller
public class SubscribeController {

	@Autowired
	private SubscribeServiceImpl sService;
	
	@RequestMapping("subscribe.su")
	public String goToSubscribe() {
		
		
	
		
		
		return "subscribe/subscribe";
	}
	
	
	@RequestMapping("buynow.su")
	public String goToBuynow(@RequestParam String userId, Model model) {
		
		Subscribe sub = sService.checkEndDate(userId);
		
		   
				ArrayList<SubComp> list =  sService.selectSubCompList(); 
			
		
		
	    if (sub == null) {
	    	
	    	
	    	model.addAttribute("list", list);
	        return "subscribe/buynow";
	    }
		
	    String endDateString = sub.getEndDate();

	    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
	    Date endDate = null;
	    
	    try {
	        endDate = dateFormat.parse(endDateString);
	    } catch (ParseException e) {
	        // 날짜 변환 중 오류 발생 시 처리
	        e.printStackTrace();
	    }

	    // 현재 날짜 가져오기
	    Date currentDate = new Date();

	    // endDate가 null이 아니면서 status가 'N'이고,
	    // endDate가 현재 날짜 (sysdate)보다 미래에 있다면
	    
	 
	    
	    if (endDate != null && "Y".equals(sub.getStatus()) && endDate.after(currentDate)) {
	    
	    	model.addAttribute("alertMsg", "이미 구독중입니다.");
	    	
	    	return "subscribe/subscribe";
	    }else {
	    	
	    	model.addAttribute("list", list);
	    	
	    	
	    	return "subscribe/buynow";
	    }
	    
		
	}
	
	@RequestMapping("payment.su")
	public String goToPayment( Model model, String boxSize, String cycle, String address, String detailAddress, String recipient, String phone, String hateVegi, String price) {
		
		   model.addAttribute("boxSize", boxSize);
		   model.addAttribute("cycle", cycle);
		   model.addAttribute("address", address);
		   model.addAttribute("detailAddress", detailAddress);
		   model.addAttribute("recipient", recipient);
		   model.addAttribute("phone", phone);
		   model.addAttribute("hateVegi", hateVegi);
		   model.addAttribute("price",price);
		   
		  
		
		
		return "subscribe/payment";
	}
	
	@ResponseBody
	@RequestMapping(value="statusY.su" , produces="application/json; charset=UTF-8")
	public String updateSubscribeStatus(String userId) {
		
		
		
		int result = sService.updateSubscribeStatus(userId);
		sService.updateMemberStatus(userId);
		
		String id = userId;
		Subscribe b = sService.selectSubscribe(id);
		
		return new Gson().toJson(b);
	}
	
	
	
	
	@RequestMapping("tossPayment.su")
	public String goToTossPayment(Model model,String userId, String boxSize, String cycle, String address, String detailAddress, String recipient, String phone, String hateVegi, int price) {
		
		
		String id = userId;
		
		
		
		
		Subscribe s = sService.selectSubscribe(id);
		
		Subscribe newSub = new Subscribe();
		
		newSub.setBoxSize(boxSize);
		newSub.setUserId(id);
		newSub.setDislike(hateVegi);
		newSub.setTerm(cycle);
		newSub.setAddress(address);
		newSub.setDetailAddress(detailAddress);
		
		
		
		
		//s가 null이 아닐시 -> 이미 있음
		
		if(s != null) {
			int result = sService.updateSubscirbe(newSub);
			
			
		}else {
		//s가 null일시 -> 추가해줘야함
			int result = sService.insertSubscribe(newSub);
		}
		
		   
	
		   model.addAttribute("price", price);
		   
		
		
		
		return "subscribe/tossPayment";
	}
	
	@RequestMapping("success.su")
	public String goToSuccess() throws IOException, InterruptedException {
		
		
		
		return "subscribe/success";
	}
		
	@RequestMapping("fail.su")
	public String goToFail() {
		return "subscribe/fail";
	
	}
	
	
	
}
