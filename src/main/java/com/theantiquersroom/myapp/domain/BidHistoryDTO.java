package com.theantiquersroom.myapp.domain;

import lombok.Data;

import java.util.Date;


@Data
public class BidHistoryDTO {

    private Date bidAt;
    private String userId;
    private Integer bidPrice;
    private Integer pId;

}
