package koreait.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import day1.OracleConnectUtil;
import koreait.vo.HrdMember;
import koreait.vo.SaleSum;

public class HrdMemberDao {
	private static HrdMemberDao dao = new HrdMemberDao();
	private HrdMemberDao() {}
	public static HrdMemberDao getInstance() {
		return dao;
	}
	
	public int getNextSeq() {
		Connection conn = OracleConnectUtil.connect();
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		String sql = "select member_seq.nextval from dual";
		int result = 0;
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			
			if(rs.next()) 
				result = rs.getInt(1);
			pstmt.close();
		} catch (SQLException e) {
			System.out.println("HrdMemberDao getNextSeq 오류 : "+e.getMessage());
		}
		OracleConnectUtil.close(conn);
		return result;
	}
	
	public void insert(HrdMember vo) {
		Connection conn = OracleConnectUtil.connect();
		PreparedStatement pstmt = null;
//		String sql = "INSERT INTO MEMBER_TBL_02(custno,custname,"
//				+ "phone,address,joindate,grade,city) " + 
//				"VALUES (MEMBER_SEQ.nextval,?,?,?,sysdate,?,?)";
		String sql = "INSERT INTO MEMBER_TBL_02(custno,custname,"
				+ "phone,address,joindate,grade,city) " + 
				"VALUES (?,?,?,?,sysdate,?,?)";
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setInt(1,vo.getCustNo());
			pstmt.setString(2, vo.getCustName());
			pstmt.setString(3, vo.getPhone());
			pstmt.setString(4, vo.getAddress());
			pstmt.setString(5, vo.getGrade());
			pstmt.setString(6, vo.getCity());
			pstmt.execute();
			pstmt.close();
		} catch (SQLException e) {
			System.out.println("HrdMemberDao insert 오류 : "+e.getMessage());
		}
		OracleConnectUtil.close(conn);
	}
	
	
	public List<HrdMember> selectAll(){
		List<HrdMember> list = new ArrayList<>();
		Connection conn = OracleConnectUtil.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "select * from member_tbl_02";
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				list.add(new HrdMember(rs.getInt(1), 
									rs.getString(2), 
									rs.getString(3), 
									rs.getString(4), 
									rs.getDate(5), 
									rs.getString(6), 
									rs.getString(7)));
			}
			pstmt.close();
		} catch (SQLException e) {
			System.out.println("HrdMemberDao selectAll 오류 : "+e.getMessage());
		}
		OracleConnectUtil.close(conn);
		return list;
	}
	public HrdMember selectOne(int custno) {
		Connection conn = OracleConnectUtil.connect();
		PreparedStatement pstmt =null;
		ResultSet rs = null;
		HrdMember result = null;
		String sql = "select * from member_tbl_02 where custno=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, custno);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				result = new HrdMember(rs.getInt(1), 
								rs.getString(2), 
								rs.getString(3), 
								rs.getString(4), 
								rs.getDate(5), 
								rs.getString(6), 
								rs.getString(7));
			}
			
			pstmt.close();
		} catch (SQLException e) {
			System.out.println("HrdMemberDao selectOne 오류 : "+e.getMessage());
		}
		OracleConnectUtil.close(conn);
		return result;
	}
	//회원 정보 수정 : phone, address, city 컬럼만 수정하고 조건은 기본키입니다.
	public void update(HrdMember vo) {
		Connection conn = OracleConnectUtil.connect();
		PreparedStatement pstmt = null;
		String sql = "update member_tbl_02 set phone=?,address=?,city=? where custno=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,vo.getPhone());
			pstmt.setString(2,vo.getAddress());
			pstmt.setString(3,vo.getCity());
			pstmt.setInt(4,vo.getCustNo());
			
			pstmt.execute();
			pstmt.close();
		} catch (SQLException e) {
			System.out.println("HrdMemberDao Update 오류 : "+e.getMessage());
		}
		OracleConnectUtil.close(conn);
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
				" WHERE mt.CUSTNO = sale.custno";		
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
