package MenJin.dao.impl;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import MenJin.dao.BaseDao;
import MenJin.dao.UserDao;
import MenJin.entity.Student;
import MenJin.entity.User;

/*
 * @ Copyright (c) Create by JASON  Date:2018-02-10  All rights reserved.
 *
 * @ class description：操作用户
 *
 */
public class UserDaoimp extends BaseDao implements UserDao{


	//查找用户
	@Override
	public List<User> findUser(String username, String password) {
		// TODO Auto-generated method stub
		List<User> list = new ArrayList<User>();
		String sql = "SELECT * FROM m_guanliyuan WHERE name=" + username + " and pwd=" + password;
		Object[] params = {};
		ResultSet rs = this.executeQuerySQL(sql, params);
		try {
			while (rs.next()) {
				User user = new User();
				user.setName(rs.getString("name"));
				user.setPwd(rs.getString("pwd"));
				user.setType(rs.getString("type"));
				list.add(user);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}
}


