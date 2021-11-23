package com.theantiquersroom.myapp.controller;

import com.theantiquersroom.myapp.domain.*;
import com.theantiquersroom.myapp.service.ProductService;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import com.theantiquersroom.myapp.domain.ProductDTO;
import com.theantiquersroom.myapp.domain.UserDTO;
import com.theantiquersroom.myapp.domain.ProductCommand;
import com.theantiquersroom.myapp.utils.ProductPageMaker;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import java.util.List;
import java.util.stream.Collectors;


@Log4j2
@NoArgsConstructor

@Controller
@RequestMapping("/product")
public class ProductController {

	
	@Setter(onMethod_= {@Autowired})
	private ProductService service;
	
	
    /*상품 목록 페이지로 이동*/
    @GetMapping("/productList")
    public void productList(
            @ModelAttribute("cri") ProductCriteria cri,
            @ModelAttribute("productCommand") ProductCommand productCommand,
            Model model) throws Exception {

        log.debug("productList() invoked cri : {} command : {}",cri,productCommand);

        List<ProductDTO> dto = service.listCriteria(cri,productCommand);

        ProductPageMaker pageMaker =new ProductPageMaker();
        pageMaker.setCri(cri);
        Integer totalNum = service.totalCount(productCommand);
        pageMaker.setTotalCount(totalNum);

        model.addAttribute("pageMaker", pageMaker);
        model.addAttribute("productList", dto);
        model.addAttribute("productCommand",productCommand);

    } // productList()

    /*상품 등록 페이지로 이동*/
    @GetMapping("/register")
    public String register() {

        System.out.println("Test");

        return "/product/register";
    } // Get register()

    /*상품 등록정보 DB전달*/
    @PostMapping("/register")
    @ResponseStatus(HttpStatus.CREATED)
    public String register(
       ProductFormDTO product,
       @SessionAttribute(LoginController.authKey) UserDTO user
    ) throws Exception{

        product.setImages(product.getImages().stream().filter(img -> !img.isEmpty()).collect(Collectors.toList()));
        product.setUserId(user.getUserId());

        this.service.registerProduct(product);
        return "/product/list"; // 추후 완료 alert으로 변경
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
    @PostMapping("/remove")
    public String remove(Integer pId) {
    	log.debug("remove({}) invoked.", pId);
    	
    	boolean isRemoved = this.service.removeProduct(pId);
    	
    	return "/productList";
    } // Post remove()

    /*상품 검색*/
    @GetMapping("/findProduct")
    public void findProduct() {

    } // findProduct()

    /*상품 상세보기 페이지로 이동*/
    @GetMapping("/getDetail")
    public String getDetail(Integer pId, Model model) {
    	log.debug("getDetail({}) invoked.", pId);
    	
    	ProductDTO dto = this.service.getDetail(pId);
    	log.info("/t+ dto: {}", dto);
    	assert dto != null;
    	
    	model.addAttribute("product", dto);

//    String detailPage = "detail?pId="+pId; //최종적으로는 pId 전달해야되므로, 해당 주석 지우지 말아주세요!

    	return "/detail";
    } // getDetail()

    /*해당 상품의 입찰 히스토리 조회*/
    @GetMapping("/getBiddingHistory")
    public void getBiddingHistory() {

    } // getBiddingHistory()

    /*입찰정보 DB전달*/
    @PostMapping("/bid")
    public void bid(Model model) {

    } // bid()


} // end class
