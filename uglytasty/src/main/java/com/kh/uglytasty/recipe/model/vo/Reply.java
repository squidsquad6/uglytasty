package com.kh.uglytasty.recipe.model.vo;

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
public class Reply {

	private int replyNo; 
	private int refRecipeNo;
	private String userId;
	private String replyContent;
	private String replyDate;
	private String status;
}
