package com.theantiquersroom.myapp;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import com.theantiquersroom.myapp.service.ProductService;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Handles requests for the application home page.
 */
@Log4j2


@Controller
public class HomeController {

    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);

    @Setter(onMethod_={@Autowired})
    private ProductService service;


    /**
     * Simply selects the home view to render by returning its name.
     */
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String home(Locale locale, Model model) {
        logger.info("Welcome home! The client locale is {}.", locale);
        log.debug("main invoked()");
        model.addAttribute("newProductList",service.getNewProduct());
        model.addAttribute("endingProductList",service.getEndingProduct());
        log.debug(service.getNewProduct());
        log.debug(service.getEndingProduct());
        return "main";
    }

}