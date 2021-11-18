package com.theantiquersroom.myapp.mapper;

import java.util.List;

import com.theantiquersroom.myapp.domain.QnADTO;

public interface BoardMapper {
	
	public Integer registerQnA(QnADTO dto);

	public List<QnADTO> getList();
	
}
