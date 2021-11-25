package com.theantiquersroom.myapp.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.theantiquersroom.myapp.domain.MypageCriteria;
import com.theantiquersroom.myapp.domain.ProductDTO;


@Mapper
public interface AdminMapper {
	
	// 승인요청상품 총 게시물 개수를 반환
	public abstract Integer getRequestedListTotal();
	
    //경매상태가 "승인대기중"인 상품 리스트 반환
    public abstract List<ProductDTO> getRequestedList(MypageCriteria cri);
    
    //경매상태를 "승인완료"로 변경
    public abstract Integer updateStatus(@Param("pId") Integer pId);
    
    //경매상태를 "승인반려"로 변경
    public abstract Integer rejectRequest(@Param("pId") Integer pId);
    

    //경매상품 총 게시물 개수를 반환
	public abstract Integer getAuctionTotal();
	
    //경매 상품 리스트 반환
    public abstract List<ProductDTO> getAuctionProductList(MypageCriteria cri);

    //경매상태를 "판매종료"로 변경
    public abstract Integer stopSale(@Param("pId") Integer pId);
    
}// end interface
