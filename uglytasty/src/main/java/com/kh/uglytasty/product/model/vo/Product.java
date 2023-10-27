package com.kh.uglytasty.product.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor	// 기본 생성자
@AllArgsConstructor	// 전체 매개변수 생성자
@Setter				// setter 메소드
@Getter				// getter 메소드
@ToString			// toString 메소드
public class Product {
	
	private int productNo;
	private String productName;
	private int price;
	private int sale;
	private String explanation;
	private String location;
	private String productionDate;
	private int stock;
	private String status;
	private int count;
	private String enrollDate;

	private int fileNo;
	private int refProductNo;
	private String originName;
	private String changeName;
	private String fileExp;
	
	

	private int fileLevel;
	
	private int quantity;

	private int salePrice;
	private int totalPrice;
	private int deliveryIncludePrice;
	
	
	public Product(int productNo, String productName, int price, int sale, String explanation, String location,
			String productionDate, int stock, String status, int count, String enrollDate) {
		super();
		this.productNo = productNo;
		this.productName = productName;
		this.price = price;
		this.sale = sale;
		this.explanation = explanation;
		this.location = location;
		this.productionDate = productionDate;
		this.stock = stock;
		this.status = status;
		this.count = count;
		this.enrollDate = enrollDate;
	}
	


}