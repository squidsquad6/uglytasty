package com.kh.uglytasty.qa.model.vo;

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
public class QA {
	
	private int qaNo;
	private String qaCategory;
	private String userId;

	private String answerId;
	private String qaTitle;
	private String qaContent;
	private String answerContent;
	private String qaStatus;
	private String answerStatus;
	private String qaDate;
	private String answerDate;




}
