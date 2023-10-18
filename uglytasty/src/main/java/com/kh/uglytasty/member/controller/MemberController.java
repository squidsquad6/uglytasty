package com.kh.uglytasty.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.uglytasty.member.model.service.MemberServiceImpl;
import com.kh.uglytasty.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired // DI(Dependency Injection) 특징 : 알아서 생성해주고, 필요없으면 소멸시킴 (더이상 new 어쩌구 안씀)
	private MemberServiceImpl mService;
	
	
	@RequestMapping("login.me")
	public String loginMember(Member m, Model model, HttpSession session) {
		
		System.out.println("전" + m);
		
		Member loginMember = mService.loginMember(m);
		System.out.println("후" + loginMember);
			
		if(loginMember == null) { 
			// 로그인 실패 => 에러메세지 requestScope에 담아서 에러 페이지(/WEB-INF/views/common/errorPage.jsp)로 포워딩
			
			// 매개변수에 Model 필요함, 작성해주기
			// model에 세팅해도 requestScope에 담김
			model.addAttribute("errorMsg", "로그인 실패!");
			
			// servlet-context.xml에 prefix, suffix가 이미 설정되어 있으므로(아래와 같이)
			
			// <beans:property name="prefix" value="/WEB-INF/views/" />
			// <beans:property name="suffix" value=".jsp" />
			// return에 그 사이의 경로를 String으로 적어주면 prefix, suffix와 결합하여 그 페이지로 이동함
			
			return "common/errorPage"; //WEB-INF/views/ ???? .jsp
			
		}else { 
			// 로그인 성공 => loginMember를 sessionScope에 담고 메인페이지 url 재요청
			
			// 매개변수에 HttpSession 필요함, 작성해주기
			session.setAttribute("loginMember", loginMember);
			
			
			model.addAttribute("errorMsg", "로그인 성공!");
			return "common/errorPage";
			// sendRedirect
			//return "redirect:/";
		}
	}

}
