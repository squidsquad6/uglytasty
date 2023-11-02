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

}
