package com.kh.uglytasty.product.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kh.uglytasty.product.model.service.ProductServiceImpl;
import com.kh.uglytasty.product.model.vo.Attachment;
import com.kh.uglytasty.product.model.vo.Product;

@Controller
public class ProductController {

	@Autowired
	private ProductServiceImpl pService;
	
	
	/** (단순jsp이동) 상품등록 폼
	 * 
	 */
	@RequestMapping("enrollForm.pro")
	public String enrollForm() {
		return "product/productEnrollForm";
	}
	
	
	
	/** 상품 전체 리스트 조회
	 * 
	 */
	@RequestMapping("list.pro")
	public String selectProductList(Model model) {
		ArrayList<Product> plist = pService.selectProductList();
		
		/*
		for(int i=0; i<plist.size(); i++) {
			System.out.println(plist.get(i));
		}
		*/
		//System.out.println(plist);
		
		model.addAttribute("plist", plist);
		
		return "product/productListView";
	}
	
	
	/** 상품 상세페이지 조회
	 * 
	 */
	@RequestMapping("detail.pro")
	public String selectDetailProduct(int pno, Model model, HttpSession session) {
		
		//System.out.println(pno);
		
		// 해당 게시글 조회수 증가
		int result = pService.increaseCount(pno);
		
		// 상세페이지 조회
		if(result > 0) {
			ArrayList<Product> plist = pService.selectDetailProduct(pno);
			
			System.out.println("상품의 상세정보 : " + plist);
			model.addAttribute("plist", plist);
			return "product/productDetailView";
		}else {
			model.addAttribute("errorMsg", "상세조회 실패!");
			return "common/errorPage";
		}
		
		
		
	}
	
	
	/** 상품 엑셀데이터 검색 조회
	 * 
	 */
	@ResponseBody
	@RequestMapping(value="search.pro", produces="application/json; charset=UTF-8")
	public String selectSearchProduct(int productNo) {
		
		System.out.println("productNo : " + productNo);
		
		Product p = pService.selectSearchProduct(productNo);
		System.out.println(p);
		return new Gson().toJson(p);
	}
	
	
	/** 상품등록 (정보1 + 첨부파일5)
	 * 
	 */
	@RequestMapping(value="insert.pro")
	public String insertProduct(Product p, Attachment at, MultipartFile[] upfile, Model model, HttpSession session, 
								String fileExp1, String fileExp2, String fileExp3, String fileExp4, String fileExp5) { 
		/*공부용*/
		for(int i=0; i<upfile.length; i++) {
			System.out.println(upfile[i]);
		}
		
		ArrayList<String> explist = new ArrayList<String>();

		if(!fileExp1.equals("")) {
			explist.add(fileExp1);
		}
		if(!fileExp2.equals("")) {
			explist.add(fileExp2);				
		}
		if(!fileExp3.equals("")) {
			explist.add(fileExp3);				
		}
		if(!fileExp4.equals("")) {
			explist.add(fileExp4);				
		}
		if(!fileExp5.equals("")) {
			explist.add(fileExp5);				
		}
		
		System.out.println("explist" + explist);
		
		
		// -----------첨부파일 등록
		ArrayList<Attachment> alist = new ArrayList<Attachment>();

		for(int i = 0; i < upfile.length; i++) {
	        
			if(upfile[i].getSize() != 0) {
				
				String changeName = saveFile(upfile[i], session); 	// "2023100412153012345.png"
				// 새로운 Attachment 객체를 생성하여 각 첨부 파일 정보를 담고 alist에 추가
				Attachment newAt = new Attachment();
				newAt.setOriginName(upfile[i].getOriginalFilename());
				newAt.setChangeName("resources/uploadFiles/" + changeName);
				newAt.setFileLevel(i + 1); // fileLevel 1,2,3,4,5
				newAt.setFileExp(explist.get(i));	//explist[i]
				
				alist.add(newAt);

			}
			
	    }
		
		System.out.println("alist" + alist);
		
		// ----------상품 [정보1 + 첨부파일5] 등록
		int result = pService.insertProduct(p, alist);
		
		if(result > 0) {
			session.setAttribute("alertMsg", "성공적으로 게시글이 등록되었습니다.");
			return "redirect:list.pro";				
		}else {
			model.addAttribute("errorMsg", "게시글 등록 실패!");
			return "common/errorPage";
		}
		
	
		
	}


	/**  현재 넘어온 첨부파일 그 자체를 서버의 폴더에 저장시키는 역할
	 * 
	 */
	public String saveFile(MultipartFile upfile, HttpSession session) {
		
		// "flower.png"
		String originName = upfile.getOriginalFilename();
		
		// "2023100412153012345.png"
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()); // "20231004154607" (년월일시분초)
		int ranNum = (int)(Math.random() * 90000 + 10000);	// 21318(5자리 랜덤값)
		String ext = originName.substring(originName.lastIndexOf(".")); // .png (확장자명)
	
		String changeName = currentTime + ranNum + ext;
		
		// 업로드 시키고자 하는 폴더의 물리적인 경로를 알아내기
		String savePath = session.getServletContext().getRealPath("/resources/uploadFiles/"); // 안에 '/'
		
		// *** (서버에 업로드 하기 위한 작업)
		try {
			upfile.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
	}
	
	
	
	
	
	
}
