package com.theantiquersroom.myapp.domain;

import lombok.Value;


@Value
public class UserVO {

	private String kakaoUniqueId;
    private String userId;
    private String password;
    private String nickName;
    private String phone;
    private Integer userType;

} //end class
