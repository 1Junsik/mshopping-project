package global.sesoc.mountshop;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import global.sesoc.mountshop.vo.MemberVO;

/**
 * 메인 콘트롤러
 */
@Controller
public class ChatController {
	
	private static final Logger log = LoggerFactory.getLogger(HomeController.class);

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
}
