package com.theantiquersroom.myapp.domain;

import lombok.Data;


@Data
public class UserDTO {

	private String kakaoUniqueId;
    private String userId;
    private String password;
    private String nickName;
    private String phone;
    private Integer userType;

} //end class
