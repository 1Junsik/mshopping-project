package global.sesoc.mountshop.vo;

public class ChatVO {
	private int chatNum;
	private String userId;
	private String userName;   
	private String chCon;
	
	public ChatVO() {}

	public int getChatNum() {
		return chatNum;
	}

	public void setChatNum(int chatNum) {
		this.chatNum = chatNum;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getChCon() {
		return chCon;
	}

	public void setChCon(String chCon) {
		this.chCon = chCon;
	}

	@Override
	public String toString() {
		return "ChatVO [chatNum=" + chatNum + ", userId=" + userId + ", userName=" + userName + ", chCon=" + chCon
				+ "]";
	}
}
