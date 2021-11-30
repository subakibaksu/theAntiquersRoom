package com.theantiquersroom.myapp.service;

import java.util.HashMap;
import java.util.List;

import com.theantiquersroom.myapp.domain.*;
import lombok.NoArgsConstructor;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.theantiquersroom.myapp.mapper.ProductMapper;
import com.theantiquersroom.myapp.domain.ProductImageDTO;

import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;


@NoArgsConstructor
@Log4j2

@Service
public class ProductServiceImpl implements ProductService, InitializingBean, DisposableBean {


    private final String PRODUCT_IMAGE_DIR = "product";

    @Setter(onMethod_= {@Autowired})
    private ProductMapper mapper;
    @Setter(onMethod_= {@Autowired})
    private FileUploadService uploadService;

    // 상품등록
    @Transactional
    @Override
    public void registerProduct(ProductFormDTO product) throws Exception {
        log.debug("login({}) invoked.", product);

        this.mapper.insertProduct(product);

        for (MultipartFile img: product.getImages()) {
            String url = uploadService.upload(img, PRODUCT_IMAGE_DIR);
            ProductImageDTO imageDto = new ProductImageDTO();
            imageDto.setPid(product.getPid());
            imageDto.setImageUrl(url);
            imageDto.setImageName(img.getOriginalFilename());
            this.mapper.insertProductImage(imageDto);
        }

    } // registerProduct()

    @Override
    public List<ProductDTO> listCriteria(ProductCriteria cri, ProductCommand productCommand) throws Exception {

        HashMap<Object,Object> map = new HashMap<>();
        map.put("pageStart",cri.getPageStart());
        map.put("perPageNum",cri.getPerPageNum());
        map.put("category_id",productCommand.getCategory_id());
        map.put("filter",productCommand.getFilter());
        map.put("searchQuery",productCommand.getSearchQuery());

        return mapper.listCriteria(map);

    } // listCriteria()

    @Override
    public Integer totalCount(ProductCommand productCommand) throws Exception {

        return mapper.getTotalCount(productCommand);

    } //totalCount()

    @Override
    public Boolean bid(BidHistoryDTO bidHistoryDTO) {

        log.debug("bid() invoked");
        if(bidHistoryDTO.getUserId()!=null){

            if(mapper.getMaxBid(bidHistoryDTO.getPid()) == null || mapper.getMaxBid(bidHistoryDTO.getPid()) < bidHistoryDTO.getBidPrice()){

                mapper.insertBid(bidHistoryDTO);

                return true;

            }

        }

        return false;
    }

    @Override
    public void destroy() throws Exception {

    } //destroy()

    @Override
    public void afterPropertiesSet() throws Exception {

    } // afterPropertiesSet()

    // 상품상세보기
    @Override
    public ProductDTO getDetail(Integer pid) {
      log.debug("getDetail({}) invoked.", pid);

      ProductDTO dto = this.mapper.getDetailByPId(pid);
      dto.setImageUrls(this.mapper.getProductImageUrls(pid));
      
      log.info("\t+ dto: {}", dto);

      return dto;
    } //getDetail

	@Override
	public boolean removeProduct(Integer pid) {
		log.debug("removeProduct({}) invoked.", pid);
		
		Integer affectedProduct = this.mapper.deleteProduct(pid);
		
		return ((affectedProduct > 0)? true:false);
	} //removeProduct

    @Override
    public List<BidHistoryDTO> getBidHistory(Integer pid) {

        log.debug("getBidHistory({}) Invoked",pid);
        List<BidHistoryDTO> bidHistoryDTOList = mapper.getBidHistory(pid);
        return bidHistoryDTOList;

    } // getBidHistory()

    // 상품 정보 수정
    @Transactional
    @Override
    public Integer modify(ProductFormDTO product) throws Exception {
        log.debug("modify({}) invoked.", product);

        this.mapper.deleteProductImage(product.getPid());
        for (MultipartFile img: product.getImages()) {
            String url = uploadService.upload(img, PRODUCT_IMAGE_DIR);
            ProductImageDTO imageDto = new ProductImageDTO();
            imageDto.setPid(product.getPid());
            imageDto.setImageUrl(url);
            imageDto.setImageName(img.getOriginalFilename());
            this.mapper.insertProductImage(imageDto);
        }

          return this.mapper.updateProduct(product);
    } // modify()

    // 상품 수정 정보 가져오기
    @Override
    public ProductModifyDTO getModify(Integer pid) {
        log.debug("getDetail({}) invoked.", pid);

        ProductModifyDTO product = this.mapper.getupdateByPId(pid);
        // 이미지 가져오기
        product.setImageUrls(this.mapper.getProductImageUrls(pid));

        return product;
    } //getDetail

    @Override
    public List<ProductDTO> getNewProduct() {

        List<ProductDTO> productDTOList = mapper.getNewProduct();
        return productDTOList;
    } // getNewProduct()

    @Override
    public List<ProductDTO> getEndingProduct() {

        List<ProductDTO> productDTOList = mapper.getEndingProduct();
        return productDTOList;
    } // getEndingProduct()

    // 유찰 등록
    @Transactional
    @Override
    public void reRegister(ProductReRegisterDTO reRegister) {

        this.mapper.reRegister(reRegister);
    } // reRegister

} // end class
