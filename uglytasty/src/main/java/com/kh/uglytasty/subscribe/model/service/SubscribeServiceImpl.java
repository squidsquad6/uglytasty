package com.kh.uglytasty.subscribe.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.kh.uglytasty.subscribe.model.dao.SubscribeDao;
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
	
}
