package com.theantiquersroom.myapp.domain;

import lombok.Data;

/**
 * Created by KBS.
 * User: KBS
 * Date: 11/15/2021
 * Time: 오전 4:44
 */
@Data
public class ProductCommand {

    private String category_id; //카테고리아이디
    private String searchQuery; //검색문
    private Integer filter; //필터

} // end Class
