package com.theantiquersroom.myapp.controller;

import java.util.HashMap;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Log4j2
@NoArgsConstructor

@Controller
public class ApiKakaoController {
	
	//카카오 로그인창 호출
	@RequestMapping("/login/getKakaoAuthUrl")
    public @ResponseBody String getKakaoAuthUrl(HttpServletRequest request) {	
        log.debug("getKakaoAuthUrl() invoked.");
        
        String REST_API_KEY = "12a4433b06d9de4acedcd972fa6a3fa9";
        String REDIRECT_URI = "http://localhost:8090/";
        
        String reqUrl = 
        		"https://kauth.kakao.com/oauth/authorize?response_type=code&client_id="
        		+ REST_API_KEY
        		+ "&redirect_uri="
        		+ REDIRECT_URI;
        
        return reqUrl;
    } //getKakaoAuthUrl

}  //end class
