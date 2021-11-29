package com.theantiquersroom.myapp.mapper;

import com.theantiquersroom.myapp.domain.ChatDTO;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * Created by KBS.
 * User: KBS
 * Date: 11/28/2021
 * Time: 오후 10:15
 */

@Mapper
public interface ChatMapper {

    public abstract void insertChat(ChatDTO chatDTO);

    public abstract List<ChatDTO> selectChatByProductId(@Param("pId") Integer pId);

}
