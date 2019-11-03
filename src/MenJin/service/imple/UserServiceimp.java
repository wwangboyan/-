package MenJin.service.imple;

import java.util.List;

import MenJin.dao.UserDao;
import MenJin.dao.impl.UserDaoimp;
import MenJin.entity.User;
import MenJin.service.UserService;

/*
 * @ Copyright (c) Create by JASON  Date:2018-02-10  All rights reserved.
 *
 * @ class description：操作用户
 *
 */
public class UserServiceimp implements UserService{
	UserDao userDao = null;
	
	public UserServiceimp(){
		userDao = new UserDaoimp();
	}
	//查找用户
	@Override
	public List<User> findUser(String username, String password) {
		// TODO Auto-generated method stub
		return userDao.findUser(username, password);
	}



	
	

}


