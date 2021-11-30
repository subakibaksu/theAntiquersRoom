package com.theantiquersroom.myapp.domain;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;
import java.util.Date;


@Data
public class BidHistoryDTO {
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime bidAt;
    private String userId;
    private Integer bidPrice;
    private Integer pid;
    private String nickName;

}
