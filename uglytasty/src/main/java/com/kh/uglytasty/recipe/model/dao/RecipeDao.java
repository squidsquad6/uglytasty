package com.kh.uglytasty.recipe.model.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.kh.uglytasty.recipe.model.vo.Ingredients;
import com.kh.uglytasty.recipe.model.vo.Liked;
import com.kh.uglytasty.recipe.model.vo.Recipe;
import com.kh.uglytasty.recipe.model.vo.Reply;

@Repository
public class RecipeDao {

	
	/** 레시피 리스트 페이지 서비스 - 게시글 총 개수
	 * @param sqlSession
	 * @return
	 */
	public int selectListCount(SqlSessionTemplate sqlSession) {
		
		return sqlSession.selectOne("recipeMapper.selectListCount");
	}

	
	/** 레시피 리스트 페이지 서비스 - 게시글 리스트 조회 (기본, 최신순)
	 * @param sqlSession
	 * @return
	 */
	public ArrayList<Recipe> selectList(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("recipeMapper.selectList");
	}
	
	
	
	/** 레시피 리스트 페이지 서비스 - 게시글 리스트 조회 (조회순)
	 * @param sqlSession
	 * @return
	 */
	public ArrayList<Recipe> selectListViewDesc(SqlSessionTemplate sqlSession) {
		
		return (ArrayList)sqlSession.selectList("recipeMapper.selectListViewDesc");
	}
	
	
	
	/** 조회수 증가
	 * @param sqlSession
	 * @param recipeNo
	 * @return
	 */
	public int increaseCount(SqlSessionTemplate sqlSession, int recipeNo) {
		
		return sqlSession.update("recipeMapper.increaseCount", recipeNo);
	}
	
	
	
	/** 레시피 검색 목록 개수 조회 메소드
	 * @param sqlSession
	 * @param map
	 * @return
	 */
	public int selectSearchListCount(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		
		return sqlSession.selectOne("recipeMapper.selectSearchRecipeListCount", map);
	}


	/** 레시피 검색 리스트 조회
	 * @param sqlSession
	 * @param map
	 * @return
	 */
	public ArrayList<Recipe> selectSearchList(SqlSessionTemplate sqlSession, HashMap<String, String> map) {
		
		return (ArrayList)sqlSession.selectList("recipeMapper.selectSearchRecipeList", map);
	}

	

	/** 레시피 게시글 상세 조회
	 * @param sqlSession
	 * @param recipeNo
	 * @return
	 */
	public Recipe selectRecipe(SqlSessionTemplate sqlSession, int recipeNo) {
		
		return sqlSession.selectOne("recipeMapper.selectRecipe", recipeNo);
	}
	
	
	
	/** 레시피 재료 조회
	 * @param sqlSession
	 * @param recipeNo
	 * @return
	 */
	public Ingredients selectIngredients(SqlSessionTemplate sqlSession, int recipeNo) {
		
		return sqlSession.selectOne("recipeMapper.selectIngredients", recipeNo);
	}

	
	
	/** 레시피 좋아요 개수 조회
	 * @param sqlSession
	 * @param recipeNo
	 * @return
	 */
	public int likeCount(SqlSessionTemplate sqlSession, int recipeNo) {
		
		return sqlSession.selectOne("recipeMapper.likeCount", recipeNo);
	}
	
	
	
	/** 로그인한 사용자가 해당 게시글을 좋아요 했는지 확인
	 * @param sqlSession
	 * @param recipeNo
	 * @return
	 */
//	public int checkIfUserLiked(SqlSessionTemplate sqlSession, int recipeNo) {
//		
//		return sqlSession.select
//	}


	
	
	/** 레시피 게시글 등록(레시피)
	 * @param sqlSession
	 * @param r
	 * @return
	 */
	public int insertRecipe(SqlSessionTemplate sqlSession, Recipe r) {
		
		return sqlSession.insert("recipeMapper.insertRecipe", r);
	}
	
	
	
	/** 레시피 게시글 등록(재료)
	 * @param sqlSession
	 * @param i
	 * @return
	 */
	public int insertIngredients(SqlSessionTemplate sqlSession, Ingredients i) {
		
		return sqlSession.insert("recipeMapper.insertIngredients", i);
	}

	
	
	/** 레시피 게시글 삭제
	 * @param sqlSession
	 * @param recipeNo
	 * @return
	 */
	public int deleteRecipe(SqlSessionTemplate sqlSession, int recipeNo) {
		
		return sqlSession.update("recipeMapper.deleteRecipe", recipeNo);
	}

	

	/** 레시피 게시글에 달린 댓글 리스트 조회 (ajax)
	 * @param sqlSession
	 * @param boardNo
	 * @return
	 */
	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int boardNo) {
		
		return (ArrayList)sqlSession.selectList("recipeMapper.selectReplyList", boardNo);
	}


	/** 레시피 게시글에 댓글 달기 (ajax)
	 * @param sqlSession
	 * @param r
	 * @return
	 */
	public int insertReply(SqlSessionTemplate sqlSession, Reply reply) {
		
		return sqlSession.insert("recipeMapper.insertReply", reply);
	}


	/** 레시피 게시글 댓글 삭제
	 * @param sqlSession
	 * @param replyNo
	 * @return
	 */
	public int deleteReply(SqlSessionTemplate sqlSession, int replyNo) {
		
		return sqlSession.update("recipeMapper.deleteReply", replyNo);
		
	}


	/** 레시피 수정(레시피 내용)
	 * @param sqlSession
	 * @param r
	 * @return
	 */
	public int updateRecipe(SqlSessionTemplate sqlSession, Recipe r) {
		
		return sqlSession.update("recipeMapper.updateRecipe", r);
	}


	/** 레시피 수정(재료 내용)
	 * @param sqlSession
	 * @param i
	 * @return
	 */
	public int updateIngredients(SqlSessionTemplate sqlSession, Ingredients i) {
		
		return sqlSession.update("recipeMapper.updateIngredients", i);
	}


	/** 레시피 좋아요 - 좋아요 여부 확인
	 * @param sqlSession
	 * @param recipeNo
	 * @param userId
	 * @return
	 */
	public Liked checkLike(SqlSessionTemplate sqlSession, Liked l) {
		
        return sqlSession.selectOne("recipeMapper.checkLike", l);
	}


	/** 레시피 좋아요 - 좋아요 하기
	 * @param sqlSession
	 * @param recipeNo
	 * @param userId
	 * @return
	 */
	public int insertLike(SqlSessionTemplate sqlSession, Liked l) {
		
		
        return sqlSession.insert("recipeMapper.insertLike", l);
	}


	/** 레시피 좋아요 - 좋아요 취소
	 * @param sqlSession
	 * @param recipeNo
	 * @param userId
	 * @return
	 */
	public int deleteLike(SqlSessionTemplate sqlSession, Liked l) {
		
		
        return sqlSession.delete("recipeMapper.deleteLike", l);
	}


	


}
