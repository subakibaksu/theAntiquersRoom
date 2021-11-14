package com.theantiquersroom.myapp.domain;

import lombok.Data;

import java.util.Date;

@Data
public class AuctionDTO {

    private Integer auctionId;
    private Date staredAt;
    private Date endedAt;
    private Integer stardtedPrice;
    private Integer bidIncrement;
    private String status;
}
