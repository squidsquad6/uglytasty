package com.kh.uglytasty.member.controller;

import java.io.UnsupportedEncodingException;
import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.Map;
import java.util.Random;

import javax.mail.Address;
import javax.mail.MessagingException;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.bind.annotation.ResponseBody;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.uglytasty.common.EmailCheckReq;
import com.kh.uglytasty.member.model.service.MemberServiceImpl;
import com.kh.uglytasty.member.model.vo.Member;

@Controller
public class MemberController {
	
	@Autowired 
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
					
					model.addAttribute("errorMsg", "로그인 성공!");

					return "redirect:/";
				}
		
		
	}
	
	
	@RequestMapping(value="oauth2", produces = "application/json" )
	public String googleLogin(@RequestParam String code,Model model, HttpSession session) {
	      
	     Map<String, Object> result = mService.getGoogleAccessToken(code);
	     
	   

	     String accessToken = (String) result.get("accessToken");
	     
	
	     JsonNode userInfoNode = (JsonNode) result.get("userInfo");
	     
	   
	     String userId = userInfoNode.get("id").asText();
	     String userName = userInfoNode.get("name").asText();
	     String userPwd = "google";

	   
	   
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
				

				model.addAttribute("errorMsg", "로그인 성공!");

				return "redirect:/";
			}
	    
	         }
	
	
	
	@RequestMapping(value="oauth2/kakao", produces = "application/json" )
	public String kakaoLogin(@RequestParam String code,Model model, HttpSession session) {
	      
		
		
	     Map<String, Object> result = mService.getKakaoAccessToken(code);
	     

	     String accessToken = (String) result.get("accessToken");
	     
	  
	     
	     
	     JsonNode userInfoNode = (JsonNode) result.get("userInfo");
	     String userId = userInfoNode.get("id").asText();
	     String userName = userInfoNode.get("properties").get("nickname").asText();
	     String email = userInfoNode.get("kakao_account").get("email").asText();
	     String userPwd = "kakao";
	     
	   
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
				

				model.addAttribute("errorMsg", "로그인 성공!");

				return "redirect:/";
			}
	    
	         }
	
	
	@Autowired
	private JavaMailSender emailSender;
	private String authNum;
	
	
	public void createCode() {
		Random random = new Random();
        StringBuffer key = new StringBuffer();

        for(int i=0; i<8; i++) {
            int idx = random.nextInt(3);

            switch (idx) {
                case 0 :
                    key.append((char) ((int)random.nextInt(26) + 97));
                    break;
                case 1:
                    key.append((char) ((int)random.nextInt(26) + 65));
                    break;
                case 2:
                    key.append(random.nextInt(9));
                    break;
            }
        }
        authNum = key.toString();
	}
	
	
	
	
	

	public MimeMessage mailCheck(String email) throws MessagingException {
		System.out.println("메일 인증 요청");
		System.out.println("메일:" + email);
		
		
		createCode();
		Address setFrom= new InternetAddress("kh.h.final6@gmail.com");
		String toEmail = email;
		String title = "못난이맛난이입니다. 이메일 인증을 해주세요.";
		
        MimeMessage message = emailSender.createMimeMessage();
        message.addRecipients(MimeMessage.RecipientType.TO, toEmail);
        message.setSubject(title);

        // 메일 내용
        String msgOfEmail="";
        msgOfEmail += "<div style='margin:20px;'>";
        msgOfEmail += "<h1> 안녕하세요 못난이맛난이 입니다. </h1>";
        msgOfEmail += "<br>";
        msgOfEmail += "<p>아래 코드를 입력해주세요<p>";
        msgOfEmail += "<br>";
        msgOfEmail += "<p>감사합니다.<p>";
        msgOfEmail += "<br>";
        msgOfEmail += "<div align='center' style='border:1px solid black; font-family:verdana';>";
        msgOfEmail += "<h3 style='color:blue;'>회원가입 인증 코드입니다.</h3>";
        msgOfEmail += "<div style='font-size:130%'>";
        msgOfEmail += "CODE : <strong>";
        msgOfEmail += authNum + "</strong><div><br/> ";
        msgOfEmail += "</div>";

        message.setFrom(setFrom);
        message.setText(msgOfEmail, "utf-8", "html");
		
		
		
		return message;
	}
	
	
		@ResponseBody
		@RequestMapping("/mailCheck")		
	    public String emailCheck(@RequestParam String email) throws MessagingException, UnsupportedEncodingException  {
	        EmailCheckReq emailCheckReq = new EmailCheckReq(email);
			
			String authCode = sendEmail(emailCheckReq.getEmail());
	        
	        System.out.println(authCode);
	        
	        return new String(authCode);	
	    }

	
		public String sendEmail(String email) throws MessagingException, UnsupportedEncodingException {

	        //메일전송에 필요한 정보 설정
	        MimeMessage emailForm = mailCheck(email);
	        //실제 메일 전송
	        emailSender.send(emailForm);

	        return authNum; //인증 코드 반환
	    }
	
	
	@RequestMapping("login.me")
	public String loginMember(Member m, Model model, HttpSession session) {
		

		
		Member loginMember = mService.loginMember(m);

			
		if(loginMember == null) { 
			// 로그인 실패 => 에러메세지 requestScope에 담아서 에러 페이지(/WEB-INF/views/common/errorPage.jsp)로 포워딩
			
			
			model.addAttribute("errorMsg", "로그인 실패!");
			
			return "common/errorPage";
			
		}else { 
			// 로그인 성공 => loginMember를 sessionScope에 담고 메인페이지 url 재요청
			
			session.setAttribute("loginMember", loginMember);

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


		// 암호화 작업 (암호문을 만들어내는 과정)
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
	
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
