<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@ page import="java.sql.*"%>

<%
	Connection conn = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	try {
		String url = "jdbc:mysql://121.187.77.136:3306/iothome"; // ����Ϸ��� �����ͺ��̽����� ������ URL ���
		String id = "root"; // ����� ����
		String pw = "1234"; // ����� ������ �н�����
		Class.forName("com.mysql.jdbc.Driver"); // �����ͺ��̽��� �����ϱ� ���� DriverManager�� ����Ѵ�.
		conn = DriverManager.getConnection(url, id, pw); // DriverManager ��ü�κ��� Connection ��ü�� ���´�.
		
		String sql = "select * from music_state";    // sql ����
		pstmt = conn.prepareStatement(sql);          // prepareStatement���� �ش� sql�� �̸� �������Ѵ�.
		
		rs = pstmt.executeQuery();                   // ������ �����ϰ� ����� ResultSet ��ü�� ��´�.
		while(rs.next()){                            // ����� �� �྿ ���ư��鼭 �����´�.
			String state = rs.getString("state");
%>
	<%=state%>
<%

		}
	} catch (Exception e) { // ���ܰ� �߻��ϸ� ���� ��Ȳ�� ó���Ѵ�.
		e.printStackTrace();
	}
%>
