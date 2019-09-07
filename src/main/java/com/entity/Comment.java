package com.entity;
/**
 * 评论表实体对象
 * @author Wxj
 */

import java.util.Date;

public class Comment {
	private long comment_id; 
	private long user_id; //所属用户编号
	private String comment_content; //评论内容
	private long movie_id; //所属电影编号
	private Date comment_time; //评论时间
	private User comment_user; //所属用户
	
	public long getComment_id() {
		return comment_id;
	}
	public void setComment_id(long comment_id) {
		this.comment_id = comment_id;
	}
	public long getUser_id() {
		return user_id;
	}
	public void setUser_id(long user_id) {
		this.user_id = user_id;
	}
	public String getComment_content() {
		return comment_content;
	}
	public void setComment_content(String comment_content) {
		this.comment_content = comment_content;
	}
	public long getMovie_id() {
		return movie_id;
	}
	public void setMovie_id(long movie_id) {
		this.movie_id = movie_id;
	}
	public Date getComment_time() {
		return comment_time;
	}
	public void setComment_time(Date comment_time) {
		this.comment_time = comment_time;
	}
	public User getComment_user() {
		return comment_user;
	}
	public void setComment_user(User comment_user) {
		this.comment_user = comment_user;
	}
}
