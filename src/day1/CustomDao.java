package day1;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CustomDao {
	//필드값이 없는 클래스 입니다. -> new 연산으로 객체를 생성했을 때 서로 다른 필드값을 갖는 것이 없습니다.
	// -> static 키워드로 실행 가능한 메소드입니다. static은 메모리의 공유영역입니다.
	// -> jdbc에서 dao 클래스는 static으로 하지 않습니다.-> 싱글턴 객체로  사용합니다.
	
	private static CustomDao customDao = new CustomDao();
	private CustomDao() {}
	public static CustomDao getCustomDao() {
		return customDao;
	}
	//지금 Dao 역할 클래스는 전역변수(클래스의 프로퍼티)가 없습니다.
	// -> 객체를 new로 새로 만들어서 메모리 할당 받아도 저장할 데이터가 없습니다.
	// -> 그래서 메소드만 실행하도록 싱글톤 패턴으로 객체를 생성하도록 구현했습니다.
	
//select 쿼리 (기본키 컬럼으로 조회하고 결과 행 반환)
	public static Custom selectOne(String custom_id) {
		Connection conn = OracleConnectUtil.connect();
		PreparedStatement pstmt = null;
		String sql="select * from tbl_custom# where custom_id =?";
		ResultSet rs =null;
		Custom vo =null;
		//?
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,custom_id);
			rs=pstmt.executeQuery();
			if(rs.next()) {		//조회 결과 1개 행 있으면
					vo=new Custom();
					vo.setCustom_id(rs.getString(1));
					vo.setName(rs.getString(2));
					vo.setEmail(rs.getString(3));
					vo.setAge(rs.getInt(4));
					vo.setReg_date(rs.getDate(5));
			}	//없으면(else) null 반환
			pstmt.close();
		} catch (SQLException e) {
			System.out.println("SQL 실행 오류: "+e.getMessage());
		}
		OracleConnectUtil.close(conn);
		return vo;
	}
//insert 쿼리 실행
	public void insert(Custom vo) {
		Connection conn = OracleConnectUtil.connect();
		String sql = "INSERT INTO TBL_CUSTOM#" + 
				"(CUSTOM_ID, NAME, EMAIL, AGE, REG_DATE)" + 
				"VALUES(?, ?, ?, ?, SYSDATE)";	
		
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, vo.getCustom_id());
			pstmt.setString(2, vo.getName());
			pstmt.setString(3, vo.getEmail());
			pstmt.setInt(4, vo.getAge());
			
			pstmt.execute();	//sql 실행 메소드
			System.out.println("고객 1건이 새로 등록되었습니다.");
			pstmt.close();
			
		} catch (SQLException e) {
			System.out.println("SQL 실행 오류"+e.getMessage());
		}
		OracleConnectUtil.close(conn);
	}
//update 쿼리 실행
//	public void update(String custom_id, String email) {	//방법1)
	public void update(Custom vo) {							//방법2)
		Connection conn = OracleConnectUtil.connect();
		PreparedStatement pstmt = null;
		String sql = "UPDATE TBL_CUSTOM# SET EMAIL=? WHERE CUSTOM_ID=?";
//		String custom_id=null;
//		String email=null;
		
		
		try {
			pstmt = conn.prepareStatement(sql);
//			pstmt.setString(1, email);			//방법1)
//			pstmt.setString(2, custom_id);		//방법1)

			//방법2) 수정할 컬럼이 많을 때 매개변수를 모두 나열하는 것은 비효율적 이므로 객체를 받아옵니다.
			pstmt.setString(1,vo.getEmail());		//방법2) 
			pstmt.setString(2,vo.getCustom_id());	//방법2)
			
			pstmt.execute();
			pstmt.close();

		} catch (SQLException e) {
			System.out.println("SQL 실행 오류 : " + e.getMessage());
		}
		System.out.println("정상적으로 email이 변경 되었습니다.");
		OracleConnectUtil.close(conn);
	}
//delete 쿼리 실행
	public void delete(String custom_id) {
		//custom_id는 이 메소드를 호출할 때 값이 전달됩니다.
		
		Connection conn = OracleConnectUtil.connect();
		PreparedStatement pstmt = null;
		String sql = "DELETE FROM TBL_CUSTOM# WHERE CUSTOM_ID=?";
		//String custom_id = null;
		
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, custom_id);
			pstmt.execute();
			pstmt.close();
		} catch (SQLException e) {
			System.out.println("SQL 실행 오류 : " + e.getMessage());
		}
		System.out.println("정상적으로 회원 탈퇴되었습니다.");
		OracleConnectUtil.close(conn);
	}

//selectOne() 메소드와 쿼리는 동일하지만 리턴 형식이 다른 예시
	public boolean idCheck(String id) {
		boolean result = false;
		Connection conn = OracleConnectUtil.connect();
		ResultSet rs = null;
		String sql = "select * from tbl_custom# where custom_id=?";
		try {
			PreparedStatement pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (!rs.next())
				result= true;
			pstmt.close();
		} catch (SQLException e) {
			System.out.println("SQL 실행 오류" + e.getMessage());
		}
		return result; // 중복되면 false 중복 없으면 true
	}
	
	
	
//select 쿼리(조건 없음)
	public List<Custom> selectAll() {
		Connection conn = OracleConnectUtil.connect();
		String sql = "select * from tbl_custom#";
		PreparedStatement pstmt = null;
		ResultSet rs =null;
		List<Custom> customs = new ArrayList<>();
		
		try {
			pstmt = conn.prepareStatement(sql);
			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				customs.add(new Custom(rs.getString(1), 	//방법1) 커스텀 생성자
										rs.getString(2), 
										rs.getString(3), 
										rs.getInt(4), 
										rs.getDate(5)));
			}
			pstmt.close();
		} catch (SQLException e) {
			System.out.println("SQL 실행 오류: "+e.getMessage());
		}
		OracleConnectUtil.close(conn);
		return customs;
	}//selctAll 메소드 끝
	
}
