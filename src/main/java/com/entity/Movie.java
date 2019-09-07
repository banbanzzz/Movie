package com.entity;

import java.sql.Date;	//yyyy-mm-dd
import java.util.List; 
/**
 * 电影信息实体对象
 * @author Wxj
 */
public class Movie {
	private long movie_id;
	private String movie_cn_name;
	private String movie_fg_name;
	private String movie_actor;     //演职人员
	private String movie_director;  //导演
	private String movie_detail;    //电影详情
	private String movie_duration;  //电影时长
	private String movie_type; 	    //电影类型
	private float movie_score;      //电影评分
	private float movie_boxOffice;   //票房
	private long movie_commentCount; //电影参评人数
	private Date movie_releaseDate;        //上映时间
	private String movie_country;    //制片地区
	private String movie_picture;    //电影海报地址
	private int movie_state; 		 //电影状态 默认1 1：在线 0：下架
	private List<Comment> commentList; //所有的评论信息
	
	public long getMovie_id() {
		return movie_id;
	}
	public void setMovie_id(long movie_id) {
		this.movie_id = movie_id;
	}
	public String getMovie_cn_name() {
		return movie_cn_name;
	}
	public int getMovie_state() {
		return movie_state;
	}
	public void setMovie_state(int movie_state) {
		this.movie_state = movie_state;
	}
	public void setMovie_cn_name(String movie_cn_name) {
		this.movie_cn_name = movie_cn_name;
	}
	public String getMovie_fg_name() {
		return movie_fg_name;
	}
	public void setMovie_fg_name(String movie_fg_name) {
		this.movie_fg_name = movie_fg_name;
	}
	public String getMovie_actor() {
		return movie_actor;
	}
	public void setMovie_actor(String movie_actor) {
		this.movie_actor = movie_actor;
	}
	public String getMovie_director() {
		return movie_director;
	}
	public void setMovie_director(String movie_director) {
		this.movie_director = movie_director;
	}
	public String getMovie_detail() {
		return movie_detail;
	}
	public void setMovie_detail(String movie_detail) {
		this.movie_detail = movie_detail;
	}
	public String getMovie_duration() {
		return movie_duration;
	}
	public void setMovie_duration(String movie_duration) {
		this.movie_duration = movie_duration;
	}
	public String getMovie_type() {
		return movie_type;
	}
	public void setMovie_type(String movie_type) {
		this.movie_type = movie_type;
	}
	public float getMovie_score() {
		return movie_score;
	}
	public void setMovie_score(float movie_score) {
		this.movie_score = movie_score;
	}
	public float getMovie_boxOffice() {
		return movie_boxOffice;
	}
	public void setMovie_boxOffice(float movie_boxOffice) {
		this.movie_boxOffice = movie_boxOffice;
	}
	public long getMovie_commentCount() {
		return movie_commentCount;
	}
	public void setMovie_commentCount(long movie_commentCount) {
		this.movie_commentCount = movie_commentCount;
	}
	public Date getReleaseDate() {
		return movie_releaseDate;
	}
	public void setReleaseDate(Date releaseDate) {
		this.movie_releaseDate = releaseDate;
	}
	public String getMovie_country() {
		return movie_country;
	}
	public void setMovie_country(String movie_country) {
		this.movie_country = movie_country;
	}
	public String getMovie_picture() {
		return movie_picture;
	}
	public void setMovie_picture(String movie_picture) {
		this.movie_picture = movie_picture;
	}
	public List<Comment> getCommentList() {
		return commentList;
	}
	public void setCommentList(List<Comment> commentList) {
		this.commentList = commentList;
	}
	
	
}
