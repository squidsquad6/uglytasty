package com.kh.uglytasty.subscribe.controller;

import java.io.IOException;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.uglytasty.subscribe.model.service.SubscribeServiceImpl;
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
	public String goToBuynow() {
		return "subscribe/buynow";
	}
	
	@RequestMapping("payment.su")
	public String goToPayment( Model model, String boxSize, String cycle, String address, String detailAddress, String recipient, String phone, String hateVegi) {
		
		   model.addAttribute("boxSize", boxSize);
		   model.addAttribute("cycle", cycle);
		   model.addAttribute("address", address);
		   model.addAttribute("detailAddress", detailAddress);
		   model.addAttribute("recipient", recipient);
		   model.addAttribute("phone", phone);
		   model.addAttribute("hateVegi", hateVegi);
		   
		  
		
		
		return "subscribe/payment";
	}
	
	@RequestMapping("statusY.su")
	public void updateSubscribeStatus(String userId) {
		
		
		
		int result = sService.updateSubscribeStatus(userId);
		
		
	}
	
	
	@RequestMapping("tossPayment.su")
	public String goToTossPayment(Model model,String userId, String boxSize, String cycle, String address, String detailAddress, String recipient, String phone, String hateVegi) {
		
		
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
