package com.theantiquersroom.myapp.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.theantiquersroom.myapp.domain.MypageCriteria;
import com.theantiquersroom.myapp.domain.ProductDTO;
import com.theantiquersroom.myapp.domain.UserDTO;
import com.theantiquersroom.myapp.domain.UserVO;

@Mapper
public interface UserMapper {

	// 전체 회원 목록 조회
//	public abstract List<UserVO> getUserList(Criteria cri);

	// 회원가입
	public abstract Integer insertUser(UserDTO user);

	// 특정 아이디의 닉네임 조회
	public abstract String selectUserNickname(@Param("userId") String userId);

	// 아이디와 인증번호 값을 임시 테이블에 INSERT
	public abstract Integer insertAuthorizationNumber(@Param("userId") String userId, @Param("auth") String auth);

	// 비밀번호 변경
	public abstract Integer updatePassword(@Param("newPassword") String newPassword, @Param("userId") String userId);

	// 특정 아이디 조회
	public abstract Integer getUserId(String userId);

	// 특정 닉네임 조회
	public abstract Integer getNickName(String nickName);

	// 특정 연락처 조회
	public abstract Integer getPhone(String phone);

	//로그인
    public abstract UserDTO selectUserById(String userId);
  
    //emailchecktemp table의 auth 조회
    public abstract String selectAuth(@Param("userId") String userId);
    

    // 전체 회원 목록 조회
    public abstract List<UserVO> getUserList();
 
    // 회원 정보 수정
    public abstract Integer update(UserDTO user);

	// 회원정보 상세조회 - XML Mapper 방식으로 처리
	public abstract UserVO read(String userId);
	
	//  특정 회원 삭제
	public abstract Integer delete(String userId);
	
    // 아이디 찾기
    public abstract UserVO findId(UserVO vo);
    
    
	
    // =====================마이페이지 관련===================== //
    
	// 마이옥션리스트 총 게시물 개수를 반환
	public abstract Integer getMyAuctionTotalCount(@Param("userId") String userId);
	
    //특정 회원 ID 통한 경매 리스트 조회
    public abstract List<ProductDTO> getMyAuctionList(HashMap<String, Object> map);
	
    
    // =====================카카오 로그인 API 관련===================== //
	
    //카카오계정 ID 조회
	public abstract UserDTO getKakaoUser(String kakaoUniqueId);
	

} // end interface
