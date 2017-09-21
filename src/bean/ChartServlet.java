package bean;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class ChartServlet
 */
public class ChartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChartServlet() {
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
		
		String sql="";
		String searcharr = request.getParameter("search");
		String searcharr1 = request.getParameter("search1");
		String searcharr2 = request.getParameter("search2");
		String textarr = request.getParameter("text");
		String tongji = request.getParameter("tongji");
		String[] searchword = searcharr.split(" ");
		String[] searchtype1 = searcharr1.split(" ");
		String[] searchtype2 = searcharr2.split(" ");
		String[] text = textarr.split(" ");
		String addsql="";

		if(searcharr==""||textarr=="")
		{
			addsql="";
		}
		else
		{
			addsql += " where (xqstatus2=1) and (";
			if(searchword.length==1)
			{
				if(searchtype2[0].equals("mohu"))
				{
					addsql +=  searchword[0] + " like '%" + text[0] + "%'";
				}
				else
				{
					addsql +=  searchword[0] + " = '" + text[0] + "'";
				}
			}
			else
			{
				for(int i = 0;i<searchword.length-1;i++)
				{
					if(searchtype2[i].equals("mohu"))
					{
						addsql +=  searchword[i] + " like '%" + text[i] + "%' " + searchtype1[i] + " ";
					}
					else
					{
						addsql +=  searchword[i] + " = '" + text[i] + "' " + searchtype1[i] + " ";
					}
				}
				if(searchtype2[searchword.length-1].equals("mohu"))
				{
					addsql += searchword[searchword.length-1] + " like '%" + text[searchword.length-1] + "%'";
				}
				else
				{
					addsql += searchword[searchword.length-1] + " = '" + text[searchword.length-1] + "'";
				}
			}
		}
		sql= "select "+tongji+",COUNT(*) from JiGou join XuQiu on JiGou.code = XuQiu.code" + addsql + ") group by "+tongji;

		
		JSONObject result = new JSONObject();
		JSONArray jsonArray = new JSONArray();
		JBean db = new JBean();
		ResultSet rs = db.executeQuery(sql);
		
		try {
			while(rs.next())
			{
				JSONObject json =  new JSONObject();
				json.put("value", rs.getString(2));
				json.put("color", "#F7464A");
				json.put("highlight", "#FF5A5E");
				json.put("label", rs.getString(1));
				jsonArray.add(json);
			}
			result.put("pieResult", jsonArray);
		} catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		db.close();
		response.getWriter().print(result);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
