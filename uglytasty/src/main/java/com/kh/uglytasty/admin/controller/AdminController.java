package com.kh.uglytasty.admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletResponse;

import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.gson.Gson;
import com.kh.uglytasty.admin.model.service.AdminServiceImpl;
import com.kh.uglytasty.common.model.vo.PageInfo;
import com.kh.uglytasty.common.template.Pagination;
import com.kh.uglytasty.member.model.vo.Member;
import com.kh.uglytasty.order.model.vo.Orders;
import com.kh.uglytasty.product.model.vo.Product;
import com.kh.uglytasty.qa.model.vo.QA;
import com.kh.uglytasty.subscribe.model.vo.Subscribe;

@Controller
public class AdminController {

	@Autowired
	private AdminServiceImpl aService;
	
	@RequestMapping("qa.ad")
	public String selectQAList(@RequestParam(value="cpage", defaultValue = "1") int currentPage, Model model) {
		
		int listCount = aService.selectQAListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<QA> list = aService.selectQAList(pi);
		
		model.addAttribute("list", list).addAttribute("pi",pi);
		
		
		
		return "admin/adminQA";
	}
	
	@RequestMapping("order.ad")
	public String selectOrderList(@RequestParam(value="cpage", defaultValue = "1") int currentPage,Model model) {
		
		int listCount = aService.selectOrderListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		
		ArrayList<Orders> list =   aService.selectOrderList(pi);
		
		
		
		model.addAttribute("list", list).addAttribute("pi",pi);
		
		
		return "admin/adminOrder";
	}
	
	@RequestMapping("member.ad")
	public String selectMemberList(@RequestParam(value="cpage", defaultValue = "1") int currentPage,Model model) {
		int listCount = aService.selectMemberListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		
		ArrayList<Member> list =   aService.selectMemberList(pi);
		
		
		
		model.addAttribute("list", list).addAttribute("pi",pi);
	
		return "admin/admin";
	}
	
	@RequestMapping("product.ad")
	public String selectProductList(Model model) {
		int listCount = aService.selectProductListCount();
		
		ArrayList<Product> list = aService.selectProductList();
		
		model.addAttribute("list", list);
		
		
		
		return "admin/adminProduct";
	}
	
	@RequestMapping("subscribe.ad")
	public String selectSubscribeList(@RequestParam(value="cpage", defaultValue = "1") int currentPage,Model model) {
		int listCount = aService.selectSubscribeCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		
		ArrayList<Subscribe> list =   aService.selectSubscribeList(pi);
		
		
		
		model.addAttribute("list", list).addAttribute("pi",pi);
		
		return "admin/adminSubscribe";
	}
	
	@ResponseBody
	@RequestMapping(value="updateMember.ad", produces="application/json; charset=UTF-8")
	public String updateAdminMember(String userId,String userPwd,String userName, String phone, String email, String addressBase, String addressDetail, String status, String subscribe, String provider, String accessToken, String refreshToken) {
		
		Member b = new Member(userId, userPwd, userName, email, phone, addressBase, addressDetail, status, subscribe, provider, accessToken, refreshToken);
		
		
		
		int result = aService.updateAdminMember(b);
		
		
		
		return new Gson().toJson(b);
		
		
	}
	
	@ResponseBody
	@RequestMapping(value="updateProduct.ad", produces="application/json; charset=utf-8")
	public String updateAdminProduct(int productNo, String productName, int price, int sale, String explanation, String location, String productionDate, int stock, String status, int count, String enrollDate) {
		
		Product b = new Product(productNo, productName, price, sale, explanation, location, productionDate, stock, status, count, enrollDate);
		
		int result = aService.updateAdminProduct(b);
		
		return new Gson().toJson(b);
	}
	
	@ResponseBody
	@RequestMapping(value= "updateOrder.ad", produces="application/json; charset=UTF-8")
	public String updateAdminOrder(int orderNo,String userId, int productNo, int orderCode, String orderDate, String trackingNo, String addressMain, String addressDetail, String receiver, String receiverPhone, String deliveryMemo, int deliveryFee, int totalPrice) {
		
		Orders b = new Orders(orderNo, userId, productNo, orderDate, orderCode, trackingNo, addressMain, addressDetail, receiver, receiverPhone, deliveryMemo, deliveryFee, totalPrice);
		
		
		
		int result = aService.updateAdminOrder(b);
		
		return new Gson().toJson(b);
		
	}
	
	@ResponseBody
	@RequestMapping(value="updateSubscribe.ad", produces="application/json; charset=UTF-8")
	public String updateAdminSubscribe(String userId, String startDate, String endDate, String boxSize, String term, String status, String dislike, String address, String detailAddress) {
		
		Subscribe b = new Subscribe(userId, startDate, endDate, boxSize, term, status, dislike, address, detailAddress);
		
		int result = aService.updateAdminSubscribe(b);
		
		return new Gson().toJson(b);
		
	}
	
	@ResponseBody
	@RequestMapping(value="updateQA.ad", produces="application/json; charset=UTF-8")
	public String updateAdminQA(int qaNo, String qaCategory, String userId, String answerId, String qaTitle, String qaContent, String answerContent, String qaStatus, String answerStatus, String qaDate, String answerDate) {
		
		QA b = new QA(qaNo, qaCategory, userId, answerId, qaTitle, qaContent, answerContent, qaStatus, answerStatus, qaDate, answerDate);
		
		int result = aService.updateAdminQA(b);
		
		
		return new Gson().toJson(b);
	}
	
	
	@RequestMapping("excel.ad")
	public void excelDownload(HttpServletResponse response) throws IOException{
		  	Workbook wb = new XSSFWorkbook();
	        Sheet sheet = wb.createSheet("단품 관리");
	        

	        Row headerRow = sheet.createRow(0);
	        headerRow.createCell(0).setCellValue("상품번호");
	        headerRow.createCell(1).setCellValue("상품명");
	        headerRow.createCell(2).setCellValue("가격");
	        headerRow.createCell(3).setCellValue("할인율");
	        headerRow.createCell(4).setCellValue("설명");
	        headerRow.createCell(5).setCellValue("생산지");
	        headerRow.createCell(6).setCellValue("생산일자");
	        headerRow.createCell(7).setCellValue("재고량");
	        headerRow.createCell(8).setCellValue("상품상태");
	        headerRow.createCell(9).setCellValue("조회수");
	        headerRow.createCell(10).setCellValue("작성일");

	        List<Product> products = aService.selectProductList();
	        int rowNum = 1;
	        for (Product product : products) {
	            Row dataRow = sheet.createRow(rowNum++);
	            dataRow.createCell(0).setCellValue(product.getProductNo());
	            dataRow.createCell(1).setCellValue(product.getProductName());
	            dataRow.createCell(2).setCellValue(product.getPrice());
	            dataRow.createCell(3).setCellValue(product.getSale());
	            dataRow.createCell(4).setCellValue(product.getExplanation());
	            dataRow.createCell(5).setCellValue(product.getLocation());
	            dataRow.createCell(6).setCellValue(product.getProductionDate());
	            dataRow.createCell(7).setCellValue(product.getStock());
	            dataRow.createCell(8).setCellValue(product.getStatus());
	            dataRow.createCell(9).setCellValue(product.getCount());
	            dataRow.createCell(10).setCellValue(product.getEnrollDate());
	        }

	       
	        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
	        response.setHeader("Content-Disposition", "attachment;filename=products.xlsx");

	        
	        wb.write(response.getOutputStream());
	        wb.close();
	}
	
	@RequestMapping("uploadExcel.ad")
	public String uploadExcel(@RequestParam("file") MultipartFile file, RedirectAttributes redirectAttributes) {
		
		if (file.isEmpty()) {
            redirectAttributes.addFlashAttribute("errorMsg", "파일을 업로드 해주세요");
            return "redirect:/product.ad";
        }
		try {
		Workbook workbook = new XSSFWorkbook(file.getInputStream());
		Sheet sheet = workbook.getSheetAt(0);
		
		for (int i = 1; i <= sheet.getLastRowNum(); i++) {
			Row row = sheet.getRow(i);
			int productNo = (int) row.getCell(0).getNumericCellValue();
			String productName = row.getCell(1).getStringCellValue();
			int price = (int) row.getCell(2).getNumericCellValue();
			int sale = (int) row.getCell(3).getNumericCellValue();
			String explanation = row.getCell(4).getStringCellValue();
			String location = row.getCell(5).getStringCellValue();
			String productionDate = row.getCell(6).getStringCellValue();
			int stock = (int) row.getCell(7).getNumericCellValue();
			String status = row.getCell(8).getStringCellValue();
			int count = (int) row.getCell(9).getNumericCellValue();
			String enrollDate = row.getCell(10).getStringCellValue();

			
			Product b = new Product(productNo, productName, price, sale, explanation, location, productionDate, stock, status, count, enrollDate);
					
			aService.updateAdminProduct(b);
			
		}
		
		 workbook.close();

         redirectAttributes.addFlashAttribute("errorMsg", "Excel 파일의 업로드와 DB 업데이트가 성공적으로 끝났습니다.");
		
		
		}catch(Exception e) {
			e.printStackTrace();
			redirectAttributes.addFlashAttribute("errorMsg", "에러");
		}
		
		return "redirect:/product.ad";
		
		
		
		
	}
	
	
	
	
	
}
