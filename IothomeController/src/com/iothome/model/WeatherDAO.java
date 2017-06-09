package com.iothome.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class WeatherDAO {
	private DBConnect dbconnect = null;
	private String sql = "";
	private String key = null;

	public WeatherDAO() {
		// TODO Auto-generated constructor stub
		dbconnect = new DBConnect();
	}

	public ArrayList<WeatherDTO> searchLocalList(String searchKey) {
		Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<WeatherDTO> alist = new ArrayList<WeatherDTO>();
		key = searchKey;
		try {
			sql = "SELECT city, nation from WEATHER_LOCAL_TB " + "WHERE city LIKE" + "'%" + key + "%'" + "OR nation =" + "'"
					+ key + "'";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				WeatherDTO dto = new WeatherDTO();
				dto.setCity(rs.getString("city"));
				dto.setNation(rs.getString("nation"));
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
