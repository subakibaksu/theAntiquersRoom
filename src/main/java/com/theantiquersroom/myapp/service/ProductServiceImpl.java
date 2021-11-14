package com.theantiquersroom.myapp.service;

import com.theantiquersroom.myapp.domain.AuctionDTO;
import com.theantiquersroom.myapp.domain.ProductDTO;
import com.theantiquersroom.myapp.mapper.ProductMapper;
import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@AllArgsConstructor
@Log4j2

@Service
public class ProductServiceImpl implements ProductService {

    @Setter(onMethod_= {@Autowired})
    ProductMapper mapper;

    // 상품등록
    @Override
    public boolean registerProduct(ProductDTO product) {
        log.debug("login({}) invoked.", product);

        int affectedRows = this.mapper.inserProduct(product);

        return affectedRows > 0;
    }

    // 경매정보등록
    @Override
    public boolean registerAuction(AuctionDTO auction) {
        log.debug("login({}) invoked.", auction);

        int affectedRows = this.mapper.inserAuction(auction);

        return affectedRows > 0;
    }
}
