package bean;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PowerSelect
 */
public class PowerSelect extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PowerSelect() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");

		String change=request.getParameter("change");
		String sql="";
		if(change!="please")
		{
			request.getSession().setAttribute("rolename", change);
		
			sql="Select power_list From UserRoles where power_name ='" + change + "'";
		}
		String power_list="";
		JBean db = new JBean();
		ResultSet rs = db.executeQuery(sql);
		
		try 
		{
			while(rs.next())
			{
				
				if(rs.getString(1).equals("all"))
				{
					power_list += "t1 t2 t3 c1 c2 c3 c4";
				}
				else
				{
					power_list += rs.getString(1);
				}

			}
			
		} 
		
		catch (SQLException e) {
			e.printStackTrace();
		}
		
		response.getWriter().print(power_list);
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
