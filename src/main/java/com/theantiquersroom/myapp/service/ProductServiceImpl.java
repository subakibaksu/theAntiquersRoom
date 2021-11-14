package com.theantiquersroom.myapp.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.theantiquersroom.myapp.domain.ProductDTO;
import com.theantiquersroom.myapp.mapper.ProductMapper;

import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;


@Log4j2
@NoArgsConstructor

@Service
public class ProductServiceImpl implements ProductService {

	
	@Setter(onMethod_= {@Autowired})
	private ProductMapper mapper;
	
	
	@Override
	public ProductDTO getDetail(Integer pId) {
		log.debug("getDetail({}) invoked.", pId);
		
		ProductDTO dto = this.mapper.getDetailByPId(pId);
		log.info("\t+ dto: {}", dto);
		
		return dto;
	} //getDetail

}
