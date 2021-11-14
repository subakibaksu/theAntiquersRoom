package com.theantiquersroom.myapp.domain;


import lombok.Data;

import java.util.Date;

@Data
public class ProductDTO {

    private Integer pId;
    private String name;
    private Date createdAt;
    private Date updatedAt;
    private String content;
    private Integer categoryId;
    private String userId;

} // end class
