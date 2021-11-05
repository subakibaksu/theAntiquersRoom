package com.theantiquersroom.myapp.service;

import com.theantiquersroom.myapp.domain.UserVO;
import org.springframework.stereotype.Service;


@Service
public interface UserService {

    // 회원가입
    public abstract boolean registerUsers(UserVO user);

    // 아이디 중복 검사
    public abstract boolean checkId(String userId);

    // 닉네임 중복검사
    public abstract boolean checkNickName(String nickName);

    // 연락처 중복검사
    public abstract boolean checkPhone(String phone);

    // 이메일 인증번호 매칭검사
    public abstract boolean confirmEmail(String eCode);

} // end interface


