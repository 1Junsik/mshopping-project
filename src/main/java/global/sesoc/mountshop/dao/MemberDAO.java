package global.sesoc.mountshop.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import global.sesoc.mountshop.vo.MemberVO;

@Repository
public class MemberDAO {
	
	@Autowired
	SqlSession session;
/*
	public void write(GuestbookVO vo) {
		GuestbookMapper mapper = session.getMapper(GuestbookMapper.class);
		mapper.write(vo);
	}
	
	public ArrayList<GuestbookVO> list() {
		GuestbookMapper mapper = session.getMapper(GuestbookMapper.class);
		ArrayList<GuestbookVO> result = mapper.list();
		return result;
	}
	
	*/

	public void signup(MemberVO member) {
		// TODO Auto-generated method stub
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		mapper.signup(member);
	}

	public MemberVO signin(MemberVO member) {
		MemberMapper mapper = session.getMapper(MemberMapper.class);
		MemberVO result = mapper.signin(member);
		return result;
	}
	
}
