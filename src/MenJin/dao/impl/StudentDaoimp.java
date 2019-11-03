package MenJin.dao.impl;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.mysql.fabric.xmlrpc.base.Array;
import com.mysql.jdbc.PreparedStatement;

import MenJin.dao.BaseDao;
import MenJin.dao.StudentDao;
import MenJin.entity.Student;

//学生操作
public class StudentDaoimp extends BaseDao implements StudentDao {
	
	@Override
	//获取所有学生信息
	public List<Student> getAllStudent() {
		List<Student> list = new ArrayList<Student>();
		String sql = "select `id`,`name`,`xuehao`,`dakashijian`,`shebeiId`,`qingkuang`,`caozuo` from m_renyuan";
		Object[] params = {};
		ResultSet rs = this.executeQuerySQL(sql, params);
		try {
			while (rs.next()) {
				Student stu = new Student();
				stu.setId(rs.getInt("id"));
				stu.setName(rs.getString("name"));
				stu.setXuehao(rs.getString("xuehao"));
				stu.setDakashijian(rs.getString("dakashijian"));
				stu.setShebeiId(rs.getString("shebeiId"));
				stu.setqingkuang(rs.getString("qingkuang"));
				stu.setCaozuo(rs.getString("caozuo"));
				list.add(stu);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}

	@Override
	//获取指定学生信息
	public Student getStudentMoreInfo(Student student) {
		Student stu = new Student();
		String sql = "select `dakashijian`,`shebeiId`,`qingkuang` from m_renyuan where `id`=?";
		Object[] params = {student.getId()};
		ResultSet rs = this.executeQuerySQL(sql, params);
		try {
			while (rs.next()) {
				stu.setDakashijian(rs.getString("dakashijian"));
				stu.setShebeiId(rs.getString("shebeiId"));
				stu.setqingkuang(rs.getString("qingkuang"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return stu;
	}

	@Override
	//添加学生
	public int addStudent(Student student) {
		int row = 0;
		String sql = "insert into m_renyuan(`id`,`name`,`xuehao`,`dakashijian`,`shebeiId`,`qingkuang`,`caozuo`) values(?,?,?,?,?,?,?)";
		Object[] params = {student.getId(),student.getName(),student.getXuehao(),student.getDakashijian(),student.getShebeiId(),student.getqingkuang(),student.getCaozuo()};
		row = this.executeUpdateSQL(sql, params);
		if(row>0){
			System.out.println("增加学生成功");
		}else{
			System.out.println("增加学生失败");
		}
		return row;
	}

	@Override
	//删除学生
	public int delStudent(int id) {
		int row = 0;
		String sql = "delete from m_renyuan where `id`=?";
		Object[] params = {id};
		row = this.executeUpdateSQL(sql, params);
		if(row>0){
			System.out.println("删除学生成功");
		}else{
			System.out.println("删除学生失败");
		}
		return row;
	}

	@Override
	//修改学生信息
	public int modifyStudent(Student student) {
		int row = 0;
		String sql = "update m_renyuan set `dakashijian`=?,`shebeiId`=?,`qingkuang`=? where `id`=?";
		Object[] params = {student.getDakashijian(),student.getShebeiId(),student.getqingkuang(),student.getId()};
		row = this.executeUpdateSQL(sql, params);
		if(row>0){
			System.out.println("学生打卡成功");
		}else{
			System.out.println("学生打卡失败");
		}
		return row;
	}
	
	//查找指定的学生存在不存在
	public boolean findStudent(Student student){
		boolean flag = true;
		int row = 0;
		String sql = "select count(1) from m_renyuan where  `name`=?and`xuehao`=?and`caozuo`=?and`dakashijian`=?and`shebeiId`=?and`qingkuang`=?";
		Object[] params = {student.getId(),student.getName(),student.getXuehao(),student.getDakashijian(),student.getCaozuo(),student.getShebeiId(),student.getqingkuang()};
		ResultSet rs = this.executeQuerySQL(sql, params);
		try {
			while(rs.next()){
				row = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		if(row>0){
			System.out.println("此学生已经存在");
			flag = true;
		}else{
			System.out.println("没有这个学生");
			flag = false;
		}
		
		return flag;
		
	}
	//设备ID查找学生
	@Override
	public List<Student> selectByCondition(Student student) {
		List<Student> list=new ArrayList<>();
		
		String sql="select `id`,`name`,`xuehao`,`dakashijian`,`shebeiId`,`qingkuang`,`caozuo` from m_renyuan  where `shebeiId` LIKE '%"+student.getShebeiId()+"%' AND `qingkuang` = 1;";
		Object[] params = { };
		ResultSet rs = this.executeQuerySQL(sql, params);		
		try {
			while (rs.next()) {	
				student.setId(rs.getInt("id"));
				student.setName(rs.getString("name"));
				student.setXuehao(rs.getString("xuehao"));
				student.setDakashijian(rs.getString("dakashijian"));			
				student.setqingkuang(rs.getString("qingkuang"));
				student.setCaozuo(rs.getString("caozuo"));				
				student.setShebeiId(rs.getString("shebeiId"));
				list.add(student);
			}
			System.out.println("查找人员成功");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println(list);
		return list;
	}
/*	@Override
	public List<Student> selectByCondition(Student student) {
		List<Student> list=new ArrayList<>();
		Student lists=new Student();
		String sql="select `id`,`name`,`xuehao`,`dakashijian`,`shebeiId`,`qingkuang` from m_renyuan where `shebeiId`=? and `qingkuang`=1";
		Object[] params = { student.getShebeiId() };
		ResultSet rs = this.executeQuerySQL(sql, params);		
		try {
			while (rs.next()) {	
				lists.setId(rs.getInt("id"));
				lists.setName(rs.getString("name"));
				lists.setXuehao(rs.getString("xuehao"));
				lists.setDakashijian(rs.getString("dakashijian"));
				lists.setShebeiId(rs.getString("shebeiId"));
				lists.setqingkuang(rs.getString("qingkuang"));
				list.add(lists);
			}
			System.out.println("查找人员成功");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return list;
	}*/

	@Override
	public int selectCountByZhuangtai(String qingkuang) {
		// TODO Auto-generated method stub
		int count = 0;
		String sql = "select  count(*) from m_renyuan where `qingkuang`="+qingkuang;
		Object[] params = { };
		ResultSet rs = this.executeQuerySQL(sql, params);
		try {
			while(rs.next()){
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(count>0){
			System.out.println("统计学生成功");
		}else{
			System.out.println("统计学生失败");
		}
		return count;
	}

	@Override
	public int selectCountByBanjiAndZhuangtai(String shebeiId, String qingkuang) {
		// TODO Auto-generated method stub
		int count = 0;
		String sql = "select count(*) from m_renyuan where `shebeiId`= " + shebeiId + " and `qingkuang`= " + qingkuang;
		Object[] params = { };
		ResultSet rs = this.executeQuerySQL(sql, params);
		try {
			while(rs.next()){
				count = rs.getInt(1);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		if(count>0){
			System.out.println("设备统计成功");
		}else{
			System.out.println("设备统计失败");
		}
		return count;
	}

	@Override
	public List<Student> selectByCondition(String shebeiId) {
		List<Student> list=new ArrayList<>();
		String sql="select `id`,`name`,`xuehao`,`dakashijian`,`shebeiId`,`qingkuang`,`caozuo` from m_renyuan  where `shebeiId` LIKE '%"+shebeiId+"%' AND `qingkuang` = 1;";
		Object[] params = { };
		ResultSet rs = this.executeQuerySQL(sql, params);		
		try {
			while (rs.next()) {	
				Student student = new Student();
				student.setId(rs.getInt("id"));
				student.setName(rs.getString("name"));
				student.setXuehao(rs.getString("xuehao"));
				student.setDakashijian(rs.getString("dakashijian"));			
				student.setqingkuang(rs.getString("qingkuang"));
				student.setCaozuo(rs.getString("caozuo"));				
				student.setShebeiId(rs.getString("shebeiId"));
				list.add(student);
			}
			System.out.println("查找人员成功");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		System.out.println(list);
		return list;
	}

}


