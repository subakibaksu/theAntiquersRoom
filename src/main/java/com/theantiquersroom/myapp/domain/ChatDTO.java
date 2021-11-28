package com.theantiquersroom.myapp.domain;

import lombok.Data;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDateTime;

/**
 * Created by KBS.
 * User: KBS
 * Date: 11/28/2021
 * Time: 오후 10:16
 */

@Data
public class ChatDTO {

    private Integer pid;
    private String userId;
    private String msg;
    @DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
    private LocalDateTime sended_at;

}
