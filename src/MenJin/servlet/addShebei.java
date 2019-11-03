package MenJin.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import MenJin.dao.ShebeiDao;
import MenJin.dao.impl.ShebeiDaoimp;
import MenJin.entity.Shebei;

/**
 * Servlet implementation class addShebei
 */
@WebServlet("/addShebei")
public class addShebei extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public addShebei() {
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
		
		String shebeiId = request.getParameter("shebeiId");
		String quyue = request.getParameter("quyue");
		String didian = request.getParameter("didian");
		int zhuangtai = Integer.valueOf(request.getParameter("zhuangtai"));
		
		Shebei sh = new Shebei();
		sh.setShebeiId(shebeiId);
		sh.setQuyue(quyue);
		sh.setDidian(didian);
		sh.setZhuangtai(zhuangtai);
		
		ShebeiDao shebeiDao = new ShebeiDaoimp();
		shebeiDao.addShebei(sh);
		response.sendRedirect("shebeiqingkuang.jsp");
	}

}
