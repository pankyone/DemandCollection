package bean;

import java.sql.ResultSet;
import java.sql.SQLException;

public class GetClassification {

	JBean db = new JBean();
	public String getCF()
	{
		String sql = "Select * From SubjectClassification where code like '%00000' order by code asc";
		ResultSet rs = db.executeQuery(sql);
		String arrCF="";
		String code="";
		try 
		{
			while(rs.next())
			{
				code=rs.getString(1).substring(0, 2);
				arrCF +=code + rs.getString(2)+" ";
			}
			
		} 
		
		catch (SQLException e) {
			// TODO 自动生成的 catch 块
			e.printStackTrace();
		}
		db.close();
		
		return arrCF;
	}
}
