package com.kh.uglytasty.recipe.model.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.kh.uglytasty.recipe.model.vo.Ingredients;
import com.kh.uglytasty.recipe.model.vo.Liked;
import com.kh.uglytasty.recipe.model.vo.Recipe;
import com.kh.uglytasty.recipe.model.vo.Reply;

public interface RecipeService {
	
	// 레시피 리스트 조회 서비스(기본, 최신순)
	int selectListCount();
	ArrayList<Recipe> selectList();
	
	// 레시피 리스트 조회 서비스(조회수 순)
	// int selectListCount();
	ArrayList<Recipe> selectListViewDesc();
	
	// 레시피 검색 결과 개수 조회
	int selectSearchListCount(HashMap<String, String> map);
	// 레시피 검색
	ArrayList<Recipe> selectSearchList(HashMap<String, String> map);
	
	// 레시피 상세 조회 서비스
	int increaseCount(int recipeNo); // 조회수 증가
	Recipe selectRecipe(int recipeNo); // 상세 게시글 내용 조회
	Ingredients selectIngredients(int recipeNo); // 해당 레시피 재료 조회
	//int checkIfUserLiked(int recipeNo, String userId); // 로그인한 사용자가 해당 게시글을 좋아요 했는지 확인
	
	// 레시피 등록 서비스(레시피+재료)
	int insertRecipe(Recipe r);
	int insertIngredients(Ingredients i);
	
	// 레시피 삭제 서비스
	int deleteRecipe(int recipeNo);
	
	// 댓글 리스트 조회용 서비스 (ajax)
	ArrayList<Reply> selectReplyList(int boardNo);

	// 댓글 작성용 서비스 (ajax)
	int insertReply(Reply reply);
	
	// 댓글 삭제용 서비스 (ajax)
	int deleteReply(int replyNo);
	
	// 레시피 수정 서비스 (레시피 Recipe r)
	int updateRecipe(Recipe r);
	
	// 레피시 수정 서비스 (재료 Ingredients i)
	int updateIngredients(Ingredients i);
	
	// <레시피 좋아요 관련>
	// 좋아요 여부 확인
	Liked checkLike(Liked l);
	// 좋아요 하기
	int insertLike(Liked l);
	// 좋아요 취소하기
	int deleteLike(Liked l);
	
	// 좋아요 개수
	int likeCount(int recipeNo);
	
}
