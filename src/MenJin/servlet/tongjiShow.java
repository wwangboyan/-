package MenJin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import MenJin.dao.StudentDao;
import MenJin.dao.impl.StudentDaoimp;
import MenJin.entity.Student;

/**
 * Servlet implementation class tongjiShow
 */
@WebServlet("/tongjiShow")
public class tongjiShow extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public tongjiShow() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
				
		StudentDao person = new StudentDaoimp();
		int list1 = person.selectCountByZhuangtai("1");
		request.setAttribute("list1", list1);	
		int list2 = person.selectCountByZhuangtai("0");
		request.setAttribute("list2", list2);		
		request.getRequestDispatcher("tongji.jsp").forward(request, response);
	}

}
