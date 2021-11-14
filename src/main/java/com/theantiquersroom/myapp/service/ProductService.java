package com.theantiquersroom.myapp.service;

import com.theantiquersroom.myapp.domain.AuctionDTO;
import com.theantiquersroom.myapp.domain.ProductDTO;
import org.springframework.stereotype.Service;

@Service
public interface ProductService {

    //상품등록
    public  abstract  boolean registerProduct(ProductDTO product);
    // 경매정보 입력
    public  abstract  boolean registerAuction(AuctionDTO auction);
}
