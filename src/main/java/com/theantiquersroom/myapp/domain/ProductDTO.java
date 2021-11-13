package com.theantiquersroom.myapp.domain;


import lombok.Data;

import java.util.Date;

@Data
public class ProductDTO {

    private Integer p_id;
    private String name;
    private Date created_at;
    private Date updated_at;
    private String content;
    private Integer category_id;
    private String user_id;

} // end class
