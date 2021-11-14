package com.theantiquersroom.myapp.mapper;


import com.theantiquersroom.myapp.domain.AuctionDTO;
import com.theantiquersroom.myapp.domain.ProductDTO;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface ProductMapper {

    //상품등록
    public abstract Integer inserProduct(ProductDTO product);
    // 경매정보입력
    public abstract Integer inserAuction(AuctionDTO auction);
}
