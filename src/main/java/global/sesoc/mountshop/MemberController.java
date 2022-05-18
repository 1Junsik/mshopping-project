package global.sesoc.mountshop;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import global.sesoc.mountshop.dao.MemberDAO;
import global.sesoc.mountshop.vo.MemberVO;

@Controller
@RequestMapping("member")
public class MemberController {
	
	@Autowired
	MemberDAO dao;
	
	// 입력받은 패스워드를 Bcrypt로 암호화
	@Autowired
	BCryptPasswordEncoder passEncoder;
	
	private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

	// 회원 가입 (GET)
	@RequestMapping(value = "signup", method = RequestMethod.GET)
	public String signup() {
		logger.info("get signup");
		
		return "member/signup";
	}
	
	// 회원 가입 (POST)
	@RequestMapping(value = "signup", method = RequestMethod.POST)
	public String signup(MemberVO member) {
		logger.info("post signup");
		
		String inputPass = member.getUserPass();
		String pass = passEncoder.encode(inputPass);
		member.setUserPass(pass);
		
		dao.signup(member);
		
		return "redirect:/";
	}
	
	// 로그인 (GET)
	@RequestMapping(value = "signin", method = RequestMethod.GET)
	public String signin() {
		logger.info("get signin");
		
		return "member/signin";
	}
	
	// 로그인 (POST)
	@RequestMapping(value = "signin", method = RequestMethod.POST)
	public String signin(MemberVO member, HttpSession session, RedirectAttributes rttr) {
		logger.info("post signin");
		
		MemberVO login = dao.signin(member);
		
		boolean passMatch = false;
		
		if (login != null) {
			passMatch = passEncoder.matches(member.getUserPass(), login.getUserPass());
		}
		
		if(passMatch) {
			session.setAttribute("member", login);
		} else {
			session.setAttribute("member", null);
			rttr.addFlashAttribute("msg", false);
			return "redirect:signin";
		}
		return "redirect:/";
	}
	
	// 로그아웃
	@RequestMapping(value = "signout", method = RequestMethod.GET)
	public String signout(HttpSession session) {
		logger.info("get signout");
		
		session.invalidate();
		
		return "redirect:/";
	}
}
