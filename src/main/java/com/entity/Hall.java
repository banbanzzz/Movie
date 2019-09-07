package com.entity;

import java.util.List;

/**
 * 放映厅表实体对象
 * @author Wxj
 */
public class Hall {
	private long hall_id;
	private String hall_name;  //放映厅名称
	private int hall_capacity; //放映厅容量
	private long cinema_id;  //所属影院编号
	private Cinema hall_cinema; //所属影院
	private List<Schedule> ScheduleList; //所有的电影场次集合
	public long getHall_id() {
		return hall_id;
	}
	public void setHall_id(long hall_id) {
		this.hall_id = hall_id;
	}
	public List<Schedule> getScheduleList() {
		return ScheduleList;
	}
	public void setScheduleList(List<Schedule> scheduleList) {
		ScheduleList = scheduleList;
	}
	public Cinema getHall_cinema() {
		return hall_cinema;
	}
	public void setHall_cinema(Cinema hall_cinema) {
		this.hall_cinema = hall_cinema;
	}
	public String getHall_name() {
		return hall_name;
	}
	public void setHall_name(String hall_name) {
		this.hall_name = hall_name;
	}
	public int getHall_capacity() {
		return hall_capacity;
	}
	public void setHall_capacity(int hall_capacity) {
		this.hall_capacity = hall_capacity;
	}
	public long getCinema_id() {
		return cinema_id;
	}
	public void setCinema_id(long cinema_id) {
		this.cinema_id = cinema_id;
	}
	
	
}
