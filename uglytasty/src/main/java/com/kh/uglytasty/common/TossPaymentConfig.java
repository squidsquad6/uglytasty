package com.kh.uglytasty.common;

public class TossPaymentConfig {
	
	private String testClientApiKey = "test_ck_Gv6LjeKD8aERylDa6bx8wYxAdXy1";
	private String testSecretKey = "test_sk_LkKEypNArWQzoOoJM9j3lmeaxYG5";
	
	private String successUrl = "http://localhost:8008/api/v1/toss/success";
	private String failUrl = "http://localhost:8008/api/v1/toss/fail";
	
	public static final String TOSSURL = "https://api.tosspayments.com/v1/payments/";

}
