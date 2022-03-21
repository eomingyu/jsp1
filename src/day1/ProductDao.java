package day1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class ProductDao {

	private static ProductDao productDao = new ProductDao();
	private ProductDao() {}
	public static ProductDao getProductDao() {
		return productDao;
	}
	
//insert	
	public void insert(Product vo) {
		Connection conn = OracleConnectUtil.connect();
		PreparedStatement pstmt = null;
		String sql = "INSERT INTO TBL_PRODUCT#" + 
				"(PCODE, CATEGORY, PNAME, PRICE)" + 
				"VALUES(?, ?, ?, ?)"; 
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1,vo.getPcode());
			pstmt.setString(2,vo.getCategory());
			pstmt.setString(3,vo.getPname());
			pstmt.setInt(4,vo.getPrice());
			
			pstmt.execute();
			System.out.println("상품 1개가 등록되었습니다.");
			pstmt.close();
		} catch (SQLException e) {
			System.out.println("SQL 실행 오류"+e.getMessage());
		}
		OracleConnectUtil.close(conn);
	}
//update
	public void update(Product vo) {
		Connection conn = OracleConnectUtil.connect();
		PreparedStatement pstmt =null;
		String sql = "UPDATE TBL_PRODUCT# SET CATEGORY=?,"
				+ "PNAME=?,PRICE=? WHERE CUSTOM_ID=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,vo.getCategory());
			pstmt.setString(2,vo.getPname());
			pstmt.setInt(3,vo.getPrice());
			
			pstmt.execute();
			System.out.println("상품 정보가 변경되었습니다.");
			pstmt.close();
			
			
		} catch (SQLException e) {
			System.out.println("SQL 실행 오류 : " + e.getMessage());
		}
		OracleConnectUtil.close(conn);
	}
	
//delete
	public void delete(String pcode) {
		Connection conn = OracleConnectUtil.connect();
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM TBL_PRODUCT# WHERE PCODE=?";
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pcode);
			
			pstmt.execute();
			System.out.println("상품 정보가 삭제되었습니다.");
			pstmt.close();
		} catch (SQLException e) {
			System.out.println("SQL 실행 오류 : " + e.getMessage());
		}
		OracleConnectUtil.close(conn);
	}
//selectOne	
	public Product selectOne(String pcode) {
		Connection conn = OracleConnectUtil.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM TBL_PRODUCT# WHERE PCODE=?";
		Product vo = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pcode);
			rs=pstmt.executeQuery();
			if(rs.next()){
				vo = new Product();
				vo.setPcode(rs.getString(1));
				vo.setCategory(rs.getString(2));
				vo.setPname(rs.getString(3));
				vo.setPrice(rs.getInt(4));
			}
			pstmt.close();
		} catch (SQLException e) {
			System.out.println("SQL 실행 오류: "+e.getMessage());
		}
		OracleConnectUtil.close(conn);
		return vo;
	}
//selectAll
	public List<Product> selectAll(){
		List<Product> products = new ArrayList<>();
		Connection conn = OracleConnectUtil.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM TBL_PRODUCT#";
		try {
			pstmt = conn.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()) {
				products.add(new Product(rs.getString(1)
										,rs.getString(2)
										,rs.getString(3)
										,rs.getInt(4)));
			}
			pstmt.close();
		} catch (SQLException e) {
			System.out.println("SQL 실행 오류: "+e.getMessage());
		}
		OracleConnectUtil.close(conn);
		return products;
	}
//selectCategory
	public List<Product> selectCategory(String category) {
		Connection conn = OracleConnectUtil.connect();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql ="SELECT * FROM TBL_PRODUCT# WHERE CATEGORY=?";
		List<Product> products = new ArrayList<>();
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, category);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				products.add(new Product(rs.getString(1)
										,rs.getString(2)
										,rs.getString(3)
										,rs.getInt(4)));
			}
			pstmt.close();
		} catch (SQLException e) {
			System.out.println("SQL 실행 오류: "+e.getMessage());
		}
		OracleConnectUtil.close(conn);
		return products;
	}
	
}
