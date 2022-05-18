package global.sesoc.mountshop.dao;

import java.util.ArrayList;

import global.sesoc.mountshop.vo.CategoryVO;
import global.sesoc.mountshop.vo.GoodsVO;
import global.sesoc.mountshop.vo.GoodsViewVO;
import global.sesoc.mountshop.vo.OrderListVO;
import global.sesoc.mountshop.vo.OrderVO;
import global.sesoc.mountshop.vo.ReplyListVO;


public interface AdminMapper {
	// 카테고리
	public ArrayList<CategoryVO> category();
	
	// 상품등록
	public void register(GoodsVO vo);
	
	// 상품목록
	public ArrayList<GoodsViewVO> goodslist();
	
	// 상품조회 + 카테고리 조인
	public GoodsViewVO goodsView(int gdsNum);
	
	// 상품수정
	public void goodsModify(GoodsVO vo);
	
	// 상품삭제
	public void goodsDelete(int gdsNum);
	
	// 주문 목록
	public ArrayList<OrderVO> orderList();
	
	// 특정 주문 목록
	public ArrayList<OrderListVO> orderView(OrderVO order);
	
	// 배송 상태
	public void delivery(OrderVO order);
	
	// 상품 수량 조절
	public void changeStock(GoodsVO goods);
	
	// 모든 리플 
	public ArrayList<ReplyListVO> allReply();
	
	// 리플 삭제
	public void deleteReply(int repNum);		
}
