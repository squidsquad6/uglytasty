package com.kh.uglytasty.member.model.service;

import java.util.ArrayList;

import com.kh.uglytasty.member.model.vo.Member;
import com.kh.uglytasty.product.model.vo.Product;

public interface MemberService {
	
	Member loginMember(Member m);



	void googleLogin(String code);
	
	// 회원가입 서비스 (insert)
	int insertMember(Member m);
			
	// 아이디 중복체크 서비스 (select)
	int idCheck(String userId);

	// 재고량 0 인 상품 조회 (select) - 관리자알림용
	ArrayList<Product> selectProductStockList();
	
	// ========================= 마이페이지 =========================
	
	// 회원탈퇴 서비스 (update)
	int deleteMember(String userId);
	
	// 회원정보 수정하기 (update)
	int updateMember(Member m);
	
	// 비밀번호 변경하기 (update)
	int updatePwd(Member updatePwdMem);
		
}
