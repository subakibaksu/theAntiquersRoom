package com.theantiquersroom.myapp.domain;

import lombok.Value;


@Value
public class UserVO {

    private String userId;
    private String nickName;
    private String phone;
    private Integer userType;
    private String password;

} //end class
