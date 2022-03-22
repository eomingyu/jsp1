package day2.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import day1.OracleConnectUtil;
import day2.vo.Member;
import day2.vo.SaleSum;

public class HrdProblemDao {
	
	private static HrdProblemDao dao = new HrdProblemDao();
	private HrdProblemDao() {};
	public static HrdProblemDao getHrdProblemDao() {
		return dao;
	}
	
	//회원 insert	:insert
	public void insert(Member vo) {
		Connection conn = OracleConnectUtil.connect();
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO MEMBER_TBL_02(custno,custname,phone,address,joindate,grade,city) " + 
				"VALUES (MEMBER_SEQ.nextval,?,?,?,?,?,?)";	
		try {
			pstmt=conn.prepareStatement(sql);
			pstmt.setString(1, vo.getCustName());
			pstmt.setString(2, vo.getPhone());
			pstmt.setString(3, vo.getAddress());
			pstmt.setDate(4, vo.getJoindate());
			pstmt.setString(5, vo.getGrade());
			pstmt.setString(6, vo.getCity());
			pstmt.execute();
			System.out.println("회원 정보가 등록되었습니다.");
			pstmt.close();
		} catch (SQLException e) {
			System.out.println("SQL 실행 오류"+e.getMessage());
		}
		OracleConnectUtil.close(conn);
	}
	//회원 update	:update
	public void update(Member vo) {
		Connection conn = OracleConnectUtil.connect();
		PreparedStatement pstmt = null;
		String sql = "UPDATE MEMBER_TBL_02 "
				+ "SET PHONE =?,ADDRESS =?,CITY =? WHERE CUSTNO = ?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, vo.getPhone());
			pstmt.setString(2, vo.getAddress());
			pstmt.setString(3, vo.getCity());
			pstmt.setInt(4, vo.getCustNo());
			pstmt.execute();
			System.out.println("회원 정보가 변경되었습니다.");
			pstmt.close();
		} catch (SQLException e) {
			System.out.println("SQL 실행 오류"+e.getMessage());
		}
		OracleConnectUtil.close(conn);
	}
	
	//회원 전체 select	: selectMemberAll
	public List<Member> selectMemberAll(){
		List<Member> members = new ArrayList<>();
		Connection conn = OracleConnectUtil.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM MEMBER_TBL_02";
		
		try {
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				members.add(new Member(rs.getInt(1),
										rs.getString(2),
										rs.getString(3),
										rs.getString(4),
										rs.getDate(5),
										rs.getString(6),
										rs.getString(7)));
			}
			pstmt.close();
		} catch (SQLException e) {
			System.out.println("SQL 실행 오류"+e.getMessage());
		}
		OracleConnectUtil.close(conn);
		return members;
	}
	//회원 pk select	: selectMember	
	public Member selectMember(int custNo) {
		Member vo = null;
		Connection conn = OracleConnectUtil.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM MEMBER_TBL_02 WHERE CUSTNO =?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, custNo);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				vo = new Member(rs.getInt(1),
								rs.getString(2),
								rs.getString(3),
								rs.getString(4),
								rs.getDate(5),
								rs.getString(6),
								rs.getString(7));
			}
			pstmt.close();
		} catch (SQLException e) {
			System.out.println("SQL 실행 오류"+e.getMessage());
		}
		OracleConnectUtil.close(conn);
		return vo;
		
		
	}
	
	//매출집계 select	:selectSale	
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
			System.out.println("SQL 실행 오류"+e.getMessage());
		}
		OracleConnectUtil.close(conn);
		return sales;
	}
	
	// pk로 데이터 삭제 : delete
	public void delete(int custNo) {
		Connection conn = OracleConnectUtil.connect();
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM MEMBER_TBL_O2 WHERE CUSTNO=?";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, custNo);
			pstmt.execute();
			System.out.println("회원 정보가 삭제되었습니다.");
			pstmt.close();
		} catch (SQLException e) {
			System.out.println("SQL 실행 오류"+e.getMessage());
		}
		OracleConnectUtil.close(conn);
	}
	
	
}
