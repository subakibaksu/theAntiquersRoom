package com.theantiquersroom.myapp.mapper;


import com.theantiquersroom.myapp.domain.AuctionDTO;
import com.theantiquersroom.myapp.domain.ProductDTO;
import com.theantiquersroom.myapp.domain.ProductFormDTO;
import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface ProductMapper {

    //상품등록
    public abstract Integer inserProduct(ProductFormDTO product);
    // 경매정보입력
    public abstract Integer inserAuction(ProductFormDTO auction);
}
