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
import MenJin.service.ShebeiService;
import MenJin.service.imple.ShebeiServiceimp;

/**
 * Servlet implementation class delShebei
 */
@WebServlet("/delShebei")
public class delShebei extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public delShebei() {
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
		
		ShebeiDao she = new ShebeiDaoimp();
		 String shid=request.getParameter("shebeiId");
	     /*int zhuangtai = Integer.parseInt(request.getParameter("zhuangtai"));
	     if(zhuangtai==0){
	    	System.out.println("设备为可使用状态，不可以删除！"); 
	     }if(zhuangtai==1){
		   System.out.println("设备为不可使用状态，删除成功！"); 
		   she.delShebei(shid);
		  }  */
	     she.delShebei(shid);
		response.sendRedirect("shebeiqingkuang.jsp");	
	}

}
