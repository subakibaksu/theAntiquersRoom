package com.theantiquersroom.myapp.mapper;


import com.theantiquersroom.myapp.domain.ProductDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProductMapper {

    //상품등록
    public abstract Integer inserProduct(ProductDTO product);
}
