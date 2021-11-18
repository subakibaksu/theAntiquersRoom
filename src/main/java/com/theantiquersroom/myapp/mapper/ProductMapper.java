package com.theantiquersroom.myapp.mapper;


import com.theantiquersroom.myapp.domain.ProductImageDTO;
import com.theantiquersroom.myapp.domain.ProductFormDTO;
import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface ProductMapper {

    // 상품등록
    public Integer insertProduct(ProductFormDTO product);
    // 상품 이미지 등록
    public Integer insertProductImage(ProductImageDTO image);
}
