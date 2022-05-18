package global.sesoc.mountshop.vo;

import java.util.Date;

public class MemberVO {
/*
    userId      varchar2(50)    not null,           -- 아이디
    userPass    varchar2(100)   not null,           -- 비밀번호
    userName    varchar2(30)    not null,           -- 닉네임
    userPhon    varchar2(20)    not null,           -- 연락처
    userAddr1   varchar2(20)    null,               -- 주소(1)
    userAddr2   varchar2(50)    null,               -- 주소(2)
    userAddr3   varchar2(50)    null,               -- 주소(3)
    regiDate    date            default sysdate,    -- 가입날짜
    verify      number          default 0,          -- 인증 여부
 */
	private String userId;
	private String userPass;
	private String userName;
	private String userPhon;
	private String userAddr1;
	private String userAddr2;
	private String userAddr3;
	private Date regDate;
	private int verify;
	
	public MemberVO() {}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPass() {
		return userPass;
	}

	public void setUserPass(String userPass) {
		this.userPass = userPass;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getUserPhon() {
		return userPhon;
	}

	public void setUserPhon(String userPhon) {
		this.userPhon = userPhon;
	}

	public String getUserAddr1() {
		return userAddr1;
	}

	public void setUserAddr1(String userAddr1) {
		this.userAddr1 = userAddr1;
	}

	public String getUserAddr2() {
		return userAddr2;
	}

	public void setUserAddr2(String userAddr2) {
		this.userAddr2 = userAddr2;
	}

	public String getUserAddr3() {
		return userAddr3;
	}

	public void setUserAddr3(String userAddr3) {
		this.userAddr3 = userAddr3;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public int getVerify() {
		return verify;
	}

	public void setVerify(int verify) {
		this.verify = verify;
	}

	@Override
	public String toString() {
		return "MemberVO [userId=" + userId + ", userPass=" + userPass + ", userName=" + userName + ", userPhon="
				+ userPhon + ", userAddr1=" + userAddr1 + ", userAddr2=" + userAddr2 + ", userAddr3=" + userAddr3
				+ ", regDate=" + regDate + ", verify=" + verify + "]";
	}
}
