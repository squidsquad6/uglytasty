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
public class Recipe {
	
	private int recipeNo;
	private String recipeWriter;
	private String recipeTitle;
	private String recipeOriginName;
	private String recipeChangeName; // "resources/uploadFiles/xxxx.jpg"
	private String recipeExplanation;
	private String recipeContent;
	private int count;
	private String difficulty;
	private String time;
	private String recipeDate;
	private String status;

}
