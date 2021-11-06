package com.theantiquersroom.myapp.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.theantiquersroom.myapp.domain.Criteria;
import com.theantiquersroom.myapp.domain.UserVO;


@Mapper
public interface UserMapper {

    //전체 회원 목록 조회
    public abstract List<UserVO> getUserList(Criteria cri);

    //회원가입
    public abstract Integer insertUser(UserVO user);

    //특정 아이디 조회
    public abstract Integer getUserId(String id);

    //특정 닉네임 조회
    public abstract Integer getNickName(String nickName);

    //특정 연락처 조회
    public abstract Integer getPhone(String phone);

    //로그인
    public abstract Integer login(String id, String pwd);
    
} // end interface
