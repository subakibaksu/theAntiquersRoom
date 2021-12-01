package com.theantiquersroom.myapp.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.theantiquersroom.myapp.domain.MyPageDTO;
import com.theantiquersroom.myapp.domain.MypageCriteria;
import com.theantiquersroom.myapp.domain.ProductDTO;
import com.theantiquersroom.myapp.domain.UserDTO;
import com.theantiquersroom.myapp.domain.UserVO;
import com.theantiquersroom.myapp.service.AdminService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@RequestMapping("/admin")
@Controller
public class AdminController {
	
    @Setter(onMethod_= {@Autowired})
    private AdminService service;

    //=============승인요청상품 리스트=============
    //승인요청상품 리스트로 이동(어드민 메인)
    @GetMapping({"/main", "/requestedList"}) 
    public String getRequestedProductList(
    		HttpSession session,
    		@ModelAttribute("cri") MypageCriteria cri,
    		Model model
    		) {
        log.debug("getRequestedProductList({}, {}) invoked.", cri, model);
        
        List<ProductDTO> requestedList = this.service.getRequestedList(cri);
 		log.info("\t+ requestedList size: {}", requestedList.size());
 		
 		model.addAttribute("requestedList",requestedList);
 		
 		//페이징 처리
 		Integer totalAmount = this.service.getRequestedListTotal();
		
		MyPageDTO pageDTO = new MyPageDTO(cri, totalAmount);
		
		model.addAttribute("pageMaker", pageDTO);
 		
        return "/admin/requestedList";
    } // getRequestedProductList()
    
    //판매요청 경매상품 승인
 	@PostMapping("/confirmRequest")
 	public String confirmRequestedProduct(@RequestParam(value="checkBoxArr[]") Integer[] confirmArr, RedirectAttributes rttrs) {
 		log.debug("confirmRequestedProduct({}, {}) invoked.", confirmArr,rttrs);
 		
 		for(int i = 0; i< confirmArr.length; i++) {
 	 		boolean result=this.service.modifyStatus(confirmArr[i]);
 		}
 			
 		return "redirect:/admin/main";
 	} //confirmRequestedProduct
 	
    //판매요청 경매상품 반려
 	@PostMapping("/rejectRequest")
 	public String rejectRequest(@RequestParam(value="checkBoxArr[]") Integer[] confirmArr, RedirectAttributes rttrs) {
 		log.debug("rejectRequest({}, {}) invoked.", confirmArr,rttrs);
 		
 		for(int i = 0; i< confirmArr.length; i++) {
 	 		boolean result=this.service.rejectRequest(confirmArr[i]);
 		}
 			
 		return "redirect:/admin/main";
 	} //rejectRequest
 	
 	
 	//=============경매상품 리스트=============
    //경매상품 리스트 조회
    @GetMapping("/auctionProductList")
    public String getAuctionProductList(
    		HttpSession session,
    		@ModelAttribute("cri") MypageCriteria cri,
    		Model model
    		) {
        log.debug("getAuctionProductList() invoked.");
        
        String keyword="";
        String status="";
        cri.setKeyword(keyword);
        cri.setStatus(status);
        
        List<ProductDTO> auctionProductList = this.service.getAuctionProductList(cri);
 		log.info("\t+ auctionProductList size: {}", auctionProductList.size());
 		
 		model.addAttribute("auctionProductList",auctionProductList);
 		
 		//페이징 처리
 		Integer totalAmount = this.service.getAuctionTotal(keyword, status);
		
		MyPageDTO pageDTO = new MyPageDTO(cri, totalAmount);
		
		model.addAttribute("pageMaker", pageDTO);
 		
        return "/admin/auctionProductList";

    } // getAuctionProductList
    
    //경매상품 판매중단
 	@PostMapping("/stopSale")
 	public String stopSale(@RequestParam(value="pId") Integer pid, RedirectAttributes rttrs) {
 		log.debug("stopSale({}, {}) invoked.", pid,rttrs);
 		
 	 	boolean result=this.service.stopSale(pid);
 			
 		return "redirect:/admin/auctionProductList";
 	} //stopSale

    //경매상품 키워드 검색 조회
    @RequestMapping("/searchItemList")
    public String getSearchItems(
    		HttpSession session,
    		@ModelAttribute("cri") MypageCriteria cri,
    		Model model
    		) {
        log.debug("getSearchItems({},{}) invoked.", cri, model);
        
        List<ProductDTO> auctionProductList = this.service.getAuctionProductList(cri);
 		log.info("\t+ auctionProductList size: {}", auctionProductList.size());
 		
 		model.addAttribute("auctionProductList",auctionProductList);
 		
 		//페이징 처리
 		Integer totalAmount = this.service.getAuctionTotal(cri.getKeyword(), cri.getStatus());
		
		MyPageDTO pageDTO = new MyPageDTO(cri, totalAmount);
		
		model.addAttribute("pageMaker", pageDTO);
 		
        return "/admin/auctionProductList";

    } // getSearchItems

    
    @GetMapping("/userList")
    public void getUserList(
    		@ModelAttribute("cri") MypageCriteria cri, Model model
    ) {
        cri.setAmount(10);
        List<UserDTO> users = this.service.getUserList(cri);
        
        model.addAttribute("users", users);
        
      //페이징 처리
 		Integer totalUsers = this.service.getTotalUsersCount();
		MyPageDTO pageDTO = new MyPageDTO(cri, totalUsers);
		
		model.addAttribute("pageMaker", pageDTO);
		
    } // getUserList

    @PostMapping("/searchUser")
    public @ResponseBody List<UserVO> searchUser(@RequestBody String nickName, Model model) {
        log.debug("searchUser({}) invoked.", nickName);
        
        List<UserVO> users=this.service.searchUser(nickName);
        log.info("\t+ users: {}", users);
        model.addAttribute("users", users);
        
//        return "redirect:/admin/userList";
        return this.service.searchUser(nickName);
    } // searchUser



} // end class