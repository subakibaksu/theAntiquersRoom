package com.theantiquersroom.myapp.domain;

import lombok.Getter;
import lombok.Value;


@Getter
public class KakaoTokenVO {

    private String token_type;
    private String access_token;
    private String expires_in;
    private String refresh_token;
    private Integer refresh_token_expires_in;

} //end class
