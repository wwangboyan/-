package MenJin.servlet;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import MenJin.dao.ShebeiDao;
import MenJin.dao.StudentDao;
import MenJin.dao.impl.ShebeiDaoimp;
import MenJin.dao.impl.StudentDaoimp;
import MenJin.entity.Shebei;
import MenJin.entity.Student;

/**
 * Servlet implementation class XiugaiServlet
 */
@WebServlet("/XiugaiServlet")
public class XiugaiServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public XiugaiServlet() {
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
		
		Shebei shebei1=new Shebei();
		String SshebeiId= request.getParameter("SshebeiId");
		int Szhuangtai = Integer.parseInt(request.getParameter("Szhuangtai"));
		int Sbiaoshi = Integer.parseInt(request.getParameter("Sbiaoshi"));
		shebei1.setShebeiId(SshebeiId);
		shebei1.setZhuangtai(Szhuangtai);
		shebei1.setBiaoshi(Sbiaoshi);
		
		ShebeiDaoimp shebieDaoimp=new ShebeiDaoimp();
		Shebei shebei2=shebieDaoimp.getShebeiMoreInfo(shebei1);
/*		
		if(Szhuangtai==0){
		shebei1.setZhuangtai(0);
		System.out.println("设备正在使用，不可以修改状态");
		}*/
		if(Sbiaoshi==0){
		shebei1.setBiaoshi(1);	
		shebei1.setZhuangtai(0);
		shebei1.setShebeiId(SshebeiId);
		}
		if(Sbiaoshi==1){
		shebei1.setBiaoshi(0);
		shebei1.setZhuangtai(0);
		shebei1.setShebeiId(SshebeiId);
		}
/*		shebei1.setShebeiId(SshebeiId);*/
		
		ShebeiDao shebeidao = new ShebeiDaoimp();		
		shebeidao.modifyShebei(shebei1);
  
		response.sendRedirect("shebeiqingkuang.jsp");

	}

}
