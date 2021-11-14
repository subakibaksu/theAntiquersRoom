package com.theantiquersroom.myapp.mapper;


import org.apache.ibatis.annotations.Mapper;

import com.theantiquersroom.myapp.domain.ProductDTO;


@Mapper
public interface ProductMapper {
	
	// 상품번호에 따른 상품 상세정보 불러오기
	public abstract ProductDTO getDetailByPId(Integer pId);
	
} //end interface
