package com.theantiquersroom.myapp.service;

import java.util.HashMap;
import java.util.List;

import com.theantiquersroom.myapp.domain.*;
import org.springframework.beans.factory.DisposableBean;
import org.springframework.beans.factory.InitializingBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.theantiquersroom.myapp.mapper.ProductMapper;
import com.theantiquersroom.myapp.domain.ProductImageDTO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;


@AllArgsConstructor
@Log4j2

@Service
public class ProductServiceImpl implements ProductService, InitializingBean, DisposableBean {


    private final String PRODUCT_IMAGE_DIR = "product";

    @Setter(onMethod_= {@Autowired} )
    private ProductMapper mapper;
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
            imageDto.setPId(product.getPId());
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

            if(mapper.getMaxBid(bidHistoryDTO.getPId()) == null || mapper.getMaxBid(bidHistoryDTO.getPId()) < bidHistoryDTO.getBidPrice()){

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
    public ProductDTO getDetail(Integer pId) {
      log.debug("getDetail({}) invoked.", pId);

      ProductDTO dto = this.mapper.getDetailByPId(pId);
      dto.setImageUrls(this.mapper.getProductImageUrls(pId));
      
      log.info("\t+ dto: {}", dto);

      return dto;
    } //getDetail

	@Override
	public boolean removeProduct(Integer pId) {
		log.debug("removeProduct({}) invoked.", pId);
		
		Integer affectedProduct = this.mapper.deleteProduct(pId);
		
		return ((affectedProduct > 0)? true:false);
	} //removeProduct

    @Override
    public List<BidHistoryDTO> getBidHistory(Integer pId) {

        log.debug("getBidHistory({}) Invoked",pId);
        List<BidHistoryDTO> bidHistoryDTOList = mapper.getBidHistory(pId);
        return bidHistoryDTOList;

    } // getBidHistory()

    // 상품 정보 수정
    @Transactional
    @Override
    public Integer modify(ProductFormDTO product) throws Exception {
        log.debug("modify({}) invoked.", product);

        this.mapper.deleteProductImage(product.getPId());
        for (MultipartFile img: product.getImages()) {
            String url = uploadService.upload(img, PRODUCT_IMAGE_DIR);
            ProductImageDTO imageDto = new ProductImageDTO();
            imageDto.setPId(product.getPId());
            imageDto.setImageUrl(url);
            imageDto.setImageName(img.getOriginalFilename());
            this.mapper.insertProductImage(imageDto);
        }

          return this.mapper.updateProduct(product);
    }

    // 상품 수정 정보 가져오기
    @Override
    public ProductModifyDTO getModify(Integer pId) {
        log.debug("getDetail({}) invoked.", pId);

        ProductModifyDTO product = this.mapper.getupdateByPId(pId);
        // 이미지 가져오기
        product.setImageUrls(this.mapper.getProductImageUrls(pId));

        return product;
    } //getDetail

} // end class
