package com.entity;
/**
 * 用户表实体对象
 * @author Wxj
 */
public class User {
	private long user_id;	      
	private String user_name; 	  //用户账号
	private String user_pwd;	  //用户密码
	private String user_email;    //用户邮箱
	private int user_role;    //用户权限 0：普通会员 1：管理员
	private String user_headImg;  //用户头像地址
	
	public long getUser_id() {
		return user_id;
	}
	public void setUser_id(long user_id) {
		this.user_id = user_id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_pwd() {
		return user_pwd;
	}
	public void setUser_pwd(String user_pwd) {
		this.user_pwd = user_pwd;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public int getUser_role() {
		return user_role;
	}
	public void setUser_role(int user_role) {
		this.user_role = user_role;
	}
	public String getUser_headImg() {
		return user_headImg;
	}
	public void setUser_headImg(String user_headImg) {
		this.user_headImg = user_headImg;
	}
	
}
