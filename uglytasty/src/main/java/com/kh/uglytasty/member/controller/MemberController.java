package com.kh.uglytasty.member.controller;

import java.math.BigInteger;
import java.security.SecureRandom;
import java.util.ArrayList;
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
import com.kh.uglytasty.product.model.vo.Product;

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
	
	
	
	
	@RequestMapping("login.me")
	public String loginMember(Member m, Model model, HttpSession session) {
		

		
		Member loginMember = mService.loginMember(m);
		
		// ** 재고량 0 인 상품 조회 (select) - 관리자알림용
		ArrayList<Product> productStockList = mService.selectProductStockList();
			
		if(loginMember == null) { 
			// 로그인 실패 => 에러메세지 requestScope에 담아서 에러 페이지(/WEB-INF/views/common/errorPage.jsp)로 포워딩
			
			
			model.addAttribute("errorMsg", "로그인 실패!");
			
			return "common/errorPage";
			
		}else { 
			// 로그인 성공 => loginMember를 sessionScope에 담고 메인페이지 url 재요청
			
			session.setAttribute("loginMember", loginMember);
			
			// ** 재고량 0 인 상품 조회 (select) - 관리자알림용
			//System.out.println("재고량0상품 : " + productStockList);
			session.setAttribute("productStockList", productStockList);
			
			model.addAttribute("errorMsg", "로그인 성공!");

			return "redirect:/";
		}
	}

	/** 재고량 0 인 상품 관련 - 관리자알림용 제거
	 *
	 */
	@RequestMapping("removeAlert.stock")
	public String removeStockAlert(HttpSession session) {
	    // 세션에서 loginMember 속성을 삭제
	    session.removeAttribute("productStockList");
	    return "redirect:/";
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

	
	// ========================= 마이페이지 =========================
	
	
		/** 마이페이지 폼 띄우기
		 * @return
		 */
		@RequestMapping("myPage.me")
		public String myPage(HttpSession session) {
			
			String subscribeOrNot = ((Member) session.getAttribute("loginMember")).getSubscribe();
			
			if(subscribeOrNot.equals("N")) {
				// 현재 로그인한 회원이 구독자일 때
				
				return "myPage/myPageMyBoxForm";
				
			}else {
				// 현재 로그인한 회원이 구독자가 아닐 때
				
				return "myPage/myPageMain";
						
			}
			
		}
		
		
		/** 마이페이지 - 회원정보 폼 띄우기
		 * @return
		 */
		@RequestMapping("myPageMemberInfo.me")
		public String myPageMemberInfo() {
			
			return "myPage/myPageMemberInfo";
		}
		
		
		
		/** 회원정보 수정
		 * @param m
		 * @param model
		 * @param session
		 * @return
		 */
		@RequestMapping("update.me")
		public String updateMember(Member m, Model model, HttpSession session) {
			
			int result = mService.updateMember(m);
			
			if(result>0) { // 수정 성공
				
				// 로그인했을 때 설정된 세션을 갈아끼워주기
				session.setAttribute("loginMember", mService.loginMember(m));
				
				session.setAttribute("alertMsg", "회원 정보가 변경되었습니다.");

				return "redirect:/myPageMemberInfo.me";
				
			}else { // 수정 실패
				model.addAttribute("errorMsg", "회원정보 변경 실패!");
				
				return "common/errorPage";
			}
			
		}
		
		
		/** 마이페이지 - 비밀번호 변경 폼 띄우기
		 * @return
		 */
		@RequestMapping("myPageUpdatePwdForm.me")
		public String myPageUpdateMemberPwdForm() {
			
			return "myPage/myPageUpdateMemberPwd";
		}
		
		
		
		/** 마이페이지 - 회원탈퇴 폼 띄우기
		 * @return
		 */
		@RequestMapping("deleteForm.me")
		public String deleteMemberForm() {
			
			return "myPage/myPageDeleteMember";
		}
		
		
		
		/** 회원 탈퇴
		 * @param userPwd
		 * @param userId
		 * @param session
		 * @return
		 */
		@RequestMapping("delete.me")
		public String deleteMember(String userPwd, String userId, HttpSession session, Model model) {
			// userPwd : 회원탈퇴 요청시 사용자가 입력한 비밀번호 평문이 들어가있음
			// session에 loginMember Member 객체 userPwd 필드 : db로부터 조회된 비번(암호문)
			
			String encPwd = ((Member)session.getAttribute("loginMember")).getUserPwd();
			// session에 담아오면 Object형으로 반환되므로 Member 객체로 바꿔주고 그 객체의 userPwd(암호문)을 뽑아서 encPwd로 설정해주기
			
			if(bcryptPasswordEncoder.matches(userPwd, encPwd)) { 
				// 비번 맞음 => 탈퇴처리
				
				// userId 히든으로 가져옴
				int result = mService.deleteMember(userId);
				
				
				if(result > 0) { // 탈퇴처리 성공
					
					session.removeAttribute("loginMember");
					session.setAttribute("alertMsg", "성공적으로 탈퇴되었습니다. 그동안 이용해주셔서 감사합니다.");
					return "redirect:/";
					
				}else { // 탈퇴처리 실패
					
					model.addAttribute("errorMsg", "회원탈퇴 실패!");
					
					return "common/errorPage";
					
				}
				
			}else { // 비번틀림 => 비밀번호가 틀림을 알리고 마이페이지가 보여지게
				session.setAttribute("alertMsg", "비밀번호를 잘못 입력하셨습니다. 확인해주세요.");
				return "redirect:/deleteForm.me";
			}
			
		}
		

		// 나의 못난이 박스 폼 띄우기 용 - 머지하고 subscribe로 옮기기
		@RequestMapping("myPageMyBoxForm.sub")
		public String myPageMyBoxForm() {
			
			return "myPage/myPageMyBoxForm";
		}
		
		
		/** 비밀번호 변경
		 * @param userPwd
		 * @param newPwd
		 * @param checkNewPwd
		 * @param userId
		 * @param session
		 * @param model
		 * @return
		 */
		@RequestMapping("updatePwd.me")
		public String updatePwd(String userPwd, String newPwd, String checkNewPwd, String userId, HttpSession session, Model model) {
			
			// 사용자가 입력한 '현재 비밀번호'가 암호화되어 db에 저장되어있는 값과 일치하는지 확인
			
			// userPwd : 사용자가 입력한 현재 비밀번호 값(원문,name값으로 받아온 것)
			// encPwd : 그 원문이 암호화 되어 db에 저장되어 있는 값(암호문)
			// newPwd : 사용자가 새롭게 설정하려고 하는 비밀번호
			// checkPwd : 새 비밀번호와 일치하는지 비교하는 값
			// encNewPwd : 사용자가 새롭게 설정하려고 하는 비밀번호를 암호화한 것
			
			String encPwd = ((Member)session.getAttribute("loginMember")).getUserPwd();
			
			
			if(bcryptPasswordEncoder.matches(userPwd, encPwd)) {
				// 현재 비밀번호 맞게 입력 => 비밀번호 변경하기
				
				// 새 비밀번호(newPwd)와 새 비밀번호 확인(checkNewPwd)에 입력된 값이 같으면 업데이트 치러가기
				if(newPwd.equals(checkNewPwd)) {
					
					// 새 비밀번호(newPwd)를 암호화 해주기(이게 db에 들어감)
					String encNewPwd = bcryptPasswordEncoder.encode(newPwd);
					
					// 히든으로 가져온 아이디로 암호화된 새 비밀번호(encNewPwd)로 db에 업데이트)
					
					Member updatePwdMem = new Member();
					
					updatePwdMem.setUserId(userId);
					updatePwdMem.setUserPwd(encNewPwd);
					
					int result = mService.updatePwd(updatePwdMem);
					
					if(result > 0) {
						// 비밀번호 변경 성공
						session.setAttribute("userPwd", encNewPwd);
						session.setAttribute("alertMsg", "비밀번호가 성공적으로 변경되었습니다.");
						
						return "redirect:/myPage.me";
						
					}else {
						// 비밀번호 변경 실패
						model.addAttribute("errorMsg", "비밀번호 변경 실패!!!");
						
						return "common/errorPage";
					}
					
					
				}else {
					session.setAttribute("alertMsg", "비밀번호가 일치하지 않습니다. 확인 후 다시 입력해주세요.");
					return "redirect:/";
				}
				
				
			}else {
				// 현재 비밀번호 틀리게 입력
				session.setAttribute("alertMsg", "비밀번호를 잘못 입력하셨습니다. 확인 후 다시 입력해주세요.");
				return "redirect:/";
			}
			
		}
	
	

}
