package global.sesoc.mountshop;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import global.sesoc.mountshop.dao.ChatDAO;
import global.sesoc.mountshop.vo.CartVO;
import global.sesoc.mountshop.vo.ChatVO;
import global.sesoc.mountshop.vo.MemberVO;

/**
 * 메인 콘트롤러
 */
@Controller
public class ChatController {
	
	private static final Logger log = LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	ChatDAO dao;

	/**
	 * 채팅 화면으로 이동
	 */
	@RequestMapping(value="chatView", method=RequestMethod.GET)
	public String chatView(Model model, HttpSession session) {
		MemberVO user = (MemberVO) session.getAttribute("member");
		
		log.info("==================================");
		log.info("@ChatController, GET Chat / Username : " + user.getUserName());
		
		model.addAttribute("userid", user.getUserName());
		return "chat";
	}
	
	// 채팅 저장
	@ResponseBody
	@RequestMapping(value = "addChat", method = RequestMethod.POST)
	public int addChat(String message, HttpSession session) {
		log.info("post addChat");
		
		int result = 0;
		
		MemberVO member = (MemberVO) session.getAttribute("member");
		
		String userId = member.getUserId();
		String userName = member.getUserName();
		
		ChatVO chat = new ChatVO();
		
		chat.setUserId(userId);
		chat.setUserName(userName);
		chat.setChCon(message);
		
		result = dao.insertChat(chat);
		
		return result;
	}
	
	// 채팅 불러오기
	@ResponseBody
	@RequestMapping(value = "chatList", method = RequestMethod.POST)
	public ArrayList<ChatVO> chatList() {
		log.info("post chatList");
		
		ArrayList<ChatVO> result = dao.chatList();
		
		return result;
	}
	
	// 전체 채팅 삭제
	@ResponseBody
	@RequestMapping(value = "allDelete", method = RequestMethod.POST)
	public void allDelete() {
		log.info("post allDelete");
		
		dao.allDelete();
	}
}
