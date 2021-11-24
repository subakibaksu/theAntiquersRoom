package com.theantiquersroom.myapp.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.theantiquersroom.myapp.domain.MypageCriteria;
import com.theantiquersroom.myapp.domain.ProductDTO;


@Service
public interface AdminService {
	
    // 경매 승인 요청한 상품 조회
    public abstract List<ProductDTO> getRequestedList(MypageCriteria cri);
    
    // 승인 요청 리스트 총 레코드 개수 반환
  	public abstract Integer getRequestedListTotal();
  	
  	// 경매 승인
  	public abstract Boolean modifyStatus(Integer pId);
    
    // 판매중인 경매 상품 조회
    public abstract List<ProductDTO> getOnSaleProductList(MypageCriteria cri);
    
    // 경매상품 리스트 총 레코드 개수 반환
  	public abstract Integer getOnSaleTotal();
  	
} // end interface