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
			sql = "SELECT COUNT(*) FROM ALARM_LIST_TB";
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
			sql = "select * from ALARM_LIST_TB";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				AlarmDTO dto = new AlarmDTO();
				dto.setIndex(rs.getInt(1));
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
	
	public int deleteAlarm(int alarmIndex) {
		Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			sql = "DELETE FROM ALARM_LIST_TB WHERE number = " + alarmIndex;
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			System.out.println("DAO µé¾î¿È");
		} catch (Exception e) {
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		return alarmIndex;
	}
}