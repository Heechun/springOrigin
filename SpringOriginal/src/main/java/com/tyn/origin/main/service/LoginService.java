package com.tyn.origin.main.service;

import java.util.HashMap;

public interface LoginService {

	HashMap<String, String> naverRequestUserInfo(String token_type, String access_token);

	HashMap<String, String> getNaverRequestKey(String state, String code, String naverClientId,
			String naverClientSecret);

	HashMap<String, String> makeNaverRequestStatement(String naverClientId);

	String generateState();

}
