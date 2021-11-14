package com.theantiquersroom.myapp.domain;


import java.util.Date;

import lombok.Data;


@Data
public class ProductDTO {

	private Integer pId;
	private String pName;
	private Date createdAt;
	private Date updatedAt;
	private String content;
	private Integer categoryId;
	private String userId;
	
} // end class
