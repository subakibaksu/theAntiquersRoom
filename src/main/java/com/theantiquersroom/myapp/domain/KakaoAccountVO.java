package com.theantiquersroom.myapp.domain;

import lombok.Getter;
import lombok.ToString;


@Getter
@ToString
public class KakaoAccountVO {
	
	//이메일 정보 가져올 수 있을 시 사용할 VO!
	//추후 판단 예정
    private Boolean email_needs_agreement; //사용자 동의 시 카카오계정 대표 이메일 제공 가능
    private Boolean is_email_valid; //이메일 유효 여부
    private Boolean is_email_verified; //이메일 인증 여부
    private String email; //카카오계정 대표 이메일

} //end class
