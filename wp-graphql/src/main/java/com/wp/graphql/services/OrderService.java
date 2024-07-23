package com.wp.graphql.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.wp.graphql.entities.Order;
import com.wp.graphql.helper.ExceptionHelper;
import com.wp.graphql.repositories.OrderRepo;

@Service
public class OrderService {
	
	private OrderRepo orderRepo;

	public OrderService(OrderRepo orderRepo) {
		this.orderRepo = orderRepo;
	}
	
	//Create order
	public Order createOrder(Order order) {
		return orderRepo.save(order);
	}
	
	//Get all order
	public List<Order> getAllOrders(){
		return orderRepo.findAll();
	}
	
	//Get single order
	public Order getOrder(int orderId) {
		Order order = orderRepo.findById(orderId).orElseThrow(ExceptionHelper::throwResourceNotFoundException);
		return order;
	}
	
	//Delete order
	public boolean deleteOrder(int orderId) {
		Order order = orderRepo.findById(orderId).orElseThrow(ExceptionHelper::throwResourceNotFoundException);
		orderRepo.delete(order);
		return true;
	}
	
	
}
