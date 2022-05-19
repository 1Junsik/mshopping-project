package global.sesoc.mountshop;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


import global.sesoc.mountshop.dao.AdminDAO;
import global.sesoc.mountshop.dao.MemberDAO;
import global.sesoc.mountshop.utils.UploadFileUtils;
import global.sesoc.mountshop.vo.CategoryVO;
import global.sesoc.mountshop.vo.GoodsVO;
import global.sesoc.mountshop.vo.GoodsViewVO;
import global.sesoc.mountshop.vo.MemberVO;
import global.sesoc.mountshop.vo.OrderListVO;
import global.sesoc.mountshop.vo.OrderVO;
import global.sesoc.mountshop.vo.ReplyListVO;
import global.sesoc.mountshop.vo.ReplyVO;
import net.sf.json.JSONArray;

@Controller
@RequestMapping("admin")
public class AdminController {
	
	@Autowired
	AdminDAO dao;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
	private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

	// 관리자화면
	@RequestMapping(value = "index", method = RequestMethod.GET)
	public String index() {
		logger.info("get index");
		
		return "admin/index";
	}
	
	// 상품 등록 (GET)
	@RequestMapping(value = "goods/register", method = RequestMethod.GET)
	public String getGoodsRegister(Model model) {
		logger.info("get Goods Register");
		
		ArrayList<CategoryVO> category = null;
		category = dao.category();
		
		model.addAttribute("category", JSONArray.fromObject(category));
		
		return "admin/goods/register";
	}
	
	// 상품 등록 (POST)
	@RequestMapping(value = "goods/register", method = RequestMethod.POST)
	public String getGoodsRegister(GoodsVO vo, MultipartFile file) throws Exception {
		logger.info("post Goods Register");
		
		String imgUploadPath = uploadPath + File.separator + "imgUpload";  // 이미지를 업로드할 폴더를 설정 = /uploadPath/imgUpload 
		String ymdPath = UploadFileUtils.calcPath(imgUploadPath);  // 위의 폴더를 기준으로 연월일 폴더를 생성
		String fileName = null;  // 기본 경로와 별개로 작성되는 경로 + 파일이름
				
		if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			// 파일 인풋박스에 첨부된 파일이 없다면(=첨부된 파일이 이름이 없다면)
			
			fileName =  UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
	
			// gdsImg에 원본 파일 경로 + 파일명 저장
			vo.setGdsImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
			// gdsThumbImg에 썸네일 파일 경로 + 썸네일 파일명 저장
			vo.setGdsThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
			
		} else {  // 첨부된 파일이 없으면
			fileName = File.separator + "images" + File.separator + "none.png";
			// 미리 준비된 none.png파일을 대신 출력함
			
			vo.setGdsImg(fileName);
			vo.setGdsThumbImg(fileName);
		}
		
		
		System.out.println("=================");
		
		System.out.println("1 = " + vo.getGdsName());
		System.out.println("1 = " + vo.getGdsPrice());
		System.out.println("1 = " + vo.getGdsDes());
		System.out.println("1 = " + vo.getGdsImg());
		System.out.println("=================");
	
		dao.register(vo);
		return "redirect:../index";
	}
	
	// 상품 목록 (GET)
	@RequestMapping(value = "goods/list", method = RequestMethod.GET)
	public String getGoodslist(Model model) {
		logger.info("get Goods list");
		
		ArrayList<GoodsViewVO> list = dao.goodslist();
		model.addAttribute("list", list);
	
		return "admin/goods/list";
	}
	
	// 상품 조회 (GET)
	@RequestMapping(value = "goods/view", method = RequestMethod.GET)
	public String view(@RequestParam("n") int gdsNum, Model model) {	// URL주소에서 "n"의 값을 찾아서 gdsNum에 전달
		logger.info("get goods view");
		
		GoodsViewVO goods = dao.goodsView(gdsNum);
		model.addAttribute("goods", goods);
		
		return "admin/goods/view";
	}
	
	// 상품 수정(GET)
	@RequestMapping(value = "goods/modify", method = RequestMethod.GET)
	public String getGoodsModify(@RequestParam("n") int gdsNum, Model model) {	// URL주소에서 "n"의 값을 찾아서 gdsNum에 전달
		logger.info("get goods modify");
		
		GoodsViewVO goods = dao.goodsView(gdsNum);
		model.addAttribute("goods", goods);
		
		ArrayList<CategoryVO> category = null;
		category = dao.category();
		model.addAttribute("category", JSONArray.fromObject(category));
		
		return "admin/goods/modify";
	}
	
	// 상품 수정(POST)
	@RequestMapping(value = "goods/modify", method = RequestMethod.POST)
	public String postGoodsModify(GoodsVO vo, MultipartFile file, HttpServletRequest req) throws Exception {
		logger.info("post goods modify");
		
		 // 새로운 파일이 등록되었는지 확인
		 if(file.getOriginalFilename() != null && file.getOriginalFilename() != "") {
			 
		  // 기존 파일을 삭제
		  new File(uploadPath + req.getParameter("gdsImg")).delete();
		  new File(uploadPath + req.getParameter("gdsThumbImg")).delete();
		  
		  // 새로 첨부한 파일을 등록
		  String imgUploadPath = uploadPath + File.separator + "imgUpload";
		  String ymdPath = UploadFileUtils.calcPath(imgUploadPath);
		  String fileName = UploadFileUtils.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
		  
		  vo.setGdsImg(File.separator + "imgUpload" + ymdPath + File.separator + fileName);
		  vo.setGdsThumbImg(File.separator + "imgUpload" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);
		  
		 } else {  // 새로운 파일이 등록되지 않았다면
		  // 기존 이미지를 그대로 사용
		  vo.setGdsImg(req.getParameter("gdsImg"));
		  vo.setGdsThumbImg(req.getParameter("gdsThumbImg"));
		  
		 }
		
		dao.goodsModify(vo);
		
		return "redirect:../index";
	}
	
	// 상품 삭제(POST)
	@RequestMapping(value = "goods/delete", method = RequestMethod.POST)
	public String deleteGoodsModify(@RequestParam("n") int gdsNum) {
		logger.info("post goods delete");
		
		dao.goodsDelete(gdsNum);
		
		return "redirect:../index";
	}
	
	// ck 에디터에서 파일 업로드
	@RequestMapping(value = "goods/ckUpload", method = RequestMethod.POST)
	public void postCKEditorImgUpload(HttpServletRequest req,
	          HttpServletResponse res,
	          @RequestParam MultipartFile upload) throws Exception {
	 logger.info("post CKEditor img upload");
	 
	 // 랜덤 문자 생성
	 UUID uid = UUID.randomUUID();
	 
	 OutputStream out = null;
	 PrintWriter printWriter = null;
	   
	 // 인코딩
	 res.setCharacterEncoding("utf-8");
	 res.setContentType("text/html;charset=utf-8");
	 
	 try {
	  
	  String fileName = upload.getOriginalFilename();  // 파일 이름 가져오기
	  byte[] bytes = upload.getBytes();
	  
	  // 업로드 경로
	  String ckUploadPath = uploadPath + File.separator + "ckUpload" + File.separator + uid + "_" + fileName;
	  
	  out = new FileOutputStream(new File(ckUploadPath));
	  out.write(bytes);
	  out.flush();  // out에 저장된 데이터를 전송하고 초기화
	  
	  String callback = req.getParameter("CKEditorFuncNum");
	  printWriter = res.getWriter();
	  String fileUrl = req.getContextPath() + "/ckUpload/" + uid + "_" + fileName;  // 작성화면
	  
	  // 업로드시 메시지 출력
	  printWriter.println("<script type='text/javascript'>"
	     + "window.parent.CKEDITOR.tools.callFunction("
	     + callback+",'"+ fileUrl+"','이미지를 업로드하였습니다.')"
	     +"</script>");
	  
	  printWriter.flush();
	  
	 } catch (IOException e) { e.printStackTrace();
	 } finally {
	  try {
	   if(out != null) { out.close(); }
	   if(printWriter != null) { printWriter.close(); }
	  } catch(IOException e) { e.printStackTrace(); }
	 }
	 
	 return; 
	}
	
	// 주문 목록
	@RequestMapping(value = "shop/orderList", method = RequestMethod.GET)
	public String getOrderList(Model model) {
	 logger.info("get order list");
	   
	 ArrayList<OrderVO> orderList = dao.orderList();
	 
	 model.addAttribute("orderList", orderList);
	 
	 return "admin/shop/orderList";
	}
	
	// 주문 상세 목록
	@RequestMapping(value = "shop/orderView", method = RequestMethod.GET)
	public String getOrderList(@RequestParam("n") String orderId,
	      OrderVO order, Model model) throws Exception {
	 logger.info("get order view");
	 
	 order.setOrderId(orderId);  
	 ArrayList<OrderListVO> orderView = dao.orderView(order);
	 
	 model.addAttribute("orderView", orderView);
	 
	 return "admin/shop/orderView";
	}
	
	// 주문 상세 목록 - 상태 변경
	@RequestMapping(value = "shop/orderView", method = RequestMethod.POST)
	public String delivery(OrderVO order) {
	 logger.info("post order view");
	 
	 dao.delivery(order);
	 
	 ArrayList<OrderListVO> orderView = dao.orderView(order);
	 GoodsVO goods = new GoodsVO();
	 
	 for(OrderListVO i : orderView) {
		 goods.setGdsNum(i.getGdsNum());
		 goods.setGdsStock(i.getCartStock());
		 dao.changeStock(goods);
	 }
	 
	 return "redirect:orderView?n=" + order.getOrderId();
	}
	
	// 모든 리플
	@RequestMapping(value = "shop/allReply", method = RequestMethod.GET)
	public String getAllReply(Model model) {
	 logger.info("get all reply");
	   
	 ArrayList<ReplyListVO> reply = dao.allReply();
	 
	 model.addAttribute("reply", reply);
	 
	 return "admin/shop/allReply";
	}
	
	// 리플 삭제
	@RequestMapping(value = "shop/allReply", method = RequestMethod.POST)
	public String postAllReply(ReplyVO reply) throws Exception {
		logger.info("post all reply");
				
		dao.deleteReply(reply.getRepNum());
		
		return "redirect:allReply";
	}	
	
	// 주문 삭제
	@RequestMapping(value = "shop/orderList", method = RequestMethod.POST)
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
