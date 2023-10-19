package com.kh.uglytasty.member.model.vo;

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
public class Member {
   
    private String userId;
    private String userPwd;
    private String userName;
    private String email;
    private String phone;
    private String addressBase;
    private String addressDetail;
    private String status;
    private String subscribe;
    private String provider;
    private String accessToken;
    private String refreshToken;

}