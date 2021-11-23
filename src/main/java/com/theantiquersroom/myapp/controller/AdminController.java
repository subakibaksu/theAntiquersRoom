package com.theantiquersroom.myapp.controller;


import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.theantiquersroom.myapp.domain.MyPageDTO;
import com.theantiquersroom.myapp.domain.MypageCriteria;
import com.theantiquersroom.myapp.domain.ProductDTO;
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

// 		String pids = "";
// 		for(int i = 0; i< confirmArr.length; i++) {
// 			pids += "'" + confirmArr[i] + "'";
// 			if(i < confirmArr.length-1) {
// 				pids += ",";
// 			}
// 		}
 		
 		log.info(confirmArr);
 		
 		for(int i = 0; i< confirmArr.length; i++) {
 	 		boolean result=this.service.modifyStatus(confirmArr[i]);
 		}
 			
 		return "redirect:/admin/main";
 	} //confirmRequestedProduct
    

    @GetMapping("/auctionProductList")
    public void auctionProductList() {
        log.debug("getRequestedProductList() invoked.");

    } // auctionProductList

    @PostMapping("/confirmDiscontinuedProduct")
    public String confirmDiscontinuedProduct() {
        log.debug("confirmDiscontinuedProduct() invoked.");

        return "redirect:/admin/discontinuedProductList";
    } // confirmDiscontinuedProduct()


    @GetMapping("/discontinuedProductList")
    public void discontinuedProductList() {
        log.debug("discontinuedProductList() invoked.");

    } // discontinuedProductList()

    @GetMapping("/getUserList")
    public void getUserList(Model model) {
        log.debug("getUserList() invoked.");


    } // getUserList()

    @GetMapping("/searchUser")
    public void searchUser() {
        log.debug("searchUser() invoked.");

    } // searchUser() 조회회원보여주는 페이지로 이동



} // end class