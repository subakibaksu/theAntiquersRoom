package com.theantiquersroom.myapp.controller;

import java.text.ParseException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.theantiquersroom.myapp.domain.MyPageDTO;
import com.theantiquersroom.myapp.domain.MypageCriteria;
import com.theantiquersroom.myapp.domain.ProductDTO;
import com.theantiquersroom.myapp.domain.UserDTO;
import com.theantiquersroom.myapp.domain.UserVO;
import com.theantiquersroom.myapp.domain.modifyDTO;
import com.theantiquersroom.myapp.service.UserService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;

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
        return "/";
    } //register

    //
    @GetMapping("/confirmEmail")
    public void confirmEmail(){
        log.debug("confirmEmail() invoked");

    } // confirmEmail

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

    @PostMapping("/checkId")
    public @ResponseBody Map<Object, Object> checkId(@RequestBody Map<Object,Object> map) {	//아이디 중복검사
        log.debug("checkId({}) invoked.", map.get("userId"));
        
        boolean checkid = this.service.checkId((String)map.get("userId")); //true/false인지 서비스에서 판별 
        log.info("\t+ checkid: {}", checkid);
        
        Map<Object, Object> resultMap = new HashMap<Object,Object>();
        
        map.put("emailCheck", checkid);
        log.debug(map.get("emailCheck"));
        
        return resultMap;
        
    } //checkId

    @PostMapping("/checkNickName")
    public void checkNickName(String nickname) {	//닉네임 중복검사
        log.debug("confirmEmail() invoked.");

    } //checkNickName

    @PostMapping("/checkPhone")
    public void checkPhone(String phone) {	//연락처 중복검사
        log.debug("checkPhone() invoked.");

    } //checkPhone

    
    @GetMapping("/logout")
    public String logout(HttpServletRequest request) {	// 로그아웃 실행
        log.debug("logout() invoked.");
        HttpSession session = request.getSession();
        session.invalidate();
        
        return "redirect:/";
    } //logout

    @GetMapping("/resetPwd")
    public void resetPwd() {	// 비밀번호 재설정 페이지로 이동

        log.debug("resetPwd() invoked.");

    } //resetPwd

    @PostMapping("/resetPwd")
    public @ResponseBody Map<Object, Object> resetPwd(
            @RequestParam("userId") String userId,
            @RequestParam("nickName") String nickName) throws Exception {	// 비밀번호 재설정 실행

        log.debug("resetPwd() invoked. model {} {} ", userId, nickName);

        //Ajax의 결과값을 Json으로 받기 위해 Map객체를 생성
        Map<Object,Object> map = new HashMap<Object, Object>();

        boolean mailSentCheck = service.resetPwd(userId, nickName);
        map.put("check",mailSentCheck);
        log.debug("result : {}", mailSentCheck);

        return map;

    } //resetPwd


    // ======================== MyPage =========================== //
    
    @GetMapping("/getMyAuctionList")
    public String getMyAuctionList(
    		HttpSession session,
    		@ModelAttribute("cri") MypageCriteria cri,
    		Model model) {	// 나의 경매리스트 페이지로 이동
        log.debug("getMyAuctionList({}, {}) invoked.", cri, model);

        UserDTO user = (UserDTO) session.getAttribute(LoginController.authKey);
        String userId = user.getUserId();
        
        HashMap<String, Object> map = new HashMap<>();
        map.put("userId", userId);
        map.put("cri", cri);
        
        List<ProductDTO> myAuctionList = this.service.getMyAuctionList(map);
 		log.info("\t+ myAuctionList size: {}", myAuctionList.size());

 		model.addAttribute("myAuctionList",myAuctionList);
	
 		//페이징 처리
 		Integer totalAmount = this.service.getMyAuctionTotal(userId);
		
		MyPageDTO pageDTO = new MyPageDTO(cri, totalAmount);
		
		model.addAttribute("pageMaker", pageDTO);
    
		return "/users/myAuctionList";
    } //getMyAuctionList


    @GetMapping("/getBidList")
    public String getBidList() {	// 나의 입찰리스트 페이지로 이동
        log.debug("getBidList() invoked.");

        return "/user/myBidList";
    } //getBidList
    
    

 // 전체회원 목록조회
//  	@GetMapping("/getUserList") // 추후 관리자 페이지에서
//  	public void list(Model model) {	
//  		log.debug("list() invoked.");
 		
//  		List<UserVO> list=this.service.getUserList();
//  		log.info("\t+ list size: {}", list.size());
 		
//  		model.addAttribute("list",list);
//  	} //list
 	
 	@GetMapping({"/get" , "/modify"})
 	public void get(String userId, Model model) {         
 		log.debug("get({}, {}) invoked." , userId, model);
 		
 		UserVO user = this.service.get(userId);
 		log.info("\t+ board: {}" , user);
 		
 		model.addAttribute("user", user);
 	} // get , modify
 	
 	@PostMapping("/modify")
 	public String modify(modifyDTO user, RedirectAttributes rttrs) {
 		log.debug("modify({}, {}) invoked.", user,rttrs);
 		
 		modifyDTO dto=
				new modifyDTO(
						user.getUserId(),
						user.getPassword(),
						user.getNickName(),
						user.getPhone()

						
				);
 		
 		boolean result=this.service.modify(user);
 			
 		return "redirect:/users/mypage";
 	} //modify
 	
 	
    // 아이디 찾기 페이지 이동
	@GetMapping("/findId")
	public String findIdView() {
		return "users/findId";
	} // findId
	
    // 아이디 찾기 실행
	@PostMapping("/findId")
	public String findIdAction(UserVO vo, Model model) {
		UserVO user = service.findId(vo);
		
		
		if(user == null) { 
			model.addAttribute("check", 1);
		} else { 
			model.addAttribute("check", 0);
			model.addAttribute("userId", user.getUserId());
		}
		
		return "users/findId";
	} // findId

    
	@PostMapping("/remove")
	public String remove(
			@RequestParam("userId") String userId,
			RedirectAttributes rttrs) 
	{
		log.debug("remove({}) invoked.", userId);
		
		boolean result=this.service.remove(userId);
		rttrs.addAttribute("result", result);
		
		return "redirect:/users/getUserList";
	} //remove
	
}  //end class
