package com.service;

import java.util.List;

import com.entity.Order;
import com.github.pagehelper.PageInfo;

public interface IOrderService {
	Order findOrderById(String order_id);
	Integer addOrder(Order order);
	Integer updateOrderStateToRefund(String order_id); //申请退票
	Integer updateOrderStateToRefunded(String order_id); //同意退票
	PageInfo<Order> findOrdersByUserName(Integer page,Integer limit,String user_name);
	List<Order> findAllOrders();
	List<Order> findRefundOrderByUserName(String user_name);
	PageInfo<Order> findOrdersByState(Integer page,Integer limit,int order_state);
	PageInfo<Order> findAllOrdersBySplitPage(Integer page,Integer limit,String keyword);
}
