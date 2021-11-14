package com.theantiquersroom.myapp.controller;

import com.theantiquersroom.myapp.domain.AuctionDTO;
import com.theantiquersroom.myapp.domain.ProductDTO;
import com.theantiquersroom.myapp.service.ProductService;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

@Log4j2
@NoArgsConstructor

@RequestMapping("/product")
@Controller
public class ProductController {

    @Setter(onMethod_= {@Autowired})
    private ProductService service;

    /*상품 목록 페이지로 이동*/
    @GetMapping("")
    public void product(){

    } // Get product()

    /*상품 등록 페이지로 이동*/
    @GetMapping("/register")
    public void register() {
        log.debug("register() invoked.");

    } // Get register()

    /*상품 등록정보 DB전달*/
    @PostMapping("/register")
    @ResponseStatus(HttpStatus.CREATED)
    public String register(ProductDTO product, AuctionDTO auction) {
        log.debug("register({}) invoked.", product, auction);

        this.service.registerProduct(product);
        this.service.registerAuction(auction);

        return "/main"; // 추후 mypage로 가자
    } // Post register()

    /*유찰된 상품 재등록 페이지로 이동*/
    @GetMapping("/reRegister")
    public void reRegister() {

    } // Get reRegister()

    /*유찰된 상품 재등록 정보 DB전달*/
    @PostMapping("/reRegister")
    public void reRegister(Model model) {

    } // Post reRegister()

    /*상품 수정 페이지로 이동*/
    @GetMapping("/modify")
    public void modify() {

    } // Get modify()

    /*수정된 상품 정보 DB전달*/
    @PostMapping("/modify")
    public void modify(Model model) {

    } // Post modify()

    /*상품 삭제*/
    @PostMapping("remove")
    public void remove(Model model) {

    } // Post remove()

    /*상품 검색*/
    @GetMapping("findProduct")
    public void findProduct() {

    } // findProduct()

    /*상품 상세보기 페이지로 이동*/
    @GetMapping("getDetail")
    public void getDetail() {

    } // getDetail()

    /*해당 상품의 입찰 히스토리 조회*/
    @GetMapping("getBiddingHistory")
    public void getBiddingHistory() {

    } // getBiddingHistory()

    /*입찰정보 DB전달*/
    @PostMapping("bid")
    public void bid(Model model) {

    } // bid()


} // end class