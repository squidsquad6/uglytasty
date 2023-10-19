package com.kh.uglytasty.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.uglytasty.common.model.vo.PageInfo;
import com.kh.uglytasty.member.model.vo.Member;
import com.kh.uglytasty.order.model.vo.Order;
import com.kh.uglytasty.subscribe.model.vo.Subscribe;

@Repository
public class AdminDao {

	public ArrayList<Order> selectOrderList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset= (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit= pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectOrderList", null, rowBounds);
	}

	public ArrayList<Member> selectMemberList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset= (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit= pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectMemberList", null, rowBounds);
	}

	public ArrayList<Subscribe> selectSubscribeList(SqlSessionTemplate sqlSession, PageInfo pi) {
		
		int offset= (pi.getCurrentPage()-1)*pi.getBoardLimit();
		int limit= pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectSubscribeList", null, rowBounds);
		
	}

	public int updateAdminOrder(SqlSessionTemplate sqlSession, Order b) {
		
		return sqlSession.update("adminMapper.updateAdminOrder", b);
	}

	public int updateAdminSubscribe(SqlSessionTemplate sqlSession, Subscribe b) {
		
		return sqlSession.update("adminMapper.updateAdminSubscribe", b);
	}

	public int updateAdminMember(SqlSessionTemplate sqlSession, Member b) {
		
		 
	
		
	 
		
			
		
		return sqlSession.update("adminMapper.updateAdminMember", b);
	}

	public int selectOrderListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("adminMapper.selectOrderListCount");
	}

	public int selectMemberListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("adminMapper.selectMemberListCount");
	}

	public int selectSubscribeCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("adminMapper.selectSubscribeCount");
	}

	
	
	
	
}
