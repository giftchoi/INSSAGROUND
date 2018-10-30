package org.kosta.inssaground.controller;

import java.util.ArrayList;
import java.util.List;

import org.kosta.inssaground.model.vo.MemberVO;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.web.socket.CloseStatus;
import org.springframework.web.socket.TextMessage;
import org.springframework.web.socket.WebSocketMessage;
import org.springframework.web.socket.WebSocketSession;
import org.springframework.web.socket.handler.TextWebSocketHandler;


public class ChatHandler extends TextWebSocketHandler{
	private List<WebSocketSession> sessionList = new ArrayList<WebSocketSession>();
	
	/*
	 * 접속 종료때 
	 * (non-Javadoc)
	 * @see org.springframework.web.socket.handler.AbstractWebSocketHandler#afterConnectionClosed(org.springframework.web.socket.WebSocketSession, org.springframework.web.socket.CloseStatus)
	 */
	@Override
	public void afterConnectionClosed(WebSocketSession session, CloseStatus status) throws Exception {
		sessionList.remove(session);
		String user = session.getRemoteAddress().getHostName();
		for(int i=0;i<sessionList.size();i++) {
			sessionList.get(i).sendMessage(new TextMessage(user+" 님 접속 종료"));
		}
		
	}
	/*
	 * 접속했을때
	 * (non-Javadoc)
	 * @see org.springframework.web.socket.handler.AbstractWebSocketHandler#afterConnectionEstablished(org.springframework.web.socket.WebSocketSession)
	 */
	@Override
	public void afterConnectionEstablished(WebSocketSession session) throws Exception {
		sessionList.add(session);
		 UsernamePasswordAuthenticationToken token=(UsernamePasswordAuthenticationToken)session.getPrincipal();
		 String memberName = ((MemberVO)token.getPrincipal()).getName();
		System.out.println(memberName+" 접속 성공!!");
		//System.out.println(session.getPrincipal().getName()); 
		String user = session.getRemoteAddress().getHostName();
		System.out.println(session.getRemoteAddress().getAddress()+" 뭔지 확인");
		for(int i=0;i<sessionList.size();i++) {
			sessionList.get(i).sendMessage(new TextMessage(memberName+" 입장!!"));
		}
	}
	/*
	 * 메세지가 들어왔을때
	 * (non-Javadoc)
	 * @see org.springframework.web.socket.handler.AbstractWebSocketHandler#handleMessage(org.springframework.web.socket.WebSocketSession, org.springframework.web.socket.WebSocketMessage)
	 */
	@Override
	public void handleMessage(WebSocketSession session, WebSocketMessage<?> message) throws Exception {
		System.out.println("메시지 도착");
		String payloadMessage = (String)message.getPayload();
		UsernamePasswordAuthenticationToken token=(UsernamePasswordAuthenticationToken)session.getPrincipal();
		 String memberName = ((MemberVO)token.getPrincipal()).getName();
		
		
		//MemberVO memberVO =session.getPrincipal().getName();
		//String user = session.getRemoteAddress().getHostName();
		System.out.println("서버에 도착한 메시지"+ memberName+": "+payloadMessage);
		for(int i=0;i<sessionList.size();i++) {
			sessionList.get(i).sendMessage(new TextMessage(memberName+": "+payloadMessage));
		}
	}
	/*
	 * 오류가 발생했을때
	 * (non-Javadoc)
	 * @see org.springframework.web.socket.handler.AbstractWebSocketHandler#handleTransportError(org.springframework.web.socket.WebSocketSession, java.lang.Throwable)
	 */
	@Override
	public void handleTransportError(WebSocketSession session, Throwable exception) throws Exception {
		super.handleTransportError(session, exception);
		System.out.println("전송 오류 발생");
	}
	
	
	
}
