package com.theantiquersroom.myapp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.theantiquersroom.myapp.domain.Criteria;
import com.theantiquersroom.myapp.domain.UserDTO;
import com.theantiquersroom.myapp.domain.UserVO;
import org.apache.ibatis.annotations.Param;


@Mapper
public interface UserMapper {

    //전체 회원 목록 조회
    public abstract List<UserVO> getUserList(Criteria cri);

    //회원가입
    public abstract Integer insertUser(UserVO user);

    //특정 아이디의 닉네임 조회
    public abstract String selectUserNickname(@Param("userId") String userId);

    //비밀번호 변경
    public abstract Integer updatePassword(@Param("newPassword") String newPassword, @Param("userId") String userId);

    //특정 아이디 조회
    public abstract Integer getUserId(String userId);

    //특정 닉네임 조회
    public abstract Integer getNickName(String nickName);

    //특정 연락처 조회
    public abstract Integer getPhone(String phone);

    //로그인
    public abstract UserVO login(String userId);
    
} // end interface
