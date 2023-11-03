package com.kh.uglytasty.recipe.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.uglytasty.recipe.model.dao.RecipeDao;
import com.kh.uglytasty.recipe.model.vo.Ingredients;
import com.kh.uglytasty.recipe.model.vo.Liked;
import com.kh.uglytasty.recipe.model.vo.Recipe;
import com.kh.uglytasty.recipe.model.vo.Reply;

@Service
public class RecipeServiceImpl implements RecipeService{
	
	@Autowired
	private RecipeDao rDao;
	
	@Autowired
	private SqlSessionTemplate sqlSession;

	
	/**
	 * 레시피 리스트 페이지 서비스 - 게시글 총 개수
	 */
	@Override
	public int selectListCount() {
		
		return rDao.selectListCount(sqlSession);
	}


	/**
	 * 레시피 리스트 서비스 - 게시글 리스트 조회(기본, 최신순)
	 */
	@Override
	public ArrayList<Recipe> selectList() {
		
		return rDao.selectList(sqlSession);
	}
	
	
	/**
	 * 레시피 리스트 서비스 - 게시글 리스트 조회(조회순)
	 */
	@Override
	public ArrayList<Recipe> selectListViewDesc() {
		
		return rDao.selectListViewDesc(sqlSession);
	}
	

	/**
	 * 레시피 조회수 증가
	 */
	@Override
	public int increaseCount(int recipeNo) {
		
		return rDao.increaseCount(sqlSession, recipeNo);
	}
	
	
	
	/**
	 * 레시피 검색 목록 개수 조회 메소드
	 */
	@Override
	public int selectSearchListCount(HashMap<String, String> map) {
		
		return rDao.selectSearchListCount(sqlSession, map);
	}


	
	/**
	 * 레시피 검색 목록 조회 메소드
	 */
	@Override
	public ArrayList<Recipe> selectSearchList(HashMap<String, String> map) {
		
		return rDao.selectSearchList(sqlSession, map);
	}



	/**
	 * 레시피 상세 조회
	 */
	@Override
	public Recipe selectRecipe(int recipeNo) {
		
		return rDao.selectRecipe(sqlSession, recipeNo);
	}

	
	/**
	 * 레시피 재료 조회
	 */
	@Override
	public Ingredients selectIngredients(int recipeNo) {
		
		return rDao.selectIngredients(sqlSession, recipeNo);
	}

	
	
	/**
	 * 레시피 좋아요 개수 조회
	 */
	@Override
	public int likeCount(int recipeNo) {
		
		return rDao.likeCount(sqlSession, recipeNo);
	}
	
	
	
	/**
	 * 로그인한 사용자가 해당 게시글을 좋아요 했는지 확인
	 */
//	@Override
//	public int checkIfUserLiked(int recipeNo, String userId) {
//		
//		return rDao.checkIfUserLiked(sqlSession, recipeNo, userId);
//	}


	
	/**
	 * 레시피 게시글 등록(레시피)
	 */
	@Override
	public int insertRecipe(Recipe r) {
		
		return rDao.insertRecipe(sqlSession, r);
	}
	
	
	
	/**
	 * 레시피 게시글 등록(재료)
	 */
	@Override
	public int insertIngredients(Ingredients i) {
		
		return rDao.insertIngredients(sqlSession, i);
	}


	
	/**
	 * 레시피 게시글 삭제
	 */
	@Override
	public int deleteRecipe(int recipeNo) {
		
		return rDao.deleteRecipe(sqlSession, recipeNo);
	}


	/**
	 *  레시피 게시글에 달린 댓글 리스트 조회 (ajax)
	 */
	@Override
	public ArrayList<Reply> selectReplyList(int boardNo) {
		
		return rDao.selectReplyList(sqlSession, boardNo);
	}


	/**
	 * 레시피 게시글에 댓글 달기 (ajax)
	 */
	@Override
	public int insertReply(Reply reply) {
		
		return rDao.insertReply(sqlSession, reply);
	}


	/**
	 * 레시피 게시글 댓글 삭제
	 */
	@Override
	public int deleteReply(int replyNo) {
		
		return rDao.deleteReply(sqlSession, replyNo);
	}


	/**
	 * 레시피 수정(레시피 내용)
	 */
	@Override
	public int updateRecipe(Recipe r) {
		
		return rDao.updateRecipe(sqlSession, r);
	}


	/**
	 * 레시피 수정(재료 내용)
	 */
	@Override
	public int updateIngredients(Ingredients i) {
		
		return rDao.updateIngredients(sqlSession, i);
	}


	/**
	 * 레시피 좋아요 - 좋아요 여부 확인
	 */
	@Override
	public Liked checkLike(Liked l) {
		
		Liked likeResult = rDao.checkLike(sqlSession, l);
		
		return likeResult;
	}


	/**
	 * 레시피 좋아요 - 좋아요 하기
	 */
	@Override
	public int insertLike(Liked l) {
		
		return rDao.insertLike(sqlSession, l);
	}


	/**
	 * 레시피 좋아요 - 좋아요 취소
	 */
	@Override
	public int deleteLike(Liked l) {
		
		return rDao.deleteLike(sqlSession, l);
	}


	// ========================= 마이페이지 =========================
	
	
	/**
	 * 찜한 레시피 총 갯수
	 */
	@Override
	public int selectLikeListCount(String userId) {
		
		return rDao.selectLikeListCount(sqlSession, userId);
	}
	
	
	/**
	 * 찜한 레시피 리스트
	 */
	@Override
	public ArrayList<Recipe> selectLikeList(String userId) {
		
		return rDao.selectLikeList(sqlSession, userId);
	}



}
