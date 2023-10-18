package com.kh.uglytasty.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.uglytasty.member.model.dao.MemberDao;
import com.kh.uglytasty.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService{
	
	@Autowired
	private MemberDao mDao;
	
	// 전역으로
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public Member loginMember(Member m) {
		return mDao.loginMember(sqlSession, m);
	}

}
