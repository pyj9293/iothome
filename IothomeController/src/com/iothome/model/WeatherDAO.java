package com.iothome.model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class WeatherDAO {
	private DBConnect dbconnect = null;
	private String sql = "";
	private String key = null;
	private String city = null;
	private String nation = null;
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
			sql = "SELECT city, nation from WEATHER_LOCAL_LIST_TB " + "WHERE city LIKE" + "'%" + key + "%'" + "OR nation =" + "'"
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
	
	public void getLocal(String[] searchKey) {
		Connection con = dbconnect.getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		city = searchKey[0];
		nation = searchKey[1];
		try {
			sql = "UPDATE WEATHER_LOCAL_TB set city = '" + city + "'," + "nation ='" + nation +"'";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
		} catch (Exception e) {
			System.out.println(e);
		} finally {
			DBClose.close(con, pstmt, rs);
		}
	}
}
