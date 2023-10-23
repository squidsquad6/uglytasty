package com.kh.uglytasty.member.controller;

import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.bind.annotation.ResponseBody;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.uglytasty.member.model.service.MemberServiceImpl;
import com.kh.uglytasty.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired // DI(Dependency Injection) 특징 : 알아서 생성해주고, 필요없으면 소멸시킴 (더이상 new 어쩌구 안씀)
	private MemberServiceImpl mService;
	
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping("loginForm.me")
	   public String loginForm() {
	      
	      return "member/loginMemberForm";
	   }
	
	@RequestMapping("logout.me")
	   public String logoutMember(HttpSession session) {
	      
	      session.invalidate();
	      
	      return "redirect:/";   }
	

	@RequestMapping(value="oauth2/naver", produces="application/json")
	public String naverLogin(@RequestParam String code,String state, Model model,HttpSession session) {
		
		
		Map<String,Object> result = mService.getNaverAccessToken(code, state);
		
		JsonNode userInfo = (JsonNode) result.get("userInfo");
		String userId = userInfo.get("response").get("id").asText();
		String email = userInfo.get("response").get("email").asText();
		String phone = userInfo.get("response").get("mobile").asText();
		String userName = userInfo.get("response").get("name").asText();
		String accessToken = (String) result.get("accessToken");
		String userPwd = "naver";
		    
		
		
		Member loginMember = mService.checkMemberByNaver(userId);
		     
		     if(loginMember == null) { 
					
					
					model.addAttribute("userId", userId + "nvr");
					model.addAttribute("userName", userName);
					model.addAttribute("phone", phone);
					model.addAttribute("email", email);
					model.addAttribute("userPwd", userPwd);
				
					
					return "member/memberEnrollForm";
					
				}else { 
					// 로그인 성공 => loginMember를 sessionScope에 담고 메인페이지 url 재요청
					
					// 매개변수에 HttpSession 필요함, 작성해주기
					session.setAttribute("loginMember", loginMember);
					


					//model.addAttribute("errorMsg", "로그인 성공!");
					//return "common/errorPage";
					// sendRedirect

					model.addAttribute("errorMsg", "로그인 성공!");

					return "redirect:/";
				}
		
		
	}
	
	
	@RequestMapping(value="oauth2", produces = "application/json" )
	public String googleLogin(@RequestParam String code,Model model, HttpSession session) {
	      
	     Map<String, Object> result = mService.getGoogleAccessToken(code);
	     
	   
	  // Extract accessToken from the result map
	     String accessToken = (String) result.get("accessToken");
	     
	     // Extract userInfo from the result map
	     JsonNode userInfoNode = (JsonNode) result.get("userInfo");
	     
	     // Extract specific fields from the userInfo JSON
	     String userId = userInfoNode.get("id").asText();
	     String userName = userInfoNode.get("name").asText();
	     String userPwd = "google";

	     // Print accessToken and extracted user information separately
	     System.out.println("AccessToken: " + accessToken);
	     System.out.println("User ID: " + userId);
	     System.out.println("User Name: " + userName);
	   
	     Member loginMember = mService.checkMemberByGoogle(userId);
	     
	     if(loginMember == null) { 
				
				
				model.addAttribute("userId", userId + "ggl");
				model.addAttribute("userName", userName);
				model.addAttribute("userPwd", userPwd);
			
				
				return "member/memberEnrollForm";
				
			}else { 
				// 로그인 성공 => loginMember를 sessionScope에 담고 메인페이지 url 재요청
				
				// 매개변수에 HttpSession 필요함, 작성해주기
				session.setAttribute("loginMember", loginMember);
				


				//model.addAttribute("errorMsg", "로그인 성공!");
				//return "common/errorPage";
				// sendRedirect

				model.addAttribute("errorMsg", "로그인 성공!");

				return "redirect:/";
			}
	    
	         }
	
	
	
	@RequestMapping(value="oauth2/kakao", produces = "application/json" )
	public String kakaoLogin(@RequestParam String code,Model model, HttpSession session) {
	      
	     Map<String, Object> result = mService.getKakaoAccessToken(code);
	     
	   
	     
	  // Extract accessToken from the result map
	     String accessToken = (String) result.get("accessToken");
	     
	  
	     
	     // Extract userInfo from the result map
	     JsonNode userInfoNode = (JsonNode) result.get("userInfo");
	     System.out.println("유저: " + userInfoNode);
	     // Extract specific fields from the userInfo JSON
	     String userId = userInfoNode.get("id").asText();
	     String userName = userInfoNode.get("properties").get("nickname").asText();
	     String email = userInfoNode.get("kakao_account").get("email").asText();
	     String userPwd = "kakao";

	     // Print accessToken and extracted user information separately
	     System.out.println("AccessToken: " + accessToken);
	     System.out.println("User ID: " + userId);
	     System.out.println("User Name: " + userName);
	   
	     Member loginMember = mService.checkMemberByKakao(userId);
	     
	     if(loginMember == null) { 
				
				
				model.addAttribute("userId", userId + "kko");
				model.addAttribute("userName", userName);
				model.addAttribute("userPwd", userPwd);
				model.addAttribute("email", email);
			
				
				return "member/memberEnrollForm";
				
			}else { 
				// 로그인 성공 => loginMember를 sessionScope에 담고 메인페이지 url 재요청
				
				// 매개변수에 HttpSession 필요함, 작성해주기
				session.setAttribute("loginMember", loginMember);
				


				//model.addAttribute("errorMsg", "로그인 성공!");
				//return "common/errorPage";
				// sendRedirect

				model.addAttribute("errorMsg", "로그인 성공!");

				return "redirect:/";
			}
	    
	         }
	
	
	
	
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
			


			//model.addAttribute("errorMsg", "로그인 성공!");
			//return "common/errorPage";
			// sendRedirect

			model.addAttribute("errorMsg", "로그인 성공!");

			return "redirect:/";
		}
	}
	
	
	

	
	/** (단순jsp이동) 회원가입 폼 띄우기
	* @return
	*/
	@RequestMapping("enrollForm.me")
	public String enrollForm() {

	return "member/memberEnrollForm";
	}


	/** 회원가입
	* @param m
	*/
	@RequestMapping("insert.me")
	public String insertMember(Member m, Model model, HttpSession session) {

	//System.out.println(m);
	// 1. 한글 깨짐 => 스프링에서 제공하는 인코딩 필터 등록 (web.xml에 등록)

	// 2. 나이를 입력하지 않았을 경우 "" 빈문자열이 넘어오는데 int형 필드에 담을 수 없어서 400 error 발생!!
	// WARN : org.springframework.web.servlet.mvc.support.DefaultHandlerExceptionResolver - Resolved [org.springframework.validation.BindException: org.springframework.validation.BeanPropertyBindingResult: 1 errors<EOL>Field error in object 'member' on field 'age': rejected value []; codes [typeMismatch.member.age,typeMismatch.age,typeMismatch.int,typeMismatch]; arguments [org.springframework.context.support.DefaultMessageSourceResolvable: codes [member.age,age]; arguments []; default message [age]]; default message [Failed to convert property value of type 'java.lang.String' to required type 'int' for property 'age'; nested exception is java.lang.NumberFormatException: For input string: ""]]
	// => Member 클래스에 age 필드를 int형 --> String형으로 변경
	// (애초에 vo를 만들 때 String으로 만들었어야 됨)

	// 3. 비밀번호가 사용자가 입력한 있는 그대로의 평문으로 보임
	// => Bcrypt 방식의 암호화를 통해서 암호문으로 변경
	// 1) 스프링 시큐리티 모듈에서 제공하는(라이브러리 추가 pom.xml)
	// 2) BcryptPassWordEncoder 라는 클래스를 빈으로 등록 (spring-security.xml 파일에, xml 방식으로)
	// 3) web.xml에 spring-security.xml 파일을 pre-loading 할 수 있도록 작성

	System.out.println("평문 : " + m.getUserPwd());

	// 암호화 작업 (암호문을 만들어내는 과정)
	String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
	System.out.println("암호문 : " + encPwd);

	// Member 객체에 userPwd에 평문 => 암호문으로 변경
	m.setUserPwd(encPwd);

	int result = mService.insertMember(m);

	if(result > 0) { // 성공 => 메인페이지 url 재요청

	session.setAttribute("alertMsg", "성공적으로 회원가입 되었습니다.");

	return "redirect:/";

	}else { // 실패 => 에러페이지 포워딩 (머리)(꼬리)

	model.addAttribute("errorMsg", "회원가입 실패!");

	return "common/errorPage";

	}

	}

	/** 아이디 중복체크
	* @param checkId
	* @return
	*/
	@ResponseBody
	@RequestMapping("idCheck.me")
	public String idCheck(String checkId) {

	int count = mService.idCheck(checkId);

	return count>0 ? "NNNNN" : "NNNNY";

	}

	@ResponseBody
	@RequestMapping("generateState.me")
	public String generateState(HttpSession session){
		
		
	    SecureRandom random = new SecureRandom();
	    String state = new BigInteger(130, random).toString(32);
	    session.setAttribute("state", state);
		return state;
		
		
	}


	 
	
	
	



}
