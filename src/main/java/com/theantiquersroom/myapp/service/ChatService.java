package com.theantiquersroom.myapp.service;

import com.theantiquersroom.myapp.domain.ChatDTO;

import java.util.List;

/**
 * Created by KBS.
 * User: KBS
 * Date: 11/28/2021
 * Time: 오후 10:20
 */
public interface ChatService {

    public abstract void sendChat(ChatDTO chatDTO);

    public abstract List<ChatDTO> getChat(Integer pId);

}
