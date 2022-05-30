package global.sesoc.mountshop.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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

@Repository
public class ShopDAO {
	
	@Autowired
	SqlSession session;
	
	// 카테고리별 상품 리스트 : 1차 분류
	public ArrayList<GoodsViewVO> list_1(CategoryVO vo, String searchText, int startRecord, int countPerPage) {
		ShopMapper mapper = session.getMapper(ShopMapper.class);
		
		// 전체 검색 결과 중 읽을 시작위치와 개수
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		
		ArrayList<GoodsViewVO> result = mapper.list_1(vo, searchText, rb);
		return result;
	}

	// 카테고리별 상품 리스트 : 2차 분류
	public ArrayList<GoodsViewVO> list_2(String cateCode, String searchText, int startRecord, int countPerPage) {
		ShopMapper mapper = session.getMapper(ShopMapper.class);
		
		// 전체 검색 결과 중 읽을 시작위치와 개수
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		
		ArrayList<GoodsViewVO> result = mapper.list_2(cateCode, searchText, rb);
		return result;
	}
	
	// 상품조회
	public GoodsViewVO goodsView(int gdsNum) {
		ShopMapper mapper = session.getMapper(ShopMapper.class);
		GoodsViewVO result = mapper.goodsView(gdsNum);
		return result;
	}
	
	// 상품 리뷰 작성
	public void registReply(ReplyVO reply) {
		ShopMapper mapper = session.getMapper(ShopMapper.class);
		mapper.registReply(reply);
		
	}

	// 상품 리뷰 리스트
	public ArrayList<ReplyListVO> replyList(int gdsNum) {
		ShopMapper mapper = session.getMapper(ShopMapper.class);
		ArrayList<ReplyListVO> result = mapper.replyList(gdsNum);
		return result;
	}
	
	// 아이디 체크
	public String idCheck(int repNum) {
		ShopMapper mapper = session.getMapper(ShopMapper.class);
		String userId = mapper.idCheck(repNum); 
		return userId;
	}
	
	// 상품 리뷰 삭제
	public void deleteReply(ReplyVO reply) {
		ShopMapper mapper = session.getMapper(ShopMapper.class);
		mapper.deleteReply(reply);
	}

	// 상품 리뷰 수정
	public void modifyReply(ReplyVO reply) {
		ShopMapper mapper = session.getMapper(ShopMapper.class);
		mapper.modifyReply(reply);
	}
	
	// 카트 담기
	public void addCart(CartVO cart) {
		ShopMapper mapper = session.getMapper(ShopMapper.class);
		mapper.addCart(cart);
	}

	// 카트 목록
	public ArrayList<CartListVO> cartList(String userId) {
		ShopMapper mapper = session.getMapper(ShopMapper.class);
		ArrayList<CartListVO> result = mapper.cartList(userId);
		return result;
	}
	
	// 카트 삭제
	public void deleteCart(CartVO cart) {
		ShopMapper mapper = session.getMapper(ShopMapper.class);
		mapper.deleteCart(cart);
	}

	// 주문 정보
	public void orderInfo(OrderVO order) {
		ShopMapper mapper = session.getMapper(ShopMapper.class);
		mapper.orderInfo(order);
	}

	// 주문 상세 정보
	public void orderInfo_Details(OrderDetailVO orderDetail) {
		ShopMapper mapper = session.getMapper(ShopMapper.class);
		mapper.orderInfo_Details(orderDetail);
	}

	// 카트 비우기
	public void cartAllDelete(String userId) {
		ShopMapper mapper = session.getMapper(ShopMapper.class);
		mapper.cartAllDelete(userId);
	}

	// 주문 목록
	public ArrayList<OrderVO> orderList(OrderVO order, int startRecord, int countPerPage) {
		ShopMapper mapper = session.getMapper(ShopMapper.class);
		
		// 전체 검색 결과 중 읽을 시작위치와 개수
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		
		ArrayList<OrderVO> result = mapper.orderList(order, rb);
		return result;
	}

	// 주문 상세 목록
	public ArrayList<OrderListVO> orderView(OrderVO order) {
		ShopMapper mapper = session.getMapper(ShopMapper.class);
		ArrayList<OrderListVO> result = mapper.orderView(order);
		return result;
	}
	
	// 주문 삭제
	public void deleteOrderList(OrderVO order) {
		ShopMapper mapper = session.getMapper(ShopMapper.class);
		mapper.deleteOrderList(order);
	}
	
	// 카테고리 갯수 세기
	public int replyCountByNum(int gdsNum) {
		ShopMapper mapper = session.getMapper(ShopMapper.class);
		int result = mapper.replyCountByNum(gdsNum);
		return result;
	}
	
	// 1차 분류 : 상품 총 갯수 
	public int goodsTotal_1(CategoryVO vo, String searchText) {
		ShopMapper mapper = session.getMapper(ShopMapper.class);
		int result = mapper.goodsTotal_1(vo, searchText);
		return result;
	}
	
	// 2차 분류 : 상품 총 갯수
	public int goodsTotal_2(String cateCode, String searchText) {
		ShopMapper mapper = session.getMapper(ShopMapper.class);
		int result = mapper.goodsTotal_2(cateCode, searchText);
		return result;
	}
	
	// 전체 상품 리스트
	public ArrayList<GoodsViewVO> list_All(String searchText, int startRecord, int countPerPage) {
		ShopMapper mapper = session.getMapper(ShopMapper.class);
		// 전체 검색 결과 중 읽을 시작위치와 개수
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		
		// 검색어와 읽을 범위를 전달
		ArrayList<GoodsViewVO> result = mapper.list_All(searchText, rb);
		return result;
	}
	
	// 전체 상품 총 갯수
	public int goodsTotal_All(String searchText) {
		ShopMapper mapper = session.getMapper(ShopMapper.class);
		int result = mapper.goodsTotal_All(searchText);
		return result;
	}
	
	// 유저 주문 목록 총 갯수
	public int orderTotalByUser(OrderVO order) {
		ShopMapper mapper = session.getMapper(ShopMapper.class);
		int result = mapper.orderTotalByUser(order);
		return result;
	}
}
