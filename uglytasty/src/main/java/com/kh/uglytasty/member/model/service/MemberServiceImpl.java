package com.kh.uglytasty.member.model.service;

import java.util.HashMap;
import java.util.Map;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.Environment;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

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

	@Override
	public void googleLogin(String code) {
		
		
	}
	
	
	

	public  Map<String, Object> getGoogleAccessToken(String code) {
		
		String accessToken = "";
		
		
		RestTemplate restTemplate = new RestTemplate();
		Map<String, String> params = new HashMap();
		
		params.put("code", code);
		params.put("client_id", "1043154405366-qnhdnm1nk8h9oka0up0crde72jfffvtq.apps.googleusercontent.com");
		params.put("client_secret","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");
		params.put("grant_type", "authorization_code");
		params.put("redirect_uri", "http://localhost:8008/uglytasty/oauth2");
		
		ResponseEntity<JsonNode> responseEntity=restTemplate.postForEntity("https://oauth2.googleapis.com/token",params, JsonNode.class);
		JsonNode accessTokenNode = responseEntity.getBody();
		accessToken = accessTokenNode.get("access_token").asText();
		
		String resourceUri = "https://www.googleapis.com/userinfo/v2/me";
		
		HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "Bearer " + accessToken);
        HttpEntity entity = new HttpEntity(headers);
        JsonNode userInfo = restTemplate.exchange(resourceUri, HttpMethod.GET, entity, JsonNode.class).getBody();
		

        Map<String, Object> responseMap = new HashMap();
        responseMap.put("accessToken", accessToken);
        responseMap.put("userInfo", userInfo);

        return responseMap;
        
	}

	public Member checkMemberByGoogle(String userId) {
		userId = userId + "ggl";
		
		return mDao.checkMemberByGoogle(sqlSession, userId);
	}


	@Override

	public int insertMember(Member m) {
		return mDao.insertMember(sqlSession, m);
	}

	@Override
	public int idCheck(String checkId) {
		return mDao.idCheck(sqlSession, checkId);
	}

	

	

}
