package com.theantiquersroom.myapp.controller;
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
import com.theantiquersroom.myapp.domain.QnADTO;
import com.theantiquersroom.myapp.domain.QnAPageMakeDTO;
import com.theantiquersroom.myapp.service.BoardService;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@RequestMapping("/board")
@Controller
public class BoardController {

    @Setter(onMethod_= { @Autowired} )
    private BoardService service;


    @GetMapping("/review")
    public void getReview( ) {
        log.debug("getReview() invoked.");

    } // getReview


    @GetMapping("/getReviewDetail")
    public void getReviewDetail(Integer b_num, Model model ) {
        log.debug("getReviewDetail() invoked.");

//      BoardVO board = this.service.getDetailReview(b_num);
//      log.info("\t+ board: {}" , board);

//      model.addAttribute("board", board);

    } // getReviewDetail


    @GetMapping("/registerReview")
    public void registerReview( ) {
        log.debug("registerReview() invoked.");

    } // registerReview  리뷰작성페이지로 이동


    @PostMapping("/registerReview")
    public String registerReview(BoardDTO board, RedirectAttributes rttrs) {
        log.debug("registerReview()_ invoked.");

//      boolean result = this.service.registerReview(board);
//      rttrs.addAttribute("result", result);

        return "redirect:/board/review";
    } // registerReview  작성된 리뷰정보 DB전달


    @GetMapping("/modifyReview")
    public void modifyReview( ) {
        log.debug("modifyReview() invoked.");

    } // modifyReview  리뷰 수정페이지로 이동


    @PostMapping("/modifyReview")
    public String modify(BoardDTO board, RedirectAttributes rttrs) {
        log.debug("modify({}) invoked." , board);

//      boolean result = this.service.modifyReview(board);

        // 이동되는 화면으로 전송해줘야할 파라미터가 있으면,
        // rttrs 를 사용해야 한다!!!
//      rttrs.addAttribute("result", result);

        return  "redirect:/board/review"; // 이동된 화면 직전에 수행했던게 양식이라면(?) redirect

    } // modifyReview  수정된 리뷰정보 DB전달


    @PostMapping("/removeReview")
    public String removeReview(@RequestParam("b_num") Integer b_num, RedirectAttributes rttrs) {
        log.debug("remove({}) invoked." , b_num);

//      boolean result = this.service.removeReview(b_num);
//      rttrs.addAttribute("result" ,result);

        return  "redirect:/board/review";
    } // removeReview




//---------------------------------------------QnA=============================================
    
  @GetMapping("/QnA")
  public void getQnA(Model model, BoardQnACriteria cri) { // 문의게시글 불러오기	

	  log.debug("getQnA() invoked.");
	  
		model.addAttribute("list",service.getQnAListPaging(cri));
		
		int total = service.getQnATotal();
		
		QnAPageMakeDTO pageMake = new QnAPageMakeDTO(cri, total);
		
		model.addAttribute("pageMaker", pageMake);

  } // getQnA 페이징처리

    @GetMapping("/getQnADetail")
    public void getQnADetail(int bindex, Model model) {	// 상세 문의게시글 보기
        log.debug("getQnADetail() invoked.");
        
        model.addAttribute("pageInfo", service.getQnADetail(bindex));

    } // getQnADetail

    @GetMapping("/registerQnA")
    public void registerQnA() {		
        log.debug("registerQnA() invoked.");

    } // registerQnA

    @PostMapping("/registerQnA")
    public String registerQnA(QnADTO dto) { // 문의게시글 작성
    	log.debug("registerQnA({}) invoked.", dto);
    	
    	this.service.registerQnA(dto);
    
    	return  "redirect:/board/QnA";
    } // registerQnA
    
    
    @GetMapping("/registerReQnA")
    public void registerReQnA() {		
        log.debug("registerReQnA() invoked.");

    } // registerQnA 
    
    @PostMapping("/registerReQnA")
    public String registerReQnA(QnADTO dto) { // 문의게시글 답글 작성
    	log.debug("registerReQnA({}) invoked.", dto);
    	
    	this.service.registerReQnA(dto);
    	
    	return  "redirect:/board/QnA";
    } // registerReQnA

    
    @GetMapping("/modifyQnA")
    public void modifyQnA(int bindex, Model model) { // 문의사항 수정페이지로 이동
        log.debug("modifyQnA() invoked.");
        
        model.addAttribute("pageInfo", service.getQnADetail(bindex));

    } // modifyQnA

    @PostMapping("/modifyQnA")
    public String modifyQnA(QnADTO dto, RedirectAttributes rttr) { // 문의게시글 수정
        log.debug("modifyQnA({})({}) invoked.", dto,rttr);

        int result = this.service.modifyQnA(dto);
        rttr.addAttribute("result", result);
        
        return  "redirect:/board/QnA";
        
    } // modifyQnA

    @PostMapping("/removeQnA")
    public String removeQnA(int bindex, RedirectAttributes rttr) { // 문의게시글 삭제
        log.debug("removeQnA({}) invoked.");
        
        int result = this.service.removeQnA(bindex);
        rttr.addAttribute("result", result);
        
        return "redirect:/board/QnA";

    } // removeQnA

} // end class
