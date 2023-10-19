package com.kh.uglytasty.common.model.vo;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class Payment {
	
	
	private String payType;
	
	private String amount;
	
	private String orderName;
	private String orderId;
	private String yourSuccessUrl;
	private String yourFailUrl;
	private String customerName;
	
	private String failReason;
	private String cancelYN;
	private String cancelReason;
	private String createdAt;
	

}
