package com.entity;

import java.util.Date;
import java.util.List;

/**
 * 订单表实体对象
 * @author Wxj
 *
 */
public class Order {
	private String order_id;
	private long user_id;   //所属用户编号
	private long schedule_id;    //所属场次编号,通过schedule_id-》场次信息-》放映厅信息+电影信息
	private String order_position; //电影票座位信息
	private int order_state;  //订单状态 0：退票中 -1：无法退票  1：已支付 2：退票成功
	private int order_price; //订单价格
	private Date order_time; //订单支付时间
	private User order_user;   //所属用户对象
	private Schedule order_schedule; //所属电影场次
	
	public String getOrder_id() {
		return order_id;
	}
	public void setOrder_id(String order_id) {
		this.order_id = order_id;
	}
	public Date getOrder_time() {
		return order_time;
	}
	public void setOrder_time(Date order_time) {
		this.order_time = order_time;
	}
	public int getOrder_price() {
		return order_price;
	}
	public void setOrder_price(int order_price) {
		this.order_price = order_price;
	}
	public long getUser_id() {
		return user_id;
	}
	public void setUser_id(long user_id) {
		this.user_id = user_id;
	}
	public long getSchedule_id() {
		return schedule_id;
	}
	public void setSchedule_id(long schedule_id) {
		this.schedule_id = schedule_id;
	}
	public String getOrder_position() {
		return order_position;
	}
	public void setOrder_position(String order_position) {
		this.order_position = order_position;
	}
	public User getOrder_user() {
		return order_user;
	}
	public int getOrder_state() {
		return order_state;
	}
	public void setOrder_state(int order_state) {
		this.order_state = order_state;
	}
	public void setOrder_user(User order_user) {
		this.order_user = order_user;
	}
	public Schedule getOrder_schedule() {
		return order_schedule;
	}
	public void setOrder_schedule(Schedule order_schedule) {
		this.order_schedule = order_schedule;
	}
	
	
}
