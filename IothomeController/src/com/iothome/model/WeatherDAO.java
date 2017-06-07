package com.iothome.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

public class WeatherDAO {
	private DBConnect dbconnect = null;
	private String sql = "";

	public ArrayList<WeatherDTO> getMemberList() {
		Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<WeatherDTO> alist = new ArrayList<WeatherDTO>();
		try {
			sql = "select city, nation from weather_local";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				WeatherDTO dto = new WeatherDTO();
				boolean dayNew = false;
				dto.setId(rs.getInt(1));
				dto.setCity(rs.getString(2));
				dto.setNation(rs.getString(3));
				alist.add(dto);
			}
		} catch (Exception e) {
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		return alist;
	}

}
