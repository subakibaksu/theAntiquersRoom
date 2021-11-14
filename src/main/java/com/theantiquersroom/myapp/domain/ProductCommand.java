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

    private String category_id;
    private String searchQuery;
    private String filter;

}
