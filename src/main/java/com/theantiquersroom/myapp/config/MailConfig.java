package com.theantiquersroom.myapp.config;

import lombok.Data;

/**
 * Created by KBS.
 * User: KBS
 * Date: 11/7/2021
 * Time: 오전 2:00
 */

@Data
public class MailConfig {

    public String from;
    private String fromname;
    private String to;
    private String smtp_username;
    private String smtp_password;
    private String host;
    private String port;
    private String subject;
    private String body;

} // end class
