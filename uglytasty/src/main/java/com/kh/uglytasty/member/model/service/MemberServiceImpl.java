package com.kh.uglytasty.member.model.service;

import java.util.ArrayList;
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
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.kh.uglytasty.member.model.dao.MemberDao;
import com.kh.uglytasty.member.model.vo.Member;
import com.kh.uglytasty.product.model.vo.Product;

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
	
	// 재고량 0 인 상품 조회 (select) - 관리자알림용
	@Override
	public ArrayList<Product> selectProductStockList() {
		return mDao.selectProductStockList(sqlSession);
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

	public Map<String, Object> getNaverAccessToken(String code, String state) {
		
		String accessToken = "";
		
		
		HttpHeaders headers = new HttpHeaders();
	    headers.add("Content-type", "application/x-www-form-urlencoded");
	    MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		RestTemplate restTemplate = new RestTemplate();
		
		
		params.add("code", code);
		params.add("client_id", "qx5GJFsGBjihBcvVb7EK");
		params.add("client_secret","Y0Khhew91p");
		params.add("grant_type", "authorization_code");
		params.add("redirect_uri", "http://localhost:8008/uglytasty/oauth2/naver");
		params.add("state", state);
		HttpEntity<MultiValueMap<String, String>> httpEntity = new HttpEntity<MultiValueMap<String, String>>(params, headers);
		
		
		 ResponseEntity<JsonNode> responseEntity = restTemplate.exchange(
			        "https://nid.naver.com/oauth2.0/token", HttpMethod.POST, httpEntity, JsonNode.class);
		 
		  JsonNode responseBody = responseEntity.getBody();
	      accessToken = responseBody.get("access_token").asText();
		
	      headers = new HttpHeaders();
	      headers.set("Authorization", "Bearer " + accessToken);
	      HttpEntity entity = new HttpEntity(headers);
	      
	      ResponseEntity<JsonNode> userInfoResponseEntity = restTemplate.exchange(
	          "https://openapi.naver.com/v1/nid/me", HttpMethod.GET, entity, JsonNode.class);
	      
	      JsonNode userInfo = userInfoResponseEntity.getBody();
	      
	      Map<String, Object> responseMap = new HashMap();
	      responseMap.put("accessToken", accessToken);
	      responseMap.put("userInfo", userInfo);

	      return responseMap;
	      
	}

	public Member checkMemberByNaver(String userId) {
		
		userId = userId + "nvr";
		
		return mDao.checkMemberByGoogle(sqlSession, userId);
	}

	public Map<String, Object> getKakaoAccessToken(String code) {
		String accessToken = "";
		
		
		HttpHeaders headers = new HttpHeaders();
	    headers.add("Content-type", "application/x-www-form-urlencoded");
	    MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
		RestTemplate restTemplate = new RestTemplate();
		
		
		params.add("code", code);
		params.add("client_id", "e1fdaf851d387ba402c8d1d3a1f2b21d");
		params.add("client_secret","hREtnoiub6OnW3sZonDU6qfVo7bpZygh");
		params.add("grant_type", "authorization_code");
		params.add("redirect_uri", "http://localhost:8008/uglytasty/oauth2/kakao");
		HttpEntity<MultiValueMap<String, String>> httpEntity = new HttpEntity<MultiValueMap<String, String>>(params, headers);
		
		
		 ResponseEntity<JsonNode> responseEntity = restTemplate.exchange(
			        "https://kauth.kakao.com/oauth/token", HttpMethod.POST, httpEntity, JsonNode.class);
		 
		  JsonNode responseBody = responseEntity.getBody();
	      accessToken = responseBody.get("access_token").asText();
		
	      headers = new HttpHeaders();
	      headers.set("Authorization", "Bearer " + accessToken);
	      HttpEntity entity = new HttpEntity(headers);
	      
	      ResponseEntity<JsonNode> userInfoResponseEntity = restTemplate.exchange(
	          "https://kapi.kakao.com/v2/user/me", HttpMethod.GET, entity, JsonNode.class);
	      
	      JsonNode userInfo = userInfoResponseEntity.getBody();
	      
	      Map<String, Object> responseMap = new HashMap();
	      responseMap.put("accessToken", accessToken);
	      responseMap.put("userInfo", userInfo);

	      return responseMap;
	}

	public Member checkMemberByKakao(String userId) {
		userId = userId + "kko";
		
		return mDao.checkMemberByGoogle(sqlSession, userId);
	}

	
	// ========================= 마이페이지 =========================
	
	
		/**
		 * 회원탈퇴
		 */
		@Override
		public int deleteMember(String userId) {
			return mDao.deleteMember(sqlSession, userId);
		}


		/**
		 * 회원정보 수정
		 */
		@Override
		public int updateMember(Member m) {
			
			return mDao.updateMember(sqlSession, m);
		}


		/**
		 * 비밀번호 변경
		 */
		@Override
		public int updatePwd(Member updatePwdMem) {
			
			//System.out.println("여기는 service, encNewPwd : " + encNewPwd);
			return mDao.updatePwd(sqlSession, updatePwdMem);
		}
		
		
	

	

}
