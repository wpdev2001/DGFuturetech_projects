package com.wp.graphql.services;

import java.util.List;

import org.springframework.stereotype.Service;

import com.wp.graphql.entities.User;
import com.wp.graphql.helper.ExceptionHelper;
import com.wp.graphql.repositories.UserRepo;

@Service
public class UserService {
	
	private UserRepo userRepo;

	public UserService(UserRepo userRepo) {
		this.userRepo = userRepo;
	}
	
	//Creating user
	public User createUser(User user) {
		return userRepo.save(user);
	}
	
	//Getting all users
	public List<User> getAllUser(){
		return userRepo.findAll();
	}
	
	//Getting single user
	public User getUser(int userId) {
		User user = userRepo.findById(userId).orElseThrow(ExceptionHelper::throwResourceNotFoundException);
		return user;
	}
	
	//Updating user
	//Deleting user
	public boolean deleteUser(int userId) {
		User user = userRepo.findById(userId).orElseThrow(ExceptionHelper::throwResourceNotFoundException);
		userRepo.delete(user);
		return true;
	}

}
