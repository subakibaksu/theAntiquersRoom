package com.theantiquersroom.myapp.utils;

import lombok.extern.log4j.Log4j2;
import org.springframework.web.socket.handler.TextWebSocketHandler;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by KBS.
 * User: KBS
 * Date: 11/28/2021
 * Time: 오후 4:01
 */


@Log4j2

@RequestMapping("/echo")
public class EchoHandler extends TextWebSocketHandler{

    //세션 리스트
    private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();

    //클라이언트가 연결 되었을 때 실행
    @Override
    public void afterConnectionEstablished(WebSocketSession session) throws Exception {
        sessionList.add(session);
        log.info("{} connected", session.getId());
    }

    //클라이언트가 웹소켓 서버로 메시지를 전송했을 때 실행
    @Override
    protected void handleTextMessage(WebSocketSession session, TextMessage message) throws Exception {
        log.info("from {} send {}", session.getId(), message.getPayload());
        //모든 유저에게 메세지 출력
        for (WebSocketSession sess : sessionList) {
            sess.sendMessage(new TextMessage(session.getId()+message.getPayload()));
        }
    }

    //클라이언트 연결을 끊었을 때 실행
    @Override
    public void afterConnectionClosed (WebSocketSession session, CloseStatus status) throws Exception {
        sessionList.remove(session);
        log.info("{} closed.", session.getId());
    }

}
