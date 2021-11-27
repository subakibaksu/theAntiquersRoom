package com.theantiquersroom.myapp.service;

import com.theantiquersroom.myapp.domain.*;
import com.theantiquersroom.myapp.domain.ProductDTO;
import org.springframework.stereotype.Service;

import java.util.List;


@Service
public interface ProductService {

    //상품등록
    public  void registerProduct(ProductFormDTO product) throws Exception;

    // 페이징 처리 서비스 메서드
    public List<ProductDTO> listCriteria(ProductCriteria cri, ProductCommand productCommand)throws Exception;

    // 전체 게시글 수 구하기
    public Integer totalCount(ProductCommand productCommand)throws Exception;

    //입찰
    public Boolean bid(BidHistoryDTO bidHistoryDTO);

    //상품 상세 보기
    public ProductDTO getDetail(Integer pId);

    //상품삭제
    public boolean removeProduct(Integer pId);

    public List<BidHistoryDTO> getBidHistory(Integer pId);

    // 상품 정보 가져오기
    public ProductModifyDTO getModify(Integer pId);

    // 상품 정보 수정
    public Integer modify(ProductFormDTO product) throws Exception;

    // 새로 들어온 상품 조회
    public List<ProductDTO> getNewProduct();

    // 마감 임박 상품 조회
    public List<ProductDTO> getEndingProduct();

} //end interface

