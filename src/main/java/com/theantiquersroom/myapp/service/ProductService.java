package com.theantiquersroom.myapp.service;

import com.theantiquersroom.myapp.domain.ProductFormDTO;
import com.theantiquersroom.myapp.domain.ProductDTO;
import org.springframework.stereotype.Service;


@Service
public interface ProductService {

    //상품등록
    public  abstract  boolean registerProduct(ProductFormDTO product);

	//상품 상세 보기
	public abstract ProductDTO getDetail(Integer pId);
	
} //end interface
