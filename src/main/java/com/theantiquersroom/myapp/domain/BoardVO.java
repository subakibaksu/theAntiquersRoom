package com.theantiquersroom.myapp.domain;


import lombok.Getter;

import java.sql.Timestamp;

@Getter
public class BoardVO {

    private Integer b_num; // 글번호
    private String b_content; // 글내용
    private String author; // 회원이메일
    private Integer p_num; // 상품일련번호
    private Integer board_id; // 타입번호
    private Integer score; // 별점
    private Timestamp b_created_at; // 작성일
    private Timestamp b_updated_at; // 수정일

    private String title; // 제목
    private Integer reference; // 레퍼
    private Integer depth; // 뎁스
    private Integer step; // 스텝


    public BoardVO(Integer b_num, String b_content, String author, Integer p_num, Integer board_id, Integer score, Timestamp b_created_at, Timestamp b_updated_at, String title, Integer reference, Integer depth, Integer step) {
        this.b_num = b_num;
        this.b_content = b_content;
        this.author = author;
        this.p_num = p_num;
        this.board_id = board_id;
        this.score = score;
        this.b_created_at = b_created_at;
        this.b_updated_at = b_updated_at;
        this.title = title;
        this.reference = reference;
        this.depth = depth;
        this.step = step;
    }

    public BoardVO(Integer b_num, String b_content, String author, Integer p_num, Integer board_id, Integer score, Timestamp b_created_at, Timestamp b_updated_at) {

        this.b_num = b_num;
        this.author = author;
        this.b_content = b_content;
        this.p_num = p_num;
        this.board_id = board_id;
        this.score = score;
        this.b_created_at = b_created_at;
        this.b_updated_at = b_updated_at;

    }


} // end class
