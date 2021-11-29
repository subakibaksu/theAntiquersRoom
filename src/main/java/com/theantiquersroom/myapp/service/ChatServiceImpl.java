package com.theantiquersroom.myapp.service;

import com.theantiquersroom.myapp.domain.ChatDTO;
import com.theantiquersroom.myapp.mapper.ChatMapper;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j2;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;


@Log4j2
@NoArgsConstructor

@Service
public class ChatServiceImpl implements ChatService{

    @Setter(onMethod_= {@Autowired} )
    private ChatMapper mapper;

    @Override
    public void sendChat(ChatDTO chatDTO) {
        mapper.insertChat(chatDTO);
    }// sendChat()

    @Override
    public List<ChatDTO> getChat(Integer pId) {
        return mapper.selectChatByProductId(pId);
    }// getChat()

} // end Class
