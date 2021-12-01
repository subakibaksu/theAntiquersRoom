package com.theantiquersroom.myapp.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import com.theantiquersroom.myapp.domain.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.ResponseStatus;
import org.springframework.web.bind.annotation.SessionAttribute;
import com.theantiquersroom.myapp.service.ProductService;
import com.theantiquersroom.myapp.utils.ProductPageMaker;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


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
    public String register(
            ProductFormDTO product,
            @SessionAttribute(LoginController.authKey) UserDTO user
    ) throws Exception{

        product.setImages(product.getImages().stream().filter(img -> !img.isEmpty()).collect(Collectors.toList()));
        product.setUserId(user.getUserId());

        this.service.registerProduct(product);
        return "redirect:/users/myAuctionList"; // 추후 완료 alert으로 변경
    } // Post register()

    /*유찰된 상품 재등록 정보 DB전달*/
    @PostMapping("/reRegister")
    @ResponseStatus(HttpStatus.CREATED)
    public String reRegister(ProductReRegisterDTO product) {

            product.setPid(product.getPid());
            this.service.reRegister(product);
        return "redirect:/users/myAuctionList";
    } // Post reRegister()

    /*상품 수정 페이지로 이동*/
    @GetMapping("/modify")
    public String modify(Integer pid, Model model) {
        log.debug("get({}, {}) invoked." , pid, model);

        ProductModifyDTO product = this.service.getModify(pid);

        model.addAttribute("product", product);
        return "/product/modify";

    } // Get modify()

    /*수정된 상품 정보 DB전달*/
    @PostMapping("/modify")
    public String modify(ProductFormDTO product) throws Exception {

        product.setImages(product.getImages().stream().filter(img -> !img.isEmpty()).collect(Collectors.toList()));
        product.setPid(product.getPid());

        this.service.modify(product);

        return "/users/myAuctionList";
    } // Post modify()

    /*상품 삭제*/
    @PostMapping("/remove")
    public String remove(Integer pid) {
    	log.debug("remove({}) invoked.", pid);

    	boolean isRemoved = this.service.removeProduct(pid);

    	return "redirect:/users/myAuctionList";
    } // Post remove()

    /*상품 검색*/
    @GetMapping("/findProduct")
    public void findProduct() {

    } // findProduct()

    /*상품 상세보기 페이지로 이동*/
    @GetMapping("/getDetail")
    public String getDetail(Integer pid, Model model) {
    	log.debug("getDetail({}) invoked.", pid);
    	
    	ProductDTO dto = this.service.getDetail(pid);
    	log.info("/t+ dto: {}", dto);
    	assert dto != null;

    	List<BidHistoryDTO> bidHistoryDTOList = this.service.getBidHistory(pid);

    	model.addAttribute("product", dto);
    	model.addAttribute("bidHistoryList",bidHistoryDTOList);

//    String detailPage = "detail?pId="+pId; //최종적으로는 pId 전달해야되므로, 해당 주석 지우지 말아주세요!

    	return "/detail";
    } // getDetail()

    /*해당 상품의 입찰 히스토리 조회*/
    @GetMapping("/getBiddingHistory")
    public void getBiddingHistory() {

    } // getBiddingHistory()

    /*입찰정보 DB전달*/
    @PostMapping("/bid")
    public @ResponseBody Map<Object,Object> bid(@RequestBody Map<String,Object> map, HttpSession session) {

        log.debug("bid invoked()");
        Map<Object,Object> resultMap = new HashMap<>();
        if(session.getAttribute(LoginController.authKey) != null){

            UserDTO userDTO = (UserDTO) session.getAttribute(LoginController.authKey);
            BidHistoryDTO bidHistoryDTO = new BidHistoryDTO();
            bidHistoryDTO.setUserId(userDTO.getUserId());
            bidHistoryDTO.setBidPrice(Integer.parseInt((String) map.get("bidPrice")));
            bidHistoryDTO.setPid(Integer.parseInt((String)map.get("pid")));
            boolean isBided = service.bid(bidHistoryDTO);

            resultMap.put("bidCheck",isBided);

        }else {

            resultMap.put("bidCheck",false);

        }

        return resultMap;

    } // bid()

} // end class
