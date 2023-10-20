package com.kh.uglytasty.subscribe.model.service;

import org.springframework.ui.Model;

import com.kh.uglytasty.subscribe.model.vo.Subscribe;

public interface SubscribeService {

	//1.구독 업데이트용
	Subscribe selectSubscribe(String id);
	
	
	int updateSubscirbe(Subscribe newSub);
	
	int insertSubscribe(Subscribe newSub);
	
	int updateSubscribeStatus(String userId);


}
