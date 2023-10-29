import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;

import com.kh.uglytasty.product.model.vo.Attachment;
import com.kh.uglytasty.product.model.vo.Product;

public class memo {

	/*-------메모장-------*/
	
	
	
	/*
	 
	// update --------------------------------------------------------------
	 
	@RequestMapping("insert.bo")
	public String insertBoard(Board b, MultipartFile upfile, Model model, HttpSession session) {
		
		// 전달된 파일이 있을 경우 => 파일명 수정 작업 후 서버 업로드 => 원본명, 서버업로드된 경로를 b에 이어서 담기
		if(!upfile.getOriginalFilename().equals("")) {
			
			String changeName = saveFile(upfile, session);
			
			b.setOriginName(upfile.getOriginalFilename());
			b.setChangeName("resources/uploadFiles/" + changeName);		// changeName : resources/uploadFiles/2023101106080716329.jpg
			
		}
		
		// 넘어온 첨부파일 있을 경우 b : 제목, 작성자, 내용, 파일원본명, 파일저장경로
		// 넘어온 첨부파일 없을 경우 b : 제목, 작성자, 내용
		
		int result = bService.insertBoard(b);
		
		if(result > 0) { // 성공 => 게시글 리스트 페이지(list.bo url재요청)
			session.setAttribute("alertMsg", "성공적으로 게시글이 등록되었습니다.");
			return "redirect:list.bo";
		}else { // 실패 => 에러페이지 포워딩
			model.addAttribute("errorMsg", "게시글 등록 실패!");
			return "common/errorPage";
		}
		
		
	}
	
	

	public String saveFile(MultipartFile upfile, HttpSession session) {
		String originName = upfile.getOriginalFilename();	// "flower.png"
		
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
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
		
	}
	
	
	
	
	// update --------------------------------------------------------------
	
	@RequestMapping("update.bo")
	public String updateBoard(@ModelAttribute Board b, MultipartFile reupfile, Model model, HttpSession session) { // 글 주렁주렁, 첨부파일
		
		// 새로 넘어온 첨부파일이 '있'을 경우
		if(!reupfile.getOriginalFilename().equals("")) {
			
			// 기존에 첨부파일이 있었을 경우 => 기존의 첨부파일 지우기
			if(b.getOriginName() != null) {
				new File(session.getServletContext().getRealPath(b.getChangeName())).delete();
			}
			
			// 새로 넘어온 첨부파일 서버 업로드 시키기 (위에 saveFile 만들어놓은거 호출 : 새로 이름 바꿔서 업로드해줌)
			String changeName = saveFile(reupfile, session);
			
			// b에 새로 넘어온 첨부파일에 대한 원본명, 저장경로 담기
			b.setOriginName(reupfile.getOriginalFilename());
			b.setChangeName("resources/uploadFiles/" + changeName);
		}
		

		int result = bService.updateBoard(b);
		
		if(result > 0) { // 수정 성공 => 상세페이지(detail.bo) + bno=? 가지고 재요청
			session.setAttribute("alertMsg", "성공적으로 게시글이 수정되었습니다.");
			return "redirect:detail.bo?bno=" + b.getBoardNo();
		}else { // 수정 실패 => 포워딩
			model.addAttribute("errorMsg", "게시글 수정 실패!");
			return "common/errorPage";
		}
		
	}
	
	
	
	*/
	
	
	/** 상품등록 (정보1 + 첨부파일5)
	    * 
	    */
	/*
	   @RequestMapping(value="insert.pro")
	   public String insertProduct(Product p, Attachment at, MultipartFile[] upfile, Model model, HttpSession session, 
	                        String fileExp1, String fileExp2, String fileExp3, String fileExp4, String fileExp5) { 
	      
		  // 공부용
	      for(int i=0; i<upfile.length; i++) {
	         System.out.println(upfile[i]);
	      }
	      
	      // 상품 설명이 없을때 null값 들어가지 않도록 하기 위한 작업
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
	      
	      //System.out.println("explist" + explist);
	      
	      
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
	
	*/
	
	
	
	
	
	
	
	
}
