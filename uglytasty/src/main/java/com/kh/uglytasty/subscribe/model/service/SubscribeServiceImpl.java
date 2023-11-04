package com.kh.uglytasty.subscribe.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.kh.uglytasty.subscribe.model.dao.SubscribeDao;
import com.kh.uglytasty.subscribe.model.vo.SubComp;
import com.kh.uglytasty.subscribe.model.vo.Subscribe;

@Service
public class SubscribeServiceImpl implements SubscribeService{

	@Autowired
	private SubscribeDao sDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	@Override
	public int updateSubscirbe(Subscribe newSub) {
		
		return sDao.updateSubscribe(sqlSession,newSub);
	}

	@Override
	public Subscribe selectSubscribe(String id) {
		
		return sDao.selectSubscribe(sqlSession, id);
	}

	@Override
	public int insertSubscribe(Subscribe newSub) {
		
		return sDao.insertSubscribe(sqlSession, newSub);
	}

	@Override
	public int updateSubscribeStatus(String userId) {
		
		return sDao.updateSubscribeStatus(sqlSession, userId);
	}

	public Subscribe checkEndDate(String userId) {
		
		return sDao.checkEndDate(sqlSession, userId);
	}

	public void updateMemberStatus(String userId) {
		
		
		 sDao.updateMemberStatus(sqlSession, userId);
	}

	public ArrayList<SubComp> selectSubCompList() {
		
		return sDao.selectSubCompList(sqlSession);
	}

	
	// -------------마이페이지----------------
	
	@Override
	public int myPageUpdateSubscribe(Subscribe s) {
		
		return sDao.myPageUpdateSubscribe(sqlSession, s);
	}
	
}
