package com.kh.uglytasty.product.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.Random;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kh.uglytasty.order.model.vo.Cart;
import com.kh.uglytasty.order.model.vo.Orders;
import com.kh.uglytasty.order.model.vo.OrdersDetail;
import com.kh.uglytasty.product.model.service.ProductServiceImpl;
import com.kh.uglytasty.product.model.vo.Attachment;
import com.kh.uglytasty.product.model.vo.Product;
import com.kh.uglytasty.product.model.vo.Review;
import com.kh.uglytasty.recipe.model.vo.Recipe;


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
      
      
      // '다음에 만나요' 상품들 조회
      ArrayList<Product> xlist = pService.selectReadyList();
      model.addAttribute("xlist", xlist);
      
      return "product/productListView";
   }
   
   
   /** 상품 인기순 리스트 조회(Y)
	 *
	 */
   @RequestMapping("popularlist.pro")
   public String selectPopularList(Model model) {
	   ArrayList<Product> plist = pService.selectPopularList();
	   //System.out.println("인기순 : " + plist);
	   model.addAttribute("plist", plist);
	      
	   return "product/productPopularListView";
   }
   
   /** 상품 가격낮은순 리스트 조회(Y)
	 *
	 */
   @RequestMapping("lowerpricelist.pro")
   public String selectLowerPriceList(Model model) {
	   ArrayList<Product> plist = pService.selectLowerPriceList();
	   model.addAttribute("plist", plist);
	      
	   return "product/productLowerPriceListView";
   }
   
   
   /** 상품 '키워드' 검색 상품들 조회
    * 
    */
   @RequestMapping("searchKeyword.pro")
   public String selectSearchKeyword(String keyword, Model model, HttpSession session) {
      
      ArrayList<Product> keylist = pService.selectSearchKeyword(keyword);
      model.addAttribute("keylist", keylist);
      
      // '다음에 만나요' 상품들 조회
      ArrayList<Product> keylistR = pService.selectSearchKeywordReady(keyword);
      model.addAttribute("keylistR", keylistR);
      
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
         
         //System.out.println("상품의 상세정보(plist) : " + plist);
         
         //** 레시피 키워드 조회 작업 (해당 상품 제목의 가장 마지막 키워드 구해서)
         String productName = plist.get(0).getProductName();
         
         String lastWord = pService.selectLastWord(productName);
         
         //System.out.println("상품 마지막 단어 : " + lastWord);
         
         ArrayList<Recipe> relatedRecipe = pService.selectRelatedRecipe(lastWord);

         
         model.addAttribute("plist", plist);
         model.addAttribute("lastWord", lastWord);
         model.addAttribute("relatedRecipe", relatedRecipe); 
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
            
            String changeName = saveFile(upfile[i], session);    // "2023100412153012345.png"
            // 새로운 Attachment 객체를 생성하여 각 첨부 파일 정보를 담고 alist에 추가
            Attachment newAt = new Attachment();
            newAt.setOriginName(upfile[i].getOriginalFilename());
            newAt.setChangeName("resources/uploadFiles/" + changeName);
            newAt.setFileLevel(i + 1); // fileLevel 1,2,3,4,5
            newAt.setFileExp(explist.get(i));   //explist[i]
            
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


   /**  현재 넘어온 첨부파일 그 자체를 서버의 폴더에 저장시키는 역할 **
    * 
    */
   public String saveFile(MultipartFile upfile, HttpSession session) {
      
      // "flower.png"
      String originName = upfile.getOriginalFilename();
      
      // "2023100412153012345.png"
      String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()); // "20231004154607" (년월일시분초)
      int ranNum = (int)(Math.random() * 90000 + 10000);   // 21318(5자리 랜덤값)
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
   
   
   
   /**
	 * 상품 수정하기 (정보1 + 첨부파일5)***************
	 */

  @RequestMapping("update.pro")
  public String updateProduct(int productNo, Product p, MultipartFile[] reupfile, Model model, HttpSession session,
		   					String fileExp1, String fileExp2, String fileExp3, String fileExp4, String fileExp5) {
	   
	   
	   // 1) 정보1 수정-------------------------------------------------------------------------------------
	   int result1 = pService.updateProduct(p);
	   
	   
	   
	   // 2) 첨부파일5 수정 (1:update, 2:insert)
		  
		  //공부용
	      for(int i=0; i<reupfile.length; i++) {
	         System.out.println(reupfile[i]);
	      }
	      
		      
	      // (준비) 상품 설명이 없을때 null값 들어가지 않도록 하기 위한 작업
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
	      
	      System.out.println("상품 설명 explist" + explist); 
	  
	      
	      ArrayList<Attachment> existAtList = pService.selectAttachmentList(productNo);	//db에서 가져온애
	      ArrayList<Attachment> updateAtList = new ArrayList<Attachment>();
	      ArrayList<Attachment> insertAtList = new ArrayList<Attachment>();
	
	      // 2_1) 상품 수정_ 수정할 상품의 첨파(기존) update -------------------------------------------------------------
	      
	      for (int i = 0; i < existAtList.size(); i++) {
	    	    if (!reupfile[i].getOriginalFilename().equals("")) {
	    	    	// 사진o, 설명o | 사진만o, 설명x
	    	        Attachment newAt = new Attachment();
	    	        String changeName = saveFile(reupfile[i], session);
	    	        newAt.setRefProductNo(productNo);
	    	        newAt.setOriginName(reupfile[i].getOriginalFilename());
	    	        newAt.setChangeName("resources/uploadFiles/" + changeName);
	    	        newAt.setFileLevel(i + 1);
	    	        newAt.setFileExp(explist.get(i));
	    	        updateAtList.add(newAt);
	    	    } else {
	    	    	// 사진x, 설명o
	    	        Attachment newAt = new Attachment();
	    	        newAt.setRefProductNo(productNo);
	    	        newAt.setOriginName(existAtList.get(i).getOriginName());
	    	        newAt.setChangeName(existAtList.get(i).getChangeName());
	    	        newAt.setFileLevel(i + 1);
	    	        newAt.setFileExp(explist.get(i));
	    	        updateAtList.add(newAt);
	    	    }
	    	}

    	  //System.out.println("updateAtList : " + updateAtList);
    	  int result2 = pService.updateExistAttachment(updateAtList);
	   
    	  
    	  // 2_2) 상품 수정_ 수정할 상품의 첨파(새로운) insert -----------------------------------------------------------
    	  //System.out.println("existAtList.size() : " + existAtList.size());
    	  //System.out.println("도대체 너 뭔데 (reupfile.length) : " + reupfile.length);
    	  
    	  
    	  // ***번뜩!!*** 새로운 첨파 객체 reupfile들 중 마지막 객체의 fileLevel숫자 필요해ㅜㅜㅜㅜ
    	  ArrayList<Attachment> fileLevelList = new ArrayList<Attachment>();
    	  
    	    for(int i = 0; i < reupfile.length; i++) {
    	           
    	         if(reupfile[i].getSize() != 0) {
    	         
    	            Attachment newAt = new Attachment();
    	            newAt.setFileLevel(i + 1); // fileLevel 1,2,3,4,5
    	            fileLevelList.add(newAt);

    	         }
    	         
    	     }
    	  //System.out.println("fileLevelList(파일번호만 담은 리스트) : " + fileLevelList);

    	  
    	  for(int i = 0; i < reupfile.length; i++) {
	           
 	         if(reupfile[i].getSize() != 0) { // 새로운 파일이 넘어왔다는 신호 (그대신 넘어온 파일이 '기존꺼=>수정' 이라면 제외시키고, '새로운첨파=>추가' 인 시작값을 인식해야 함!!)
 	        	 
 	        	 int lastObjectIndex = fileLevelList.size() - 1;								// fileLevelList에 담긴 객체중 가장 마지막 객체의 인덱스 수
 	        	 int lastObjectFileLevel = fileLevelList.get(lastObjectIndex).getFileLevel();  	// 그 객체의 fileLevel 수
 	        	 //System.out.println("lastObjectFileLevel(리스트 중 마지막 객체의 fileLevel): " + lastObjectFileLevel);
 	         
 	        	 for (int j = existAtList.size(); j < lastObjectFileLevel; j++) { // 예) 2 ~ 2,3,4 == 시작값 : existAtList.size() ~ lastObjectFileLevel
 	    		   
 	    		        String changeName = saveFile(reupfile[j], session);
 	    		        Attachment insertAt = new Attachment();
 	    		        insertAt.setRefProductNo(productNo);
 	    		        insertAt.setOriginName(reupfile[j].getOriginalFilename());
 	    		        insertAt.setChangeName("resources/uploadFiles/" + changeName);
 	    		        insertAt.setFileLevel(j + 1);
 	    		        insertAt.setFileExp(explist.get(j));
 	    		        insertAtList.add(insertAt);
 	    		 }

 	         }
 	         
 	     }
    	  

 	    //System.out.println("insertAtList(새로 넣을 첨파) : " + insertAtList);
 	    int result3 = pService.insertAddAttachment(insertAtList);
		 
		//-------------------------------------마무리--------------------------------------	  
		// result1 = 상품 정보
 	    // result2 = 첨부파일 기존 update
 	    // result3 = 첨부파일 새로운 insert
 	    
		int result = result1 + result2 + result3;
			  
		if(result > 0) {
		     session.setAttribute("alertMsg", "성공적으로 상품이 수정되었습니다.");
		     return "redirect:list.pro";
	    }else {
		     model.addAttribute("errorMsg", "상품 수정 실패!");
		     return "common/errorPage";
	    }
	   
	   
	   
  } 
   
   
   
   
   
   
   
   
   
   
   
   
   
   /** 상품 삭제 (정보:N + 첨부파일:delete)
    * 
    */
   @RequestMapping("delete.pro")
   public String deleteProduct(int productNo, Model model, HttpSession session,
                        String filePath1, String filePath2, String filePath3, String filePath4, String filePath5) {
      
      
      
      ArrayList<String> filePathList = new ArrayList<String>();

      if(!filePath1.equals("")) {
         filePathList.add(filePath1);
      }
      if(!filePath2.equals("")) {
         filePathList.add(filePath2);            
      }
      if(!filePath3.equals("")) {
         filePathList.add(filePath3);            
      }
      if(!filePath4.equals("")) {
         filePathList.add(filePath4);            
      }
      if(!filePath5.equals("")) {
         filePathList.add(filePath5);            
      }
      
      //System.out.println("filePathList" + filePathList);
      
      
      // ----------상품 [정보1 + 첨부파일5] 삭제
      // product, attachment리스트 status(N)으로
      int result = pService.deleteProduct(productNo, filePathList);
      
      if(result > 0) { // 삭제 성공 => '상품(N) + 첨부파일(delete)'
         // filePath = "resources/uploadFiles/xxxx.jpg" | ""
         // resources안에 uploadFiles안에 xxxx.jpg 파일을 지워라
    	  
    	 /* 첨부파일 찐 삭제 (일단 살려두는 걸로..)
         if(!filePath1.equals("")) {
            new File(session.getServletContext().getRealPath(filePath1)).delete();
         }
         if(!filePath2.equals("")) {
            new File(session.getServletContext().getRealPath(filePath2)).delete();
         }
         if(!filePath3.equals("")) {
            new File(session.getServletContext().getRealPath(filePath3)).delete();
         }
         if(!filePath4.equals("")) {
            new File(session.getServletContext().getRealPath(filePath4)).delete();
         }
         if(!filePath5.equals("")) {
            new File(session.getServletContext().getRealPath(filePath4)).delete();
         }
         */
    	  
         // 상품 전체 리스트 페이지 list.pro 재요청
         session.setAttribute("alertMsg", "성공적으로 상품이 삭제되었습니다.");
         return "redirect:list.pro";
      }else {
         model.addAttribute("errorMsg", "상품 삭제 실패!");
         return "common/errorPage";
         
         
      }
      
   }
   
   
   /** 상품 일시품절 (정보:R)
    * 
    */
   @RequestMapping("ready.pro")
   public String readyProduct(int productNo, Model model, HttpSession session) {
      
      int result = pService.readyProduct(productNo);
      
      if(result > 0) { // status = 'R' 성공
         session.setAttribute("alertMsg", "성공적으로 [일시품절] 처리가 되었습니다.");
         return "redirect:list.pro";
      }else {
         model.addAttribute("errorMsg", "[일시품절] 처리 실패!");
         return "common/errorPage";
      }
   }
   
   
   /** 상품 재입고 (정보:Y)
	 * 
	 */
   @RequestMapping("yes.pro")
   public String yesProduct(int productNo, Model model, HttpSession session) {
	   
	   int result = pService.yesProduct(productNo);
	   
	   if(result > 0) {
		   session.setAttribute("alertMsg", "성공적으로 [재입고] 처리가 되었습니다.");
		   return "redirect:list.pro";
	   }else {
		   model.addAttribute("errorMsg", "[재입고] 처리 실패!");
		   return "common/errorPage";
	   }
	   
   }
   
   
   /** 상품 수정 (정보1 + 첨부파일5) ---- 수정 form 에 띄워 줄 내용들 조회
	 *
	 */
   @RequestMapping("updateForm.pro")
   public String updateProductForm(int productNo, Model model) {
	   
	   // 정보1
	   Product p = pService.selectProduct(productNo);
	   model.addAttribute("p", p);
	   
	   // 첨부파일5
	   ArrayList<Attachment> alist = pService.selectAttachmentList(productNo);
	   model.addAttribute("alist", alist);
	   
	   return "product/productUpdateForm";
   }
   
   
   
   
   /** 장바구니 추가
    *
    */
   @ResponseBody
   @RequestMapping("insert.cart")
   public String ajaxInsertCart(Cart c) {
      
      System.out.println(c);
      
      int result = pService.insertCart(c);
      
      return result>0 ? "success" : "fail";
   }
   
   
   /** (단순jsp이동) 장바구니 폼
    * 
    */
   /*
   @RequestMapping("confirmForm.cart")
   public String cartConfirmForm() {
      //return "order/cartTest";
      return "order/cartConfirmForm";
   }
   */
   
   
   /** 장바구니 리스트 조회 ( + 장바구니 담긴 상품 수)
	* 
    */
   @RequestMapping("list.cart")
   public String selectCartList(String userId, Model model) {
	   //System.out.println(userId);
	   //System.out.println(productNo);
	   
	   int cartListCount = pService.selectCartListCount(userId);
	   model.addAttribute("cartListCount", cartListCount);
	   
	   ArrayList<Cart> cartlist = pService.selectCartList(userId);
	   model.addAttribute("cartlist", cartlist);
	   //System.out.println("장바구니 상품(cartlist) : " + cartlist);
	   
	   return "order/cartListForm";
	   
   }
   
   
   /** 장바구니 수량 추가
	*
	*/
   @ResponseBody
   @RequestMapping("updateAdd.quan")
   public String ajaxUpdateAddQuantity(String userId, int pno) {
	   
	   //System.out.println("add : " + userId);
	   //System.out.println("add : " + pno);
	   Cart c = new Cart();
	   c.setUserId(userId);
	   c.setProductNo(pno);
  
	   int result = pService.updateAddQuantity(c);
	   //System.out.println("추가 결과 : " + result);
	   
	   return result>0 ? "success" : "fail";
	   
   }
   
   /** 장바구니 수량 빼기
    *
    */
   @ResponseBody
   @RequestMapping("updateMinus.quan")
   public String ajaxUpdateMinusQuantity(String userId, int pno) {
	   
	   //System.out.println("add : " + userId);
	   //System.out.println("add : " + pno);
	   Cart c = new Cart();
	   c.setUserId(userId);
	   c.setProductNo(pno);
	   
	   int result = pService.updateMinusQuantity(c);
	   //System.out.println("빼기 결과 : " + result);
	   
	   return result>0 ? "success" : "fail";
	   
   }
   
   
   /** 장바구니 선택삭제
	 * 
	 */
   @ResponseBody
   @RequestMapping("delete.cart")
   public String ajaxDeleteCart(String userId, String[] productNo) {
    
       //System.out.println("장바구니 선택삭제 : " + productNo.length);
       

	   ArrayList<Cart> clist = new ArrayList<Cart>();
	
	   for(int i=0; i<productNo.length; i++) {
		   
	         Cart delCart = new Cart();
	         
	         delCart.setUserId(userId);
	         delCart.setProductNo(Integer.parseInt(productNo[i]));

	         clist.add(delCart);
	      
	    }
	    
	   //System.out.println("삭제할 clist : " + clist);
        
	   // 준비 끝........서비스로..
	   int result = pService.deleteCartProduct(clist);
    
	   return result>0 ? "success" : "fail";
 
   }
   
   
   /** 장바구니에서 주문하기용_상품 조회
	 * 
	 */
   @RequestMapping("order.cart")
   public String ajaxOrderCart(String userId, String[] productNo, Model model) {
	   
	   /*
	   for(String p: productNo) {
		   System.out.println("p" + p);
	   }
	   */
	   
	   ArrayList<Cart> clist = new ArrayList<Cart>();
		
	   for(int i=0; i<productNo.length; i++) {
		   
	         Cart orderCart = new Cart();
	         
	         orderCart.setUserId(userId);
	         orderCart.setProductNo(Integer.parseInt(productNo[i]));

	         clist.add(orderCart);
	      
	    }
    
	   // 준비 끝........서비스로..
	   ArrayList<Cart> clistOrder = pService.orderCartProduct(clist);
	   
	   /*
	   for(int i=0; i<clistOrder.size(); i++) {
		   System.out.println("주문할clist : " + clistOrder.get(i));
	   }
	   */
	   
	   model.addAttribute("clistOrder", clistOrder);
	      
	   return "order/orderForm";
	   
   }

   
   /** 상세페이지에서 주문하기용_상품 조회
	 * 
	 */
   @RequestMapping("enrollForm.order")
   public String selectOrderProductInfo(int quantity, int productNo, Model model) {
	   
	    
	   // 1) 먼저 quantity 박아!
	   model.addAttribute("quantity", quantity);
		   
	   // 2) 해당 product 정보 조회(+attachment조인)
	   Product p = pService.selectOrderProductInfo(productNo);
	   model.addAttribute("p", p);
	   
	   return "order/orderForm";
	  
   }
   
   
   //----------------------------------------- 결제 API 관련 깐뜨롤라-----------------------------------------
   //----------------------------------------- (단품)
   
   /** 단품 '주문 insert' => toss.jsp 로 이동
	 * 
	 */
   @RequestMapping("insertOrder.pro")
   public String insertOrderProduct(Orders oPro, Model model, String userId, int totalPrice, String addressMain) {
	   
	   //System.out.println("단품 왔니?");
	   //System.out.println(oPro);
	   //System.out.println(userId);
	   //System.out.println(totalPrice);
	   
	   int result = pService.insertOrderProduct(oPro);
	   
	   if(result > 0) { 
		   // DB에 단품 insert하고 토스 결제API 화면으로 (준비물:userId, totalPrice)
		   // 단품 => 긴주문번호 뒤에 붙여 담아갈 orders 객체 조회(order_no 등)
		   Orders oFinal = pService.selectOrdersInfoFinal(addressMain);
		   //System.out.println("oFinal : " + oFinal);
		   model.addAttribute("oFinal", oFinal);
		   
		   model.addAttribute("userId", userId);
		   model.addAttribute("totalPrice", totalPrice);
		   return "order/toss";
	   }else { 
		   model.addAttribute("errorMsg", "주문하기 실패!");
		   return "common/errorPage";
	   }
    }
   
   
   	/** 단품 결제API 후 '성공화면'으로..
	 *
	 */
   	@RequestMapping("success.pro")
	public String goSuccess(@RequestParam(name = "orderId") String orderId, Model model) {

	   //System.out.println("토스에서 받아 온 orderId: " + orderId);

	   // 1)주문코드번호 '2:결제완료'로 update
	   // 2_1)주문한 OrdersDetail에서 productNo, quantity 조회
   	   // 2_2)상품재고량 stock에서 주문수량 quantity 빼기 
   	   // 3)최종 주문 완료 화면에 줄 배송정보 select
	   
	   // "9a6hV9B4kXJ8QtWS9RCqa" 부분 이후의 숫자 부분을 추출 == *** 주문번호(orderNo) ***
	   String numberPart = orderId.substring(orderId.lastIndexOf("9a6hV9B4kXJ8QtWS9RCqa") + "9a6hV9B4kXJ8QtWS9RCqa".length());
	   int orderNo = Integer.parseInt(numberPart);
	  
	   // 1)
	   int result1 = pService.updateOrderCode(orderNo);
	   
	   // 2_1)
	   OrdersDetail quantityProductNo = pService.selectOrdersQuantityProductNo(orderNo);
	   //System.out.println("quantityProductNo객체" + quantityProductNo);
	  
	   // 2_2)
	   int result2 = pService.updateProductStock(quantityProductNo);
	   
	   int result = result1 * result2;
	   
	   if(result > 0) { // 3)
		   
		   Orders oDelivery = pService.selectOrdersDelivery(orderNo);
		   model.addAttribute("oDelivery", oDelivery);
	   }
	   
	   return "order/tossSuccess";
	}
   	

	/** 단품 결제API 후 '실패화면'으로..
	 *
	 */
	@RequestMapping("fail.pro")
	public String goFail() {
		return "order/tossFail";
	}
	
	
   
	//----------------------------------------- (장바구니 상품)
   
    /** 장바구니상품 '주문 insert' => toss.jsp 로 이동
	 * 
	 */
    @RequestMapping("insertOrder.cart")
    public String insertOrderCart(Orders oCart, String[] productNo, String[] quantity, Model model, String userId, int totalPrice, String addressMain) {
	   
	   //System.out.println("장바구니상품 왔니?");
	   //System.out.println(oCart);
	   /*
	   for(String p: productNo) {
		   System.out.println("pno : " + p);
	   }
	   for(String q: quantity) {
		   System.out.println("quan : " + q);
	   }
	   */
	   
	   ArrayList<OrdersDetail> odList = new ArrayList<OrdersDetail>();
	   
	   for(int i=0; i<productNo.length; i++) {
		   
		   OrdersDetail od = new OrdersDetail();
		   
		   od.setProductNo(Integer.parseInt(productNo[i]));
		   od.setQuantity(Integer.parseInt(quantity[i]));
		   
		   odList.add(od);
		   
	   }
	   
	   // 준비 끝.. 주문(1),상품(여러개) 들고 서비스로..
	   int result = pService.insertOrderCart(oCart, odList);
	   
	   if(result > 0) { 
		   // DB에 단품 insert하고 토스 결제API 화면으로 (준비물:userId, totalPrice)
		   // 단품 => 긴주문번호 뒤에 붙여 담아갈 orders 객체 조회(order_no 등)
		   Orders oFinal = pService.selectOrdersDetailInfoFinal(addressMain);
		   model.addAttribute("oFinal", oFinal);
		   
		   model.addAttribute("userId", userId);
		   model.addAttribute("totalPrice", totalPrice);
		   return "order/tossCart";
	   }else { 
		   model.addAttribute("errorMsg", "주문하기 실패!");
		   return "common/errorPage";
	   }
	   
    }
    
    
    
    
    
    /** 장바구니상품 결제API 후 '성공화면'으로..
	 *
	 */
  	@RequestMapping("success.cart")
	public String goSuccessCart(@RequestParam(name = "orderId") String orderId, Model model) {

	   //System.out.println("토스에서 받아 온 orderId: " + orderId);

	   // 1)주문코드번호 '2:결제완료'로 update			----------------단품꺼 같이써 (updateOrderCode)
	   // 2)최종 주문 완료 화면에 줄 배송정보 select	----------------단품꺼 같이써 (selectOrdersDelivery)
  	   // 3_1)주문상세에서 주문번호 들고 주문한 productNo들 '조회'  
  	   // 3_2)주문에서 	주문번호 들고 주문한 userId '조회'
  	   // 3_3)빈배열 ArrayList<OrdersDetail> [] 만들고
  	   // 3_4)객체 OrdersDetail (vo userId추가한)에 userId, productNo, orderNo 들 set하고
  	   // 3_5)빈배열에 add객체들
  	   // 3)준비 끝.. list들고 장바구니 내역가서 '삭제'
  	   // 4_1)주문한 productNo, quantity 조회
  	   // 4_2)재고량 - 주문수량 update
	   
	   // "9a6hV9B4kXJ8QtWS9RCqa" 부분 이후의 숫자 부분을 추출 == *** 주문번호(orderNo) ***
	   String numberPart = orderId.substring(orderId.lastIndexOf("9a6hV9B4kXJ8QtWS9RCqa") + "9a6hV9B4kXJ8QtWS9RCqa".length());
	   int orderNo = Integer.parseInt(numberPart);
	  
	   // 1)
	   int result1 = pService.updateOrderCode(orderNo);
	   
	   // 3_1)'조회' : 이 리스트 속 객체마다 order_no, product_no 있음
	   ArrayList<OrdersDetail> ordersDetailPnoList = pService.selectOrdersDetailPnoList(orderNo);
	   // 3_2)'조회' : userId 
	   String userId = pService.selectUserId(orderNo);
	   
	   // 3_3,4,5)
	   ArrayList<OrdersDetail> delList = new ArrayList<OrdersDetail>();	
	   
	   for(int i=0; i<ordersDetailPnoList.size(); i++) {
		   
		   // 새로운 OrdersDetail 객체 생성
		   OrdersDetail delOD = new OrdersDetail();
		   delOD.setOrderNo(orderNo);
		   delOD.setProductNo(ordersDetailPnoList.get(i).getProductNo());
		   delOD.setUserId(userId);
		   
		   delList.add(delOD);
		   
	   }
	   
	   //System.out.println("주문 후 삭제할 장바구니 리스트 : " + delList);
	   
	   // 3) '삭제'
	   int result3 = pService.deleteCartAfterOrder(delList);
	   
	   
	   // 4_1)
	   ArrayList<OrdersDetail> ordersDetailPnoQuanList = pService.selectOrdersDetailPnoQuanList(orderNo);
	   //System.out.println("주문후재고량변경리스트 : " + ordersDetailPnoQuanList);
	   
	   // 4_2)
	   int result4 = pService.updateProductStockCart(ordersDetailPnoQuanList);
	   
	   int result = result1 * result3 * result4;
	   
	   if(result > 0) { // 2)
		   
		   Orders oDelivery = pService.selectOrdersDelivery(orderNo);
		   model.addAttribute("oDelivery", oDelivery);
	   }
	   
	   return "order/tossSuccess";
	}
  	

	/** 장바구니상품 결제API 후 '실패화면'으로..
	 *
	 */
	@RequestMapping("fail.cart")
	public String goFailCart() {
		return "order/tossFail";
	}
   
   
   
	//-------------------------------댓글(후기review)-------------------------------
	
	/** 댓글 리스트 전체 조회 (ajax)
	 *
	 */
	@ResponseBody
	@RequestMapping(value="rlist.pro", produces="application/json; charset=utf-8")
	public String ajaxSelectReviewList(int productNo) {
		ArrayList<Review> rlist = pService.selectReviewList(productNo);
		return new Gson().toJson(rlist);
	}
   
	/** 댓글 작성 (ajax)
	 *
	 */
	@ResponseBody
	@RequestMapping(value="rinsert.pro")
	public String ajaxInsertReview(Review r) {
		//System.out.println("r(등록) : " + r);
		int result = pService.insertReview(r);
		return result>0 ? "success" : "fail";
	}
	
	/** 댓글 삭제 (ajax)
	 * 
	 */
	@ResponseBody
	@RequestMapping(value="rdelete.pro")
	public String ajaxDeleteReview(Review r) {
		//System.out.println("r(삭제) : " + r);
		int result = pService.deleteReview(r);
		return result>0 ? "success" : "fail";
	}
	 
	
	
    /** 장바구니 상품 중복 검사 (ajax)
	 *
	 */
	@ResponseBody
    @RequestMapping("duplication.cart")
    public String selectAddCartDuplication(Cart c) {
	    int result = pService.selectAddCartDuplication(c);
	    //System.out.println("장바구니 상품 중복 검사 result : " + result);

	    return result>0 ? "cartO" : "cartX";
    }
	
	

	
	/** 먹비티아이 단순 jsp 이동
	 *
	 */
	@RequestMapping("test.eat")
	public String testEatForm() {
		return "product/testEatForm";
	}
	
	/** 먹비티아이 테스트 결과 값 처리(inner or outer)
	 *
	 */
	@RequestMapping("testResult.eat")
	public String testEatResult(Model model, String tester, String one, String two, String three, String four, String five, String six, String seven) {
	
		ArrayList<String> resultArr = new ArrayList<String>();
		
	    resultArr.add(one);
	    resultArr.add(two);
	    resultArr.add(three);
	    resultArr.add(four);
	    resultArr.add(five);
	    resultArr.add(six);
	    resultArr.add(seven);

	    //System.out.println(resultArr);

	    int yCount = 0;
	    for (String value : resultArr) {	// value : Y or N
	        if ("Y".equals(value)) {
	            yCount++;
	        }
	    }

	    //System.out.println("Y의 개수: " + yCount);

	    if (yCount >= 4) {
	    	String inner = "inner";
	        model.addAttribute("inner", inner);
	        model.addAttribute("tester", tester);
	    }else {
	    	String outer = "outer";
	        model.addAttribute("outer", outer);
	        model.addAttribute("tester", tester);
	    }

	    return "product/testEatResultView";
		    
	}
	
	
   
   
}