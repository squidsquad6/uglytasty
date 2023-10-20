package com.kh.uglytasty.member.model.service;

import com.kh.uglytasty.member.model.vo.Member;

public interface MemberService {
	
	Member loginMember(Member m);



	void googleLogin(String code);
	
	// 회원가입 서비스 (insert)
	int insertMember(Member m);
			
	// 아이디 중복체크 서비스 (select)
	int idCheck(String userId);
	


	
	

}
