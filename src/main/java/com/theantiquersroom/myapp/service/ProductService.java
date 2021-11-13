package com.theantiquersroom.myapp.service;

import com.theantiquersroom.myapp.domain.ProductDTO;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by KBS.
 * User: KBS
 * Date: 11/14/2021
 * Time: 오전 2:41
 */

@Service
public interface ProductService {

    //상품목록 가져오기
    public abstract List<ProductDTO> getProductList(String categoryId);

    //상품목록 가져오기
    public abstract List<ProductDTO> getProductList(String categoryId,Integer filter);

} // end interface
