package com.theantiquersroom.myapp.domain;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class QnADTO {

    private Integer bindex; // 글번호
    private String content; // 글내용
    private String author; // 회원이메일
    private Integer pId; // 상품일련번호
    private String title; // 제목
    private Integer ref; // 레퍼
    private Integer depth; // 뎁스
    private Integer step; // 스텝
//    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
//    private LocalDateTime createdAt;
//    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
//    private LocalDateTime updatedAt;
//  private DateTime createdAt;
//  private DateTime updatedAt;
  private Timestamp createdAt;
  private Timestamp updatedAt;

  private int parentBIndex;
    
} // end class