package com.theantiquersroom.myapp.controller;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.theantiquersroom.myapp.domain.BoardDTO;
import com.theantiquersroom.myapp.domain.BoardQnACriteria;
import com.theantiquersroom.myapp.domain.BoardReviewCriteria;
import com.theantiquersroom.myapp.domain.ProductDTO;
import com.theantiquersroom.myapp.domain.QnADTO;
import com.theantiquersroom.myapp.domain.QnAPageMakeDTO;
import com.theantiquersroom.myapp.domain.ReviewDTO;
import com.theantiquersroom.myapp.domain.ReviewPageMakeDTO;
import com.theantiquersroom.myapp.domain.UserDTO;
import com.theantiquersroom.myapp.service.BoardService;
import com.theantiquersroom.myapp.service.ProductService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@RequestMapping("/board")
@Controller
public class BoardController {

	@Setter(onMethod_= {@Autowired})
    private BoardService service;

	@Setter(onMethod_= {@Autowired})
    private ProductService prdouctService;

    
    @GetMapping("/review")
    public void getReview(Model model, Integer pid, BoardReviewCriteria cri) {
  	  log.debug("getReview() invoked.");
	  
  		model.addAttribute("reviewList",service.getReviewListPaging(cri,pid));
  		
  		int total = service.getReviewTotal();
  		
  		ReviewPageMakeDTO pageMake = new ReviewPageMakeDTO(cri, total);
  		
  		model.addAttribute("pageMaker", pageMake);
        
    } // getReview

    @GetMapping("/getReviewDetail")
    public void getReviewDetail(Integer b_num, Model model ) {
        log.debug("getReviewDetail() invoked.");

    } // getReviewDetail

    //리뷰작성시 상품명, 낙찰가 주입.
    @GetMapping("/registerReview")
    public String getReview(Integer pid, Model model) {
    	log.debug("getReview({}) invoked.", pid);
    	
    	ProductDTO dto = this.prdouctService.getDetail(pid);
    	log.info("/t+ dto: {}", dto);
    	assert dto != null;

    	model.addAttribute("product", dto);
    	
    	return "/board/registerReview";
    } // getDetail()
    
    @PostMapping("/registerReview")
    public String registerReview(ReviewDTO dto, Integer pid, HttpSession session) {
        log.debug("registerReview({}) invoked.", pid);

        UserDTO userdto = (UserDTO) session.getAttribute(LoginController.authKey);
        String userId = userdto.getUserId();
        		dto.setAuthor(userId);
        
        this.service.registerReview(dto);
        
        return "redirect:/product/getDetail?pid="+pid;
    } // registerReview

    @GetMapping("/modifyReview")
    public String modifyReview() {
        log.debug("modifyReview() invoked.");
        
        return "redirect:/board/review";
    } // modifyReview

    @PostMapping("/modifyReview")
    public String modify(BoardDTO board, RedirectAttributes rttrs) {
        log.debug("modify({}) invoked." , board);

        return  "redirect:/board/review";

    } // modifyReview  수정된 리뷰정보 DB전달


    @PostMapping("/removeReview")
    public String removeReview(@RequestParam("review_id") Integer review_id, RedirectAttributes rttrs) {
        log.debug("remove({}) invoked." , review_id);

        return  "redirect:/board/review";
    } // removeReview

//---------------------------------------------QnA=============================================
    
  @GetMapping("/QnA")
  public void getQnA(@RequestParam("pid") Integer pid, Model model, BoardQnACriteria cri) { // 문의게시글 불러오기

	  log.debug("getQnA({}) invoked." , pid);
	  
	  	cri.setPid(pid);
	  
		model.addAttribute("list",service.getQnAListByProductId(cri));
		
		int total = service.getQnATotal();
		
		QnAPageMakeDTO pageMake = new QnAPageMakeDTO(cri, total);
		
		model.addAttribute("pageMaker", pageMake);
		model.addAttribute("pid",pid);


      } // getQnA 페이징처리

    @GetMapping("/getQnADetail")
    public void getQnADetail(Integer bindex, Model model) {	// 상세 문의게시글 보기
        log.debug("getQnADetail() invoked.");
        
        model.addAttribute("pageInfo", service.getQnADetail(bindex));

    } // getQnADetail

    @GetMapping("/registerQnA")
    public void registerQnA(Integer pid, Model model) {
        log.debug("registerQnA() invoked.");
        
        ProductDTO dto = this.prdouctService.getDetail(pid);
        
        model.addAttribute("product", dto);

    } // registerQnA

    @PostMapping("/registerQnA")
    public String registerQnA(QnADTO dto,Model model) { // 문의게시글 작성
    	log.debug("registerQnA({}) invoked.", dto);
    	
    	this.service.registerQnA(dto);
    	
        model.addAttribute("product", dto);

    	
    	return  "redirect:/product/getDetail?"+"pid="+dto.getPid();
    } // registerQnA
    
    
    @GetMapping("/registerReQnA")
    public void registerReQnA(Integer bindex, Model model) {		
        log.debug("registerReQnA() invoked.");
        
        model.addAttribute("pageInfo", service.getQnADetail(bindex));
    } // registerReQnA 
    
    @PostMapping("/registerReQnA")
    public String registerReQnA(QnADTO dto) { // 문의게시글 답글 작성
    	log.debug("registerReQnA({}) invoked.", dto);
    	
    	this.service.registerReQnA(dto);
    	
    	return  "redirect:/product/getDetail?"+"pid="+dto.getPid();
    } // registerReQnA

    
    @GetMapping("/modifyQnA")
    public void modifyQnA(Integer bindex, Model model) { // 문의사항 수정페이지로 이동
        log.debug("modifyQnA() invoked.");
        
        model.addAttribute("pageInfo", service.getQnADetail(bindex));

    } // modifyQnA

    @PostMapping("/modifyQnA")
    public String modifyQnA(QnADTO dto, Integer pid, RedirectAttributes rttr) { // 문의게시글 수정
        log.debug("modifyQnA({})({}) invoked.", dto,rttr);
        
        int result = this.service.modifyQnA(dto);
        rttr.addAttribute("result", result);
        
    	return  "redirect:/product/getDetail?"+"pid="+dto.getPid();
        
    } // modifyQnA

    @PostMapping("/removeQnA")
    public String removeQnA(Integer bindex, Integer pid, RedirectAttributes rttr) { // 문의게시글 삭제
        log.debug("removeQnA({}) invoked.");
        
        int result = this.service.removeQnA(bindex);
        rttr.addAttribute("result", result);
        
        return  "redirect:/product/getDetail?" +"pid="+pid;

    } // removeQnA
   

} // end class
