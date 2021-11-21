package com.theantiquersroom.myapp.service;

import java.util.List;

import com.theantiquersroom.myapp.domain.QnADTO;

public interface BoardService {

	public abstract boolean registerQnA(QnADTO dto);
	
	public abstract List<QnADTO> getQnAList();

}
