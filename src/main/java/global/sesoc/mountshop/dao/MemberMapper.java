package global.sesoc.mountshop.dao;

import java.util.ArrayList;

import global.sesoc.mountshop.vo.MemberVO;


public interface MemberMapper {
	void signup(MemberVO member);		// 회원가입

	MemberVO signin(MemberVO member);	// 로그인
}
