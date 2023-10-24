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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.google.gson.Gson;
import com.kh.uglytasty.order.model.vo.Cart;
import com.kh.uglytasty.order.model.vo.Orders;
import com.kh.uglytasty.product.model.service.ProductServiceImpl;
import com.kh.uglytasty.product.model.vo.Attachment;
import com.kh.uglytasty.product.model.vo.Product;

/**
 * @author wow59
 *
 */
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
         
         System.out.println("상품의 상세정보(plist) : " + plist);
         
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


   /**  현재 넘어온 첨부파일 그 자체를 서버의 폴더에 저장시키는 역할
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
      
      System.out.println("filePathList" + filePathList);
      
      
      // ----------상품 [정보1 + 첨부파일5] 삭제
      int result = pService.deleteProduct(productNo, filePathList);
      
      
      if(result > 0) { // 삭제 성공 => '상품(N) + 첨부파일(delete)'
         // filePath = "resources/uploadFiles/xxxx.jpg" | ""
         // resources안에 uploadFiles안에 xxxx.jpg 파일을 지워라
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
         
         // 상품 전체 리스트 페이지 list.pro 재요청
         session.setAttribute("alertMsg", "성공적으로 상품이 삭제되었습니다.");
         return "redirect:list.pro";
      }else {
         model.addAttribute("errorMsg", "상품 삭제 실패!");
         return "common/errorPage";
      }
      
   }
   
   
   /** 상품 소진 (정보:R)
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
   
   
   
   /** 장바구니 추가
    *
    */
   @ResponseBody
   @RequestMapping("insert.cart")
   public String ajaxInsertCart(Cart c) {
      
      System.out.println(c);
      
      int result = pService.insertCart(c);
      
      System.out.println("result : " + result);
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
	   System.out.println("장바구니 상품(cartlist) : " + cartlist);
	   
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
    
       System.out.println("장바구니 선택삭제 : " + productNo.length);
       

	   ArrayList<Cart> clist = new ArrayList<Cart>();
	
	   for(int i=0; i<productNo.length; i++) {
		   
	         Cart delCart = new Cart();
	         
	         delCart.setUserId(userId);
	         delCart.setProductNo(Integer.parseInt(productNo[i]));

	         clist.add(delCart);
	      
	    }
	    
	   System.out.println("clist : " + clist);
        
	   // 준비 끝........서비스로..
	   int result = pService.deleteCartProduct(clist);
    
	   return result>0 ? "success" : "fail";
 
   }

   
   @RequestMapping("enrollForm.order")
   public String selectOrderProductInfo(int quantity, int productNo, Model model) {
	   
	    
	   // 1) 먼저 quantity 박아!
	   model.addAttribute("quantity", quantity);
		   
	   // 2) 해당 product 정보 조회(+attachment조인)
	   Product p = pService.selectOrderProductInfo(productNo);
	   model.addAttribute("p", p);
	   
	   return "order/orderForm";
	  
   }
   
   
   
}