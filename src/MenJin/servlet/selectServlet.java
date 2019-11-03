package MenJin.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import MenJin.dao.StudentDao;
import MenJin.dao.impl.StudentDaoimp;
import MenJin.entity.Student;
import MenJin.service.StudentService;
import MenJin.service.imple.StudentServiceimp;

/**
 * Servlet implementation class selectServlet
 */
@WebServlet("/selectServlet")
public class selectServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public selectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 response.setContentType("text/html; charset=utf-8");
	        // 获取传递过来的参数(查询条件)		 
	        String  shebeiId =request.getParameter("shebeiId");
	        /*Student student = new Student();
			student.setShebeiId(shebeiId);*/
/*			System.out.println(student.getShebeiId());*/
	        StudentDao st = new StudentDaoimp();	        
	        List<Student> list= st.selectByCondition(shebeiId);
	        System.out.println(list);
	        HttpSession session=request.getSession();
	        session.setAttribute("list", list);
	        request.getRequestDispatcher("selectJoin.jsp").forward(request,response);
	    }
	}

