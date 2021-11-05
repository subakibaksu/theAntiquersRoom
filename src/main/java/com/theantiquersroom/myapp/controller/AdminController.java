package com.theantiquersroom.myapp.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.NoArgsConstructor;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@RequestMapping("/admin")
@Controller
public class AdminController {

    @GetMapping("/getRequestedProductList")
    public String getRequestedProductList() {
        log.debug("getRequestedProductList() invoked.");

        return null;
    } // getRequestedProductList()

    @PostMapping("/confirmRequestedProduct")
    public String confirmRequestedProduct() {
        log.debug("confirmRequestedProduct() invoked.");

        return "redirect:/admin/getRequestedProductList";
    } // confirmRequestedProduct()

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