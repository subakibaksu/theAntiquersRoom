package com.theantiquersroom.myapp.service;

import org.springframework.stereotype.Service;

import com.theantiquersroom.myapp.domain.ProductDTO;


@Service
public interface ProductService {

	//상품 상세 보기
	public abstract ProductDTO getDetail(Integer pId);
	
} //end interface
