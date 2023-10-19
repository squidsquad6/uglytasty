package com.kh.uglytasty.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.uglytasty.admin.model.dao.AdminDao;
import com.kh.uglytasty.common.model.vo.PageInfo;
import com.kh.uglytasty.member.model.vo.Member;
import com.kh.uglytasty.order.model.vo.Order;
import com.kh.uglytasty.subscribe.model.vo.Subscribe;

@Service
public class AdminServiceImpl implements AdminService{

	
	@Autowired
	private AdminDao aDao;
	
	
	@Autowired
	private SqlSessionTemplate sqlSession;


	@Override
	public ArrayList<Order> selectOrderList(PageInfo pi) {
		
		return aDao.selectOrderList(sqlSession,pi);
	}


	@Override
	public ArrayList<Member> selectMemberList(PageInfo pi) {
		
		return aDao.selectMemberList(sqlSession,pi);
	}


	@Override
	public ArrayList<Subscribe> selectSubscribeList(PageInfo pi) {
		
		return aDao.selectSubscribeList(sqlSession,pi);
	}


	@Override
	public int updateAdminOrder(Order b) {
		
		return aDao.updateAdminOrder(sqlSession, b);
	}


	@Override
	public int updateAdminSubscribe(Subscribe b) {
		
		return aDao.updateAdminSubscribe(sqlSession, b);
	}


	@Override
	public int updateAdminMember(Member b) {
		
		
		
		
		int a = aDao.updateAdminMember(sqlSession, b);
		
		
		return a;
	}


	@Override
	public int selectOrderListCount() {
		
		return aDao.selectOrderListCount(sqlSession);
	}


	@Override
	public int selectMemberListCount() {
		
		return aDao.selectMemberListCount(sqlSession);
	}


	@Override
	public int selectSubscribeCount() {
		
		return aDao.selectSubscribeCount(sqlSession);
	}
	
	
	
	
}