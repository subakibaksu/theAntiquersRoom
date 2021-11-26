package com.theantiquersroom.myapp.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.theantiquersroom.myapp.domain.MypageCriteria;
import com.theantiquersroom.myapp.domain.ProductDTO;
import com.theantiquersroom.myapp.domain.UserDTO;
import com.theantiquersroom.myapp.domain.UserVO;


@Service
public interface AdminService {
	
    // 경매 승인 요청한 상품 조회
    public abstract List<ProductDTO> getRequestedList(MypageCriteria cri);
    
    // 승인 요청 리스트 총 레코드 개수 반환
  	public abstract Integer getRequestedListTotal();
  	
  	// 경매 승인
  	public abstract Boolean modifyStatus(Integer pId);
  	
  	// 경매 승인 반려
  	public abstract Boolean rejectRequest(Integer pId);
  	
    // 경매 상품 조회
    public abstract List<ProductDTO> getAuctionProductList(MypageCriteria cri);
    
    // 경매상품 리스트 총 레코드 개수 반환
  	public abstract Integer getAuctionTotal();
  	
  	// 경매상품 판매중단
  	public abstract Boolean stopSale(Integer pId);
  
    	// 회원 목록 조회
  	public abstract List<UserDTO> getUserList(MypageCriteria cri);
  	
  	// 전체 회원수 조회
  	public abstract Integer getTotalUsersCount();
  	
  	// 닉네임으로 회원 검색
  	public abstract List<UserVO> searchUser(String nickName);
  	
} // end interface