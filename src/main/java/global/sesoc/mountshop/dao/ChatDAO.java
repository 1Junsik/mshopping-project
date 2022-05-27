package global.sesoc.mountshop.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.mountshop.vo.CartListVO;
import global.sesoc.mountshop.vo.CartVO;
import global.sesoc.mountshop.vo.CategoryVO;
import global.sesoc.mountshop.vo.ChatVO;
import global.sesoc.mountshop.vo.GoodsViewVO;
import global.sesoc.mountshop.vo.MemberVO;
import global.sesoc.mountshop.vo.OrderDetailVO;
import global.sesoc.mountshop.vo.OrderListVO;
import global.sesoc.mountshop.vo.OrderVO;
import global.sesoc.mountshop.vo.ReplyListVO;
import global.sesoc.mountshop.vo.ReplyVO;

@Repository
public class ChatDAO {
	
	@Autowired
	SqlSession session;
	
	// 채팅 저장
	public int insertChat(ChatVO chat) {
		ChatMapper mapper = session.getMapper(ChatMapper.class);
		int result = mapper.insertChat(chat);
		return result;
	}

	// 채팅 불러오기
	public ArrayList<ChatVO> chatList() {
		ChatMapper mapper = session.getMapper(ChatMapper.class);
		ArrayList<ChatVO> result = mapper.chatList();
		return result;
	}
	
	// 전체 채팅 삭제
	public void allDelete() {
		ChatMapper mapper = session.getMapper(ChatMapper.class);
		mapper.allDelete();
		
	}
}
