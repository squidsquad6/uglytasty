package com.kh.uglytasty.subscribe.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.uglytasty.subscribe.model.vo.SubComp;
import com.kh.uglytasty.subscribe.model.vo.Subscribe;

@Repository
public class SubscribeDao {

	public int updateSubscribe(SqlSessionTemplate sqlSession, Subscribe newSub) {
		
		return sqlSession.update("subscribeMapper.updateSubscribe", newSub);
	}

	public Subscribe selectSubscribe(SqlSessionTemplate sqlSession, String id) {
		
		return sqlSession.selectOne("subscribeMapper.selectSubscribe", id);
	}

	public int insertSubscribe(SqlSessionTemplate sqlSession, Subscribe newSub) {
		
		return sqlSession.insert("subscribeMapper.insertSubscribe", newSub);
	}

	public int updateSubscribeStatus(SqlSessionTemplate sqlSession, String userId) {
		
		return sqlSession.update("subscribeMapper.updateSubscribeStatus", userId);
	}

	public Subscribe checkEndDate(SqlSessionTemplate sqlSession, String userId) {
		
		return sqlSession.selectOne("subscribeMapper.checkEndDate", userId);
	}

	public void updateMemberStatus(SqlSessionTemplate sqlSession, String userId) {
		
		 sqlSession.update("subscribeMapper.updateMemberStatus", userId);
	}

	public ArrayList<SubComp> selectSubCompList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("subscribeMapper.selectSubCompList");
	}

}
