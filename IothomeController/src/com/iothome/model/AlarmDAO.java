package com.iothome.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class AlarmDAO {
	private DBConnect dbconnect = null;
	private String sql = "";

	public AlarmDAO() {
		dbconnect = new DBConnect();
	}

	public int count() {
		Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int cnt = 0;
		try {
			sql = "SELECT COUNT(*) FROM alarm_list";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				cnt = rs.getInt(1);
			}
		} catch (Exception e) {
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		return cnt;
	}

	public ArrayList<AlarmDTO> getMemberList() {
		Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<AlarmDTO> alist = new ArrayList<AlarmDTO>();
		try {
			sql = "select * from alarm_list";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				AlarmDTO dto = new AlarmDTO();
				dto.setWeekday(rs.getString(2));
				dto.setHour(rs.getInt(3));
				dto.setMinute(rs.getString(4));
				alist.add(dto);
			}
		} catch (Exception e) {
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		return alist;
	}

}