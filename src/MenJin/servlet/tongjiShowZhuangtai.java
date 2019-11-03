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
@WebServlet("/tongjiShowZhuangtai")
public class tongjiShowZhuangtai extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public tongjiShowZhuangtai() {
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
		
		int bj10 = person.selectCountByBanjiAndZhuangtai("1", "0");
		request.setAttribute("bj10", bj10);
		int bj11 = person.selectCountByBanjiAndZhuangtai("1", "1");
		request.setAttribute("bj11", bj11);

		int bj20 = person.selectCountByBanjiAndZhuangtai("2", "0");
		request.setAttribute("bj20", bj20);
		int bj21 = person.selectCountByBanjiAndZhuangtai("2", "1");
		request.setAttribute("bj21", bj21);
		
		int bj30 = person.selectCountByBanjiAndZhuangtai("3", "0");
		request.setAttribute("bj30", bj30);
		int bj31 = person.selectCountByBanjiAndZhuangtai("3", "1");
		request.setAttribute("bj31", bj31);
		
		int bj40 = person.selectCountByBanjiAndZhuangtai("4", "0");
		request.setAttribute("bj40", bj40);
		int bj41 = person.selectCountByBanjiAndZhuangtai("4", "1");
		request.setAttribute("bj41", bj41);
		request.getRequestDispatcher("shebeitong.jsp").forward(request, response);
	}

}
