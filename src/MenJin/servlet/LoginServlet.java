package MenJin.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import MenJin.dao.UserDao;
import MenJin.dao.impl.UserDaoimp;
import MenJin.entity.User;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=utf-8");
		//获取类型
		String type=request.getParameter("type");
		System.out.println(type);
		PrintWriter out=response.getWriter();
		//判断类型
		if("2".equals(type)){
			//管理员
			request.getRequestDispatcher("index.jsp").forward(request, response);
			}
		else{
			String name=request.getParameter("name");
			String pwd=request.getParameter("pwd");	
			HttpSession session = request.getSession();
			UserDao userDao = new UserDaoimp();
			User user = new User(); 
			List<User> list=userDao.findUser(name,pwd);
			if(list.size()>0){
				response.sendRedirect("daka.jsp");
			}else{
				request.setAttribute("message", "账号密码不匹配！");
				request.getRequestDispatcher("login.jsp").forward(request, response);
			}
			
		}
		}


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
