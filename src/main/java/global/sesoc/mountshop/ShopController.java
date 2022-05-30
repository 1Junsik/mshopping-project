package global.sesoc.mountshop;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.Calendar;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import global.sesoc.mountshop.dao.ShopDAO;
import global.sesoc.mountshop.utils.PageNavigator;
import global.sesoc.mountshop.vo.CartListVO;
import global.sesoc.mountshop.vo.CartVO;
import global.sesoc.mountshop.vo.CategoryVO;
import global.sesoc.mountshop.vo.GoodsViewVO;
import global.sesoc.mountshop.vo.MemberVO;
import global.sesoc.mountshop.vo.OrderDetailVO;
import global.sesoc.mountshop.vo.OrderListVO;
import global.sesoc.mountshop.vo.OrderVO;
import global.sesoc.mountshop.vo.ReplyListVO;
import global.sesoc.mountshop.vo.ReplyVO;

@Controller
@RequestMapping("shop")
public class ShopController {
	
	@Autowired
	ShopDAO dao;
	
	private static final Logger logger = LoggerFactory.getLogger(ShopController.class);
	
	// 페이징 관련 상수값들
	final int countPerPage = 8;		// 페이지당 글 수
	final int pagePerGroup = 5;			// 페이지 이동 링크를 표시할 페이지 수
	
	// 전체 상품 리스트 (GET)
	@RequestMapping(value = "allList", method = RequestMethod.GET)
	public String getAllList(@RequestParam(value="t", defaultValue="") String searchText, 
							 @RequestParam(value="page", defaultValue="1") int page, Model model) {
		logger.info("get allList");
		
		ArrayList<GoodsViewVO> list = null;
		int count = 0; // 전체 상품 총 갯수 
		
		count = dao.goodsTotal_All(searchText);
		
		// 페이지 계산을 위한 객체 생성
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, count);
		
		// 검색어와 시작 위치, 페이지당 글 수를 전달하여 목록 읽기
		list = dao.list_All(searchText, navi.getStartRecord(), navi.getCountPerPage());
		
		model.addAttribute("list", list);
		model.addAttribute("navi", navi);
		model.addAttribute("count", count);
		
		model.addAttribute("searchText", searchText);
		
		return "shop/list";
	}

	// 카테고리별 상품 리스트 (GET)
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public String getList(@RequestParam("c") String cateCode,
						  @RequestParam("l") String level, 
						  @RequestParam(value="t", defaultValue="") String searchText, 
						  @RequestParam(value="pages", defaultValue="1") int page, Model model, CategoryVO vo) {
		logger.info("get list");
//		logger.info("cateCode : {}, level : {}", cateCode, level);
		logger.info("검색어 : {}", searchText);
		logger.info("현재 페이지 : {}", page);
		
		String cateCodeRef = "0";  // 카테고리 참조 코드. 없어도 무관
		
		if(level.equals("1")) { // level 1 = 1차 분류
			ArrayList<GoodsViewVO> list = null;
			int count = 0; // level 1, 상품 총 갯수 
			cateCodeRef = cateCode;
			
			vo.setCateCode(cateCode);
			vo.setCateCodeRef(cateCodeRef);
			
			count = dao.goodsTotal_1(vo, searchText);
			
			// 페이지 계산을 위한 객체 생성
			PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, count);
			
			list = dao.list_1(vo, searchText, navi.getStartRecord(), navi.getCountPerPage());
			
			model.addAttribute("list", list);
			model.addAttribute("navi", navi);
		} else if(level.equals("2")) {	// level 2 = 2차분류
			ArrayList<GoodsViewVO> list = null;
			int count = 0; // level 2, 상품 총 갯수
			
			count = dao.goodsTotal_2(cateCode, searchText);
			
			// 페이지 계산을 위한 객체 생성
			PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, count);
			
			list = dao.list_2(cateCode, searchText, navi.getStartRecord(), navi.getCountPerPage());
			
			
			model.addAttribute("list", list);
			model.addAttribute("navi", navi);
		} else {	// 전체 상품 
			logger.info("get allList");
			ArrayList<GoodsViewVO> list = null;
			int count = 0; // 전체 상품 총 갯수 
			
			count = dao.goodsTotal_All(searchText);
			
			// 페이지 계산을 위한 객체 생성
			PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, count);
			
			// 검색어와 시작 위치, 페이지당 글 수를 전달하여 목록 읽기
			list = dao.list_All(searchText, navi.getStartRecord(), navi.getCountPerPage());
			
			model.addAttribute("list", list);
			model.addAttribute("navi", navi);
		}
		
		model.addAttribute("level", level);
		model.addAttribute("cateCode", cateCode);
		model.addAttribute("searchText", searchText);
		
		return "shop/list";
	}
	
	// 상품 조회 (GET)
	@RequestMapping(value = "view", method = RequestMethod.GET)
	public String signup(@RequestParam("n") int gdsNum, Model model) {
		logger.info("get view");
		
		GoodsViewVO view = dao.goodsView(gdsNum);
		model.addAttribute("view", view);
		
		// 상품번호로 리플 갯수 세기 
		int count = dao.replyCountByNum(gdsNum);
		model.addAttribute("count", count);
		/*
		ArrayList<ReplyListVO> reply = dao.replyList(gdsNum);
		model.addAttribute("reply", reply);
		*/
		
		return "shop/view";
	}
	
	/*
	// 상품 조회 - 리뷰 작성
	@RequestMapping(value = "view", method = RequestMethod.POST)
	public String registReply(ReplyVO reply, HttpSession session) {
		logger.info("post regist reply");
		
		MemberVO member = (MemberVO) session.getAttribute("member");
		reply.setUserId(member.getUserId());
		
		dao.registReply(reply);
		
		return "redirect:view?n=" + reply.getGdsNum();
	} */
	
	// 상품 리뷰 목록 - ajax 
	@ResponseBody
	@RequestMapping(value = "replyList", method = RequestMethod.GET)
	public ArrayList<ReplyListVO> getReplyList(@RequestParam("n") int gdsNum) {
		logger.info("get reply list");
		
		ArrayList<ReplyListVO> reply = dao.replyList(gdsNum);
		
		logger.info("{}", reply);
		
		return reply;
	}
	
	// 상품 리뷰 작성
	@ResponseBody
	@RequestMapping(value = "registReply", method = RequestMethod.POST)
	public void registReply(ReplyVO reply, HttpSession session) {
		logger.info("reply list");
		
		MemberVO member = (MemberVO) session.getAttribute("member");
		reply.setUserId(member.getUserId());
		
		dao.registReply(reply);
	}
	
	// 상품 리뷰 삭제
	@ResponseBody
	@RequestMapping(value = "deleteReply", method = RequestMethod.POST)
	public int getReplyList(ReplyVO reply, HttpSession session) {
		logger.info("post delete reply");
		
		int result = 0;
		
		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = dao.idCheck(reply.getRepNum());
		
		if(member.getUserId().equals(userId)) {
			reply.setUserId(member.getUserId());
			dao.deleteReply(reply);
			
			result = 1;
		}
		return result;
	}
	
	// 상품 리뷰 수정
	@ResponseBody
	@RequestMapping(value = "modifyReply", method = RequestMethod.POST)
	public int modifyReply(ReplyVO reply, HttpSession session) {
		logger.info("modifyReply");
		
		int result = 0;
		
		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = dao.idCheck(reply.getRepNum());
		
		if(member.getUserId().equals(userId)) {
			reply.setUserId(member.getUserId());
			dao.modifyReply(reply);
			
			result = 1;
		}
		return result;
	}
	
	// 카트 담기
	@ResponseBody
	@RequestMapping(value = "addCart", method = RequestMethod.POST)
	public int registReply(CartVO cart, HttpSession session) {
		logger.info("post addCart");
		
		int result = 0;
		
		MemberVO member = (MemberVO) session.getAttribute("member");
		
		if(member != null) {
		cart.setUserId(member.getUserId());
		dao.addCart(cart);
		result = 1;
		}
		
		return result;
	}
	
	// 카트 목록
	@RequestMapping(value = "cartList", method = RequestMethod.GET)
	public String getCartList(HttpSession session, Model model) {
		logger.info("get cart list");
		
		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = member.getUserId();
		
		ArrayList<CartListVO> cartList = dao.cartList(userId);
		
		model.addAttribute("cartList", cartList);
		
		return "shop/cartList";
	}	
	
	// 카트 삭제
	@ResponseBody
	@RequestMapping(value = "deleteCart", method = RequestMethod.POST)
	public int deleteCart(HttpSession session,
	     @RequestParam(value = "chbox[]") ArrayList<String> chArr, CartVO cart) throws Exception {
	 logger.info("delete cart");
	 
	 MemberVO member = (MemberVO)session.getAttribute("member");
	 String userId = member.getUserId();
	 
	 int result = 0;
	 int cartNum = 0;
	 
	 
	 if(member != null) {
	  cart.setUserId(userId);
	  
	  for(String i : chArr) {   
	   cartNum = Integer.parseInt(i);
	   cart.setCartNum(cartNum);
	   dao.deleteCart(cart);
	  }   
	  result = 1;
	 }  
	 return result;  
	}
	
	// 주문 (POST)
	@RequestMapping(value = "cartList", method = RequestMethod.POST)
	public String order(HttpSession session, OrderVO order, OrderDetailVO orderDetail) {
		logger.info("cartList");

		MemberVO member = (MemberVO) session.getAttribute("member");
		String userId = member.getUserId();

		Calendar cal = Calendar.getInstance();
		int year = cal.get(Calendar.YEAR);
		String ym = year + new DecimalFormat("00").format(cal.get(Calendar.MONTH) + 1);
		String ymd = ym +  new DecimalFormat("00").format(cal.get(Calendar.DATE));
		String subNum = "";

		for(int i = 1; i <= 6; i ++) {
			subNum += (int)(Math.random() * 10);
		}

		String orderId = ymd + "_" + subNum;
		
		order.setOrderId(orderId);
		order.setUserId(userId);

		dao.orderInfo(order);
		
		orderDetail.setOrderId(orderId);
		
		logger.info("{}", orderDetail);
		
		dao.orderInfo_Details(orderDetail);
		
		dao.cartAllDelete(userId);
		
		return "redirect:orderList";
	}
	
	// 주문 목록
	@RequestMapping(value = "orderList", method = RequestMethod.GET)
	public String getOrderList(HttpSession session, OrderVO order, Model model,
							   @RequestParam(value="pages", defaultValue="1") int page) {
		logger.info("get order list");
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		String userId = member.getUserId();
		
		order.setUserId(userId);
		
		ArrayList<OrderVO> orderList = null;
		int count = 0; // 유저 주문 목록 총 갯수
		
		count = dao.orderTotalByUser(order);
		
		// 페이지 계산을 위한 객체 생성
		PageNavigator navi = new PageNavigator(countPerPage, pagePerGroup, page, count);	
		
		orderList = dao.orderList(order, navi.getStartRecord(), navi.getCountPerPage());
		
		model.addAttribute("orderList", orderList);
		model.addAttribute("navi", navi);		
		
		return "shop/orderList";
	}
	
	// 주문 상세 목록
	@RequestMapping(value = "orderView", method = RequestMethod.GET)
	public String getOrderList(HttpSession session,
		      				  @RequestParam("n") String orderId,
		      				  OrderVO order, Model model) {
		logger.info("get order view");
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		String userId = member.getUserId();
		
		order.setUserId(userId);
		order.setOrderId(orderId);
		
		ArrayList<OrderListVO> orderView = dao.orderView(order);
		
		model.addAttribute("orderView", orderView);
		
		return "shop/orderView";
	}
	
	// 주문 삭제
	@RequestMapping(value = "orderList", method = RequestMethod.POST)
	public String postOrderList(HttpSession session, OrderVO order, String orderId) {
		logger.info("post order list");
		
		MemberVO member = (MemberVO)session.getAttribute("member");
		String userId = member.getUserId();
		
		order.setUserId(userId);
		order.setOrderId(orderId);
		
		dao.deleteOrderList(order);
		
		return "redirect:orderList";
	}
	
}
