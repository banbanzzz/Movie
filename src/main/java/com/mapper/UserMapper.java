package com.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.entity.User;
@Repository
public interface UserMapper {
	User findUserById(long user_id);
	Integer addUser(User user);
	Integer deleteUser(long user_id);
	Integer updateUser(User user);
	List<User> findAllUser();
	List<User> findUserByName(String name);
	List<User> findUserLikeName(String name);
}
