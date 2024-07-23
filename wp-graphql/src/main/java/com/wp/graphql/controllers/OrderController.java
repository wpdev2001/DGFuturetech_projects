package com.wp.graphql.controllers;

import java.util.List;

import org.springframework.graphql.data.method.annotation.Argument;
import org.springframework.graphql.data.method.annotation.MutationMapping;
import org.springframework.graphql.data.method.annotation.QueryMapping;
import org.springframework.stereotype.Controller;

import com.wp.graphql.entities.Order;
import com.wp.graphql.entities.User;
import com.wp.graphql.services.OrderService;
import com.wp.graphql.services.UserService;

@Controller
public class OrderController {
	
	private UserService userService;
	private OrderService orderService;
	
	public OrderController(UserService userService, OrderService orderService) {
		super();
		this.userService = userService;
		this.orderService = orderService;
	}
	
	//create order
	@MutationMapping
	public Order createOrder(@Argument String orderDetail,@Argument String address,@Argument int price,@Argument int userId) {
		
		User user = userService.getUser(userId);
		
		Order order = new Order();
		order.setOrderDetail(orderDetail);
		order.setAddress(address);
		order.setPrice(price);
		order.setUser(user);
		
		Order order1 = orderService.createOrder(order);
		return order1;
	}
	
	//get orders
	@QueryMapping
	public List<Order> getOrders(){
		return orderService.getAllOrders();
	}
	
	//get order
	@QueryMapping
	public Order getOrder(@Argument int orderId) {
		return orderService.getOrder(orderId);
	}
	
	//delete order
	@MutationMapping
	public boolean deleteOrder(@Argument int orderId) {
		return orderService.deleteOrder(orderId);
	}

}
