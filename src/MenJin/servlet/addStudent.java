package MenJin.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.fabric.xmlrpc.base.Data;

import MenJin.dao.StudentDao;
import MenJin.dao.impl.StudentDaoimp;
import MenJin.entity.Shebei;
import MenJin.entity.Student;
import MenJin.service.ShebeiService;
import MenJin.service.StudentService;
import MenJin.service.imple.ShebeiServiceimp;
import MenJin.service.imple.StudentServiceimp;

/*
 * @ Copyright (c) Create by JASON  Date:2018-02-11  All rights reserved.
 *
 * @ class description：添加学生到数据库，
 *
 */
@WebServlet("/addStudent")
public class addStudent extends HttpServlet {

	private static final long serialVersionUID = 5804433309240831094L;

	public addStudent() {
		super();
	}

	public void destroy() {
		super.destroy(); 
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        this.doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {		
		request.setCharacterEncoding("UTF-8");	
		String name = request.getParameter("name");
		String xuehao = request.getParameter("xuehao");
		String shebeiId = request.getParameter("shebeiId");
		String qingkuang = request.getParameter("qingkuang");
		Student stu = new Student();
		stu.setName(name);
		stu.setXuehao(xuehao);
		stu.setShebeiId(shebeiId);	
		stu.setqingkuang(qingkuang);
		StudentDao studentdao = new StudentDaoimp();		
		studentdao.addStudent(stu);
		response.sendRedirect("index.jsp");
	}

	public void init() throws ServletException {
	}

}


