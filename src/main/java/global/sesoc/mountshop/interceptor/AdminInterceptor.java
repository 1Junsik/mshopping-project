package global.sesoc.mountshop.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import global.sesoc.mountshop.vo.MemberVO;


/**
 * 사용자 로그인 확인 인터셉터. HandlerInterceptorAdapter를 상속받아서 정의.
 */
public class AdminInterceptor extends HandlerInterceptorAdapter {
	private static final Logger logger = LoggerFactory.getLogger(AdminInterceptor.class);

	//콘트롤러의 메서드 실행 전에 처리
	@Override
	public boolean preHandle(HttpServletRequest req,
				HttpServletResponse res, Object obj) throws Exception {
		
		logger.debug("LoginInterceptor 실행");
		
		HttpSession session = req.getSession();
		MemberVO member = (MemberVO)session.getAttribute("member");
		
		if(member == null) {
			res.sendRedirect(req.getContextPath() + "/member/signin");
			return false;
		}
		
		
		if(member.getVerify() != 9) {
			res.sendRedirect(req.getContextPath());
			return false;
		}
		
		//로그인 된 경우 요청한 경로로 진행
		return super.preHandle(req, res, obj);
	}
}