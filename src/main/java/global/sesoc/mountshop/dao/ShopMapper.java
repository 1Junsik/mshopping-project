package global.sesoc.mountshop.dao;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.session.RowBounds;

import global.sesoc.mountshop.vo.CartListVO;
import global.sesoc.mountshop.vo.CartVO;
import global.sesoc.mountshop.vo.CategoryVO;
import global.sesoc.mountshop.vo.GoodsViewVO;
import global.sesoc.mountshop.vo.OrderDetailVO;
import global.sesoc.mountshop.vo.OrderListVO;
import global.sesoc.mountshop.vo.OrderVO;
import global.sesoc.mountshop.vo.ReplyListVO;
import global.sesoc.mountshop.vo.ReplyVO;

public interface ShopMapper {
	
	// 카테고리별 상품 리스트 : 1차 분류
	public ArrayList<GoodsViewVO> list_1(@Param("vo") CategoryVO vo, @Param("searchText") String searchText, RowBounds rb);
	
	// 카테고리별 상품 리스트 : 2차 분류
	public ArrayList<GoodsViewVO> list_2(@Param("cateCode") String cateCode, @Param("searchText") String searchText, RowBounds rb);
	
	// 상품 조회
	public GoodsViewVO goodsView(int gdsNum);
	
	// 상품 리뷰 작성
	public void registReply(ReplyVO reply);
	
	// 상퓸 리뷰 리스트
	public ArrayList<ReplyListVO> replyList(int gdsNum);
	
	// 아이디 체크 
	public String idCheck(int repNum);
	
	// 상품 리뷰 삭제
	public void deleteReply(ReplyVO reply);
	
	// 상품 리뷰 수정
	public void modifyReply(ReplyVO reply);
	
	// 카트 담기
	public void addCart(CartVO cart);
	
	// 카트 목록
	public ArrayList<CartListVO> cartList(String userId);
	
	// 카트 삭제
	public void deleteCart(CartVO cart);

	// 주문 정보
	public void orderInfo(OrderVO order);

	// 주문 상세 정보
	public void orderInfo_Details(OrderDetailVO orderDetail);
	
	// 카트 비우기
	public void cartAllDelete(String userId);

	// 주문 목록 
	public ArrayList<OrderVO> orderList(OrderVO order, RowBounds rb);
	
	// 주문 상세 목록
	public ArrayList<OrderListVO> orderView(OrderVO order);
	
	// 주문 삭제
	public void deleteOrderList(OrderVO order);
	
	// 카테고리 갯수 세기
	public int replyCountByNum(int gdsNum);

	// 1차 분류 : 상품 총 갯수 
	public int goodsTotal_1(@Param("vo") CategoryVO vo, @Param("searchText") String searchText);
	
	// 2차 분류 : 상품 총 갯수 
	public int goodsTotal_2(@Param("cateCode") String cateCode, @Param("searchText") String searchText);
	
	// 전체 상품 리스트
	public ArrayList<GoodsViewVO> list_All(String searchText, RowBounds rb);
	
	// 전체 상품 총갯수
	public int goodsTotal_All(String searchText);
	
	// 유저 주문 목록 총 갯수
	public int orderTotalByUser(OrderVO order);

}
