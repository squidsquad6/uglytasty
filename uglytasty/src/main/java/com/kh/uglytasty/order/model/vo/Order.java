package com.kh.uglytasty.order.model.vo;

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
public class Order {
	
	private int orderNo;
	private String userId;
	private int productNo;
	private int orderCode;
	private int orderQuantity;
	private String orderDate;
	private int totalPrice;

}
