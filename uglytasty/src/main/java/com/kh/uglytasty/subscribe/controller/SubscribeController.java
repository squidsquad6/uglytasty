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
import com.kh.uglytasty.member.model.service.MemberServiceImpl;
import com.kh.uglytasty.member.model.vo.Member;
import com.kh.uglytasty.subscribe.model.service.SubscribeServiceImpl;
import com.kh.uglytasty.subscribe.model.vo.SubComp;
import com.kh.uglytasty.subscribe.model.vo.Subscribe;

@Controller
public class SubscribeController {

	@Autowired
	private SubscribeServiceImpl sService;
	
	@Autowired 
	private MemberServiceImpl mService;
	
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
	
	// ========================= 마이페이지 =========================
	
	/** 나의 못난이 박스 폼 띄우기
	 * @return
	 */
	@RequestMapping("myPageMyBoxForm.su")
	public String myPageMyBoxForm(HttpSession session, String userId) {
		
		String id = ((Member)session.getAttribute("loginMember")).getUserId();
				
		Subscribe loginMemSubscribInfo = sService.selectSubscribe(id);
		
		session.setAttribute("loginMemSubscribInfo", loginMemSubscribInfo);
		
		return "myPage/myPageMyBoxForm";
	}
	
	
	/** 나의 못난이 박스 - 구독 정보 변경
	 * @param s
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("myPageMyBoxUpdate.su")
	public String myPageMyBoxUpdate(Subscribe s, HttpSession session, Model model) {

		int result = sService.myPageUpdateSubscribe(s);
		//System.out.println("결과아 : " + result);
		if(result > 0) {
			
			Subscribe newSubscribe = sService.selectSubscribe(s.getUserId());
			model.addAttribute("s", newSubscribe);
			session.setAttribute("alertMsg", "구독 정보가 수정되었습니다.");
			
			return "redirect:/myPageMyBoxForm.su";
			
		}else {
			
			model.addAttribute("errorMsg", "구독 정보 수정에 실패하였습니다!");
			return "common/errorPage";
			
		}
		
		
	}
	
	
	/** 못난이 박스 구독 취소
	 * @param model
	 * @param session
	 * @return
	 */
	@RequestMapping("myPageUpdateSubscribeStatus.su")
	public String myPageUpdateSubscribeStatus(Member m, Model model, HttpSession session) {
		
		String userId = ((Member)session.getAttribute("loginMember")).getUserId();
		
		int mResult = sService.myPageUpdateSubscribeStatus(userId);
		
		if(mResult > 0) {
			
			int sResult = sService.myPageUpdateMemberStatus(userId);
			
			if(sResult > 0) {
				
				Subscribe loginMemSubscribInfo = sService.selectSubscribe(userId);
				session.setAttribute("loginMemSubscribInfo", loginMemSubscribInfo);

				Member loginMember = mService.loginMember(m);
				session.setAttribute("loginMember", mService.loginMember(m));
				
				session.setAttribute("alertMsg", "못난이 박스 구독이 취소되었습니다.");
				
			}
			return "redirect:/myPage.me";
			
			
		}else {
			model.addAttribute("errorMsg", "Member 구독 정보 수정 실패!");
			return "common/errorPage";
		}
		
		
	}
	
	
	
}