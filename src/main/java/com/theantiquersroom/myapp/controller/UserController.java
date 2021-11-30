package com.theantiquersroom.myapp.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.theantiquersroom.myapp.domain.MyPageDTO;
import com.theantiquersroom.myapp.domain.MypageCriteria;
import com.theantiquersroom.myapp.domain.ProductCriteria;
import com.theantiquersroom.myapp.domain.ProductDTO;
import com.theantiquersroom.myapp.domain.UserDTO;
import com.theantiquersroom.myapp.domain.modifyDTO;
import com.theantiquersroom.myapp.service.ChatService;
import com.theantiquersroom.myapp.service.ProductService;
import com.theantiquersroom.myapp.service.UserService;
import com.theantiquersroom.myapp.utils.ProductPageMaker;

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

    @Setter(onMethod_= {@Autowired})
      private ChatService chatService;

	@Setter(onMethod_= {@Autowired})
	private ProductService productService;

    @GetMapping("/logout")
    public String logout(HttpServletRequest request, HttpSession session) {	// 로그아웃 실행
        
        String kakaoUniqueId = (String) session.getAttribute("kakaoUniqueId");
       
        if(kakaoUniqueId != null) { //카카오로 로그인했다면, 카카오계정 로그아웃도 함께 진행
        	
            String logout_redirect_uri = "http://localhost:8090";

            String reqUrl = 
            		"https://kauth.kakao.com/oauth/logout?client_id="
            		+ ApiKakaoController.REST_API_KEY
            		+ "&logout_redirect_uri="
            		+ logout_redirect_uri;
            
            session.invalidate();
            
            return "redirect:"+reqUrl;
            
        }else { //일반회원 로그아웃 시 세션 초기화
        	session.invalidate();
            
            return "redirect:/";
        }
    } //logout

    @GetMapping("/myAuctionList")
    public String getMyAuctionList(
    		HttpSession session,
    		@ModelAttribute("cri") MypageCriteria cri,
    		Model model) {	// 나의 경매리스트 페이지로 이동

        UserDTO user = (UserDTO) session.getAttribute(LoginController.authKey);
        String userId = user.getUserId();
        
        HashMap<String, Object> map = new HashMap<>();
        map.put("userId", userId);
        map.put("cri", cri);
        
        List<ProductDTO> myAuctionList = this.service.getMyAuctionList(map);

 		model.addAttribute("myAuctionList",myAuctionList);
	
 		//페이징 처리
 		Integer totalAmount = this.service.getMyAuctionTotal(userId);
		
		MyPageDTO pageDTO = new MyPageDTO(cri, totalAmount);
		
		model.addAttribute("pageMaker", pageDTO);
    
		return "/users/myAuctionList";
    } //getMyAuctionList


    @GetMapping("/getBidList")
    public String getBidList() {	// 나의 입찰리스트 페이지로 이동

        return "/user/myBidList";
    } //getBidList
 	
 	@GetMapping({"/modify" , "/mypage"})
 	public void get(String userId, Model model) {
 		
 		UserDTO user = this.service.get(userId);
 		
 		model.addAttribute("user", user);
 	} // mypage, modify
 	
 	@PostMapping("/modify")
 	public String modify(modifyDTO user, RedirectAttributes rttrs) {
 		
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
	public String findIdAction(String phone, Model model) {
		UserDTO user = this.service.findId(phone);
		
		if(user == null) { 
			model.addAttribute("check", 1);
		} else { 
			model.addAttribute("check", 0);
			model.addAttribute("userId", user.getUserId());
		}
		
		return "users/findId";
	} // findId

    
	@PostMapping("/remove")
	@ResponseBody
	public void remove(
//			String userId,
//			RedirectAttributes rttrs
			HttpServletResponse response
	) throws IOException {	
//		boolean result=this.service.remove(userId);
//		rttrs.addAttribute("result", result);
		
		response.setContentType("text/html; charset=UTF-8");
		 
		PrintWriter out = response.getWriter();
		 
		out.println("<script>alert('주의! 경매 중인 상품이 있습니다. 확인 후 다시 시도해 주세요.'); location.href='/users/mypage';</script>");
		 
		out.flush();

//		return "redirect:/users/mypage"
	} //remove

	@GetMapping("/getMyBidList")
	public String getMyBidList(
			HttpSession session,
			@ModelAttribute("cri") ProductCriteria cri,
			Model model) {	// 나의 입찰리스트 페이지로 이동

		UserDTO user = (UserDTO) session.getAttribute(LoginController.authKey);
		String userId = user.getUserId();
		cri.setPerPageNum(7);
		HashMap<String, Object> map = new HashMap<>();
		map.put("userId", userId);
		map.put("cri", cri);

		List<ProductDTO> myBidList = this.service.getMyBidList(cri,map);

		model.addAttribute("myBidList",myBidList);

		ProductPageMaker pageMaker =new ProductPageMaker();
		//페이징 처리
		pageMaker.setCri(cri);
		Integer totalNum = this.service.getMyBidTotal(userId);
		pageMaker.setTotalCount(totalNum);

		model.addAttribute("pageMaker", pageMaker);

		return "/users/myBidList";
	} //getMyBidList

	@GetMapping("/chat")
	public String chat(
			@RequestParam("pid") Integer pid,
			@RequestParam("myBidPrice") Integer myBidPrice,
			Model model, HttpSession session){

    	//아이디 체크
		//True or False 반환

		//만약 True 이면 계속 진행

    	//매퍼에서 기존 DB에 저장되어있던 채팅정보들을 가져옵니다..
		// List<ChatDTO> list = service.getChat(pId);

		//model에 지정해줍니다.
		//model.addAtrribute("chatList",list);
		UserDTO user = (UserDTO) session.getAttribute(LoginController.authKey);

		ProductDTO productDTO = productService.getDetail(pid);
		String userId = user.getUserId();

		model.addAttribute("userId",userId);
		model.addAttribute("myBidPrice",myBidPrice);
		model.addAttribute("product",productDTO);
		model.addAttribute("chatList",chatService.getChat(pid));

    	return "/users/chat";
	}

}  //end class
