package com.theantiquersroom.myapp.domain;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;


@Data
public class ProductDTO {


   private Integer pId;
   private String name;
   @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
   private LocalDateTime createdAt;
   @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
   private LocalDateTime updatedAt;
   private String content;
   private Integer categoryId;
   private String userId;
   
   //경매정보
   @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
   private LocalDateTime startedAt;
   @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
   private LocalDateTime endedAt;
   private Integer startedPrice;
   private Integer bidIncrement;
   private String status;
   
   private String nickname;
   private String categoryName;
   
} // end class
