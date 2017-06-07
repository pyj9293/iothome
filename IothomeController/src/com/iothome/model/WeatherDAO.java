package com.iothome.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class WeatherDAO {
	private DBConnect dbconnect = null;
	private String sql = "";

	public WeatherDAO() {
		// TODO Auto-generated constructor stub
		dbconnect = new DBConnect();
	}

	public ArrayList<WeatherDTO> getLocalList() {
		Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<WeatherDTO> alist = new ArrayList<WeatherDTO>();
		try {
			sql = "select local_id, city, nation from weather_local";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				WeatherDTO dto = new WeatherDTO();
				dto.setId(rs.getInt(1));
				dto.setCity(rs.getString(2));
				dto.setNation(rs.getString(3));
				alist.add(dto);
			}
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DBClose.close(con, pstmt, rs);
		}
		return alist;
	}

}
