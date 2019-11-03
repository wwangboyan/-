package MenJin.service;

import java.util.List;

import MenJin.entity.User;

/*
 * @ Copyright (c) Create by JASON  Date:2018-02-10  All rights reserved.
 *
 * @ class description：操作用户
 *
 */
public interface UserService {
	//查找用户
	public List<User> findUser(String username,String password);


}


