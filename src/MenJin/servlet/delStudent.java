package MenJin.servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import MenJin.dao.StudentDao;
import MenJin.dao.impl.StudentDaoimp;
import MenJin.entity.Student;
import MenJin.service.StudentService;
import MenJin.service.imple.StudentServiceimp;


/*
 * @ Copyright (c) Create by JASON  Date:2018-02-11  All rights reserved.
 *
 * @ class description：
 *
 */
@WebServlet("/delStudent")
public class delStudent extends HttpServlet {

	private static final long serialVersionUID = 8988759302676261138L;

	public delStudent() {
		super();
	}

	public void destroy() {
		super.destroy(); 
	}
	
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
		StudentDao stu = new StudentDaoimp();
        
        String sid=request.getParameter("id");
        int id=Integer.parseInt(sid);       
	/*	int id = Integer.valueOf(request.getParameter("id"));*/		
        stu.delStudent(id);
		
		response.sendRedirect("index.jsp");	
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.doGet(request, response);
	}


}


