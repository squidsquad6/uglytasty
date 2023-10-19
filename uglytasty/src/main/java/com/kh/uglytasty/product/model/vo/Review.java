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
public class Review {
	
	private int reviewNo;
	private int refProductNo;
	private String userId;
	private String content;
	private String reviewDate;
	private String status;
}
