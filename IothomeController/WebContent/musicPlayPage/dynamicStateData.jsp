<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ page import="java.sql.*"%>

<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try {
		String url = "jdbc:mysql://121.187.77.136:3306/iothome"; // 사용하려는 데이터베이스명을 포함한 URL 기술
		String id = "root"; // 사용자 계정
		String pw = "1234"; // 사용자 계정의 패스워드
		Class.forName("com.mysql.jdbc.Driver"); // 데이터베이스와 연동하기 위해 DriverManager에 등록한다.
		conn = DriverManager.getConnection(url, id, pw); // DriverManager 객체로부터 Connection 객체를 얻어온다.
		
		String sql = "select * from music_state";    // sql 쿼리
		pstmt = conn.prepareStatement(sql);          // prepareStatement에서 해당 sql을 미리 컴파일한다.
		
		rs = pstmt.executeQuery();                   // 쿼리를 실행하고 결과를 ResultSet 객체에 담는다.
		while(rs.next()){                            // 결과를 한 행씩 돌아가면서 가져온다.
			String state = rs.getString("state");
%>
	<%=state%>
<%

		}
	} catch (Exception e) { // 예외가 발생하면 예외 상황을 처리한다.
		e.printStackTrace();
	}
%>
