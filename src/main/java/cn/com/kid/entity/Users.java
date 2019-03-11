package cn.com.kid.entity;
//用户类
public class Users {
	private int uid;
	private String userName;
	private String passWord;
	
	public Users(){
	}
	
	public Users(int uid, String userName, String passWord) {
		//super();
		this.uid = uid;
		this.userName = userName;
		this.passWord = passWord;
	}

	public int getUid() {
		return uid;
	}
	public void setUid(int uid) {
		this.uid = uid;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassWord() {
		return passWord;
	}
	public void setPassWord(String passWord) {
		this.passWord = passWord;
	}
	
}
