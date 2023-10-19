package com.kh.uglytasty.notice.model.vo;

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
public class Notice {
	
	private int noticeNo;
	private String userId;
	private String userName;
	private String noticeTitle;
	private String noticeContent;
	private String status;
	private String upfix;
	private String upFix;


}
