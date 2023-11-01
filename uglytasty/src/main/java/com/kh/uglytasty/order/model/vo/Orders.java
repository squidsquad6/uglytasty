package com.kh.uglytasty.order.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@NoArgsConstructor   // 기본 생성자
@AllArgsConstructor   // 전체 매개변수 생성자
@Setter            // setter 메소드
@Getter            // getter 메소드
@ToString         // toString 메소드
public class Orders {

   private int orderNo;
   private String userId;
   private int productNo;
   private String orderDate;
   private int orderCode;
   private String trackingNo;      // 예) TIDJLSJFIEJLWKJFSD12345(문자열)
   private String addressMain;
   private String addressDetail;
   private String receiver;
   private String receiverPhone;
   private String deliveryMemo;
   private int deliveryFee;
   private int totalPrice;
   
   
   private int quantity;
   
   private String products;


public Orders(int orderNo, String userId, String orderDate, int orderCode, String trackingNo,
		String addressMain, String addressDetail, String receiver, String receiverPhone, String deliveryMemo,
		int deliveryFee, int totalPrice) {
	super();
	this.orderNo = orderNo;
	this.userId = userId;
	this.orderDate = orderDate;
	this.orderCode = orderCode;
	this.trackingNo = trackingNo;
	this.addressMain = addressMain;
	this.addressDetail = addressDetail;
	this.receiver = receiver;
	this.receiverPhone = receiverPhone;
	this.deliveryMemo = deliveryMemo;
	this.deliveryFee = deliveryFee;
	this.totalPrice = totalPrice;
	

}
   
   
   
   
   
}