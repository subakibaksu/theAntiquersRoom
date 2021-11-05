package com.theantiquersroom.myapp.controller;

import com.theantiquersroom.myapp.domain.UserDTO;
import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Log4j2
@NoArgsConstructor

@RequestMapping("/users")
@Controller
public class UserController {

//    @Setter(onMethod_= {@Autowired})
//    private UserService service;

    @GetMapping("/register")
    public void register() {	//회원가입 화면 요청
        log.debug("register() invoked.");

    } //register

    @PostMapping("/register")
    public String register(UserDTO user, RedirectAttributes rttrs) {
        //회원가입 서비스 수행, 저장

        log.debug("register({}, {}) invoked.", user, rttrs);

        return "redirect:/";
    } //register

    @GetMapping("/kakaoLogin")
    public void kakaoLogin() {	//카카오 로그인 화면 요청
        log.debug("kakaoLogin() invoked.");

    } //register

    @PostMapping("/kakaoLogin")
    public void kakaoLogin(String code) {	//카카오 로그인 화면 요청
        log.debug("kakaoLogin() invoked.");

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

    @PostMapping("/login")
    public void login() {	// 로그인 페이지로 이동
        log.debug("login() invoked.");

    } //login

    @GetMapping("/login")
    public String login(String id, String pwd) {	// 로그인 실행
        log.debug("login({}, {}) invoked.", id, pwd);

        return "/user/main";
    } //login


    @PostMapping("/logout")
    public String logout() {	// 로그아웃 실행
        log.debug("logout() invoked.");

        return "/user/main";
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
    public String resetPwd(String nickName, String id) {	// 비밀번호 재설정 실행
        log.debug("resetPwd({}, {}) invoked.", nickName, id);

        return "/user/main";
    } //resetPwd


    @GetMapping("/modify")
    public void modify() {	// 회원정보 수정페이지로 이동
        log.debug("USER_modify() invoked.");

    } //modify

    @PostMapping("/modify")
    public String modify(UserDTO userDto) {	// 회원정보 수정 실행
        log.debug("USER_modify({}) invoked.", userDto);

        return "/user/userInfo";
    } //modify


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

}  //end class
