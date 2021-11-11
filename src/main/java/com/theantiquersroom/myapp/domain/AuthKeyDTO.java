package com.theantiquersroom.myapp.domain;

import lombok.Data;

import java.util.Date;

/**
 * Created by KBS.
 * User: KBS
 * Date: 11/11/2021
 * Time: 오후 12:04
 */

@Data
public class AuthKeyDTO {

    private String userId;
    private String auth;
    private Date updatedate;

}
