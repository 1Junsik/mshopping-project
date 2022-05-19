package global.sesoc.mountshop.dao;

import java.util.ArrayList;

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
	public ArrayList<GoodsViewVO> goodslist() {
		AdminMapper mapper = session.getMapper(AdminMapper.class);
		ArrayList<GoodsViewVO> result = mapper.goodslist();
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
	public ArrayList<OrderVO> orderList() {
		AdminMapper mapper = session.getMapper(AdminMapper.class);
		ArrayList<OrderVO> result = mapper.orderList();
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
	public ArrayList<ReplyListVO> allReply() {
		AdminMapper mapper = session.getMapper(AdminMapper.class);
		ArrayList<ReplyListVO> result = mapper.allReply();
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
	
}
