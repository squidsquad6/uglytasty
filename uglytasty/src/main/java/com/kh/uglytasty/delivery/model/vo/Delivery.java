package com.kh.uglytasty.delivery.model.vo;

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
public class Delivery {
	
	private int transactionNo;
	private String userId;
	private String deliveryAddress;
	private String detailAddress;
	private String receiver;
	private int deliveryFee;
	private String deliveryMemo;
	private int postNo;
	private String phone;

}
