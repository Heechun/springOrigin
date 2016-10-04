package com.tyn.origin.main.service;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONObject;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.tyn.origin.main.dao.MainDao;

@Service("mainService")
public class MainServiceImpl implements MainService {
	@Inject
	private MainDao mainDao;
	ModelAndView mav;
	
	@Override
	public ModelAndView getMain() {
		mav = new ModelAndView();
		
		mav.setViewName("main");
		return mav;
	}
	
	@Override
	public ModelAndView intro() {
		mav = new ModelAndView();
		
		mav.setViewName("intro");
		return mav;
	}

	@Override
	public void loginCheck(String inputId, String inputPassword, HttpServletResponse res) {
		
		int loginStatus = 0;
		String DBPassword = mainDao.getPassword(inputId);
		System.out.println("inputpassword :" + inputPassword + "db : " + DBPassword);
		if(DBPassword == null || DBPassword == ""){
			loginStatus = 0;//존재하지 않는 아이디
		}
		else if(DBPassword.equals(inputPassword)){
			loginStatus = 1;//로그인 완료
		}
		else{
			loginStatus = 2;//비밀번호 오류
		}
		
		HashMap<String, Integer> hm = new HashMap<>();
		hm.put("loginStatus", loginStatus);
		JSONObject jb = new JSONObject(hm);
		
		PrintWriter pw;
		try {
			pw = res.getWriter();
			pw.println(jb.toString());
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	
	
}
