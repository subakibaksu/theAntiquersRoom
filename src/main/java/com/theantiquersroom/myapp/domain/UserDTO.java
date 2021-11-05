package com.theantiquersroom.myapp.domain;

import lombok.Data;


@Data
public class UserDTO {

    private String userId;
    private String nickName;
    private String phone;
    private Integer userType;
    private String password;

} //end class
