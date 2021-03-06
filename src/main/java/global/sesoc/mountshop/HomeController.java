package global.sesoc.mountshop;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * 메인 콘트롤러
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * 메인 화면으로 이동
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		
		return "home";
	}
	
	/**
	 * index1.jsp으로 이동
	 */
	@RequestMapping(value = "admin/index1", method = RequestMethod.GET)
	public String index1() {
		
		return "admin/index1";
	}
	
	  /**
	   * 사이트 소개(intro.jsp)로 이동
	   */
	  @RequestMapping(value = "intro", method = RequestMethod.GET)
	  public String intro() {
	      
	     return "intro";
	  }
}
