package com.kh.uglytasty.admin.model.service;

import java.util.ArrayList;

import com.kh.uglytasty.common.model.vo.PageInfo;
import com.kh.uglytasty.member.model.vo.Member;
import com.kh.uglytasty.order.model.vo.Orders;
import com.kh.uglytasty.subscribe.model.vo.Subscribe;

public interface AdminService {

	
	ArrayList<Orders> selectOrderList(PageInfo pi);
	int selectOrderListCount();
	
	ArrayList<Member> selectMemberList(PageInfo pi);
	int selectMemberListCount();
	
	ArrayList<Subscribe> selectSubscribeList(PageInfo pi);
	int selectSubscribeCount();
	
	
	int updateAdminOrder(Orders b);
	int updateAdminSubscribe(Subscribe b);
	int updateAdminMember(Member b);
	
	
	int updateTrackingNo(Orders o);

}

