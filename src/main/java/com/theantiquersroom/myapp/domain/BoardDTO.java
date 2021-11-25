package com.theantiquersroom.myapp.domain;


import lombok.Data;


@Data
public class BoardDTO {

    private Integer b_num; // 글번호
    private String b_content; // 글내용
    private String author; // 회원이메일
    private Integer p_num; // 상품일련번호
    private Integer board_id; // 타입번호
    private Integer score; // 별점
    private String title; // 제목
    private Integer reference; // 레퍼
    private Integer depth; // 뎁스
    private Integer step; // 스텝

} //end class
