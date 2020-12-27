package com.beer.macSim.member.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.beer.macSim.member.model.service.KakaoService;

@Controller
public class KakaoController {

	 @Autowired
	 private KakaoService kakaoService;
	 
	 /*
	 @RequestMapping("/kakaologin.do")
	 public String home(@RequestParam(value = "code", required = false) String code) throws Exception{
        System.out.println("#########" + code);
        String access_Token = kakaoService.getAccessToken(code);
        System.out.println("###access_Token#### : " + access_Token);
        return "main";
         
	 }*/
	 
	 /*
	 @RequestMapping(value="/kakaologin.do")
	 public String login(@RequestParam("code") String code, HttpSession session) {
	     String access_Token = kakaoService.getAccessToken(code);
	     HashMap<String, Object> userInfo =  kakaoService.getUserInfo(access_Token);
	     System.out.println("login Controller : " + userInfo);
	     
	     //    클라이언트의 이메일이 존재할 때 세션에 해당 이메일과 토큰 등록
	     if (userInfo.get("email") != null) {
	         session.setAttribute("userId", userInfo.get("email"));
	         session.setAttribute("access_Token", access_Token);
	     }
	     session.setAttribute("userInfo", userInfo);
	     
	     return "main";
	 }
	*/
}
