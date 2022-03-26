package koreait.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import day1.OracleConnectUtil;
import koreait.vo.SaleSum;

public class HrdSaleDao {
	private static HrdSaleDao dao = new HrdSaleDao();
	private HrdSaleDao() {}
	public static HrdSaleDao getInstance() {
		return dao;
	}
	public List<SaleSum> selectSale(){
		List<SaleSum> sales = new ArrayList<>();
		Connection conn = OracleConnectUtil.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT mt.CUSTNO , CUSTNAME , " + 
				" decode(grade,'A','VIP','B','일반','C','직원') AS agrade, " + 
				" asum FROM MEMBER_TBL_02 mt ," + 
				" (SELECT custno, sum(price) AS asum FROM MONEY_TBL_02 mt " + 
				" GROUP BY CUSTNO" + 
				" ORDER BY asum desc) sale" + 
				" WHERE mt.CUSTNO = sale.custno ORDER BY asum desc";		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				sales.add(new SaleSum(rs.getInt(1),
										rs.getString(2),
										rs.getString(3),
										rs.getInt(4)));
			}
			pstmt.close();
		} catch (SQLException e) {
			System.out.println("HrdMemberDao selectSale 오류"+e.getMessage());
		}
		OracleConnectUtil.close(conn);
		return sales;
	}
}
