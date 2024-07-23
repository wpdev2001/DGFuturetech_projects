package com.wp.graphql.repositories;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.wp.graphql.entities.Order;

@Repository
public interface OrderRepo extends JpaRepository<Order,Integer> {

}
