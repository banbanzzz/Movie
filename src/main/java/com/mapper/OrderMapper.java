package com.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.entity.Order;

@Repository
public interface OrderMapper {
	Order findOrderById(String order_id);
	Integer addOrder(Order order);
	Integer updateOrderStateToRefund(String order_id); //申请退票
	Integer updateOrderStateToRefunded(String order_id); //同意退票
	List<Order> findRefundOrderByUserName(String user_name);
	List<Order> findOrdersByUserName(String user_name);
	List<Order> findAllOrders();
	List<Order> findOrdersByScheduleId(long schedule_id);
	List<Order> findOrdersByState(int order_state);
	
}
