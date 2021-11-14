package com.theantiquersroom.myapp.service;

import com.theantiquersroom.myapp.domain.ProductFormDTO;
import com.theantiquersroom.myapp.domain.ProductDTO;
import com.theantiquersroom.myapp.mapper.ProductMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@AllArgsConstructor
@Log4j2

@Service
public class ProductServiceImpl implements ProductService {

    @Setter(onMethod_= {@Autowired})
    ProductMapper mapper;

    // 상품등록
    @Override
    public boolean registerProduct(ProductFormDTO product) {
        log.debug("login({}) invoked.", product);

        this.mapper.insertProduct(product);
        return true;
    }
	
	// 상품상세보기
	@Override
	public ProductDTO getDetail(Integer pId) {
		log.debug("getDetail({}) invoked.", pId);
		
		ProductDTO dto = this.mapper.getDetailByPId(pId);
		log.info("\t+ dto: {}", dto);
		
		return dto;
	} //getDetail

} // end class
