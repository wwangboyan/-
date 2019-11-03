package MenJin.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import MenJin.dao.ShebeiDao;
import MenJin.dao.StudentDao;
import MenJin.dao.impl.ShebeiDaoimp;
import MenJin.dao.impl.StudentDaoimp;
import MenJin.entity.Shebei;
import MenJin.entity.Student;

/**
 * Servlet implementation class dakaServlet
 */
@WebServlet("/dakaServlet")
public class dakaServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public dakaServlet() {
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
		// TODO Auto-generated method stub	
		request.setCharacterEncoding("UTF-8");
		
		Student student1=new Student();
		String Sid= request.getParameter("Sid");
		int id = Integer.parseInt(Sid);
		String SshebeiId= request.getParameter("SshebeiId");
		student1.setId(id);
		student1.setShebeiId(SshebeiId);
		
		StudentDaoimp studentDaoimp=new StudentDaoimp();
		Student student2=studentDaoimp.getStudentMoreInfo(student1);
		
		//获取时间
		Date date = new Date();
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd hh-mm-ss");
		String doString = dateFormat.format(date).toString();
		
		//打卡状态
		String daka=student1.getqingkuang();
		daka="1";
		student1.setqingkuang(daka);
		student1.setDakashijian(doString);
		student1.setShebeiId(SshebeiId);
		
		StudentDao studentdao = new StudentDaoimp();		
		studentdao.modifyStudent(student1);
		//设备的修改
		
		Shebei shebei = new Shebei();
		shebei.setShebeiId(SshebeiId);
		//获取信息
		ShebeiDaoimp shebeiDaoimp=new ShebeiDaoimp();
		Shebei shebei2=shebeiDaoimp.getShebeiMoreInfo(shebei);
		//修改设备表示信息
//		int biaoshi1 = shebei.getBiaoshi();
//		biaoshi1 = 1;
//		shebei.setBiaoshi(biaoshi1);
		shebei.setBiaoshi(1);
		shebei.setShebeiId(SshebeiId);
		ShebeiDao sheDao = new ShebeiDaoimp();
		sheDao.biaoShe(shebei);
		response.sendRedirect("daka.jsp");
//		request.getRequestDispatcher("daka.jsp").forward(request, response);
	}

}
