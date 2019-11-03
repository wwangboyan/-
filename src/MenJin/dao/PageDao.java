package MenJin.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.jdbc.PreparedStatement;
import com.mysql.jdbc.Statement;

import MenJin.entity.Student;

public class PageDao {
	Statement statement = null;
	ResultSet resultSet = null;
	String url="jdbc:mysql://localhost:3306/menjin?useUnicode=true&characterEncoding=UTF-8&useSSL=false";
	String user = "root";
	String password = "1234";
	PreparedStatement pstmt = null;
	Connection conn;

	// 获取总数据，计算总⻚页数
	public int getPage() {
		int recordCount = 0;// 数据总数，6条数据为⼀一⻚页
		int t1 = 0;
		int t2 = 0;
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url, user, password);
			ResultSet result = null;
			String sql = "select count(*) from m_renyuan";
			pstmt = (PreparedStatement) conn.prepareStatement(sql);
			result = pstmt.executeQuery();
			result.next();
			recordCount = result.getInt(1);
			t1 = recordCount % 10;// 判断是否⼤大于⼀一⻚页
			t2 = recordCount / 10;// 整⻚页数
			pstmt.close();
			conn.close();
		} catch (ClassNotFoundException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// 多余⼀一⻚页的数据，⻚页数加⼀一
		if (t1 != 0) {
			t2 = t2 + 1;
		}
		// 返回最终⻚页数
		return t2;
	}


	// 查询员数据
	public List<Student> listUser(int pageNo){
	List<Student> list=new ArrayList<Student>();
	String sql="select id,xuehao,name,dakashijian,shebeiId,qingkuang,caozuo from m_renyuan order by id limit ?,?";
	try {
	Class.forName("com.mysql.jdbc.Driver");
	conn=DriverManager.getConnection(url, user, password);
	ResultSet result=null;
	int pageSize=10;//10条数据为⼀一⻚页
	int page=(pageNo-1)*10;//当前⻚页第⼀一条数据为总数据的第⼏几条
	pstmt=(PreparedStatement) conn.prepareStatement(sql);
	pstmt.setInt(1, page);//设置当前⻚页的第⼀一条数据
	pstmt.setInt(2, pageSize);//设置⻚页⼤大⼩小
	result=pstmt.executeQuery();
	while(result.next()){
		Student stu = new Student();
		stu.setId(result.getInt("id"));
		stu.setName(result.getString("name"));
		stu.setXuehao(result.getString("xuehao"));
		stu.setDakashijian(result.getString("dakashijian"));
		stu.setShebeiId(result.getString("shebeiId"));
		stu.setqingkuang(result.getString("qingkuang"));
		stu.setCaozuo(result.getString("caozuo"));
		list.add(stu);
	}
	pstmt.close();
	conn.close();
	return list;
	} catch (Exception e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
	}
	return null;
	}

	// 查询待审核申请指定⻚页的数据
	public List<Student> listwait(int pageNo){
	List<Student> list=new ArrayList<Student>();
	String sql="select id,xuehao,name,dakashijian,shebeiId,qingkuang,caozuo from m_renyuan where  shebeiId limit ?,?";
	ResultSet result=null;
	try {
	Class.forName("com.mysql.jdbc.Driver");
	conn=DriverManager.getConnection(url, user,password);
	int pageSize=10;//10条数据为⼀一⻚页
	int page=(pageNo-1)*10;//当前⻚页第⼀一条数据为总数据的第⼏几条
	pstmt=(PreparedStatement) conn.prepareStatement(sql);
	pstmt.setInt(1, page);//设置当前⻚页的第⼀一条数据
	pstmt.setInt(2, pageSize);//设置⻚页⼤大⼩小
	result=pstmt.executeQuery();
	while(result.next()){
	Student stu = new Student();
	stu.setId(result.getInt("id"));
	stu.setName(result.getString("name"));
	stu.setXuehao(result.getString("xuehao"));
	stu.setDakashijian(result.getString("dakashijian"));
	stu.setShebeiId(result.getString("shebeiId"));
	stu.setqingkuang(result.getString("qingkuang"));
	stu.setCaozuo(result.getString("caozuo"));
	list.add(stu);
	}
	pstmt.close();
	conn.close();
	return list;
	} catch (Exception e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
	}
	return null;
	}
}
