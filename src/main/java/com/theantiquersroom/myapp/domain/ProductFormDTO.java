package com.theantiquersroom.myapp.domain;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;

@Data
public class ProductFormDTO {

    private Integer pId;
    private String name;
    private String content;
    private Integer categoryId;
    private String userId;

    // 경매관련
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime startedAt;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime endedAt;
    private Integer startedPrice;
    private Integer bidIncrement;
    private String status;
}
