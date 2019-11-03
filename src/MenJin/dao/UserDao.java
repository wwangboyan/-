package MenJin.dao;

import java.util.List;

import MenJin.entity.User;

/*
 * @ Copyright (c) Create by JASON  Date:2018-02-10  All rights reserved.
 *
 * @ class description：用户操作
 *
 */
public interface UserDao {
	
	//查找用户
	public List<User> findUser(String username,String password);

	
	/*//
	public boolean getSelect(String name,String password);*/

}


