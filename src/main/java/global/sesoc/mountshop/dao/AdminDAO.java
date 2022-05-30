package global.sesoc.mountshop.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.mountshop.vo.CategoryVO;
import global.sesoc.mountshop.vo.GoodsVO;
import global.sesoc.mountshop.vo.GoodsViewVO;
import global.sesoc.mountshop.vo.MemberVO;
import global.sesoc.mountshop.vo.OrderListVO;
import global.sesoc.mountshop.vo.OrderVO;
import global.sesoc.mountshop.vo.ReplyListVO;

@Repository
public class AdminDAO {
	
	@Autowired
	SqlSession session;

	// 카테고리
	public ArrayList<CategoryVO> category() {
		AdminMapper mapper = session.getMapper(AdminMapper.class);
		ArrayList<CategoryVO> result = mapper.category();
		return result;
	}
	
	// 상품등록
	public void register(GoodsVO vo) {
		AdminMapper mapper = session.getMapper(AdminMapper.class);
		mapper.register(vo);
	}
	
	// 상품목록
	public ArrayList<GoodsViewVO> goodslist(String searchText, int startRecord, int countPerPage) {
		AdminMapper mapper = session.getMapper(AdminMapper.class);
		
		// 전체 검색 결과 중 읽을 시작위치와 개수
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		
		ArrayList<GoodsViewVO> result = mapper.goodslist(searchText, rb);
		
		return result;
	}
	
	// 상품조회 + 카테고리 조인
	public GoodsViewVO goodsView(int gdsNum) {
		AdminMapper mapper = session.getMapper(AdminMapper.class);
		GoodsViewVO result = mapper.goodsView(gdsNum);
		return result;
	}
	
	// 상품 수정
	public void goodsModify(GoodsVO vo) {
		AdminMapper mapper = session.getMapper(AdminMapper.class);
		mapper.goodsModify(vo);
	}
	
	// 상품 삭제
	public void goodsDelete(int gdsNum) {
		AdminMapper mapper = session.getMapper(AdminMapper.class);
		mapper.goodsDelete(gdsNum);
	}

	// 주문 목록
	public ArrayList<OrderVO> orderList(String searchText, int startRecord, int countPerPage) {
		AdminMapper mapper = session.getMapper(AdminMapper.class);
		
		// 전체 검색 결과 중 읽을 시작위치와 개수
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		
		ArrayList<OrderVO> result = mapper.orderList(searchText, rb);
		return result;
	}
	
	// 특정 주문 목록
	public ArrayList<OrderListVO> orderView(OrderVO order) {
		AdminMapper mapper = session.getMapper(AdminMapper.class);
		ArrayList<OrderListVO> result = mapper.orderView(order);
		return result;
	}
	
	// 배송 상태
	public void delivery(OrderVO order) {
		AdminMapper mapper = session.getMapper(AdminMapper.class);
		mapper.delivery(order);
	}	
	
	// 상품 수량 조절
	public void changeStock(GoodsVO goods) {
		AdminMapper mapper = session.getMapper(AdminMapper.class);
		mapper.changeStock(goods);
	}
	
	// 모든 리플 
	public ArrayList<ReplyListVO> allReply(String searchText, int startRecord, int countPerPage) {
		AdminMapper mapper = session.getMapper(AdminMapper.class);
		
		// 전체 검색 결과 중 읽을 시작위치와 개수
		RowBounds rb = new RowBounds(startRecord, countPerPage);
		
		ArrayList<ReplyListVO> result = mapper.allReply(searchText, rb);
		return result;
	}
	
	// 리플 삭제
	public void deleteReply(int repNum) {
		AdminMapper mapper = session.getMapper(AdminMapper.class);
		mapper.deleteReply(repNum);
	}
	
	// 주문 삭제
	public void deleteOrderList(OrderVO order) {
		AdminMapper mapper = session.getMapper(AdminMapper.class);
		mapper.deleteOrderList(order);
	}

	// 전체 상품 총 갯수
	public int goodsTotal_All(String searchText) {
		AdminMapper mapper = session.getMapper(AdminMapper.class);
		int result = mapper.goodsTotal_All(searchText);
		return result;
	}
	
	// 주문 목록 총 갯수
	public int orderTotal_All(String searchText) {
		AdminMapper mapper = session.getMapper(AdminMapper.class);
		int result = mapper.orderTotal_All(searchText);
		return result;
	}
	
	
	// 리플 총 갯수
	public int replyTotal_All(String searchText) {
		AdminMapper mapper = session.getMapper(AdminMapper.class);
		int result = mapper.replyTotal_All(searchText);
		return result;
	}
	
}
