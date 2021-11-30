package com.theantiquersroom.myapp.mapper;


import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.theantiquersroom.myapp.domain.MypageCriteria;
import com.theantiquersroom.myapp.domain.ProductDTO;
import com.theantiquersroom.myapp.domain.UserDTO;
import com.theantiquersroom.myapp.domain.UserVO;


@Mapper
public interface AdminMapper {
	
	// 승인요청상품 총 게시물 개수를 반환
	public abstract Integer getRequestedListTotal();
	
    //경매상태가 "승인대기중"인 상품 리스트 반환
    public abstract List<ProductDTO> getRequestedList(MypageCriteria cri);
    
    //경매상태를 "승인완료"로 변경
    public abstract Integer updateStatus(@Param("pid") Integer pid);
    
    //경매상태를 "승인반려"로 변경
    public abstract Integer rejectRequest(@Param("pid") Integer pid);

    //경매상품 총 게시물 개수를 반환
	public abstract Integer getAuctionTotal(@Param("keyword") String keyword, @Param("status") String status);
	
    //경매 상품 리스트 반환
    public abstract List<ProductDTO> getAuctionProductList(MypageCriteria cri);

    //경매상태를 "판매종료"로 변경
    public abstract Integer stopSale(@Param("pid") Integer pid);
  
    //회원 목록 조회
    public abstract List<UserDTO> selectUserList(MypageCriteria cri);
    
    //전체 회원수 조회
    public abstract Integer getTotalUsersCount();
    
    //닉네임으로 회원 검색
    public abstract List<UserVO> selectUserByNick(String nickName);
    
}// end interface
