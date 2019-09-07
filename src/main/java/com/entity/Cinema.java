package com.entity;

import java.util.List;

/**
 * 电影院表实体对象
 * @author Wxj
 */
public class Cinema {
	private long cinema_id;
	private String cinema_name;    //影院名称
	private String cinema_address; //影院地址
	private List<Hall> hallList;   //所有的放映厅集合
	
	public long getCinema_id() {
		return cinema_id;
	}
	public void setCinema_id(long cinema_id) {
		this.cinema_id = cinema_id;
	}
	public String getCinema_name() {
		return cinema_name;
	}
	public void setCinema_name(String cinema_name) {
		this.cinema_name = cinema_name;
	}
	public String getCinema_address() {
		return cinema_address;
	}
	public void setCinema_address(String cinema_address) {
		this.cinema_address = cinema_address;
	}
	public List<Hall> getHallList() {
		return hallList;
	}
	public void setHallList(List<Hall> hallList) {
		this.hallList = hallList;
	}
	
	
}
