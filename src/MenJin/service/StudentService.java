package MenJin.service;

import java.util.List;

import MenJin.entity.Student;

/*
 * @ Copyright (c) Create by JASON  Date:2018-02-10  All rights reserved.
 *
 * @ class description：操作学生
 *
 */
public interface StudentService {
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
	//查找有没有指定的学生
	public boolean findStudent(Student student);
	//查找学生
	public List<Student> selectByCondition(Student student);
	//
	public int selectCountByZhuangtai(String zhuangtai);
	
}



