package com.theantiquersroom.myapp.mapper;

import java.sql.Date;
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

    //아이디와 인증번호 값을 임시 테이블에 INSERT
    public abstract Integer insertAuthorizationNumber(@Param("userId") String userId, @Param("auth") String auth);

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

    //현재시간 조회
    public abstract String selectNow();

    //emailchecktemp table의 auth 조회
    public abstract String selectAuth(@Param("userId") String userId);

    //emailchecktemp table의 updatedate 조회
    public abstract String selectUpdatedate(@Param("userId") String userId);

} // end interface
