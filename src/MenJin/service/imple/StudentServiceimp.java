  package MenJin.service.imple;

import java.sql.SQLException;
import java.util.List;

import MenJin.dao.StudentDao;
import MenJin.dao.impl.StudentDaoimp;
import MenJin.entity.Student;
import MenJin.service.StudentService;


/*
 * @ Copyright (c) Create by JASON  Date:2018-02-10  All rights reserved.
 *
 * @ class description：操作学生
 *
 */
public class StudentServiceimp implements StudentService{
	private StudentDao studentDao = null;
	
	public StudentServiceimp(){
		studentDao = new StudentDaoimp();
	}

	@Override
	//获取所有学生信息
	public List<Student> getAllStudent() {
		return studentDao.getAllStudent();
	}

	@Override
	//获取指定学生信息
	public Student getStudentMoreInfo(Student student) {
		return studentDao.getStudentMoreInfo(student);
	}

	@Override
	//添加学生
	public int addStudent(Student student) {
		return studentDao.addStudent(student);
	}

	@Override
	//删除学生
	public int delStudent(int id) {
		return studentDao.delStudent(id);
	}

	@Override
	//修改学生信息
	public int modifyStudent(Student student) {
		return studentDao.modifyStudent(student);
	}
	
	//查找有没有指定的学生
	public boolean findStudent(Student student){
		return studentDao.findStudent(student);
				
	}
	//根据查找
	@Override
	public List<Student>  selectByCondition(Student student) {
		// TODO Auto-generated method stub
		return studentDao.selectByCondition(student);
	}

	@Override
	public int selectCountByZhuangtai(String zhuangtai) {
		// TODO Auto-generated method stub
		return 0;
	}

//	@Override
//	public int selectCountByZhuangtai(String zhuangtai) {
//		// TODO Auto-generated method stub
//		return studentDao.selectByCondition(zhuangtai);;
//	}
}


