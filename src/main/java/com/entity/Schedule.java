package com.entity;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

/**
 * 场次表实体对象
 * @author Wxj
 */
public class Schedule {
	private long schedule_id;
	private long hall_id;      //所属放映厅
	private long movie_id;     //放映的电影编号
	//@DateTimeFormat(pattern="yyyy-MM-dd")
	private String schedule_startTime; //电影放映时间
	private int schedule_price; //售价
	private int schedule_remain;  //剩余座位数
	private int schedule_state;   //场次状态 1：上映中 0：下架
	private Hall schedule_hall; //所属放映厅对象
	private Movie schedule_movie; //放映的电影
	private List<Order> orderList; //所有的订单集合
	
	public long getSchedule_id() {
		return schedule_id;
	}
	public void setSchedule_id(long schedule_id) {
		this.schedule_id = schedule_id;
	}
	public int getSchedule_state() {
		return schedule_state;
	}
	public void setSchedule_state(int schedule_state) {
		this.schedule_state = schedule_state;
	}
	public Movie getSchedule_movie() {
		return schedule_movie;
	}
	public void setSchedule_movie(Movie schedule_movie) {
		this.schedule_movie = schedule_movie;
	}
	public long getHall_id() {
		return hall_id;
	}
	public void setHall_id(long hall_id) {
		this.hall_id = hall_id;
	}
	public long getMovie_id() {
		return movie_id;
	}
	public void setMovie_id(long movie_id) {
		this.movie_id = movie_id;
	}
	public String getSchedule_startTime() {
		return schedule_startTime;
	}
	public void setSchedule_startTime(String schedule_startTime) {
		this.schedule_startTime = schedule_startTime;
	}
	public int getSchedule_price() {
		return schedule_price;
	}
	public void setSchedule_price(int schedule_price) {
		this.schedule_price = schedule_price;
	}
	public int getSchedule_remain() {
		return schedule_remain;
	}
	public void setSchedule_remain(int schedule_remain) {
		this.schedule_remain = schedule_remain;
	}
	public Hall getSchedule_hall() {
		return schedule_hall;
	}
	public void setSchedule_hall(Hall schedule_hall) {
		this.schedule_hall = schedule_hall;
	}
	public List<Order> getOrderList() {
		return orderList;
	}
	public void setOrderList(List<Order> orderList) {
		this.orderList = orderList;
	}
	
	
}
