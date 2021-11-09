package com.theantiquersroom.myapp.domain;

import lombok.Getter;
import lombok.Value;


@Getter
public class KakaoAccountVO {

    private Boolean email_needs_agreement;
    private Boolean is_email_valid;
    private Boolean is_email_verified;
    private String email;

} //end class
