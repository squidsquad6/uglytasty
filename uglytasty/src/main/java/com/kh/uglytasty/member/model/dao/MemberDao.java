package com.kh.uglytasty.member.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.uglytasty.member.model.vo.Member;
import com.kh.uglytasty.product.model.vo.Product;

@Repository
public class MemberDao {

	public Member loginMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.selectOne("memberMapper.loginMember", m);
	}
	
	// 재고량 0 인 상품 조회 (select) - 관리자알림용
	public ArrayList<Product> selectProductStockList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("memberMapper.selectProductStockList");
	}


	public Member checkMemberByGoogle(SqlSessionTemplate sqlSession, String userId) {
		
		return sqlSession.selectOne("memberMapper.checkMemberByGoogle",userId);
	}


	public int insertMember(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.insert("memberMapper.insertMember", m);
	}


	public int idCheck(SqlSessionTemplate sqlSession, String checkId) {
		return sqlSession.selectOne("memberMapper.idCheck", checkId);
	}
	
	/** 회원탈퇴
	 * @param sqlSession
	 * @param userId
	 * @return
	 */
	public int deleteMember(SqlSessionTemplate sqlSession, String userId) {
		
		return sqlSession.delete("memberMapper.deleteMember", userId);
	}


	/** 회원정보 수정
	 * @param sqlSession
	 * @param m
	 * @return
	 */
	public int updateMember(SqlSessionTemplate sqlSession, Member m) {
		
		return sqlSession.update("memberMapper.updateMember",m);
	}


	/** 비밀번호 변경
	 * @param sqlSession
	 * @param userPwd
	 * @return
	 */
	public int updatePwd(SqlSessionTemplate sqlSession, Member updatePwdMem) {
		
		return sqlSession.update("memberMapper.updatePwd", updatePwdMem);
	}




}
