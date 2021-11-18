package com.theantiquersroom.myapp.service;

import com.theantiquersroom.myapp.domain.ProductCommand;
import com.theantiquersroom.myapp.domain.ProductCriteria;
import com.theantiquersroom.myapp.domain.ProductDTO;
import com.theantiquersroom.myapp.domain.ProductFormDTO;
import com.theantiquersroom.myapp.domain.ProductDTO;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Map;


@Service
public interface ProductService {

    //상품등록
    public  abstract  boolean registerProduct(ProductFormDTO product);

    // 페이징 처리 서비스 메서드
    public List<ProductDTO> listCriteria(ProductCriteria cri, ProductCommand productCommand)throws Exception;

    // 전체 게시글 수 구하기
    public Integer totalCount(ProductCommand productCommand)throws Exception;

    //입찰
    public Boolean bid(Map<Object,Object> map);

	  //상품 상세 보기
	  public abstract ProductDTO getDetail(Integer pId);
	
} //end interface

