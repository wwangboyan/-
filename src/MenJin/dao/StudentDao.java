package MenJin.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.taglibs.standard.lang.jstl.test.beans.PublicBean1;
import MenJin.entity.Student;

//对学生表接口

public interface StudentDao {
	//获取所有学生
	public List<Student> getAllStudent();
	//获取指定学生
	public Student getStudentMoreInfo(Student student);
	//添加学生
	public int addStudent(Student student);
	//删除学生
	public int delStudent(int id);
	//学生信息(daka)
	public int modifyStudent(Student student);
	//查找指定的学生存在不存在
	public boolean findStudent(Student student);
	//查找学生
	public List<Student> selectByCondition(Student student);
	public List<Student> selectByCondition(String shebeiId);
	//统计打卡情况
	public int selectCountByZhuangtai(String qingkuang);
	//统计设备人数
	public int  selectCountByBanjiAndZhuangtai(String shebeiId,String qingkuang);

}


