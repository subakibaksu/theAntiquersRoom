package com.theantiquersroom.myapp.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;

import org.springframework.web.bind.annotation.*;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.theantiquersroom.myapp.domain.UserDTO;
import com.theantiquersroom.myapp.domain.UserVO;
import com.theantiquersroom.myapp.service.UserService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Log4j2
@NoArgsConstructor

@RequestMapping("/users")
@Controller
public class UserController {

    @Setter(onMethod_= {@Autowired})
    private UserService service;

    @GetMapping("/register")
    public void register() {	//회원가입 화면 요청
        log.debug("register() invoked.");

    } //register

    @PostMapping("/register")
    @ResponseStatus(HttpStatus.CREATED)
    public String register(UserDTO user) { //회원가입 서비스 수행, 저장
        log.debug("register({}) invoked.", user);

        this.service.registerUser(user);
        return "/main";
    } //register

    @PostMapping("/confirmEmail")
    public void confirmEmail(String email) {	//입력받은 이메일로 인증코드 발송
        log.debug("confirmEmail() invoked.");

    } //confirmEmail

    @PostMapping("/checkId")
    public void checkId(String id) {	//아이디 중복검사
        log.debug("checkId() invoked.");

    } //checkId

    @PostMapping("/checkNickName")
    public void checkNickName(String nickname) {	//닉네임 중복검사
        log.debug("confirmEmail() invoked.");

    } //checkNickName

    @PostMapping("/checkPhone")
    public void checkPhone(String phone) {	//연락처 중복검사
        log.debug("checkPhone() invoked.");

    } //checkPhone

    @GetMapping("/login")
    public void login() {	// 로그인 페이지로 이동
        log.debug("login() invoked.");

    } //login

    @PostMapping("/login")
    public String login(
    		@RequestParam("userId") String userId, 
    		@RequestParam("password") String password, HttpServletRequest request) {	// 로그인 실행
        log.debug("login({}, {}) invoked.", userId, password);
        HttpSession session = request.getSession();
        
        boolean isUser=this.service.login(userId, password);
        log.info("\t+ isUser: {}", isUser);
        
        if(isUser) {
        	session.setAttribute("userId", userId);
        } //if
        
        return "/main";
    } //login


    @GetMapping("/logout")
    public String logout(HttpServletRequest request) {	// 로그아웃 실행
        log.debug("logout() invoked.");
        HttpSession session = request.getSession();
        session.invalidate();
        
        return "/main";
    } //logout


    @GetMapping("/findId")
    public void findId() {		// 아이디 찾기 페이지로 이동
        log.debug("findId() invoked.");

    } //findId

    @PostMapping("/findId")
    public String findId(String nickName, String phone) {	// 아이디 찾기 실행
        log.debug("findId({}, {}) invoked.", nickName, phone);

        return "/user/login";	// 아이디 확인 후, 로그인 페이지로 이동
    } //findId



    @GetMapping("/resetPwd")
    public void resetPwd() {	// 비밀번호 재설정 페이지로 이동
        log.debug("resetPwd() invoked.");

    } //resetPwd

    @PostMapping("/resetPwd")
    public @ResponseBody Map<Object, Object> resetPwd(@RequestParam("userId") String userId, @RequestParam("nickName") String nickName) throws Exception {	// 비밀번호 재설정 실행

        System.out.println("hihi");
        log.trace("resetPwd() invoked. model {} {} ", userId, nickName);
        Map<Object,Object> map = new HashMap<Object, Object>();

        Boolean b = false;

        b = service.resetPwd(userId, nickName);
        map.put("check",b);
        log.debug("result : {}", b);

//        model.addAttribute("checkemailsent",b);


        return map;
    } //resetPwd





    @PostMapping("/remove")
    public String remove(Model model) {	// 회원탈퇴 실행	// id는 session값인데.. 흠..?
        log.debug("USER_remove({}) invoked.", model);

        return "/user/main";
    } //remove


    @GetMapping("/getMyAuctionList")
    public String getMyAuctionList(Model model) {	// 나의 경매리스트 페이지로 이동
        log.debug("getMyAuctionList({}) invoked.", model);

        return "/user/myAuctionList";
    } //getMyAuctionList


    @GetMapping("/getBidList")
    public String getBidList() {	// 나의 입찰리스트 페이지로 이동
        log.debug("getBidList() invoked.");

        return "/user/myBidList";
    } //getBidList
    
    
    // =================================================== //

 // 전체회원 목록조회
 	@GetMapping("/getUserList")
 	public void list(Model model) {	// 게시판 목록화면 요청
 		log.debug("list() invoked.");
 		
 		List<UserVO> list=this.service.getUserList();
 		log.info("\t+ list size: {}", list.size());
 		
 		model.addAttribute("list",list);
 	} //list
 	
 	@GetMapping({"/get" , "/modify"})
 	public void get(String userId, Model model) {         // 특정 게시물 상세조회 화면요청
 		log.debug("get({}, {}) invoked." , userId, model);
 		
 		UserVO user = this.service.get(userId);
 		log.info("\t+ board: {}" , user);
 		
 		model.addAttribute("user", user);
 	} // get
 	
 	@PostMapping("/modify")
 	public String modify(UserDTO user, RedirectAttributes rttrs) {
 		log.debug("modify({}, {}) invoked.", user,rttrs);
 		
 		UserVO vo=
 				new UserVO(
 						user.getKakaoUniqueId(),
 						user.getUserId(),
 						user.getPassword(),
 						user.getNickName(),
 						user.getPhone(),
 						user.getUserType()
 						
 				);
 		
 		boolean result=this.service.modify(vo);
 		
 		// 이동되는 화면으로 전송해 줘야 할 파라미터가 있으면,
 		// rttrs를 이용해야 한다.
 		rttrs.addAttribute("result", result);
 		
 		return "redirect:/users/getUserList";
 	} //modify
 	

}  //end class
