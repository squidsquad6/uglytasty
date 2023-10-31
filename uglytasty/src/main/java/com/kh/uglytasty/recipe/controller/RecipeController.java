package com.kh.uglytasty.recipe.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kh.uglytasty.member.model.vo.Member;
import com.kh.uglytasty.recipe.model.service.RecipeServiceImpl;
import com.kh.uglytasty.recipe.model.vo.Ingredients;
import com.kh.uglytasty.recipe.model.vo.Liked;
import com.kh.uglytasty.recipe.model.vo.Recipe;
import com.kh.uglytasty.recipe.model.vo.Reply;

@Controller
public class RecipeController {
	
	@Autowired
	private RecipeServiceImpl rService;
	
	
	/** 레시피 리스트 페이지 서비스 - 게시글 총 개수 & 게시글 리스트 조회 (기본, 최신순)
	 * @return
	 */
	@RequestMapping("list.re")
	public String recipeList(Model model) {
		
		// 총 게시글 개수
		int listCount = rService.selectListCount();
		
		// 게시글 리스트
		ArrayList<Recipe> list = rService.selectList();
		
		model.addAttribute("listCount", listCount);
		model.addAttribute("list", list);
		
		return "recipe/recipeListView";
	}
	
	
	
	/** 레시피 리스트 페이지 서비스 - 게시글 총 개수 & 게시글 리스트 조회 (조회순)
	 * @param model
	 * @return
	 */
	@RequestMapping("listViewDesc.re")
	public String recipeListViewDesc(Model model) {
		
		// 총 게시글 개수
		int listCount = rService.selectListCount();
		
		// 게시글 리스트(조회수 순)
		ArrayList<Recipe> list = rService.selectListViewDesc();
		
		
		model.addAttribute("listCount", listCount);
		model.addAttribute("list", list);
		
		return "recipe/recipeListView";
		
	}
	
	
	/** 레시피 리스트 검색
	 * @param keyword
	 * @param model
	 * @return
	 */
	@RequestMapping("search.re")
	public String selectSearchList(String keyword, Model model) {
		
		HashMap<String, String> map = new HashMap<>();
		map.put("keyword", keyword);
		
		// 레시피 검색 결과 개수 조회
		int searchListCount = rService.selectSearchListCount(map);
		
		// 검색된 레시피 리스트
		ArrayList<Recipe> list = rService.selectSearchList(map);
		
		model.addAttribute("keyword", keyword);
		model.addAttribute("searchListCount", searchListCount);
		model.addAttribute("list", list);
		
		return "recipe/recipeListView";
		
	}
	
	
	/** 레시피 상세 조회
	 * @param rno
	 * @param model
	 * @return
	 */
	@RequestMapping("detail.re")
	public String selectRecipe(int rno, Model model, HttpSession session) {
		// rno : 상세 조회하고자 하는 해당 레시피글 번호(recipeNo)
		
		//String userId = ((Member) session.getAttribute("loginMember")).getUserId();
		String ifUserLiked = "";
		
		// 조회수 증가
		int result = rService.increaseCount(rno);
		
		if(result > 0) { // 조회수 증가 성공
			
			// -- 레시피 상세 조회 서비스 --
			
			// 상세 게시글 내용 조회
			Recipe r = rService.selectRecipe(rno);
			
			// 재료 조회 서비스 호출
			Ingredients i = rService.selectIngredients(rno);
			
			// 좋아요 갯수 조회
			int likeCount = rService.likeCount(rno);
			
			// 로그인한 사용자가 해당 게시글을 좋아요 했는지 확인
			Member loginMember = (Member) session.getAttribute("loginMember");

			    if (loginMember != null) {
			    	
			        String userId = loginMember.getUserId();
			        
			        Liked l = new Liked(rno, userId);

			        // 좋아요 여부 체크
			        Liked likeResult = rService.checkLike(l);
			        
			        session.setAttribute("likeResult", likeResult);

			        if (likeResult == null) { // 좋아요 체크 안 된 상태
			            ifUserLiked = "no";
			           
			        } else { // 좋아요 된 상태
			            ifUserLiked = "yes";
			        }
			        
			        session.setAttribute("ifUserLiked", ifUserLiked);
			        
			    }
			
			
			model.addAttribute("r", r);
			model.addAttribute("i", i);
			session.setAttribute("likeCount", likeCount);
			
			return "recipe/recipeDetailView";
			
		}else { // 조회수 증가 실패
			
			model.addAttribute("errorMsg", "상세 조회 실패");
			return "common/errorPage";
			
		}
		
	}
	
	/** 레시피 게시글 등록폼 띄우기
	 * @return
	 */
	@RequestMapping("enrollForm.re")
	public String enrollRecipeForm() {
		
		return "recipe/recipeEnrollForm";
	}
	
	
	/** 레시피 게시글 등록
	 * @param r
	 * @param upfile
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("insert.re")
	public String insertRecipe(Recipe r, Ingredients i, MultipartFile upfile, HttpSession session, Model model) {
		
		// 첨부파일이 있을 경우 => 파일명 수정 후 서버 업로드
		if(!upfile.getOriginalFilename().equals("")) {
			
			// saveFile 메소드 호출
			String changeName = saveFile(upfile, session);
			
			// 원본명, 서버에 업로드된 경로를 Recipe r에 이어서 담기(db에 업로드)
			r.setRecipeOriginName(upfile.getOriginalFilename());
			r.setRecipeChangeName("resources/uploadFiles/" + changeName);
			
		}
	
		int recipeResult = rService.insertRecipe(r);
		int ingredientsResult = 0;
		
		if(recipeResult > 0 ) {
			
			ingredientsResult = rService.insertIngredients(i);
			
			session.setAttribute("alertMsg", "레시피 등록 성공!");
			return "redirect:list.re";
			
		}else {
			
			model.addAttribute("errorMsg", "게시글 등록 실패");
			return "common/errorPage";
			
		}
		
		
	}
	
	
	// 첨부파일 관련
	public String saveFile(MultipartFile upfile, HttpSession session) {
		String recipeOriginName = upfile.getOriginalFilename();
		
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date());
		int ranNum = (int)(Math.random() * 90000 + 10000);
		String ext = recipeOriginName.substring(recipeOriginName.lastIndexOf("."));
		
		String changeName = "utrecipe" + currentTime + ranNum + ext;
		
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/");
		
		try {
			
			upfile.transferTo(new File(savePath + changeName));
			
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
		
	}
	
	
	
	/** 레시피 게시글 삭제
	 * @param rno
	 * @param filePath
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("delete.re")
	public String deleteRecipe(int rno, String filePath, HttpSession session, Model model) {
		
		int result = rService.deleteRecipe(rno);
		
		if(result > 0) { // 삭제 성공
			
			// 첨부파일 있는 경우 => 파일 삭제
			if(!filePath.equals("")) {
				new File(session.getServletContext().getRealPath(filePath)).delete();
			}
			
			session.setAttribute("alertMsg", "레시피 삭제 완료!");
			
			return "redirect:list.re";
			
		}else { // 삭제 실패
			model.addAttribute("errorMsg", "게시글 삭제 실패");
			
			return "common/errorPage";
		}
		
	}
	
	
	
	/** 레시피 게시글에 달린 댓글 리스트 조회 (ajax)
	 * @param rno
	 * @return
	 */
	@ResponseBody
	@RequestMapping(value="rlist.re", produces="application/json; charset=UTF-8")
	public String ajaxSelectReplyList(int rno) {
		
		ArrayList<Reply> list = rService.selectReplyList(rno);
		//System.out.println("리스트" + list);
		
		return new Gson().toJson(list);
	}
	
	
	/** 레시피 게시글에 댓글 달기 (ajax)
	 * @param r
	 * @return
	 */
	@ResponseBody
	@RequestMapping("rinsert.re")
	public String ajaxInsertReply(Reply reply) {
		
		int result = rService.insertReply(reply);
		//System.out.println(reply);
		
		return result > 0 ? "success" : "fail";
		
	}
	
	
	/** 레시피 댓글 삭제 (ajax)
	 * @param rplno
	 * @param session
	 * @param model
	 * @return
	 */
	@ResponseBody
	@RequestMapping("rdelete.re")
	public String deleteReply(int rplno, HttpSession session, Model model) {
		
		int result = rService.deleteReply(rplno);

		return result > 0 ? "success" : "fail";
		
	}
	
	
	/** 레시피 수정 폼 띄우기
	 * @param rno
	 * @param model
	 * @return
	 */
	@RequestMapping("updateForm.re")
	public String updateForm(int rno, Model model) {
		
		model.addAttribute("r", rService.selectRecipe(rno));
		model.addAttribute("i", rService.selectIngredients(rno));
		
		return "recipe/recipeUpdateForm";
		
	}
	
	
	
	/** 게시글 수정하기
	 * @param r
	 * @param i
	 * @param reupfile
	 * @param session
	 * @param model
	 * @return
	 */
	@RequestMapping("update.re")
	public String updateRecipe(@ModelAttribute Recipe r, @ModelAttribute Ingredients i, MultipartFile reupfile, HttpSession session, Model model) {
		
		// 사진 수정할 경우
		if(!reupfile.getOriginalFilename().equals("")) {
			
			// 기존 첨부파일 있는 경우 => 이거 삭제
			if(r.getRecipeOriginName() != null) {
				new File(session.getServletContext().getRealPath(r.getRecipeChangeName())).delete();
			}
			
			// 새로 수정한 사진 서버에 업로드 하기
			String changeName = saveFile(reupfile, session);
			
			r.setRecipeOriginName(reupfile.getOriginalFilename());
			r.setRecipeChangeName("resources/uploadFiles/" + changeName);
			
		}
		
		
		int recipeResult = rService.updateRecipe(r);
		int ingredientsResult = 0;
		
		
		if(recipeResult > 0) {
			
			ingredientsResult = rService.updateIngredients(i);
			
			session.setAttribute("alertMsg", "게시글 수정 성공!");
			return "redirect:detail.re?rno=" + r.getRecipeNo();
			
		}else {
			
			model.addAttribute("errorMsg", "게시글 수정 실패!");
			
			return "common/errorPage";
			
		}
		
	}
	
	
	/** 레시피 좋아요 기능  - 좋아요 여부 확인, 좋아요 하기, 좋아요 취소
	 * @param recipeNo
	 * @param session
	 * @param model
	 * @return
	 */
	@ResponseBody
	@RequestMapping("like.re")
	public int likeRecipe(int recipeNo, HttpSession session, Model model) {
		
		Member loginMember = (Member) session.getAttribute("loginMember");
		
	    int result = 0;

		    if (loginMember != null) {
		    	
		        String userId = loginMember.getUserId();
		        
		        Liked l = new Liked(recipeNo, userId);

		        // 좋아요 여부 체크
		        Liked likeResult = rService.checkLike(l);
		        //session.setAttribute("likeResult", likeResult);

		        if (likeResult == null) { // 좋아요 체크 안 된 상태
		            result = rService.insertLike(l);
		        } else { // 좋아요 된 상태
		            result = rService.deleteLike(l);
		        }
		        
		    }
		    
		    return result;
		
	}
	

	


}
