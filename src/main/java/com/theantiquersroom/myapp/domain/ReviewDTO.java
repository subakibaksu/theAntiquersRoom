package com.theantiquersroom.myapp.domain;

import java.time.LocalDateTime;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ReviewDTO {

	private Integer reviewId;
	private Integer pid;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private LocalDateTime createdAt;
	@DateTimeFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	private LocalDateTime updatedAt;
	private String content;
	private String score;
	private String author;
	private String sellerId;
	private String imageUrl;

} // end class
