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
	private String aId;
	private String qTitle;
	private String qContent;
	private String aContent;
	private String qStatus;
	private String aStatus;
	private String qDate;
	private String aDate;

}
