package global.sesoc.mountshop.dao;

import java.util.ArrayList;

import global.sesoc.mountshop.vo.ChatVO;


public interface ChatMapper {
	
	// 채팅방 저장
	public int insertChat(ChatVO chat); 
	
	// 채팅방 불러오기
	public ArrayList<ChatVO> chatList();
	
	// 전체 채팅 삭제
	public void allDelete();

}
