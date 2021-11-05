package com.theantiquersroom.myapp.mapper;

import com.theantiquersroom.myapp.domain.UserVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;


@Mapper
public interface UserMapper {

    //전체 회원 목록 조회
    public abstract List<UserVO> getUserList();

    //회원가입
    public abstract Integer insertUser(UserVO user);

    //특정 아이디 조회
    public abstract Integer getUserId(String id);

    //특정 닉네임 조회
    public abstract Integer getNickName(String nickName);

    //특정 연락처 조회
    public abstract Integer getPhone(String phone);

} // end interface
