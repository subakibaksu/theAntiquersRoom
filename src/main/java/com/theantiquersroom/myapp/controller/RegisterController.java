package com.theantiquersroom.myapp.controller;

import java.text.ParseException;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;

import com.theantiquersroom.myapp.domain.UserDTO;
import com.theantiquersroom.myapp.service.UserService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@Controller
public class RegisterController {

		
	@Setter(onMethod_= {@Autowired})
    private UserService service;
	

    @GetMapping("/register")
    public void register() {	//회원가입 화면 요청
        log.debug("register() invoked.");

    } //register

    @PostMapping("/registerCheck")
    @ResponseStatus(HttpStatus.CREATED)
    public String register(UserDTO user) { //회원가입 서비스 수행, 저장
        log.debug("register({}) invoked.", user);

        this.service.registerUser(user);
        return "/";

    } //registerCheck
    
    @PostMapping("/checkId")
    public @ResponseBody Map<Object, Object> checkId(@RequestBody Map<Object,Object> map) {	//아이디 중복검사
        log.debug("userId({}) invoked.", map.get("userId"));
        
        boolean checkid = this.service.checkId((String)map.get("userId")); // NullPointerException 발생
        log.info("\t+ checkid: {}", checkid);
        
        Map<Object, Object> resultMap = new HashMap<Object,Object>();
        
        resultMap.put("emailCheck", checkid);
        log.debug(resultMap.get("emailCheck"));
        
        log.info("\t+ resultMap: {}", resultMap);
        return resultMap;
        
    } //checkId

    @PostMapping("/checkNickName")
    public @ResponseBody Map<Object, Object> checkNickName(@RequestBody Map<Object, Object> map) {	//닉네임 중복검사
        log.debug("confirmNickName({}) invoked.", map.get("nickName"));
        
        boolean checknickname = this.service.checkNickName((String)map.get("nickName"));
        
        Map<Object, Object> resultMap = new HashMap<Object, Object>();
                
        resultMap.put("nicknameCheck", checknickname);        
        return resultMap;
    } //checkNickName

    @PostMapping("/checkPhone")
    public @ResponseBody Map<Object, Object> checkPhone(@RequestBody Map<Object, Object> map) {	//연락처 중복검사
        log.debug("checkPhone() invoked.");
        
        boolean checkphone = this.service.checkPhone((String)map.get("phone"));

        Map<Object, Object> resultMap = new HashMap<Object, Object>();
        
        resultMap.put("phonenumberCheck", checkphone);
        log.info("\t+ resultMap: {}", resultMap);
        
        return resultMap;
        
    } //checkPhone

    @PostMapping("/sendEmail")
    public @ResponseBody Map<Object,Object> sendEmail(@RequestBody Map<String,String> userMap) throws Exception {    //입력받은 이메일로 인증코드 발송

        log.debug("confirmEmail() invoked. userid : {}",userMap.get("userId"));

        //Ajax의 결과값을 Json으로 받기 위해 Map객체를 생성
        Map<Object,Object> map = new HashMap<Object, Object>();

        boolean mailSendResult = service.sendEmail(userMap.get("userId"));
        log.debug("result : {}", mailSendResult);
        map.put("check",mailSendResult);

        return map;
    } // sendEmail

    @PostMapping("/confirmEmail")
    public @ResponseBody Map<Object, Object> confirmEmail(
            @RequestBody Map<String, String> auth) throws ParseException {    //DB인증코드 입력받은 인증코드를 비교

        log.debug("confirmEmail() invoked. userId : {} auth : {}" ,auth.get("userId"));

        //Ajax의 결과값을 Json으로 받기 위해 Map객체를 생성
        Map<Object, Object> map = new HashMap<Object, Object>();

        boolean confirmResult = service.confirmEmail(auth.get("userId") ,auth.get("auth"));
        log.debug("confirmResult : {}", confirmResult);
        map.put("confirmResult",confirmResult);

        return map;
    } // confirmEmail
	
	
	
}
