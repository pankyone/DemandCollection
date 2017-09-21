package bean;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PWDreset
 */
public class PWDreset extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PWDreset() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String userselect = request.getParameter("userselect");
		String pwd = request.getParameter("pwd");
		
		String sql="";
		int flag = 0;
		sql="update UserLogin set psw = '" + pwd + "' where username = '" + userselect + "'";
		String sql1="update UserPeople set psw = '" + pwd + "' where username = '" + userselect + "'";
		JBean db = new JBean();
		int i = db.executeUpdate(sql);
		int j = db.executeUpdate(sql1);
		if(i==1&&j==1)
		{
			flag = 1;
		}
		else
		{
			flag = 0;
		}
		response.getWriter().print(flag);
		db.close();
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
