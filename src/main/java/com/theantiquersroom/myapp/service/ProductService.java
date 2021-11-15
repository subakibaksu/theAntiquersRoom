package com.theantiquersroom.myapp.service;

import com.theantiquersroom.myapp.domain.ProductFormDTO;
import org.springframework.stereotype.Service;

@Service
public interface ProductService {

    //상품등록
    public  abstract  boolean registerProduct(ProductFormDTO product);
}
