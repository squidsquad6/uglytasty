package com.kh.uglytasty.subscribe.model.vo;

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
public class Subscribe {
	
	private String userId;
	private String startDate;
	private String endDate;
	private String boxSize;
	private String term;
	private String status;
	private String dislike;
	

}

@NoArgsConstructor   // 기본 생성자
@AllArgsConstructor   // 전체 매개변수 생성자
@Setter            // setter 메소드
@Getter            // getter 메소드
@ToString         // toString 메소드
public class Subscribe {
   
   private String userId;
   private String startDate;
   private String endDate;
   private String boxSize;
   private String term;
   private String status;
   private String dislike;
   private String address;
   private String detailAddress;
   

}

