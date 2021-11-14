package com.theantiquersroom.myapp.mapper;

import com.theantiquersroom.myapp.domain.ProductFormDTO;
import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface ProductMapper {

    //상품등록
    public abstract Integer insertProduct(ProductFormDTO product);
	
	// 상품번호에 따른 상품 상세정보 불러오기
	public abstract ProductDTO getDetailByPId(Integer pId);
	
} //end interface
