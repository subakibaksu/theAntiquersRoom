package com.theantiquersroom.myapp.service;

import com.theantiquersroom.myapp.domain.ProductCommand;
import com.theantiquersroom.myapp.domain.ProductCriteria;
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


    // 페이징 처리 서비스 메서드
    public List<ProductDTO> listCriteria(ProductCriteria cri, ProductCommand productCommand)throws Exception;

    // 전체 게시글 수 구하기
    public Integer totalCount(ProductCommand productCommand)throws Exception;



} // end interface
